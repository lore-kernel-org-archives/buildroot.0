From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:28:39 +0100
Subject: [Buildroot] [git commit] arch: sparc: Add leon3 cpu type and remove
	sparc{s, h}fleon{, v8}
Message-ID: <20141030203113.6DA2DB228A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43b78e7285e1d744c304b72a03fe1e9f2d2e047a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is support for -mcpu=leon3 from gcc 4.8.3. Use this for LEON systems
instead of the non-mainline targets sparcsfleon, sparchfleon, sparcsfleonv8, and
sparchfleonv8.

[Thomas: add Config.in.legacy handling for the removed options.]

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |   32 +++++
 arch/Config.in.sparc                   |   15 +--
 package/gcc/4.4.7/950-sparc-leon.patch |  239 --------------------------------
 package/gcc/Config.in.host             |   19 +--
 4 files changed, 41 insertions(+), 264 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b441e67..4347284 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,38 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_sparc_sparchfleon
+	bool "sparchfleon CPU has been removed"
+	select BR2_LEGACY
+	help
+	  The sparchfleon CPU was only supported in a patched gcc 4.4
+	  version. Its support has been removed in favor of the leon3
+	  CPU starting from gcc 4.8.x.
+
+config BR2_sparc_sparchfleonv8
+	bool "sparchfleonv8 CPU has been removed"
+	select BR2_LEGACY
+	help
+	  The sparchfleonv8 CPU was only supported in a patched gcc
+	  4.4 version. Its support has been removed in favor of the
+	  leon3 CPU starting from gcc 4.8.x.
+
+config BR2_sparc_sparcsfleon
+	bool "sparcsfleon CPU has been removed"
+	select BR2_LEGACY
+	help
+	  The sparcsfleon CPU was only supported in a patched gcc 4.4
+	  version. Its support has been removed in favor of the leon3
+	  CPU starting from gcc 4.8.x.
+
+config BR2_sparc_sparcsfleonv8
+	bool "sparcsfleonv8 CPU has been removed"
+	select BR2_LEGACY
+	help
+	  The sparcsfleonv8 CPU was only supported in a patched gcc
+	  4.4 version. Its support has been removed in favor of the
+	  leon3 CPU starting from gcc 4.8.x.
+
 config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "xlib-libpciaccess option has been renamed"
 	depends on BR2_PACKAGE_XORG7
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 657c825..cd845b2 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -7,14 +7,8 @@ choice
 
 config BR2_sparc_v8
 	bool "v8"
-config BR2_sparc_sparchfleon
-	bool "hfleon"
-config BR2_sparc_sparchfleonv8
-	bool "hfleonv8"
-config BR2_sparc_sparcsfleon
-	bool "sfleon"
-config BR2_sparc_sparcsfleonv8
-	bool "sfleonv8"
+config BR2_sparc_leon3
+	bool "leon3"
 endchoice
 
 config BR2_ARCH
@@ -30,7 +24,4 @@ config BR2_GCC_TARGET_TUNE
 	default "v8"		if BR2_sparc_v8
 
 config BR2_GCC_TARGET_CPU
-	default "sparchfleon"	if BR2_sparc_sparchfleon
-	default "sparchfleonv8"	if BR2_sparc_sparchfleonv8
-	default "sparcsfleon"	if BR2_sparc_sparcsfleon
-	default "sparcsfleonv8"	if BR2_sparc_sparcsfleonv8
+	default "leon3"		if BR2_sparc_leon3
diff --git a/package/gcc/4.4.7/950-sparc-leon.patch b/package/gcc/4.4.7/950-sparc-leon.patch
deleted file mode 100644
index ad18607..0000000
--- a/package/gcc/4.4.7/950-sparc-leon.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-diff -Naurb gcc-4.4.2.ori/gcc/config/sparc/leon.md gcc-4.4.2/gcc/config/sparc/leon.md
---- gcc-4.4.2.ori/gcc/config/sparc/leon.md	1970-01-01 01:00:00.000000000 +0100
-+++ gcc-4.4.2/gcc/config/sparc/leon.md	2010-10-19 11:56:58.000000000 +0200
-@@ -0,0 +1,56 @@
-+;; Scheduling description for Leon.
-+;;   Copyright (C) 2010 Free Software Foundation, Inc.
-+;;
-+;; This file is part of GCC.
-+;;
-+;; GCC is free software; you can redistribute it and/or modify
-+;; it under the terms of the GNU General Public License as published by
-+;; the Free Software Foundation; either version 3, or (at your option)
-+;; any later version.
-+;;
-+;; GCC is distributed in the hope that it will be useful,
-+;; but WITHOUT ANY WARRANTY; without even the implied warranty of
-+;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+;; GNU General Public License for more details.
-+;;
-+;; You should have received a copy of the GNU General Public License
-+;; along with GCC; see the file COPYING3.  If not see
-+;; <http://www.gnu.org/licenses/>.
-+
-+
-+(define_automaton "leon")
-+
-+(define_cpu_unit "leon_memory, leon_fpalu" "leon")
-+(define_cpu_unit "leon_fpmds" "leon")
-+(define_cpu_unit "write_buf" "leon")
-+
-+(define_insn_reservation "leon_load" 1
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "load,sload,fpload"))
-+  "leon_memory")
-+
-+(define_insn_reservation "leon_store" 1
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "store,fpstore"))
-+  "leon_memory+write_buf")
-+  
-+(define_insn_reservation "leon_fp_alu" 1
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "fp,fpmove"))
-+  "leon_fpalu, nothing")
-+
-+(define_insn_reservation "leon_fp_mult" 1
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "fpmul"))
-+  "leon_fpmds, nothing")
-+
-+(define_insn_reservation "leon_fp_div" 16
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "fpdivs,fpdivd"))
-+  "leon_fpmds, nothing*15")
-+
-+(define_insn_reservation "leon_fp_sqrt" 23
-+  (and (eq_attr "cpu" "leon")
-+    (eq_attr "type" "fpsqrts,fpsqrtd"))
-+  "leon_fpmds, nothing*21")
-+
-diff -Naurb gcc-4.4.2.ori/gcc/config/sparc/sparc.c gcc-4.4.2/gcc/config/sparc/sparc.c
---- gcc-4.4.2.ori/gcc/config/sparc/sparc.c	2010-10-19 11:55:17.000000000 +0200
-+++ gcc-4.4.2/gcc/config/sparc/sparc.c	2010-10-19 11:56:58.000000000 +0200
-@@ -246,6 +246,30 @@
-   0, /* shift penalty */
- };
- 
-+static const
-+struct processor_costs leon_costs = {
-+  COSTS_N_INSNS (1), /* int load */
-+  COSTS_N_INSNS (1), /* int signed load */
-+  COSTS_N_INSNS (1), /* int zeroed load */
-+  COSTS_N_INSNS (1), /* float load */
-+  COSTS_N_INSNS (1), /* fmov, fneg, fabs */
-+  COSTS_N_INSNS (1), /* fadd, fsub */
-+  COSTS_N_INSNS (1), /* fcmp */
-+  COSTS_N_INSNS (1), /* fmov, fmovr */
-+  COSTS_N_INSNS (1), /* fmul */
-+  COSTS_N_INSNS (15), /* fdivs */
-+  COSTS_N_INSNS (15), /* fdivd */
-+  COSTS_N_INSNS (23), /* fsqrts */
-+  COSTS_N_INSNS (23), /* fsqrtd */
-+  COSTS_N_INSNS (5), /* imul */
-+  COSTS_N_INSNS (5), /* imulX */
-+  0, /* imul bit factor */
-+  COSTS_N_INSNS (5), /* idiv */
-+  COSTS_N_INSNS (5), /* idivX */
-+  COSTS_N_INSNS (1), /* movcc/movr */
-+  0, /* shift penalty */
-+};
-+
- const struct processor_costs *sparc_costs = &cypress_costs;
- 
- #ifdef HAVE_AS_RELAX_OPTION
-@@ -651,6 +675,10 @@
-     { TARGET_CPU_ultrasparc3, "ultrasparc3" },
-     { TARGET_CPU_niagara, "niagara" },
-     { TARGET_CPU_niagara2, "niagara2" },
-+    { TARGET_CPU_sparchfleon, "sparchfleon" },
-+    { TARGET_CPU_sparchfleonv8, "sparchfleonv8" },
-+    { TARGET_CPU_sparcsfleon, "sparcsfleon" },
-+    { TARGET_CPU_sparcsfleonv8, "sparcsfleonv8" },
-     { 0, 0 }
-   };
-   const struct cpu_default *def;
-@@ -689,6 +717,11 @@
-     /* UltraSPARC T1 */
-     { "niagara", PROCESSOR_NIAGARA, MASK_ISA, MASK_V9|MASK_DEPRECATED_V8_INSNS},
-     { "niagara2", PROCESSOR_NIAGARA, MASK_ISA, MASK_V9},
-+    /* SPARC-LEON */
-+    { "sparchfleon",   PROCESSOR_LEON, MASK_ISA, MASK_FPU },
-+    { "sparchfleonv8", PROCESSOR_LEON, MASK_ISA & ~(MASK_V8), MASK_V8|MASK_FPU },
-+    { "sparcsfleon",   PROCESSOR_LEON, MASK_ISA | MASK_FPU, 0 },
-+    { "sparcsfleonv8", PROCESSOR_LEON, (MASK_ISA | MASK_FPU) & ~(MASK_V8), MASK_V8 },
-     { 0, 0, 0, 0 }
-   };
-   const struct cpu_table *cpu;
-@@ -855,6 +888,9 @@
-     case PROCESSOR_NIAGARA2:
-       sparc_costs = &niagara2_costs;
-       break;
-+    case PROCESSOR_LEON:
-+      sparc_costs = &leon_costs;
-+      break;
-     };
- 
- #ifdef TARGET_DEFAULT_LONG_DOUBLE_128
-diff -Naurb gcc-4.4.2.ori/gcc/config/sparc/sparc.h gcc-4.4.2/gcc/config/sparc/sparc.h
---- gcc-4.4.2.ori/gcc/config/sparc/sparc.h	2010-10-19 11:55:17.000000000 +0200
-+++ gcc-4.4.2/gcc/config/sparc/sparc.h	2010-10-19 11:56:58.000000000 +0200
-@@ -243,6 +243,10 @@
- #define TARGET_CPU_ultrasparc3	9
- #define TARGET_CPU_niagara	10
- #define TARGET_CPU_niagara2	11
-+#define TARGET_CPU_sparchfleon  12
-+#define TARGET_CPU_sparchfleonv8 13
-+#define TARGET_CPU_sparcsfleon  14
-+#define TARGET_CPU_sparcsfleonv8 15
- 
- #if TARGET_CPU_DEFAULT == TARGET_CPU_v9 \
-  || TARGET_CPU_DEFAULT == TARGET_CPU_ultrasparc \
-@@ -299,6 +303,26 @@
- #define ASM_CPU32_DEFAULT_SPEC "-Asparclite"
- #endif
- 
-+#if TARGET_CPU_DEFAULT == TARGET_CPU_sparchfleon
-+#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon"
-+#define ASM_CPU32_DEFAULT_SPEC ""
-+#endif
-+
-+#if TARGET_CPU_DEFAULT == TARGET_CPU_sparcsfleon
-+#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon -D_SOFT_FLOAT"
-+#define ASM_CPU32_DEFAULT_SPEC ""
-+#endif
-+
-+#if TARGET_CPU_DEFAULT == TARGET_CPU_sparchfleonv8
-+#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon -D__sparc_v8__ "
-+#define ASM_CPU32_DEFAULT_SPEC ""
-+#endif
-+
-+#if TARGET_CPU_DEFAULT == TARGET_CPU_sparcsfleonv8
-+#define CPP_CPU32_DEFAULT_SPEC "-Dsparcleon -D__sparc_v8__ -D_SOFT_FLOAT"
-+#define ASM_CPU32_DEFAULT_SPEC ""
-+#endif
-+
- #if TARGET_CPU_DEFAULT == TARGET_CPU_supersparc
- #define CPP_CPU32_DEFAULT_SPEC "-D__supersparc__ -D__sparc_v8__"
- #define ASM_CPU32_DEFAULT_SPEC ""
-@@ -369,6 +393,10 @@
- %{mcpu=ultrasparc3:-D__sparc_v9__} \
- %{mcpu=niagara:-D__sparc_v9__} \
- %{mcpu=niagara2:-D__sparc_v9__} \
-+%{mcpu=sparchfleon:-Dsparcleon} \
-+%{mcpu=sparchfleonv8:-Dsparcleon -D__sparc_v8__} \
-+%{mcpu=sparcsfleon:-Dsparcleon -D_SOFT_FLOAT} \
-+%{mcpu=sparcsfleonv8:-Dsparcleon -D_SOFT_FLOAT -D__sparc_v8__} \
- %{!mcpu*:%{!mcypress:%{!msparclite:%{!mf930:%{!mf934:%{!mv8:%{!msupersparc:%(cpp_cpu_default)}}}}}}} \
- "
- #define CPP_ARCH32_SPEC ""
-@@ -533,6 +561,7 @@
-   PROCESSOR_V7,
-   PROCESSOR_CYPRESS,
-   PROCESSOR_V8,
-+  PROCESSOR_LEON,
-   PROCESSOR_SUPERSPARC,
-   PROCESSOR_SPARCLITE,
-   PROCESSOR_F930,
-diff -Naurb gcc-4.4.2.ori/gcc/config/sparc/sparc.md gcc-4.4.2/gcc/config/sparc/sparc.md
---- gcc-4.4.2.ori/gcc/config/sparc/sparc.md	2010-10-19 11:55:17.000000000 +0200
-+++ gcc-4.4.2/gcc/config/sparc/sparc.md	2010-10-19 11:56:58.000000000 +0200
-@@ -89,6 +89,7 @@
-   "v7,
-    cypress,
-    v8,
-+   leon,
-    supersparc,
-    sparclite,f930,f934,
-    hypersparc,sparclite86x,
-@@ -320,6 +321,7 @@
- (include "ultra3.md")
- (include "niagara.md")
- (include "niagara2.md")
-+(include "leon.md")
- 
- 
- ;; Operand and operator predicates and constraints
-diff -Naurb gcc-4.4.2.ori/gcc/config/sparc/t-leon gcc-4.4.2/gcc/config/sparc/t-leon
---- gcc-4.4.2.ori/gcc/config/sparc/t-leon	1970-01-01 01:00:00.000000000 +0100
-+++ gcc-4.4.2/gcc/config/sparc/t-leon	2010-10-19 11:56:58.000000000 +0200
-@@ -0,0 +1,16 @@
-+# configuration file for LEON cpu
-+
-+LIB1ASMSRC = sparc/lb1spc.asm
-+LIB1ASMFUNCS = _mulsi3 _divsi3 _modsi3
-+
-+# We want fine grained libraries, so use the new code to build the
-+# floating point emulation libraries.
-+FPBIT = fp-bit.c
-+DPBIT = dp-bit.c
-+
-+dp-bit.c: $(srcdir)/config/fp-bit.c
-+	cat $(srcdir)/config/fp-bit.c > dp-bit.c
-+
-+fp-bit.c: $(srcdir)/config/fp-bit.c
-+	echo '#define FLOAT' > fp-bit.c
-+	cat $(srcdir)/config/fp-bit.c >> fp-bit.c
-diff -Naurb gcc-4.4.2.ori/gcc/config.gcc gcc-4.4.2/gcc/config.gcc
---- gcc-4.4.2.ori/gcc/config.gcc	2010-10-19 11:55:17.000000000 +0200
-+++ gcc-4.4.2/gcc/config.gcc	2010-10-19 11:56:11.000000000 +0200
-@@ -2978,6 +2978,9 @@
- 			| v9 | ultrasparc | ultrasparc3 | niagara | niagara2)
- 				# OK
- 				;;
-+			sparchfleon | sparcsfleon | sparchfleonv8 | sparcsfleonv8 | leon)
-+				tmake_file="${tmake_file} sparc/t-leon"
-+				;;
- 			*)
- 				echo "Unknown cpu used in --with-$which=$val" 1>&2
- 				exit 1
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8be3a9a..07efac8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -8,7 +8,6 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
@@ -31,6 +30,8 @@ choice
 		depends on !BR2_cortex_a5 && !BR2_cortex_a7 && \
 			!BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_fa526 && \
 			!BR2_pj4
+		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
+		depends on !BR2_sparc_leon3
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		# ARM VFPv4 support appeared in gcc 4.5
@@ -53,9 +54,8 @@ choice
 			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
 		# Broken or unsupported PPC cores
 		depends on !BR2_power8
-		# Broken or unsupported SPARC cores
-		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
-			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
+		depends on !BR2_sparc_leon3
 		# Broken or unsupported X86 cores
 		depends on !BR2_x86_corei7 && !BR2_x86_jaguar
 		# ARM EABIhf support appeared in gcc 4.6
@@ -73,9 +73,8 @@ choice
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
 		depends on !BR2_power8
-		# Broken or unsupported SPARC cores
-		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
-			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
+		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar
 		select BR2_GCC_NEEDS_MPC
@@ -89,9 +88,6 @@ choice
 		depends on !BR2_cortex_a12
 		# Broken or unsupported PPC cores
 		depends on !BR2_power8
-		# Broken or unsupported SPARC cores
-		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
-			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
@@ -105,9 +101,6 @@ choice
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin
-		# Broken or unsupported SPARC cores
-		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
-			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
