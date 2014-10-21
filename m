From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:06 +0200
Subject: [Buildroot] [PATCH v2 19/30] toolchain-external: use
	BR2_ARM_CPU_ARM* options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refactor the toolchain-external Config.in file to use the
BR2_ARM_CPU_ARM*. All of the changes are purely mechanical, except for
the Arago ARMv5 toolchain: it had a 'depends on BR2_GCC_TARGET_ARCH !=
"armv5t"', but armv5t was not a possible value for
BR2_GCC_TARGET_ARCH. Since the toolchain is ARMv5TE, the only ARM
architectures we need to exclude are ARMv4 and ARMv4T.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c74388f..39b56e1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -9,7 +9,7 @@ comment "(e)glibc toolchains only available with shared lib support"
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.08"
 	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
@@ -29,13 +29,13 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.08"
 	depends on BR2_armeb
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
@@ -55,7 +55,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
-	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
@@ -151,7 +151,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABI
 	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	depends on !BR2_PREFER_STATIC_LIB
@@ -174,9 +174,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	bool "Arago ARMv5 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_GCC_TARGET_ARCH != "armv4t" && \
-		BR2_GCC_TARGET_ARCH != "armv4" && \
-		BR2_GCC_TARGET_ARCH != "armv5t"
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-- 
2.0.0
