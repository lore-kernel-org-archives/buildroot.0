From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Thu, 21 May 2015 13:54:09 -0300
Subject: [Buildroot] [PATCH 2/2] arch: tidy up binary formats config
In-Reply-To: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1432227249-15345-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of blacklisting architectures when deciding the binary format,
let's have each one select the binary formats it supports. The
preferred default is ELF, then FDPIC, and finally FLAT.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 arch/Config.in     | 43 +++++++++++++++++++++++++++++++++++++------
 arch/Config.in.arm | 17 +++++++++++++++++
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 3fb3838..30f0517 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -15,6 +15,15 @@ config BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_ARCH_HAS_MMU_OPTIONAL
 	bool
 
+config BR2_ARCH_HAS_ELF_SUPPORT
+	bool
+
+config BR2_ARCH_HAS_FDPIC_SUPPORT
+	bool
+
+config BR2_ARCH_HAS_FLAT_SUPPORT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -24,6 +33,7 @@ choice
 config BR2_arcle
 	bool "ARC (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -32,6 +42,7 @@ config BR2_arcle
 config BR2_arceb
 	bool "ARC (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
 	  that can be used from deeply embedded to high performance host
@@ -57,6 +68,7 @@ config BR2_aarch64
 	bool "AArch64"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -64,6 +76,8 @@ config BR2_aarch64
 
 config BR2_bfin
 	bool "Blackfin"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
+	select BR2_ARCH_HAS_FLAT_SUPPORT
 	help
 	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
 	  manufactured and marketed by Analog Devices.
@@ -73,6 +87,7 @@ config BR2_bfin
 config BR2_i386
 	bool "i386"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
@@ -80,6 +95,7 @@ config BR2_i386
 config BR2_m68k
 	bool "m68k"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_FLAT_SUPPORT
 	depends on BROKEN # ice in uclibc / inet_ntoa_r
 	help
 	  Motorola 68000 family microprocessor
@@ -88,6 +104,7 @@ config BR2_m68k
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI bus
 	  based architecture (little endian)
@@ -97,6 +114,7 @@ config BR2_microblazeel
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB bus
 	  based architecture (non-AXI, big endian)
@@ -106,6 +124,7 @@ config BR2_microblazebe
 config BR2_mips
 	bool "MIPS (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -114,6 +133,7 @@ config BR2_mips
 config BR2_mipsel
 	bool "MIPS (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -123,6 +143,7 @@ config BR2_mips64
 	bool "MIPS64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -132,6 +153,7 @@ config BR2_mips64el
 	bool "MIPS64 (little endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -140,6 +162,7 @@ config BR2_mips64el
 config BR2_nios2
 	bool "Nios II"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Nios II is a soft core processor from Altera Corporation.
 	  http://www.altera.com/
@@ -148,6 +171,7 @@ config BR2_nios2
 config BR2_powerpc
 	bool "PowerPC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -158,6 +182,7 @@ config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Big endian.
@@ -168,6 +193,7 @@ config BR2_powerpc64le
 	bool "PowerPC64 (little endian)"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
 	  Little endian.
@@ -177,6 +203,7 @@ config BR2_powerpc64le
 config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -187,6 +214,7 @@ config BR2_sh64
 	bool "SuperH64"
 	depends on BR2_DEPRECATED_SINCE_2015_05
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -196,6 +224,7 @@ config BR2_sh64
 config BR2_sparc
 	bool "SPARC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC instruction
 	  set architecture (ISA) developed by Sun Microsystems.
@@ -206,6 +235,7 @@ config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  x86-64 is an extension of the x86 instruction set (Intel i386
 	  architecture compatible microprocessor).
@@ -214,6 +244,7 @@ config BR2_x86_64
 config BR2_xtensa
 	bool "Xtensa"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 	help
 	  Xtensa is a Tensilica processor IP architecture.
 	  http://en.wikipedia.org/wiki/Xtensa
@@ -270,13 +301,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
-	default BR2_BINFMT_FDPIC if BR2_bfin
-	default BR2_BINFMT_FLAT if BR2_m68k
+	default BR2_BINFMT_ELF		if BR2_ARCH_HAS_ELF_SUPPORT
+	default BR2_BINFMT_FDPIC	if BR2_ARCH_HAS_FDPIC_SUPPORT
+	default BR2_BINFMT_FLAT		if BR2_ARCH_HAS_FLAT_SUPPORT
 
 config BR2_BINFMT_ELF
 	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
+	depends on BR2_ARCH_HAS_ELF_SUPPORT
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
@@ -285,7 +316,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
-	depends on BR2_bfin
+	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
@@ -295,7 +326,7 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
+	depends on BR2_ARCH_HAS_FLAT_SUPPORT
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
 	  based on the original a.out format. It is widely used in environment
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a2f00d2..482a33a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -65,12 +65,14 @@ config BR2_arm920t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_HAS_ARM
@@ -78,6 +80,7 @@ config BR2_arm926t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -85,12 +88,14 @@ config BR2_arm1136jf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -98,6 +103,7 @@ config BR2_arm1176jzf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -106,6 +112,7 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -114,6 +121,7 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -122,6 +130,7 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -130,6 +139,7 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -138,6 +148,7 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -146,33 +157,39 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_HAS_ELF_SUPPORT
 endchoice
 
 choice
-- 
2.1.4
