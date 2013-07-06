From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jul 2013 17:08:06 +0200
Subject: [Buildroot] [PATCH 2/8] arch: Refactor BR2_SOFT_FLOAT into
	per-architecture options
In-Reply-To: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373123292-15085-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are going to introduced a more advanced support of floating
point options for the ARM architecture, we need to adjust how the
soft-float option is handled. We replace the current hidden option
BR2_PREFER_SOFT_FLOAT option and the visible BR2_SOFT_FLOAT option by:

 * A global hidden BR2_SOFT_FLOAT option, defined in arch/Config.in,
   that tells whether the architecture-specific code is using software
   emulated floating point. This hidden option can be used throughout
   Buildroot to determine whether soft float is used or not.

 * Per-architecture visible BR2_<arch>_SOFT_FLOAT options, for the
   architecture for which it makes sense, which allows users to select
   soft float emulation when needed.

This change will allow each architecture to have a different way of
presenting its floating point capabilities.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in                |  3 +++
 arch/Config.in.arm            | 10 ++++++++++
 arch/Config.in.avr32          | 10 ++++++++++
 arch/Config.in.mips           | 10 ++++++++++
 arch/Config.in.powerpc        | 10 ++++++++++
 toolchain/toolchain-common.in | 21 ---------------------
 6 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index d95d4ef..8daeee3 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -1,6 +1,9 @@
 config BR2_ARCH_IS_64
        bool
 
+config BR2_SOFT_FLOAT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 983cac4..a0c7228 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -86,6 +86,16 @@ config BR2_ARM_EABI
 	def_bool y
 	depends on !BR2_ARM_OABI
 
+config BR2_ARM_SOFT_FLOAT
+	bool "Use soft-float"
+	default y
+	select BR2_SOFT_FLOAT
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU)
+	  or a kernel FPU emulator, but you still wish to support
+	  floating point functions, then everything will need to be
+	  compiled with soft floating point support (-msoft-float).
+
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
 	depends on BR2_ARM_CPU_MAYBE_HAS_NEON
diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index ebf8454..34055d9 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -3,3 +3,13 @@ config BR2_ARCH
 
 config BR2_ENDIAN
        default "BIG"
+
+config BR2_AVR32_SOFT_FLOAT
+	bool "Use soft-float"
+	default y
+	select BR2_SOFT_FLOAT
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU)
+	  or a kernel FPU emulator, but you still wish to support
+	  floating point functions, then everything will need to be
+	  compiled with soft floating point support (-msoft-float).
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 1454fb4..6242bcc 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -52,6 +52,16 @@ config BR2_MIPS_NABI64
 	depends on BR2_ARCH_IS_64
 endchoice
 
+config BR2_MIPS_SOFT_FLOAT
+	bool "Use soft-float"
+	default y
+	select BR2_SOFT_FLOAT
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU)
+	  or a kernel FPU emulator, but you still wish to support
+	  floating point functions, then everything will need to be
+	  compiled with soft floating point support (-msoft-float).
+
 config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8643efc..721d40a 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -88,6 +88,16 @@ config BR2_powerpc_SPE
 	depends on BR2_powerpc_8540 || BR2_powerpc_8548
 endchoice
 
+config BR2_POWERPC_SOFT_FLOAT
+	bool "Use soft-float"
+	default y
+	select BR2_SOFT_FLOAT
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU)
+	  or a kernel FPU emulator, but you still wish to support
+	  floating point functions, then everything will need to be
+	  compiled with soft floating point support (-msoft-float).
+
 config BR2_ARCH
 	default "powerpc"	if BR2_powerpc
 
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7c9b842..dc3bd2a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -90,27 +90,6 @@ config BR2_USE_MMU
 	  If your target has a MMU, you should say Y here.  If you
 	  are unsure, just say Y.
 
-config BR2_PREFER_SOFT_FLOAT
-	bool
-	default y if BR2_arm
-	default y if BR2_armeb
-	default y if BR2_avr32
-	default y if BR2_mips
-	default y if BR2_mipsel
-
-config BR2_SOFT_FLOAT
-	bool "Use software floating point by default"
-	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
-	# External toolchains will automatically do soft float or hard
-	# float depending on their configuration
-	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_CTNG
-	default $(BR2_PREFER_SOFT_FLOAT)
-	help
-	  If your target CPU does not have a Floating Point Unit (FPU) or a
-	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft
-	  floating point support (-msoft-float).
-
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-pipe"
-- 
1.8.1.2
