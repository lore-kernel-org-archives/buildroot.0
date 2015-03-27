From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Mar 2015 00:20:18 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain/external: add Linaro ARM 2014.11
	ARMv7 EABIhf
In-Reply-To: <cover.1427498258.git.yann.morin.1998@free.fr>
References: <cover.1427498258.git.yann.morin.1998@free.fr>
Message-ID: <ce718a85b7d4bc0fb1e1e520066122373b0ed615.1427498258.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain has a kind of hstory of its own... ;-(

First released in November 2014, it was completely broken, and Thomas
opened a bug report. Here's the story (for reference):
    https://plus.google.com/+ThomasPetazzoni/posts/SjFkrX3ow5M
    https://bugs.linaro.org/show_bug.cgi?id=862

since then, the release has been re-done, and the issue reported above
has been fixed. This makes that toolchain almost usable by Buildroot,
with just a few little nits:

  - it is available only for x86_64 hosts

  - the toolchain is split in three parts:
    - the main archive, with the tools and a minimalist sysroot with
      just the strictly required stuff (e.g. just the C library and most
      libs as static libs, i.e. no shared libs but libc.so)
    - a secondary archive, with the complete sysroot , duplicationg most
      previously existing files in the minimal sysroot, above
    - a tertiary archive, with the 'runtime' content (whatever that
      could mean...); that one seems completely unnecessary for
      Buildroot.

  - the sys/types.h headers from the main sysroot is correct, while the
    one from the secondary archive (thus overwriting the main one) is
    broken, as it removes the definition of caddr_t (why? WHY?).

So, add this new toolchain with two post-extract hooks, one to extract
the secondary, sysroot archive, the other to restore sys/types.h to a
useable state.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 27 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  2 ++
 toolchain/toolchain-external/toolchain-external.mk | 24 +++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8b0f09b..199b6ab 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,6 +6,32 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11
+	bool "Linaro arm 2014.11"
+	depends on BR2_arm
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2014.11 (based on gcc 4.9), Linaro GDB 2014.11 (based on
+	  GDB 7.8), Linaro glibc 2014.11 (based on glibc2.20), Linaro
+	  Binutils 2014.09 (based on 2.24). It generates code that runs
+	  on all Cortex-A profile devices, but tuned for the Cortex-A9.
+	  The code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+comment "Linaro toolchain 2014.11 available only on x86_64 hosts"
+	depends on BR2_arm
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOSTARCH != "x86_64"
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.09"
 	depends on BR2_arm
@@ -948,6 +974,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7362b81..1a0c0f3 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -51,6 +51,8 @@ sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2
 sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 
 # ARM and Aarch64 toolchains from Linaro
+sha256 bc4ca2ced084d2dc12424815a4442e19cb1422db87068830305d90075feb1a3b  gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 c85cda17fcf6e83cfb35bab646ebce7061edd15ae0b796f2f616cb61e92b4e61  sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c0429bb..1c9bd82 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -253,6 +253,23 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+# The Linaro 2014.11 toolchains are split in two parts:
+# - the main archive, contains compiler and other tools, plus a minimal
+#   sysroot without a lot of share dlibs (e.g. libstdc++.so)
+# - a secondrary archive with another part of the sysroot (in that both
+#   the intersection and exclusion are non-empty)
+# The standard package infra handles the main archive, and we use a
+# post-extract hook to extract the secondary, sysroot archive
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc $(TAR_OPTIONS) -
+endef
+# The sysroot archive is kinda broken, keep the pieces together...
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES
+	$(SED) 's/\(typedef __daddr_t daddr_t;\)/\1\ntypedef __caddr_t caddr_t;/' \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/include/sys/types.h
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -276,6 +293,13 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.11/components/toolchain/binaries/arm-linux-gnueabihf/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-- 
1.9.1
