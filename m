From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Wed,  3 Jun 2015 19:34:03 -0300
Subject: [Buildroot] [PATCH v3 1/2] arch: tidy up mmu config
In-Reply-To: <1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1433370844-11584-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of blacklisting which architectures support MMUs (mandatorily
or optionally), introduce two Kconfig options that are selected by each
architecture in each case.

This simplifies the logic in BR2_USE_MMU.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in                | 28 ++++++++++++++++++++++++++++
 arch/Config.in.arm            | 17 +++++++++++++++++
 arch/Config.in.xtensa         |  2 ++
 toolchain/toolchain-common.in |  4 ++--
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 06aff2c..3ad9574 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -9,6 +9,12 @@ config BR2_KERNEL_64_USERLAND_32
 config BR2_SOFT_FLOAT
 	bool
 
+config BR2_ARCH_HAS_MMU_MANDATORY
+	bool
+
+config BR2_ARCH_HAS_MMU_OPTIONAL
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -17,6 +23,7 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -24,6 +31,7 @@ config BR2_arcle
 
 config BR2_arceb
 	bool "ARC (big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -31,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
 	  set architecture (ISA) developed by ARM Holdings. Little endian.
@@ -39,6 +48,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
+	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
 	  set architecture (ISA) developed by ARM Holdings. Big endian.
@@ -48,6 +58,7 @@ config BR2_armeb
 config BR2_aarch64
 	bool "AArch64"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -63,12 +74,14 @@ config BR2_bfin
 
 config BR2_i386
 	bool "i386"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
 config BR2_m68k
 	bool "m68k"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	depends on BROKEN # ice in uclibc / inet_ntoa_r
 	help
 	  Motorola 68000 family microprocessor
@@ -76,6 +89,7 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI bus
 	  based architecture (little endian)
@@ -84,6 +98,7 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB bus
 	  based architecture (non-AXI, big endian)
@@ -92,6 +107,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -99,6 +115,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -107,6 +124,7 @@ config BR2_mipsel
 config BR2_mips64
 	bool "MIPS64 (big endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -115,6 +133,7 @@ config BR2_mips64
 config BR2_mips64el
 	bool "MIPS64 (little endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -122,6 +141,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Nios II is a soft core processor from Altera Corporation.
 	  http://www.altera.com/
@@ -129,6 +149,7 @@ config BR2_nios2
 
 config BR2_powerpc
 	bool "PowerPC"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -138,6 +159,7 @@ config BR2_powerpc
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -147,6 +169,7 @@ config BR2_powerpc64
 config BR2_powerpc64le
 	bool "PowerPC64 (little endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Little endian.
@@ -155,6 +178,7 @@ config BR2_powerpc64le
 
 config BR2_sh
 	bool "SuperH"
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -164,6 +188,7 @@ config BR2_sh
 config BR2_sh64
 	bool "SuperH64"
 	depends on BR2_DEPRECATED_SINCE_2015_05
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -172,6 +197,7 @@ config BR2_sh64
 
 config BR2_sparc
 	bool "SPARC"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC instruction
 	  set architecture (ISA) developed by Sun Microsystems.
@@ -181,6 +207,7 @@ config BR2_sparc
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  x86-64 is an extension of the x86 instruction set (Intel i386
 	  architecture compatible microprocessor).
@@ -188,6 +215,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
 	  http://en.wikipedia.org/wiki/Xtensa
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f5d317b..a2f00d2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -64,34 +64,40 @@ config BR2_arm920t
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -99,6 +105,7 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -106,6 +113,7 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -113,6 +121,7 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -120,6 +129,7 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -127,6 +137,7 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -134,28 +145,34 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 endchoice
 
 choice
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 0687319..a0e18f1 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -3,8 +3,10 @@ choice
 	depends on BR2_xtensa
 	default BR2_xtensa_fsf
 config BR2_XTENSA_CUSTOM
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 	bool "Custom Xtensa processor configuration"
 config BR2_xtensa_fsf
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	bool "fsf - Default configuration"
 endchoice
 
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d50c908..4f411c3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -108,8 +108,8 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
-	default y if !BR2_bfin
+	bool "Enable MMU support" if BR2_ARCH_HAS_MMU_OPTIONAL
+	default y if BR2_ARCH_HAS_MMU_OPTIONAL || BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  If your target has a MMU, you should say Y here.  If you
 	  are unsure, just say Y.
-- 
2.1.4
