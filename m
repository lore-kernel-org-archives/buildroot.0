From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:19:14 +0100
Subject: [Buildroot] [git commit] arch/arm: some variants need different gcc
 versions
Message-ID: <20171201205336.929107F90C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d08ccb40f53f152f4c4443a636b52239fded57ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Take the conditions currently specified in the gcc version choice.

Also, the conditions explained in the commit log for 78c2a9f7 were not
all properly applied, especially the a57-a53 combo needs gcc-6, but
78c2a9f7 forgot to add the condition to gcc-4.9.

gcc-4.9 was excluded for cortex-a17 and a72, but the CodeSourcery
external toolchain, which uses 4.8, was not excluded for those two
cores. Now it is.

Remove the arch condition from gcc and the external toolchains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm                                                  | 6 ++++++
 package/gcc/Config.in.host                                          | 5 -----
 .../toolchain-external-codesourcery-arm/Config.in                   | 4 ----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 09916df..b58be6b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -190,6 +190,7 @@ config BR2_cortex_a15_a7
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17
 	bool "cortex-A17"
@@ -199,6 +200,7 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17_a7
 	bool "cortex-A17/A7 big.LITTLE"
@@ -208,6 +210,7 @@ config BR2_cortex_a17_a7
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a53
 	bool "cortex-A53"
@@ -233,6 +236,7 @@ config BR2_cortex_a57_a53
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a72
 	bool "cortex-A72"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -241,6 +245,7 @@ config BR2_cortex_a72
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a72_a53
 	bool "cortex-A72/A53 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -249,6 +254,7 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index c681dee..780ee73 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -25,9 +25,6 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_or1k
-	# Broken or unsupported ARM cores
-	depends on !BR2_cortex_a17 && !BR2_cortex_a17_a7
-	depends on !BR2_cortex_a72 && !BR2_cortex_a72_a53
 	# musl microblaze unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 	# musl ppc64 unsupported
@@ -43,8 +40,6 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc && !BR2_or1k
-	# Broken or unsupported ARM cores
-	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	# musl ppc64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	# musl mips64 unsupported
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index b91daa5..60d86c3 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -2,10 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
-	# a15/a7 appeared in gcc-4.9, a17/a7 in gcc-5, a57/a53 and a72/a53
-	# in gcc-6, or they each were broken earlier than that.
-	depends on !BR2_cortex_a15_a7 && !BR2_cortex_a17_a7
-	depends on !BR2_cortex_a57_53 && !BR2_cortex_a72_53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
