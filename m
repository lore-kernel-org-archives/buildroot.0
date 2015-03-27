From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Mar 2015 00:20:19 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain/external: add Linaro ARM BE
	2014.11 ARMv7 EABIhf
In-Reply-To: <cover.1427498258.git.yann.morin.1998@free.fr>
References: <cover.1427498258.git.yann.morin.1998@free.fr>
Message-ID: <3f6b86ec7df9f2bc8aa891b5f845d2f9985f6712.1427498258.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suffers from the same deficiencies as the just-introduced LE variant.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 27 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  2 ++
 toolchain/toolchain-external/toolchain-external.mk |  7 ++++++
 3 files changed, 36 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 199b6ab..c1ed5c2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -58,6 +58,32 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_11
+	bool "Linaro armeb 2014.11"
+	depends on BR2_armeb
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	help
+	  Linaro toolchain for the ARM big endian architecture. It
+	  uses Linaro GCC 2014.11 (based on gcc 4.9), Linaro GDB 2014.11
+	  (based on GDB 7.8), Linaro glibc 2014.11 (based on glibc2.20),
+	  Linaro Binutils 2014.09 (based on 2.24). It generates code that
+	  runs on all Cortex-A profile devices, but tuned for the Cortex-A9.
+	  The code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+comment "Linaro toolchain 2014.11 available only on x86_64 hosts"
+	depends on BR2_armeb
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOSTARCH != "x86_64"
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
@@ -975,6 +1001,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11
+	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_11
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1a0c0f3..d1cf56a 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -53,6 +53,8 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 # ARM and Aarch64 toolchains from Linaro
 sha256 bc4ca2ced084d2dc12424815a4442e19cb1422db87068830305d90075feb1a3b  gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 c85cda17fcf6e83cfb35bab646ebce7061edd15ae0b796f2f616cb61e92b4e61  sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
+sha256 f1b8cc025864d0213e88f0821b50d663d2428d31ea78eb38446d2042c8a49a74  gcc-linaro-4.9-2014.11-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 56a75abfb229d2d2f05a884212669a543a873c76aab4c0c8d1ebe71b8074803d  sysroot-linaro-eglibc-gcc4.9-2014.11-armeb-linux-gnueabihf.tar.xz
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1c9bd82..8643047 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -300,6 +300,13 @@ TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-arm-li
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
 	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_11),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.11/components/toolchain/binaries/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2014.11-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-- 
1.9.1
