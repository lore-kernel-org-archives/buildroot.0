From: Eddy Petrisor <eddy.petrisor@freescale.com>
Date: Sun, 28 Sep 2014 04:10:17 +0300
Subject: [Buildroot] [PATCH 1/1] arm: -march for Cortex A7,
	A12 and A15 is armv7ve
Message-ID: <1411866617-4994-1-git-send-email-eddy.petrisor@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eddy Petri?or <eddy.petrisor@gmail.com>

For Cortex A7, A12 and A15 setting -march=armv7-a will generate this
type of warning by default:

warning: switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch

This is because these cores have an instruction set which is based on
the armv7-a set, but adds some extensions on top of them. This new set
is called 'armv7ve' and is the default for A7, A12 and A15:

http://gcc.gnu.org/viewcvs?rev=207237&root=gcc&view=rev

With this patch we make sure we don't force the warning anymore.

Signed-off-by: Eddy Petri?or <eddy.petrisor@gmail.com>
---
 arch/Config.in.arm                     | 6 +++---
 toolchain/toolchain-external/Config.in | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 201ff1d..2988ac0 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -369,11 +369,11 @@ config BR2_GCC_TARGET_ARCH
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
 	default "armv7-a"	if BR2_cortex_a5
-	default "armv7-a"	if BR2_cortex_a7
+	default "armv7ve"	if BR2_cortex_a7
 	default "armv7-a"	if BR2_cortex_a8
 	default "armv7-a"	if BR2_cortex_a9
-	default "armv7-a"	if BR2_cortex_a12
-	default "armv7-a"	if BR2_cortex_a15
+	default "armv7ve"	if BR2_cortex_a12
+	default "armv7ve"	if BR2_cortex_a15
 	default "armv4"		if BR2_fa526
 	default "armv7-a"	if BR2_pj4
 	default "armv4"		if BR2_strongarm
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 67ad450..a7b965b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -9,7 +9,7 @@ comment "(e)glibc toolchains only available with shared lib support"
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.08"
 	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a" || BR2_GCC_TARGET_ARCH = "armv7ve"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
@@ -29,13 +29,13 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
+	depends on (BR2_GCC_TARGET_ARCH != "armv7-a" && BR2_GCC_TARGET_ARCH != "armv7ve") || !BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.08"
 	depends on BR2_armeb
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a" || BR2_GCC_TARGET_ARCH = "armv7ve"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
-- 
1.9.2.459.g68773ac
