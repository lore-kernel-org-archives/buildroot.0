From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri,  3 May 2013 10:37:50 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_GCC_x_y_PLUS
Message-ID: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch eliminates the long "depends on" lines in
toolchain/gcc/Config.in by letting architectures specify
from which GCC version the architecture is supported.

Architectures that support only one specific version of GCC
should bypass the GCC version selection mechanism.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in.arm      |    6 ++++
 arch/Config.in.powerpc  |    7 ++++
 arch/Config.in.x86      |    1 +
 toolchain/gcc/Config.in |   73 +++++++++++++++++++++++++++++++++-------------
 4 files changed, 66 insertions(+), 21 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2f4c0c8..fd6671d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -36,19 +36,25 @@ config BR2_arm1176jzf_s
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_5_PLUS
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_6_PLUS
 config BR2_fa526
 	bool "fa526/626"
+	select BR2_ARCH_HAS_GCC_4_6_PLUS
 config BR2_pj4
 	bool "pj4"
+	select BR2_ARCH_HAS_GCC_4_8_PLUS
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 config BR2_xscale
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8643efc..cd87b7c 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -20,12 +20,16 @@ config BR2_powerpc_440fp
 	bool "440 with FPU"
 config BR2_powerpc_464
 	bool "464"
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_powerpc_464fp
 	bool "464 with FPU"
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_powerpc_476
 	bool "476"
+	select BR2_ARCH_HAS_GCC_4_5_PLUS
 config BR2_powerpc_476fp
 	bool "476 with FPU"
+	select BR2_ARCH_HAS_GCC_4_5_PLUS
 config BR2_powerpc_505
 	bool "505"
 config BR2_powerpc_601
@@ -66,10 +70,13 @@ config BR2_powerpc_8548
 	bool "8548 / e500v2"
 config BR2_powerpc_e300c2
 	bool "e300c2"
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_powerpc_e300c3
 	bool "e300c3"
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 config BR2_powerpc_e500mc
 	bool "e500mc"
+	select BR2_ARCH_HAS_GCC_4_4_PLUS
 endchoice
 
 choice
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..a7255b6 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -86,6 +86,7 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_HAS_GCC_4_5_PLUS
 config BR2_x86_k6
 	bool "k6"
 	select BR2_X86_CPU_HAS_MMX
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index f297e73..8d7e2e9 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -2,56 +2,83 @@
 
 comment "GCC Options"
 
+config BR2_ARCH_HAS_ALL_GCC
+	bool
+	default y if !(BR2_ARCH_HAS_GCC_4_4_PLUS || \
+		       BR2_ARCH_HAS_GCC_4_5_PLUS || \
+		       BR2_ARCH_HAS_GCC_4_6_PLUS || \
+		       BR2_ARCH_HAS_GCC_4_7_PLUS || \
+		       BR2_ARCH_HAS_GCC_4_8_PLUS || \
+		       BR2_ARCH_HAS_GCC_SNAP_ONLY)
+
+config BR2_ARCH_HAS_GCC_4_4_PLUS
+	bool
+	select BR2_ARCH_HAS_GCC_4_5_PLUS
+
+config BR2_ARCH_HAS_GCC_4_5_PLUS
+	bool
+	select BR2_ARCH_HAS_GCC_4_6_PLUS
+
+config BR2_ARCH_HAS_GCC_4_6_PLUS
+	bool
+	select BR2_ARCH_HAS_GCC_4_7_PLUS
+
+config BR2_ARCH_HAS_GCC_4_7_PLUS
+	bool
+	select BR2_ARCH_HAS_GCC_4_8_PLUS
+
+config BR2_ARCH_HAS_GCC_4_8_PLUS
+	bool
+	select BR2_ARCH_HAS_GCC_SNAP_ONLY
+
+config BR2_ARCH_HAS_GCC_SNAP_ONLY
+	bool
+
 config BR2_GCC_NEEDS_MPC
 	bool
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
-	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
-	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
+	depends on !(BR2_arc			|| \
+		     BR2_avr32			|| \
+		     BR2_sparc_sparchfleon	|| \
+		     BR2_sparc_sparchfleonv8	|| \
+		     BR2_sparc_sparcsfleon	|| \
+		     BR2_sparc_sparcsfleonv8)
 	default BR2_GCC_VERSION_4_7_X
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_4_7_ARC
-		depends on BR2_arc
-		bool "gcc 4.4.7-arc"
-
-	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	       depends on BR2_avr32
-	       bool "gcc 4.2.2-avr32-2.1.5"
-
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_ALL_GCC
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_4_PLUS || BR2_ARCH_HAS_ALL_GCC
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_5_PLUS || BR2_ARCH_HAS_ALL_GCC
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_6_PLUS || BR2_ARCH_HAS_ALL_GCC
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_7_PLUS || BR2_ARCH_HAS_ALL_GCC
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on BR2_ARCH_HAS_GCC_4_8_PLUS || BR2_ARCH_HAS_ALL_GCC
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on BR2_ARCH_HAS_GCC_SNAP_ONLY || BR2_ARCH_HAS_ALL_GCC
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
@@ -76,10 +103,14 @@ config BR2_GCC_SNAP_DATE
 
 config BR2_GCC_VERSION
 	string
-	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	default "4.2.2-avr32-2.1.5" if BR2_avr32
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
-	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
-	default "4.4.7-arc" if BR2_GCC_VERSION_4_4_7_ARC
+	default "4.4.7"     if (BR2_GCC_VERSION_4_4_X	|| \
+				BR2_sparc_sparchfleon	|| \
+				BR2_sparc_sparchfleonv8	|| \
+				BR2_sparc_sparcsfleon	|| \
+				BR2_sparc_sparcsfleonv8)
+	default "4.4.7-arc" if BR2_arc
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-- 
1.7.0.4
