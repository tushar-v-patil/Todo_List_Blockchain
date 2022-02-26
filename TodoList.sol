// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata text) external {
        todos.push(Todo(text,false));
    }

    function updateText(uint index, string calldata text) external {
        todos[index].text = text; // for one change this saves gas [access/update multiple times]

        // for multiple changes this saves gas [access once and update multiple times]
        // Todo storage todo = todos[index];
        // todo.text = text;
    }

    function get(uint index) external view returns(string memory, bool){
        Todo storage todo = todos[index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint index) external {
        todos[index].completed = !todos[index].completed;
    }
    
}
