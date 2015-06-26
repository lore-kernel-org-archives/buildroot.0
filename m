From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 26 Jun 2015 14:33:22 -0300
Subject: [Buildroot] [PATCH 4/4] toolchain-external: add OSELAS 2014.12.0
	Cortex-M3 toolchain
In-Reply-To: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1435340002-20396-5-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binary toolchain based on uClibc for Cortex-M3 processor based on GCC
4.9.2.

This toolchain has no resolver support, thus, we don't select
BR2_HAS_RESOLVER_SUPPORT.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 toolchain/toolchain-external/Config.in               | 13 +++++++++++++
 toolchain/toolchain-external/toolchain-external.hash |  4 ++++
 toolchain/toolchain-external/toolchain-external.mk   | 10 ++++++++++
 3 files changed, 27 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ec2d1a5..6980b1e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -195,6 +195,18 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
+config BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412
+	bool "OSELAS ARM Cortex-M3 2014.12"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  OSELAS binary toolchain for Cortex-M3.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -941,6 +953,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "arm-cortexm3-uclinuxeabi" if BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3980c62..342ce21 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -74,3 +74,7 @@ sha256 79a1a4be93e2a63acb137170e98bdfbf744bd9ca7b15b76ab512d1e0dfec834e  crossx8
 sha256 aec4d560dc601e397fc86a9759166005afba22ad666d1a48019b5102c534ccc1  crossx86-sh4eb-linux-musl-1.1.6.tar.xz
 sha256 68eda0795aacd4371b45a6c58c5c75e86c0c2fdf7ebc2c0b7d3752462c848260  crossx86-x86_64-linux-musl-1.1.6.tar.xz
 sha256 6bef5ee2cdb9fa35e49ce0a270f6d7c48f3268c6f6345ad5ca0b8137982b4690  crossx86-x86_64-x32-linux-musl-1.1.6.tar.xz
+
+# Oselas Cortex-M3 toolchain
+# Locally calculated
+sha1	75e7ae45b514b10ad64ff5588770434cea755496	oselas.toolchain-2014.12.0-arm-cortexm3-uclinuxeabi-gcc-4.9.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.16-sanitized_2014.12.0_i386.deb
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 22f8118..e9514c1 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -293,6 +293,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412),y)
+TOOLCHAIN_EXTERNAL_SITE = http://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/
+TOOLCHAIN_EXTERNAL_SOURCE = oselas.toolchain-2014.12.0-arm-cortexm3-uclinuxeabi-gcc-4.9.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.16-sanitized_2014.12.0_i386.deb
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
@@ -421,6 +424,13 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 endef
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412),y)
+# Special handling for OSELAS toolchains
+define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
+	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+	ar fp $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) data.tar.xz | $(XZCAT) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=5 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+endef
 else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 # Normal handling of toolchain tarball extraction.
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
-- 
2.1.4
