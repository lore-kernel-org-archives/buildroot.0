From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:10:04 +0100
Subject: [Buildroot] [git commit] arch/arm: add an armv8.3a core
Message-ID: <20181230150529.0C0317FCE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=354781dd962f5011cd2c9aa9f0ee84150bd28229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The armv8.3a generation is a cumulative extension to armv8.2a.

Since gcc correctly enables the appropriate extensions based on the core
name, we don't really need to introduce a separate config for armv8.3a,
and we can piggyback on armv8a.

This new core is AArch64 only.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e3c64d12ab..a9972978d4 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -473,6 +473,16 @@ config BR2_cortex_a75_a55
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 endif # BR2_ARCH_IS_64
+
+if BR2_ARCH_IS_64
+comment "armv8.3a cores"
+config BR2_saphira
+	bool "saphira"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+endif # BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -822,6 +832,8 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a55"	if BR2_cortex_a55
 	default "cortex-a75"	if BR2_cortex_a75
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
+	# armv8.3a
+	default "saphira"	if BR2_saphira
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
