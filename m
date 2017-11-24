From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:30:43 +0100
Subject: [Buildroot] [git commit branch/next] arch/arm: add armv8.1a cores
Message-ID: <20171124222554.4E3AF80253@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6317a199ecb525309e8172237a15b46776fe3a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The armv8.1a generation is a cumulative extension to armv8a. It adds new
extensions, and makes some previously optional ones now mandatory.

Since gcc correctly enables the appropriate extensions based on the core
name, we don't really need to introduce a separate config for armv8.1a,
and we can piggyback on armv8a.

All those new cores are aarch64 only (gcc fails to build in arm mode).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2d6eb99..85070fb 100644
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
@@ -704,6 +735,10 @@ config BR2_GCC_TARGET_CPU
 	default "thunderxt88"	if BR2_thunderxt88
 	default "thunderxt88p1"	if BR2_thunderxt88p1
 	default "xgene1"	if BR2_xgene1
+	# armv8.1a
+	default "thunderx2t99"	if BR2_thunderx2t99
+	default "thunderx2t99p1"	if BR2_thunderx2t99p1
+	default "vulcan"	if BR2_vulcan
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
