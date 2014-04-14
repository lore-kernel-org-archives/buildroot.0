From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:10:38 +0200
Subject: [Buildroot] [git commit] toolchain-external: add Linaro ARM big
	endian toolchain
Message-ID: <20140414211100.2435C9C601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd32da8f7931af61737df293d1f8bcedaab8648e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linaro has started to release ARM big endian toolchains, so we
integrate this toolchain in the external toolchain logic of
Buildroot. Since ARM big endian is probably going to be a lot more
uncommon than ARM little endian, we will only support one version at a
time of this toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   27 ++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |   10 ++++++-
 2 files changed, 36 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d3cf66d..0d8d9b9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -77,6 +77,32 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "Linaro armeb 2014.02"
+	depends on BR2_armeb
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	help
+	  Linaro toolchain for the ARM big endian architecture. It
+	  uses Linaro GCC 2014.01 (based on gcc 4.8), Linaro GDB
+	  2013.10 (based on GDB 7.6), eglibc 2.18, Binutils 2013.11
+	  (based on 2.24). It generates code that runs on all Cortex-A
+	  profile devices, but tuned for the Cortex-A9. The code
+	  generated is Thumb 2, with the hard floating point calling
+	  convention, and uses the VFPv3-D16 FPU instructions.
+
+comment "Linaro toolchains available for Cortex-A + EABIhf"
+	depends on BR2_armeb
+	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
+	depends on !BR2_PREFER_STATIC_LIB
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	bool "Sourcery CodeBench ARM 2013.11"
 	depends on BR2_arm
@@ -894,6 +920,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
+	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3973bbc..b40f54d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -242,6 +242,11 @@ define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
 endef
 
+define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
+	ln -sf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
+	ln -sf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
+endef
+
 define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -sf . $(TARGET_DIR)/lib/aarch64-linux-gnu
 	ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
@@ -281,7 +286,10 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.8-2014.02_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
