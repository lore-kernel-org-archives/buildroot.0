From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:08 +0100
Subject: [Buildroot] [PATCH 5/8] arch/Config.in.arm: add FPU related options
	for ARMv8 cores
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <c0050d5134ffd7c430d4e813d6080c78473f0a4c.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The ARMv8 cores have a mandatory FPU unit called FP-ARMv8, so we:

 - add a new hidden Config.in option for the availability of this
   unit (BR2_ARM_CPU_HAS_FP_ARMV8)

 - allow the selection of a possible choice in the "Floating point
   strategy", and add two new choices: BR2_ARM_FPU_FP_ARMV8 and
   BR2_ARM_FPU_NEON_FP_ARMV8.

 - specify the -mfpu values for BR2_ARM_FPU_FP_ARMV8 and
   BR2_ARM_FPU_NEON_FP_ARMV8 cases, when used on ARM 32 bits (-mfpu
   doesn't exist on ARM64, instead -mcpu modifiers are used, so they
   will be added on a per-core basis).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: drop the FP strategy dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index fa999d5..1a3c36d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,10 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_HAS_FP_ARMV8
+	bool
+	select BR2_ARM_CPU_HAS_VFPV4
+
 config BR2_ARM_CPU_HAS_ARM
 	bool
 
@@ -308,6 +312,7 @@ endchoice
 
 choice
 	prompt "Floating point strategy"
+	default BR2_ARM_FPU_FP_ARMV8 if BR2_ARM_CPU_HAS_FP_ARMV8
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
@@ -418,6 +423,20 @@ config BR2_ARM_FPU_NEON_VFPV4
 	  example on Cortex-A5 and Cortex-A7, support for VFPv4 and
 	  NEON is optional.
 
+config BR2_ARM_FPU_FP_ARMV8
+	bool "FP-ARMv8"
+	depends on BR2_ARM_CPU_HAS_FP_ARMV8
+	help
+	  This option allows to use the ARMv8 floating point unit.
+
+config BR2_ARM_FPU_NEON_FP_ARMV8
+	bool "NEON/FP-ARMv8"
+	depends on BR2_ARM_CPU_HAS_FP_ARMV8
+	depends on BR2_ARM_CPU_HAS_NEON
+	help
+	  This option allows to use both the ARMv8 floating point unit
+	  and the NEON SIMD unit for floating point operations.
+
 endchoice
 
 choice
@@ -504,6 +523,8 @@ config BR2_GCC_TARGET_FPU
 	default "vfpv4-d16" 	if BR2_ARM_FPU_VFPV4D16
 	default "neon" 		if BR2_ARM_FPU_NEON
 	default "neon-vfpv4" 	if BR2_ARM_FPU_NEON_VFPV4
+	default "fp-armv8"	if BR2_ARM_FPU_FP_ARMV8
+	default "neon-fp-armv8"	if BR2_ARM_FPU_NEON_FP_ARMV8
 
 config BR2_GCC_TARGET_FLOAT_ABI
 	default "soft"		if BR2_ARM_SOFT_FLOAT
-- 
2.7.4
