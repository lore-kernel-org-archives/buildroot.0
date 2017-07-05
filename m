From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 12:25:36 +0200
Subject: [Buildroot] [PATCH 4/5] arch/arm: add big.LITTLE cpu variants
In-Reply-To: <cover.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <dee314e62edcca9e986d86c0dec30d944deb733a.1499250321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The big.LITTLE configurations can be optimised for by gcc, and a few
users wonder what they should choose when they have such CPUs.

Add new entries for those big.LITTLE configurations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 arch/Config.in.arm                                 | 38 ++++++++++++++++++++++
 package/gcc/Config.in.host                         |  5 ++-
 .../Config.in                                      |  2 ++
 .../toolchain-external-codesourcery-arm/Config.in  |  4 +++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e6beacf3d8..5ca536684f 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -182,6 +182,15 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+config BR2_cortex_a15_a7
+	bool "cortex-A15/A7 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17
 	bool "cortex-A17"
 	select BR2_ARM_CPU_HAS_ARM
@@ -191,6 +200,15 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+config BR2_cortex_a17_a7
+	bool "cortex-A17/A7 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -207,6 +225,14 @@ config BR2_cortex_a57
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a57_a53
+	bool "cortex-A57/A53 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a72
 	bool "cortex-A72"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -215,6 +241,14 @@ config BR2_cortex_a72
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a72_a53
+	bool "cortex-A72/A53 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
@@ -526,7 +560,9 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
+	default "cortex-a15.cortex-a7"	if BR2_cortex_a15_a7
 	default "cortex-a17"	if BR2_cortex_a17
+	default "cortex-a17.cortex-a7"	if BR2_cortex_a17_a7
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
 	default "fa526"		if BR2_fa526
@@ -536,7 +572,9 @@ config BR2_GCC_TARGET_CPU
 	default "iwmmxt"	if BR2_iwmmxt
 	default "cortex-a53"		if (BR2_cortex_a53)
 	default "cortex-a57"		if (BR2_cortex_a57)
+	default "cortex-a57.cortex-a53"	if (BR2_cortex_a57_a53)
 	default "cortex-a72"		if (BR2_cortex_a72)
+	default "cortex-a72.cortex-a53"	if (BR2_cortex_a72_a53)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5dcaa03ff0..c072b78ae5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -25,7 +25,8 @@ config BR2_GCC_VERSION_4_9_X
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
 	# Broken or unsupported ARM cores
-	depends on !BR2_cortex_a17 && !BR2_cortex_a72
+	depends on !BR2_cortex_a17 && !BR2_cortex_a17_a7
+	depends on !BR2_cortex_a72 && !BR2_cortex_a72_a53
 	# Unsupported MIPS cores
 	depends on !BR2_mips_interaptiv
 	# Unsupported for MIPS R5
@@ -45,6 +46,8 @@ config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	# Broken or unsupported ARM cores
+	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	# musl ppc64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	# Unsupported MIPS cores
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
index 2fbb218ecc..66a032e9ac 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
@@ -1,6 +1,8 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.11"
 	depends on BR2_aarch64
+	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
+	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index 6331873dbd..70c488d327 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -1,6 +1,10 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
+	# a15/a7 appeared in gcc-4.9, a17/a7 in gcc-5, a57/a53 and a72/a53
+	# in gcc-6, or they were broken earlier than that.
+	depends on !BR2_cortex_a15_a7 && !BR2_cortex_a17_a7
+	depends on !BR2_cortex_a57_53 && !BR2_cortex_a72_53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
-- 
2.11.0
