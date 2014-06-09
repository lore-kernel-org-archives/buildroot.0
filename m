From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:38:55 +0200
Subject: [Buildroot] [git commit] toolchain-external: support only one
	Linaro ARM toolchain at a time
Message-ID: <20140609134341.E31AC9CF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be2abf23ce808bf342e6067c529738530a8073d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linaro toolchains are released so frequently (every month) that it
doesn't make much sense to support 3 consecutive versions. So, like we
do for ARM big-endian, let's support only one version at a time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             |   52 +------------------
 toolchain/toolchain-external/toolchain-external.mk |   10 +---
 2 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index aa21f22..619a50f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,8 +6,8 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
-	bool "Linaro 2014.02"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "Linaro ARM 2014.02"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -28,50 +28,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
-	bool "Linaro 2014.01"
-	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2014.01 (based on gcc 4.8), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.18, Binutils 2013.11 (based on 2.24). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
-	bool "Linaro 2013.12"
-	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.12 (based on gcc 4.8), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.18, Binutils 2013.11 (based on 2.24). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
-
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
@@ -938,9 +894,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 6816b3f..bb81f4c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -275,15 +275,7 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.12/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.12_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.01/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.01_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
