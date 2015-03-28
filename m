From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Mar 2015 16:27:12 +0100
Subject: [Buildroot] [PATCH 3/3 v2] toolchain/external: add Linaro AArch64
	2014.11
In-Reply-To: <cover.1427556250.git.yann.morin.1998@free.fr>
References: <cover.1427556250.git.yann.morin.1998@free.fr>
Message-ID: <f236047e897f67361e28b321b0e9e326c012b802.1427556250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suffers from the same deficiencies as the just-introduced ARMv7 variants.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 19 +++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.hash |  2 ++
 toolchain/toolchain-external/toolchain-external.mk   | 11 +++++++++++
 3 files changed, 32 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c1ed5c2..f32504b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -882,6 +882,24 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_11
+	bool "Linaro AArch64 14.11"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
+
+comment "Linaro toolchain 2014.11 available only on x86_64 hosts"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH != "x86_64"
+	depends on !BR2_STATIC_LIBS
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
@@ -1009,6 +1027,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_11
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index d1cf56a..15de8e3 100644
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
index 2dd419e..d12c668 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -272,6 +272,9 @@ endef
 define TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_32
 	rm -f $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/lib/libgcc_s.so.1.backup
 endef
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_64
+	rm -f $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/lib64/libgcc_s.so.1.backup
+endef
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
@@ -384,6 +387,14 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_11),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.11/components/toolchain/binaries/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2014.11-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES_H \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_64
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-- 
1.9.1
