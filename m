From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:55 +0200
Subject: [Buildroot] [PATCH v3 13/15] arch/arm: add two new cortex-based
 armv8.2a cores
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-14-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The cortex-a76 implements the full amrv8.2a extensions, and some
optional extensions from the armv8.3a, armv8.4a, and armv8.5a sets,
but none of their mandatory extensions, which means that it does not
qualify for better than an armv8.2a:
    https://developer.arm.com/products/processors/cortex-a/cortex-a76
    http://infocenter.arm.com/help/topic/com.arm.doc.100798_0301_00_en/giq1479805174793.html
    http://infocenter.arm.com/help/topic/com.arm.doc.100798_0301_00_en/fjv1477559794375.html

Also, gcc fits it in the armv8.2a category, too:
    https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;h=67ce42fb8aacd4c246295f32151a03b1f318ae44;hb=HEAD#l97

Build tested:
https://gitlab.com/kubu93/buildroot/pipelines/60318953

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 arch/Config.in.arm | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4685b72510..a664cfe0e2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -494,6 +494,24 @@ config BR2_cortex_a75_a55
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+config BR2_cortex_a76
+	bool "cortex-A76"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_cortex_a76_a55
+	bool "cortex-A76/A55 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
 config BR2_saphira
@@ -857,6 +875,8 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a55"	if BR2_cortex_a55
 	default "cortex-a75"	if BR2_cortex_a75
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
+	default "cortex-a76"	if BR2_cortex_a76
+	default "cortex-a76.cortex-a55"	if BR2_cortex_a76_a55
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 
-- 
2.17.1
