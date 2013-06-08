From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Jun 2013 11:14:18 +0200
Subject: [Buildroot] [PATCH 5/9] toolchain-external: add support for Arago
	2011.09 ARMv5
In-Reply-To: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1370682862-7285-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   | 15 +++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3ce58ac..2fc18cc 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -153,6 +153,20 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	  instructions, but pass floating point function arguments in
 	  non-floating point registers).
 
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	bool "Arago ARMv5 2011.09"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
+	  4.5.3, binutils 2.20.1, glibc 2.12, gdb 7.2.
+
+	  This toolchain uses software-floating point.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	bool "Sourcery CodeBench MIPS 2013.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -767,6 +781,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
+	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0d29d36..30a4953 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -207,6 +207,13 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
+TOOLCHAIN_EXTERNAL_SITE=http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SOURCE=arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
+define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
+	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
+endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
-- 
1.8.1.2
