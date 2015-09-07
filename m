From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Sep 2015 23:09:59 +0200
Subject: [Buildroot] [PATCH 3/3 v3] toolchain/external: add Linaro AArch64
	2014.11
In-Reply-To: <cover.1441660041.git.yann.morin.1998@free.fr>
References: <cover.1441660041.git.yann.morin.1998@free.fr>
Message-ID: <7d7abe73fcf0fc9420ba27ec0b069ad97f747b63.1441660041.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suffers from the same deficiencies as the just-introduced ARMv7 variants.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in              | 13 +++++++++----
 .../toolchain-external/toolchain-external.hash      |  2 ++
 toolchain/toolchain-external/toolchain-external.mk  | 21 ++++++++++-----------
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9cd0572..c51f8fe 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -836,20 +836,24 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	  http://blackfin.uclinux.org.
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 14.09"
+	bool "Linaro AArch64 14.11"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
+comment "Linaro toolchain 2014.11 available only on x86_64 hosts"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH != "x86_64"
+	depends on !BR2_STATIC_LIBS
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.05"
 	depends on BR2_aarch64
@@ -969,6 +973,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_11
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 80ac049..b2aab7b 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -57,6 +57,8 @@ sha256 f1b8cc025864d0213e88f0821b50d663d2428d31ea78eb38446d2042c8a49a74  gcc-lin
 sha256 56a75abfb229d2d2f05a884212669a543a873c76aab4c0c8d1ebe71b8074803d  sysroot-linaro-eglibc-gcc4.9-2014.11-armeb-linux-gnueabihf.tar.xz
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+sha256 56d9f810fe48826d1247a0c44f4f5847ff9a092c45b9a0678253f04c17329596  gcc-linaro-4.9-2014.11-x86_64_aarch64-linux-gnu.tar.xz
+sha256 4c8022e271ba1d75eb722623a94f6e63ab0a08048a2a6c2fce32ed13aece58eb  sysroot-linaro-eglibc-gcc4.9-2014.11-aarch64-linux-gnu.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 
 # Synopsys DesignWare ARC toolchains
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7f62f64..84420c3 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -235,14 +235,6 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
-# The Linaro AArch64 toolchain expects the libraries in
-# {/usr,}/lib/aarch64-linux-gnu, but Buildroot copies them to
-# {/usr,}/lib, so we need to create a symbolic link.
-define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/aarch64-linux-gnu
-	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
-endef
-
 # The Linaro 2014.11 toolchains are split in two parts:
 # - the main archive contains compiler and other tools, plus a
 #   minimal sysroot without a lot of share dlibs (e.g. libstdc++.so)
@@ -268,6 +260,9 @@ endef
 define TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_32
 	rm -f $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/lib/libgcc_s.so.1.backup
 endef
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_64
+	rm -f $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/lib64/libgcc_s.so.1.backup
+endef
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
@@ -373,9 +368,13 @@ TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.11/components/toolchain/binaries/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2014.11-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES_H \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_64
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.9.1
