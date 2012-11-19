From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 19 Nov 2012 12:29:14 +0100
Subject: [Buildroot] [PATCH] external-toolchain: add Sourcery CodeBench ARM
	2012.09
Message-ID: <1353324554-23461-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've added the "depends on BROKEN" because this toolchain
breaks linux kernel arm builds:
"arch/arm/lib/copy_template.S:247: Error: selected processor
 does not support ARM mode `ldralt r4,[r1],#4'"

https://bugzilla.redhat.com/show_bug.cgi?id=869025

http://sourceware.org/bugzilla/show_bug.cgi?id=14575

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 toolchain/toolchain-external/Config.in   | 24 ++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f04ced6..f8c4899 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -54,6 +54,29 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 
 	  To use this toolchain, you must disable soft float usage.
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201209
+	bool "Sourcery CodeBench ARM 2012.09"
+	depends on BROKEN
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the ARM architecture, from
+	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
+	  2.16 and gdb 7.4.50, kernel headers 3.5.4. It has support
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
@@ -630,6 +653,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201209
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a6025db..2b1c2ba 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -184,6 +184,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201209),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.09-64-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.08/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.08-20120827_linux.tar.bz2
-- 
1.8.0
