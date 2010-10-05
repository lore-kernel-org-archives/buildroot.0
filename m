From: Konrad Eisele <konrad@gaisler.com>
Date: Tue,  5 Oct 2010 12:50:38 +0200
Subject: [Buildroot] [PATCH 3/3] gcc-patch: Add patch for 4.4.5 to support
	Sparc-leon processors
In-Reply-To: <4CAB0299.2010903@gaisler.com>
References: <4CAB0299.2010903@gaisler.com>
Message-ID: <1286275838-5226-3-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gcc patch that adds hfleon (fpu,v7), hfleonv8 (fpu, v8), sfleon (softfpu,v7),
sfleonv8 (softfpu,v8) SPARC variants. Default cpu is selected with --with-cpu.
Adds leon pipeline descrption to gcc.

Signed-off-by: Konrad Eisele <konrad@gaisler.com>
---
 toolchain/gcc/4.4.5/950-sparc-leon.patch |  206 ++++++++++++++++++++++++++++++
 1 files changed, 206 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.4.5/950-sparc-leon.patch

diff --git a/toolchain/gcc/4.4.5/950-sparc-leon.patch b/toolchain/gcc/4.4.5/950-sparc-leon.patch
new file mode 100644
index 0000000..cdff2bb
--- /dev/null
+++ b/toolchain/gcc/4.4.5/950-sparc-leon.patch
@@ -0,0 +1,206 @@
+diff -Naur gcc-4.4.5.ori/gcc/config/sparc/leon.md gcc-4.4.5/gcc/config/sparc/leon.md
+--- gcc-4.4.5.ori/gcc/config/sparc/leon.md	1970-01-01 01:00:00.000000000 +0100
++++ gcc-4.4.5/gcc/config/sparc/leon.md	2010-10-05 11:47:08.000000000 +0200
+@@ -0,0 +1,56 @@
++;; Scheduling description for Leon.
++;;   Copyright (C) 2010 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++
++(define_automaton "leon")
++
++(define_cpu_unit "leon_memory, leon_fpalu" "leon")
++(define_cpu_unit "leon_fpmds" "leon")
++(define_cpu_unit "write_buf" "leon")
++
++(define_insn_reservation "leon_load" 1
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "load,sload,fpload"))
++  "leon_memory")
++
++(define_insn_reservation "leon_store" 1
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "store,fpstore"))
++  "leon_memory+write_buf")
++  
++(define_insn_reservation "leon_fp_alu" 1
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "fp,fpmove"))
++  "leon_fpalu, nothing")
++
++(define_insn_reservation "leon_fp_mult" 1
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "fpmul"))
++  "leon_fpmds, nothing")
++
++(define_insn_reservation "leon_fp_div" 16
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "fpdivs,fpdivd"))
++  "leon_fpmds, nothing*15")
++
++(define_insn_reservation "leon_fp_sqrt" 23
++  (and (eq_attr "cpu" "leon")
++    (eq_attr "type" "fpsqrts,fpsqrtd"))
++  "leon_fpmds, nothing*21")
++
+diff -Naur gcc-4.4.5.ori/gcc/config/sparc/sparc.c gcc-4.4.5/gcc/config/sparc/sparc.c
+--- gcc-4.4.5.ori/gcc/config/sparc/sparc.c	2010-10-05 11:46:07.000000000 +0200
++++ gcc-4.4.5/gcc/config/sparc/sparc.c	2010-10-05 11:47:08.000000000 +0200
+@@ -246,6 +246,30 @@
+   0, /* shift penalty */
+ };
+ 
++static const
++struct processor_costs leon_costs = {
++  COSTS_N_INSNS (1), /* int load */
++  COSTS_N_INSNS (1), /* int signed load */
++  COSTS_N_INSNS (1), /* int zeroed load */
++  COSTS_N_INSNS (1), /* float load */
++  COSTS_N_INSNS (1), /* fmov, fneg, fabs */
++  COSTS_N_INSNS (1), /* fadd, fsub */
++  COSTS_N_INSNS (1), /* fcmp */
++  COSTS_N_INSNS (1), /* fmov, fmovr */
++  COSTS_N_INSNS (1), /* fmul */
++  COSTS_N_INSNS (15), /* fdivs */
++  COSTS_N_INSNS (15), /* fdivd */
++  COSTS_N_INSNS (23), /* fsqrts */
++  COSTS_N_INSNS (23), /* fsqrtd */
++  COSTS_N_INSNS (5), /* imul */
++  COSTS_N_INSNS (5), /* imulX */
++  0, /* imul bit factor */
++  COSTS_N_INSNS (5), /* idiv */
++  COSTS_N_INSNS (5), /* idivX */
++  COSTS_N_INSNS (1), /* movcc/movr */
++  0, /* shift penalty */
++};
++
+ const struct processor_costs *sparc_costs = &cypress_costs;
+ 
+ #ifdef HAVE_AS_RELAX_OPTION
+@@ -655,6 +679,10 @@
+     { TARGET_CPU_ultrasparc3, "ultrasparc3" },
+     { TARGET_CPU_niagara, "niagara" },
+     { TARGET_CPU_niagara2, "niagara2" },
++    { TARGET_CPU_sparchfleon, "sparchfleon" },
++    { TARGET_CPU_sparchfleonv8, "sparchfleonv8" },
++    { TARGET_CPU_sparcsfleon, "sparcsfleon" },
++    { TARGET_CPU_sparcsfleonv8, "sparcsfleonv8" },
+     { 0, 0 }
+   };
+   const struct cpu_default *def;
+@@ -693,6 +721,11 @@
+     /* UltraSPARC T1 */
+     { "niagara", PROCESSOR_NIAGARA, MASK_ISA, MASK_V9|MASK_DEPRECATED_V8_INSNS},
+     { "niagara2", PROCESSOR_NIAGARA, MASK_ISA, MASK_V9},
++    /* SPARC-LEON */
++    { "sparchfleon",   PROCESSOR_LEON, MASK_ISA, MASK_FPU },
++    { "sparchfleonv8", PROCESSOR_LEON, MASK_ISA & ~(MASK_V8), MASK_V8|MASK_FPU },
++    { "sparcsfleon",   PROCESSOR_LEON, MASK_ISA | MASK_FPU, 0 },
++    { "sparcsfleonv8", PROCESSOR_LEON, (MASK_ISA | MASK_FPU) & ~(MASK_V8), MASK_V8 },
+     { 0, 0, 0, 0 }
+   };
+   const struct cpu_table *cpu;
+@@ -859,6 +892,9 @@
+     case PROCESSOR_NIAGARA2:
+       sparc_costs = &niagara2_costs;
+       break;
++    case PROCESSOR_LEON:
++      sparc_costs = &leon_costs;
++      break;
+     };
+ 
+ #ifdef TARGET_DEFAULT_LONG_DOUBLE_128
+diff -Naur gcc-4.4.5.ori/gcc/config/sparc/sparc.h gcc-4.4.5/gcc/config/sparc/sparc.h
+--- gcc-4.4.5.ori/gcc/config/sparc/sparc.h	2010-10-05 11:46:07.000000000 +0200
++++ gcc-4.4.5/gcc/config/sparc/sparc.h	2010-10-05 11:47:08.000000000 +0200
+@@ -243,6 +243,10 @@
+ #define TARGET_CPU_ultrasparc3	9
+ #define TARGET_CPU_niagara	10
+ #define TARGET_CPU_niagara2	11
++#define TARGET_CPU_sparchfleon  12
++#define TARGET_CPU_sparchfleonv8 13
++#define TARGET_CPU_sparcsfleon  14
++#define TARGET_CPU_sparcsfleonv8 15
+ 
+ #if TARGET_CPU_DEFAULT == TARGET_CPU_v9 \
+  || TARGET_CPU_DEFAULT == TARGET_CPU_ultrasparc \
+@@ -299,6 +303,26 @@
+ #define ASM_CPU32_DEFAULT_SPEC "-Asparclite"
+ #endif
+ 
++#if TARGET_CPU_DEFAULT == TARGET_CPU_sparchfleon
++#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon"
++#define ASM_CPU32_DEFAULT_SPEC ""
++#endif
++
++#if TARGET_CPU_DEFAULT == TARGET_CPU_sparcsfleon
++#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon -D_SOFT_FLOAT"
++#define ASM_CPU32_DEFAULT_SPEC ""
++#endif
++
++#if TARGET_CPU_DEFAULT == TARGET_CPU_sparchfleonv8
++#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon -D__sparc_v8__ "
++#define ASM_CPU32_DEFAULT_SPEC ""
++#endif
++
++#if TARGET_CPU_DEFAULT == TARGET_CPU_sparcsfleonv8
++#define CPP_CPU32_DEFAULT_SPEC "-Dleon -D__sparc_v8__ -D_SOFT_FLOAT"
++#define ASM_CPU32_DEFAULT_SPEC ""
++#endif
++
+ #if TARGET_CPU_DEFAULT == TARGET_CPU_supersparc
+ #define CPP_CPU32_DEFAULT_SPEC "-D__supersparc__ -D__sparc_v8__"
+ #define ASM_CPU32_DEFAULT_SPEC ""
+@@ -533,6 +557,7 @@
+   PROCESSOR_V7,
+   PROCESSOR_CYPRESS,
+   PROCESSOR_V8,
++  PROCESSOR_LEON,
+   PROCESSOR_SUPERSPARC,
+   PROCESSOR_SPARCLITE,
+   PROCESSOR_F930,
+diff -Naur gcc-4.4.5.ori/gcc/config/sparc/sparc.md gcc-4.4.5/gcc/config/sparc/sparc.md
+--- gcc-4.4.5.ori/gcc/config/sparc/sparc.md	2010-10-05 11:46:07.000000000 +0200
++++ gcc-4.4.5/gcc/config/sparc/sparc.md	2010-10-05 11:47:08.000000000 +0200
+@@ -89,6 +89,7 @@
+   "v7,
+    cypress,
+    v8,
++   leon,
+    supersparc,
+    sparclite,f930,f934,
+    hypersparc,sparclite86x,
+@@ -320,6 +321,7 @@
+ (include "ultra3.md")
+ (include "niagara.md")
+ (include "niagara2.md")
++(include "leon.md")
+ 
+ 
+ ;; Operand and operator predicates and constraints
+diff -Naur gcc-4.4.5.ori/gcc/config.gcc gcc-4.4.5/gcc/config.gcc
+--- gcc-4.4.5.ori/gcc/config.gcc	2010-10-05 11:46:08.000000000 +0200
++++ gcc-4.4.5/gcc/config.gcc	2010-10-05 11:47:08.000000000 +0200
+@@ -2998,6 +2998,7 @@
+ 			case ${val} in
+ 			"" | sparc | sparcv9 | sparc64 | sparc86x \
+ 			| v7 | cypress | v8 | supersparc | sparclite | f930 \
++			| sparchfleon | sparcsfleon | sparchfleonv8 | sparcsfleonv8 \
+ 			| f934 | hypersparc | sparclite86x | sparclet | tsc701 \
+ 			| v9 | ultrasparc | ultrasparc3 | niagara | niagara2)
+ 				# OK
-- 
1.6.3.2
