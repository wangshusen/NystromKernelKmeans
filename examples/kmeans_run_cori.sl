#!/bin/bash
#SBATCH -p regular
#SBATCH -N 3
#SBATCH -C haswell
#SBATCH -t 00:30:00
#SBATCH -J shusen_kmeans
#SBATCH -L SCRATCH
#SBATCH -e mysparkjob_%j.err
#SBATCH -o mysparkjob_%j.out

INPUT_DIR="$SCRATCH/NystromKernelKmeans"
PYTHON_FILE="$INPUT_DIR/examples/kmeans.py"

module load spark
start-all.sh
spark-submit $PYTHON_FILE
stop-all.sh
