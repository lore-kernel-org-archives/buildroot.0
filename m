From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 23 Dec 2012 14:42:00 +0100
Subject: [Buildroot] [PATCH] toolchain-external: re-introduce Sourcery
	CodeBench ARM 2010.09
Message-ID: <1356270120-20416-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

on the lastest release the toolchain can not produce a working rootfs for
at91rm9200

Tested on at91rm9200ek

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
Hi,

	I try the internal toolchains of buildroot we have the same issue

Best Regards,
J.

 toolchain/toolchain-external/Config.in   |   24 ++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    5 ++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index eeb40a3..06e847e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -102,6 +102,29 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
+	bool "Sourcery CodeBench ARM 2010.09"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the ARM architecture, from
+	  Mentor Graphics. It uses gcc 4.5.1, binutils 2.20, glibc
+	  2.11 and gdb 7.2.50, kernel headers 2.6.35.2. It has support
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
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	bool "Sourcery CodeBench MIPS 2012.09"
 	depends on BR2_mips || BR2_mipsel
@@ -685,6 +708,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 649e3a3..be25956 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -175,7 +175,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
-- 
1.7.10.4
