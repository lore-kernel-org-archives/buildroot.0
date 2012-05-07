From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 17:08:58 +0200
Subject: [Buildroot] [PATCH 2/2] external-toolchain: add support for Linaro
	2012.04
In-Reply-To: <cover.1336403333.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336403333.git.thomas.petazzoni@free-electrons.com>
Message-ID: <057c729c2438107b426576121bcf83f792734a6f.1336403333.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   15 +++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 18 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 49ea7fa..f58523f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,6 +3,20 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
+	bool "Linaro 2012.04"
+	depends on BR2_arm
+	depends on BR2_cortex_a8 || BR2_cortex_a9
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2012.04 (based on gcc 4.7), Linaro GDB 2012.04 (based on
+	  GDB 7.4), eglibc 2.13. It generates code that runs on all
+	  Cortex-A profile devices, but tuned for the Cortex-A9. The
+	  code generated is Thumb 2, with the softfp calling
+	  convention, and uses the VFPv3-D16 FPU instructions.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
 	bool "Linaro 2012.03"
 	depends on BR2_arm
@@ -504,6 +518,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
+	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2a01d68..b163aee 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -200,6 +200,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.02-20120222_linux.ta
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03),y)
 TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.03/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04),y)
+TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.04/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.04-20120426_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.9.5
