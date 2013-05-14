From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 14 May 2013 21:37:29 +0200
Subject: [Buildroot] [PATCHv2 1/1] external-toolchain: add Sourcery
	CodeBench ARM 201305 Signed-off-by: Olivier Schonken
	<olivier.schonken@gmail.com>
Message-ID: <1368560249-6484-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
Changelog:
   Fixed kernel headers version
 toolchain/toolchain-external/Config.in   | 25 +++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a93ada3..5fdd27b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -64,6 +64,30 @@ comment "Linaro toolchains available for Cortex-A{5,8,9,15}"
 	depends on BR2_arm
 	depends on !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
+	bool "Sourcery CodeBench ARM 2013.05"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  Sourcery CodeBench toolchain for the ARM architecture, from
+	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
+	  2.17 and gdb 7.4.50, kernel headers 3.8.2. It has support
+	  for the following variants:
+	    - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	bool "Sourcery CodeBench ARM 2012.03"
 	depends on BR2_arm
@@ -764,6 +788,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a87bc3b..e993fe8 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -200,6 +200,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2013.01/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz2
-- 
1.8.1.2
