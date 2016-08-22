From: Matt Flax <flatmax@flatmax.org>
Date: Mon, 22 Aug 2016 20:12:28 +1000
Subject: [Buildroot] [PATCH 3/3] arch/arm: Add ARMV8 (aarch32) toolchain
	config.
Message-ID: <1471860748-5126-1-git-send-email-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit configures the toolchain to use the ARMV8 hardware features.
This commit also cleans up and adds to the previous cortex-a53 commit.

This commit adds BR2_ARM_CPU_HAS_ARMV8 to arch/Config.in.arm and cleans up
the BR2_cortex_a53 config to remove redundant selections relating to VFPV4 and
ARMV7A. The commit also adds BR2_ARM_CPU_HAS_ARMV8 to BR2_ARM_EABIHF which
allows the selection of hard float (HF) activating the toolchain for whatever
specific ARMV8 hardware features are possible. It also adds the
BR2_ARM_FPU_NEON_ARMV8 HF tuning (crypto-neon-fp-armv8).

The cortex-a53 BR2_ARCH_HAS_MMU_OPTIONAL selection ensures that uclibc successfully
compiles without non-compliant swp assembly calls.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 arch/Config.in.arm | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 72bb744..c01daf6 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,9 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_HAS_ARMV8
+	bool
+
 config BR2_ARM_CPU_HAS_ARM
 	bool
 
@@ -174,8 +177,7 @@ config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_NEON
-	select BR2_ARM_CPU_HAS_VFPV4
-	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARM_CPU_HAS_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
@@ -271,7 +273,7 @@ config BR2_ARM_EABI
 
 config BR2_ARM_EABIHF
 	bool "EABIhf"
-	depends on BR2_ARM_CPU_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_ARMV8
 	help
 	  The EABIhf is an extension of EABI which supports the 'hard'
 	  floating point model. This model uses the floating point
@@ -292,6 +294,7 @@ endchoice
 choice
 	prompt "Floating point strategy"
 	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
+	default BR2_ARM_FPU_NEON_ARMV8 if BR2_ARM_CPU_HAS_ARMV8
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
@@ -366,6 +369,13 @@ config BR2_ARM_FPU_VFPV4
 	  cores, including the earlier Cortex-A{8, 9}, you should
 	  instead select VFPv3.
 
+config BR2_ARM_FPU_NEON_ARMV8
+	bool "ARMV8"
+	depends on BR2_ARM_CPU_HAS_ARMV8
+	help
+	  This option allows to use the ARMV8 floating point unit, as
+	  available in some ARMv8 processors (Cortex-A53).
+
 config BR2_ARM_FPU_VFPV4D16
 	bool "VFPv4-D16"
 	depends on BR2_ARM_CPU_HAS_VFPV4
@@ -485,6 +495,7 @@ config BR2_GCC_TARGET_FPU
 	default "vfpv4-d16" 	if BR2_ARM_FPU_VFPV4D16
 	default "neon" 		if BR2_ARM_FPU_NEON
 	default "neon-vfpv4" 	if BR2_ARM_FPU_NEON_VFPV4
+	default "crypto-neon-fp-armv8" 	if BR2_ARM_FPU_NEON_ARMV8
 
 config BR2_GCC_TARGET_FLOAT_ABI
 	default "soft"		if BR2_ARM_SOFT_FLOAT
-- 
2.7.4
