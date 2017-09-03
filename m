From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 15:17:48 +0200
Subject: [Buildroot] [PATCH 8/9] arch/arm: add armv8.1a cores
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <26299bebf4d92dc57d8722f1f11eb3b2209ceb30.1504444617.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The armv8.1a generation is a cumulative extension to armv8a. It adds new
extensions, and makes some previously optional ones now mandatory.

Since gcc correctly enables the appropriate extensions based on the core
name, we don't really need to introduce a separate config for armv8.1a,
and we can piggyback on armv8a.

All those new cores are aarch64 only (gcc fails to build in arm mode).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 40d6ae18b8..1cb75c1b69 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -400,6 +400,37 @@ config BR2_xgene1
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+
+if BR2_ARCH_IS_64
+comment "armv8.1a cores"
+config BR2_thunderx2t99
+	bool "thunderx2t99"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_thunderx2t99p1
+	bool "thunderx2t99p1"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_vulcan
+	bool "vulcan"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+endif # BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -705,6 +736,10 @@ config BR2_GCC_TARGET_CPU
 	default "thunderxt88"	if BR2_thunderxt88
 	default "thunderxt88p1"	if BR2_thunderxt88p1
 	default "xgene1"	if BR2_xgene1
+	# armv8.1a
+	default "thunderx2t99"	if BR2_thunderx2t99
+	default "thunderx2t99p1"	if BR2_thunderx2t99p1
+	default "vulcan"	if BR2_vulcan
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.11.0
