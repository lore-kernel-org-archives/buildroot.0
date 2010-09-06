From: Konrad Eisele <konrad@gaisler.com>
Date: Mon,  6 Sep 2010 17:38:35 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Add --with-cpu option to gcc
	configure and add gcc patch that adds LEON-SPARC variants
	hfleon, hfleonv8,
	sfleon and sfleonv8 to gcc-4.4.4. Signed-off-by: Konrad Eisele
	<konrad@gaisler.com>
Message-ID: <1283787515-15961-1-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 target/Config.in.arch                    |   18 +++-
 toolchain/gcc/4.4.4/900-sparc-leon.patch |  206 ++++++++++++++++++++++++++++++
 toolchain/gcc/Makefile.in                |    3 +
 toolchain/gcc/gcc-uclibc-4.x.mk          |    8 +-
 4 files changed, 229 insertions(+), 6 deletions(-)
 create mode 100644 toolchain/gcc/4.4.4/900-sparc-leon.patch

diff --git a/target/Config.in.arch b/target/Config.in.arch
index ce64068..29fbb64 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -349,6 +349,14 @@ config BR2_sparc_cypress
 	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
+config BR2_sparc_sparchfleon
+	bool "hfleon"
+config BR2_sparc_sparchfleonv8
+	bool "hfleonv8"
+config BR2_sparc_sparcsfleon
+	bool "sfleon"
+config BR2_sparc_sparcsfleonv8
+	bool "sfleonv8"
 config BR2_sparc_supersparc
 	bool "supersparc"
 config BR2_sparc_sparclite
@@ -402,8 +410,8 @@ endchoice
 
 config BR2_SPARC_TYPE
 	string
-	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701
-	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc
+	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
 	default V9	if BR2_sparc_v9 || BR2_sparc_ultrasparc || BR2_sparc_ultrasparc3 || BR2_sparc_niagara || BR2_sparc64_v9 || BR2_sparc64_ultrasparc || BR2_sparc64_ultrasparc3 || BR2_sparc64_niagara
 	default V9	if BR2_sparc_v9a || BR2_sparc64_v9a
 	default V9B	if BR2_sparc_v9b || BR2_sparc64_v9b
@@ -773,3 +781,9 @@ config BR2_GCC_TARGET_ABI
 	default ibmlongdouble	if BR2_powerpc && BR2_PPC_ABI_ibmlongdouble
 	default ieeelongdouble	if BR2_powerpc && BR2_PPC_ABI_ieeelongdouble
 
+config BR2_GCC_TARGET_CPU
+	string
+	default sparchfleon	if BR2_sparc_sparchfleon
+	default sparchfleonv8	if BR2_sparc_sparchfleonv8
+	default sparcsfleon	if BR2_sparc_sparcsfleon
+	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
diff --git a/toolchain/gcc/4.4.4/900-sparc-leon.patch b/toolchain/gcc/4.4.4/900-sparc-leon.patch
new file mode 100644
index 0000000..da55326
--- /dev/null
+++ b/toolchain/gcc/4.4.4/900-sparc-leon.patch
@@ -0,0 +1,206 @@
+diff -Naur gcc-4.4.4.ori/gcc/config/sparc/leon.md gcc-4.4.4/gcc/config/sparc/leon.md
+--- gcc-4.4.4.ori/gcc/config/sparc/leon.md	1970-01-01 01:00:00.000000000 +0100
++++ gcc-4.4.4/gcc/config/sparc/leon.md	2010-09-06 11:16:16.000000000 +0200
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
+diff -Naur gcc-4.4.4.ori/gcc/config/sparc/sparc.c gcc-4.4.4/gcc/config/sparc/sparc.c
+--- gcc-4.4.4.ori/gcc/config/sparc/sparc.c	2010-09-06 11:15:29.000000000 +0200
++++ gcc-4.4.4/gcc/config/sparc/sparc.c	2010-09-06 11:25:02.000000000 +0200
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
+diff -Naur gcc-4.4.4.ori/gcc/config/sparc/sparc.h gcc-4.4.4/gcc/config/sparc/sparc.h
+--- gcc-4.4.4.ori/gcc/config/sparc/sparc.h	2010-09-06 11:15:29.000000000 +0200
++++ gcc-4.4.4/gcc/config/sparc/sparc.h	2010-09-06 11:18:51.000000000 +0200
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
+diff -Naur gcc-4.4.4.ori/gcc/config/sparc/sparc.md gcc-4.4.4/gcc/config/sparc/sparc.md
+--- gcc-4.4.4.ori/gcc/config/sparc/sparc.md	2010-09-06 11:15:29.000000000 +0200
++++ gcc-4.4.4/gcc/config/sparc/sparc.md	2010-09-06 11:16:16.000000000 +0200
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
+diff -Naur gcc-4.4.4.ori/gcc/config.gcc gcc-4.4.4/gcc/config.gcc
+--- gcc-4.4.4.ori/gcc/config.gcc	2010-09-06 11:15:29.000000000 +0200
++++ gcc-4.4.4/gcc/config.gcc	2010-09-06 11:17:28.000000000 +0200
+@@ -2980,6 +2980,7 @@
+ 			case ${val} in
+ 			"" | sparc | sparcv9 | sparc64 | sparc86x \
+ 			| v7 | cypress | v8 | supersparc | sparclite | f930 \
++			| sparchfleon | sparcsfleon | sparchfleonv8 | sparcsfleonv8 \
+ 			| f934 | hypersparc | sparclite86x | sparclet | tsc701 \
+ 			| v9 | ultrasparc | ultrasparc3 | niagara | niagara2)
+ 				# OK
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index b6ebca9..2e55ed0 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -37,6 +37,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
+endif
 
 # AVR32 GCC configuration
 ifeq ($(BR2_avr32),y)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index f17b73f..d40731d 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -211,7 +211,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC1_CONFIG_OPTIONS) \
 		$(QUIET) \
@@ -287,7 +287,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC2_CONFIG_OPTIONS) \
 		$(QUIET) \
@@ -362,7 +362,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC2_CONFIG_OPTIONS) \
@@ -495,7 +495,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
-- 
1.6.3.2
