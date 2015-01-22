From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 22 Jan 2015 15:33:28 -0300
Subject: [Buildroot] [PATCH 4/4] toolchain-external: add OSELAS 2013.12.2
	Cortex-M3 toolchain
In-Reply-To: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1421951608-31233-5-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Binary toolchain based on uClibc for Cortex-M3 processor based on GCC
4.8.2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 toolchain/toolchain-external/Config.in               | 12 ++++++++++++
 toolchain/toolchain-external/toolchain-external.hash |  3 +++
 toolchain/toolchain-external/toolchain-external.mk   | 11 +++++++++++
 3 files changed, 26 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3b0f4cb..c9f2bfe 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -192,6 +192,17 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
+config BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3
+	bool "OSELAS ARM Cortex-M3"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_ARM_TOOLCHAIN_SKIP_CHECK
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	bool "Sourcery CodeBench MIPS 2014.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -970,6 +981,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "arm-cortexm3-uclinuxeabi" if BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7f211db..f00cce4 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -56,3 +56,6 @@ sha256 3e1c7c53fadfd3346ab60386c573f07f0617ab119546ec8cb93bc20c23cff2b3  lin32-m
 sha256 b72f7be654a75bb643372f3909de7b8739f0f56bdf8bea98fea41dcecefe6b6b  microblazeel-unknown-linux-gnu.tgz
 sha256 ed2fea022f2def257ca6db09911b73c7102aaa1792d2da2d81371a763e5c2eff  lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 sha256 53ee0b1ad50e651eb14d0b53044b90e7bf7e3cb341ee57fe575bc4c4e142ea37  microblaze-unknown-linux-gnu.tgz
+
+# OSELAS Cortex-M3 toolchain
+sha1  b5a85b489e32c3730673b74e998e08444e36aab4  oselas.toolchain-2013.12.2-arm-cortexm3-uclinuxeabi-gcc-4.8.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.12-sanitized_2013.12.2_i386.deb
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5a69eb8..718bedc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -287,6 +287,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3),y)
+TOOLCHAIN_EXTERNAL_SITE = http://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain-2013.12.2-arm-cortexm3-uclinuxeabi-gcc-4.8.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.12-sanitized/
+TOOLCHAIN_EXTERNAL_SOURCE = oselas.toolchain-2013.12.2-arm-cortexm3-uclinuxeabi-gcc-4.8.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.12-sanitized_2013.12.2_i386.deb
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
@@ -417,6 +420,14 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 endef
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3),y)
+# Special handling for OSELAS toolchains
+define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
+	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+	(cd $(@D); ar xvf $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE))
+	$(call suitable-extractor,data.tar.xz) $(@D)/data.tar.xz | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=5 -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+endef
 else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 # Normal handling of toolchain tarball extraction.
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
-- 
2.2.1
