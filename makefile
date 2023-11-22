BIN = bin/
ENDPOINT = localhost

all: clean $(BIN)/database_node $(BIN)/health_checker

run_db_node: $(BIN)/database_node
	./$(BIN)/db_node $(OWN_PORT) $(BAL_ADDR) $(BAL_PORT)

run_health_checker: $(BIN)/health_checker
	./$(BIN)/health_checker

$(BIN)/database_node:
	go build -o $(BIN)/db_node database_node/*

$(BIN)/health_checker:
	go build -o $(BIN)/health_checker health_checker/main.go


.PHONY: clean
clean:
	rm -f $(BIN)/*