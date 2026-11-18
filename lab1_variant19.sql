CREATE TABLE Disciplines (
    discipline_id   SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    description     TEXT,
    year_introduced INTEGER NOT NULL
);

CREATE TABLE Schedule (
    group_number   VARCHAR(20) NOT NULL,
    lab_number     INTEGER NOT NULL,
    discipline_id  INTEGER NOT NULL,
    day_of_week    VARCHAR(15) NOT NULL,
    lesson_number  INTEGER NOT NULL,
    CONSTRAINT pk_schedule PRIMARY KEY (group_number, lab_number, discipline_id, day_of_week, lesson_number),
    CONSTRAINT fk_schedule_discipline
        FOREIGN KEY (discipline_id)
        REFERENCES Disciplines(discipline_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO Disciplines (name, description, year_introduced) VALUES
('Математика', 'Высшая математика', 2015),
('Физика', 'Общая физика', 2016),
('Информатика', 'Основы программирования', 2018),
('Базы данных', 'Реляционные базы данных', 2020),
('Экономика', 'Основы экономики', 2014),
('История', 'История России', 2012),
('Химия', 'Общая химия', 2016),
('Биология', 'Общая биология', 2015),
('Английский язык', 'Иностранный язык', 2010),
('Философия', 'Основы философии', 2013);

INSERT INTO Schedule (group_number, lab_number, discipline_id, day_of_week, lesson_number) VALUES
('ИТ-21', 101, 1, 'Понедельник', 1),
('ИТ-21', 102, 2, 'Понедельник', 2),
('ИТ-21', 103, 3, 'Вторник', 1),
('ИТ-21', 104, 4, 'Вторник', 2),
('ИТ-22', 101, 1, 'Среда', 1),
('ИТ-22', 102, 5, 'Среда', 2),
('ИТ-22', 103, 6, 'Четверг', 1),
('ИТ-22', 104, 7, 'Четверг', 2),
('ЭК-21', 105, 5, 'Пятница', 1),
('ЭК-21', 106, 8, 'Пятница', 2);

SELECT * FROM Disciplines;
SELECT * FROM Schedule;

SELECT s.group_number, s.day_of_week, s.lesson_number,
       d.name AS discipline, s.lab_number
FROM Schedule s
JOIN Disciplines d ON s.discipline_id = d.discipline_id
ORDER BY s.group_number, s.day_of_week, s.lesson_number;