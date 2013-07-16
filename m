From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:03:20 +0200
Subject: [Buildroot] [PATCHv3 09/14] toolchain-external: update config
	options after EABIhf introduction
In-Reply-To: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373961805-3901-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The introduction of the EABIhf ABI requires a few updates to the
configuration options for external toolchains, in order to ensure that
the user doesn't do any invalid selection. In detail:

 * The Linaro ARM toolchains now depend on BR2_ARM_EABIHF, because
   that's the ABI they use, and it is incompatible with EABI. The
   comment about the availability of Linaro toolchains is updated to
   inform users selecting EABI that they should select EABIhf if they
   want to see Linaro toolchains.

 * The Sourcery CodeBench toolchains now depend on BR2_ARM_EABI,
   because that's the ABI they use. A comment is added to inform users
   that have selected EABIhf that Sourcery CodeBench are only
   available when EABI is used.

 * The Arago toolchains now depend on BR2_ARM_EABI, because that's the
   ABI they use. The description of the ARMv7 Arago toolchain is also
   slightly improved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 130b705..324401f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -27,6 +28,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -46,6 +48,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -60,14 +63,16 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 
 	  To use this toolchain, you must disable soft float usage.
 
-comment "Linaro toolchains available for Cortex-A{5,8,9,15}"
+comment "Linaro toolchains available for Cortex-A{5,7,8,9,15} and the EABIhf ABI"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a"
+	depends on !BR2_ARM_EABIHF
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	bool "Sourcery CodeBench ARM 2013.05"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -92,6 +97,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	bool "Sourcery CodeBench ARM 2012.03"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -116,6 +122,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -136,11 +143,17 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+comment "Sourcery CodeBench toolchains available for the EABI ABI"
+	depends on BR2_arm
+	depends on !BR2_ARM_EABI
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_ARM_EABI
+	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -149,9 +162,11 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
 	  binutils 2.20.1, glibc 2.12, gdb 7.2.
 
-	  This toolchain uses -mfloat-abi=softfp (i.e use FPU
-	  instructions, but pass floating point function arguments in
-	  non-floating point registers).
+	  This toolchain uses -mfloat-abi=softfp (i.e can use FPU
+	  instructions, but passes floating point function arguments
+	  in integer registers), and requires a VFPv3 floating point
+	  unit to work properly. This unit is available on most
+	  Cortex-A ARM processors, but not all.
 
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	bool "Arago ARMv5 2011.09"
@@ -160,6 +175,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	depends on BR2_GCC_TARGET_ARCH != "armv4t" && \
 		BR2_GCC_TARGET_ARCH != "armv4" && \
 		BR2_GCC_TARGET_ARCH != "armv5t"
+	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-- 
1.8.1.2
