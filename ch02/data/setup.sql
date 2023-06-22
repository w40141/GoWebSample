CREATE TABLE
  users (
    id serial PRIMARY KEY,
    uuid varchar(64) NOT NULL UNIQUE,
    name varchar(255),
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    created_at timestamp NOT NULL
  );

CREATE TABLE
  sessions (
    id serial PRIMARY KEY,
    uuid varchar(64) NOT NULL UNIQUE,
    email varchar(255),
    user_id INTEGER REFERENCES users (id),
    created_at TIMESTAMP NOT NULL
  );

CREATE TABLE
  threads (
    id serial PRIMARY KEY,
    uuid varchar(64) NOT NULL UNIQUE,
    topic TEXT,
    user_id INTEGER REFERENCES users (id),
    created_at TIMESTAMP NOT NULL
  );

CREATE TABLE
  posts (
    id serial PRIMARY KEY,
    uuid varchar(64) NOT NULL UNIQUE,
    topic TEXT,
    user_id INTEGER REFERENCES users (id),
    thread_id INTEGER REFERENCES threads (id),
    created_at TIMESTAMP NOT NULL
  );
