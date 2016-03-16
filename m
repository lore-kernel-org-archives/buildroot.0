From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:16 +0100
Subject: [Buildroot] [PATCH 10/16] arch/arm: add support for hard-float on
	Cortex-M4
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cortex-M4 cores can optionally have a FPv4-SP floating point unit
(which is different than the VFPv4). This commit adds the necessary
Config.in options to allow the user to enable the use of this FPU, and
to build an EABIhf toolchain for Cortex-M4.

Note that for now the kernel does not have CONFIG_VFP support for
ARMv7-M, so in practice, this VFP support cannot really be used for
the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ee612f5..ad3c725 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,12 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_MAYBE_HAS_FPV4_SP
+	bool
+
+config BR2_ARM_CPU_HAS_FPV4_SP
+	bool
+
 config BR2_ARM_CPU_HAS_ARM
 	bool
 
@@ -177,6 +183,7 @@ config BR2_cortex_m3
 config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_MAYBE_HAS_FPV4_SP
 	select BR2_ARM_CPU_ARMV7M
 config BR2_fa526
 	bool "fa526/626"
@@ -218,10 +225,11 @@ config BR2_ARM_ENABLE_NEON
 
 config BR2_ARM_ENABLE_VFP
 	bool "Enable VFP extension support"
-	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_FPV4_SP
 	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_FPV4_SP if BR2_ARM_CPU_MAYBE_HAS_FPV4_SP
 	help
 	  For some CPU cores, the VFP extension is optional. Select
 	  this option if you are certain your particular
@@ -264,7 +272,7 @@ config BR2_ARM_EABI
 
 config BR2_ARM_EABIHF
 	bool "EABIhf"
-	depends on BR2_ARM_CPU_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_FPV4_SP
 	help
 	  The EABIhf is an extension of EABI which supports the 'hard'
 	  floating point model. This model uses the floating point
@@ -285,6 +293,7 @@ endchoice
 choice
 	prompt "Floating point strategy"
 	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
+	default BR2_ARM_FPU_FPV4_SP if BR2_ARM_CPU_HAS_FPV4_SP
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
@@ -374,6 +383,15 @@ config BR2_ARM_FPU_VFPV4D16
 	  cores, including the earlier Cortex-A{8, 9}, you should
 	  instead select VFPv3-D16.
 
+config BR2_ARM_FPU_FPV4_SP
+	bool "FPv4-SP-D16"
+	depends on BR2_ARM_CPU_HAS_FPV4_SP
+	help
+	  This option allows to use the FPv4-SP floating point unit,
+	  as available in some ARMv7-M processors (Cortex-M4). This
+	  option requires a FPv4-SP unit that has 16 double-precision
+	  registers.
+
 config BR2_ARM_FPU_NEON
 	bool "NEON"
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -475,6 +493,7 @@ config BR2_GCC_TARGET_FPU
 	default "vfpv3-d16" 	if BR2_ARM_FPU_VFPV3D16
 	default "vfpv4" 	if BR2_ARM_FPU_VFPV4
 	default "vfpv4-d16" 	if BR2_ARM_FPU_VFPV4D16
+	default "fpv4-sp-d16"	if BR2_ARM_FPU_FPV4_SP
 	default "neon" 		if BR2_ARM_FPU_NEON
 	default "neon-vfpv4" 	if BR2_ARM_FPU_NEON_VFPV4
 
-- 
2.6.4
