From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:07:51 +0100
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME hidden
	config option
Message-ID: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config option corresponds to the string returned by readelf for
the "Machine" field of the ELF header. It will be used to check if the
architecture of binaries built by Buildroot match the target
architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v3:
 - None

Changes since v2:
 - Improve comment above BR2_READELF_ARCH_NAME to explain that it is the
   value of the "Machine:" field in readelf output, and point to the
   readelf source code for the list of possible values.

Changes since v1:
 - None
---
 arch/Config.in            | 6 ++++++
 arch/Config.in.arc        | 3 +++
 arch/Config.in.arm        | 4 ++++
 arch/Config.in.bfin       | 3 +++
 arch/Config.in.csky       | 2 ++
 arch/Config.in.m68k       | 3 +++
 arch/Config.in.microblaze | 3 +++
 arch/Config.in.mips       | 3 +++
 arch/Config.in.nios2      | 3 +++
 arch/Config.in.or1k       | 3 +++
 arch/Config.in.powerpc    | 4 ++++
 arch/Config.in.sh         | 3 +++
 arch/Config.in.sparc      | 4 ++++
 arch/Config.in.x86        | 4 ++++
 arch/Config.in.xtensa     | 3 +++
 15 files changed, 51 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 65a33fb..50377a9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -292,6 +292,12 @@ config BR2_GCC_TARGET_MODE
 config BR2_BINFMT_SUPPORTS_SHARED
 	bool
 
+# Must match the name of the architecture from readelf point of view,
+# i.e the "Machine:" field of readelf output. See get_machine_name()
+# in binutils/readelf.c for the list of possible values.
+config BR2_READELF_ARCH_NAME
+	string
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 7d341f3..dcdba68 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -38,6 +38,9 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
 
+config BR2_READELF_ARCH_NAME
+	default "ARCv2"
+
 choice
 	prompt "MMU Page Size"
 	default BR2_ARC_PAGE_SIZE_8K
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2617976..f910364 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -568,3 +568,7 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_GCC_TARGET_MODE
 	default "arm"		if BR2_ARM_INSTRUCTIONS_ARM
 	default "thumb"		if BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2
+
+config BR2_READELF_ARCH_NAME
+	default "ARM"		if BR2_arm || BR2_armeb
+	default "AArch64"	if BR2_aarch64 || BR2_aarch64_be
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 9f7056a..90e4ab9 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -105,3 +105,6 @@ config BR2_GCC_TARGET_CPU_REVISION
 	  value of the -mcpu option. For example, if the selected CPU is
 	  bf609, and then selected CPU revision is "0.0", then gcc will
 	  receive the -mcpu=bf609-0.0 option.
+
+config BR2_READELF_ARCH_NAME
+	default "Analog Devices Blackfin"
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 7029c60..e88e4e2 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -44,3 +44,5 @@ config BR2_GCC_TARGET_CPU
 	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
 	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
 
+config BR2_READELF_ARCH_NAME
+	default "CSKY"
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index ced871f..c56031c 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -35,3 +35,6 @@ endchoice
 config BR2_GCC_TARGET_CPU
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
+
+config BR2_READELF_ARCH_NAME
+	default "MC68000"
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 2d4c1fe..042712a 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -6,6 +6,9 @@ config BR2_ENDIAN
 	default "LITTLE" if BR2_microblazeel
 	default "BIG"	 if BR2_microblazebe
 
+config BR2_READELF_ARCH_NAME
+	default "Xilinx MicroBlaze"
+
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index ce41e9e..22819d0 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -161,3 +161,6 @@ config BR2_GCC_TARGET_ABI
 	default "32"		if BR2_MIPS_OABI32
 	default "n32"		if BR2_MIPS_NABI32
 	default "64"		if BR2_MIPS_NABI64
+
+config BR2_READELF_ARCH_NAME
+	default "MIPS R3000"
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index ed63898..7466331 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "Altera Nios II"
diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
index dba64a6..b31ab3e 100644
--- a/arch/Config.in.or1k
+++ b/arch/Config.in.or1k
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "BIG"
+
+config BR2_READELF_ARCH_NAME
+	default "OpenRISC 1000"
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 09ac794..0968412 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -212,3 +212,7 @@ config BR2_GCC_TARGET_ABI
 	default "no-spe"		if BR2_PPC_ABI_no-spe
 	default "ibmlongdouble"		if BR2_PPC_ABI_ibmlongdouble
 	default "ieeelongdouble"	if BR2_PPC_ABI_ieeelongdouble
+
+config BR2_READELF_ARCH_NAME
+	default "PowerPC"	if BR2_powerpc
+	default "PowerPC64"	if BR2_powerpc64 || BR2_powerpc64le
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 4705212..deb7244 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -27,3 +27,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
+
+config BR2_READELF_ARCH_NAME
+	default "Renesas / SuperH SH"
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 307540f..9b6a6aa 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -28,3 +28,7 @@ config BR2_GCC_TARGET_CPU
 	default "leon3"		if BR2_sparc_leon3
 	default "v8"		if BR2_sparc_v8
 	default "ultrasparc"	if BR2_sparc_v9
+
+config BR2_READELF_ARCH_NAME
+	default "Sparc"		if BR2_sparc
+	default "Sparc v9"	if BR2_sparc64
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index efa9567..0d9e93b 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -275,3 +275,7 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
+
+config BR2_READELF_ARCH_NAME
+	default "Intel 80386"			if BR2_i386
+	default "Advanced Micro Devices X86-64" if BR2_x86_64
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index fcb3dc9..88dbe18 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -54,3 +54,6 @@ config BR2_ENDIAN
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
+
+config BR2_READELF_ARCH_NAME
+	default "Tensilica Xtensa Processor"
-- 
2.7.4
