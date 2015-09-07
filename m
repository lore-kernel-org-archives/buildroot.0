From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Sep 2015 23:09:57 +0200
Subject: [Buildroot] [PATCH 1/3 v3] toolchain/external: add Linaro ARM
	2014.11 ARMv7 EABIhf
In-Reply-To: <cover.1441660041.git.yann.morin.1998@free.fr>
References: <cover.1441660041.git.yann.morin.1998@free.fr>
Message-ID: <3ecce217bfa887d56f12000f80d74d4614498edd.1441660041.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain has a kind of history of its own... ;-(

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
      libs as static libs, i.e. no shared libs but libc.so);
    - a secondary archive, with the complete sysroot, duplicating most
      previously existing files in the minimal sysroot, above, and
      expending it with the shared libs, the gconv modules and many
      other "things";
    - a tertiary archive, with the 'runtime' content (whatever that
      could mean...); that one seems completely unnecessary for
      Buildroot.

  - the sys/types.h headers from the main sysroot is correct, while the
    one from the secondary archive (thus overwriting the main one) is
    broken, as it removes the definition of caddr_t (why? WHY?).
    (reported as https://bugs.linaro.org/show_bug.cgi?id=1417 )

  - there's a stray backup file for libstdc++
    (reported as https://bugs.linaro.org/show_bug.cgi?id=1418 )

So, add this new toolchain as a replacement for the previous 2014.09
one.

We add three post-extract hooks, one to extract the secondary, sysroot
archive, the second to restore sys/types.h to a useable state, and the
third to remove the backup file.

(Note: we're doing it in three hooks, because the cleanup hook is
different for the AArch64 toolchain, coming soon...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - fix comment about secondary sysroot  (Thomas)
  - expand comment about post-extract hooks  (Thomas)
  - fix typoes  (Thomas)
---
 toolchain/toolchain-external/Config.in             | 23 ++++++------
 .../toolchain-external/toolchain-external.hash     |  2 ++
 toolchain/toolchain-external/toolchain-external.mk | 41 +++++++++++++++++-----
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e7aed2e..a17b0a2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,31 +7,31 @@ comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2014.09"
+	bool "Linaro arm 2014.11"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86_64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.19, Binutils 2014.09 (based on 2.24). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
+	  GCC 2014.11 (based on gcc 4.9), Linaro GDB 2014.11 (based on
+	  GDB 7.8), Linaro glibc 2014.11 (based on glibc2.20), Linaro
+	  Binutils 2014.09 (based on 2.24). It generates code that runs
+	  on all Cortex-A profile devices, but tuned for the Cortex-A9.
+	  The code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
-comment "Linaro toolchains available for Cortex-A + EABIhf"
+comment "Linaro toolchain 2014.11 available only on x86_64 hosts"
 	depends on BR2_arm
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOSTARCH != "x86_64"
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.09"
@@ -934,6 +934,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3980c62..6734b00 100644
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
index 3cb59c6..10c7a46 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -238,11 +238,6 @@ endif
 # The Linaro ARMhf toolchain expects the libraries in
 # {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
 # {/usr,}/lib, so we need to create a symbolic link.
-define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
-	ln -snf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
-endef
-
 define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 	ln -snf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
 	ln -snf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
@@ -253,6 +248,32 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+# The Linaro 2014.11 toolchains are split in two parts:
+# - the main archive contains compiler and other tools, plus a
+#   minimal sysroot without a lot of share dlibs (e.g. libstdc++.so)
+# - a secondary archive with another part of the sysroot:
+#   - main sysroot set     : [----+++++++++++++]
+#   - secondary sysroot set:     [+++++++++++++----------------]
+# The standard package infra handles the main archive, and we use a
+# post-extract hook to extract the secondary, sysroot archive
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
+		$(TAR) --strip-components=1 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc $(TAR_OPTIONS) -
+endef
+# The sys/types.h headers from the secondary sysroot is missing the definition
+# for caddr_t (even though the sys/types.h in the main sysroot *is* correct).
+# Restore the definition of caddr_t after the secondary sysroot has been
+# extracted.
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES_H
+	$(SED) 's/\(typedef __daddr_t daddr_t;\)/\1\ntypedef __caddr_t caddr_t;/' \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/include/sys/types.h
+endef
+# The secondary sysroot contains a stray 'backup' file that is completely
+# useless (and it takes quite some place). Remove it.
+define TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_32
+	rm -f $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc/usr/lib/libgcc_s.so.1.backup
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -277,9 +298,13 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.11/components/toolchain/binaries/arm-linux-gnueabihf/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_FIX_TYPES_H \
+	TOOLCHAIN_EXTERNAL_LINARO_2014_11_CLEAN_UP_32
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-- 
1.9.1
