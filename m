From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:18 +0100
Subject: [Buildroot] [PATCH 5/7] toolchain-external: bump CodeSourcery
	aarch64 to 2014.11
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1448123780-30067-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for 2014.05 [1], this toolchain need a small fixup:

Buildroot picks up aarch64-linux-gnu/libc/lib64 and all its contents, but
does not pickup aarch64-linux-gnu/libc/lib to populate the staging directory.
aarch64-linux-gnu/libc/lib contain a single symlink which is lost during
Buildroot staging install :
  aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.20.so

Add a custom post install staging hook to create it manually.

A runtime testing show that /lib/ld-2.20.so and /lib/ld-linux-aarch64.so.1
are missing in the file system.

Add another post install target hook to copy ld-2.20.so and create the
symlink.

Runtime tested using qemu_aarch64_virt_defconfig.

[1] http://patchwork.ozlabs.org/patch/467857/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 13 +++++++------
 .../toolchain-external/toolchain-external.hash     |  2 +-
 toolchain/toolchain-external/toolchain-external.mk | 22 ++++++++++++++++++++--
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9f7a1da..62cb30b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -851,7 +851,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	  http://www.linaro.org/engineering/armv8/
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	bool "CodeSourcery AArch64 2014.05"
+	bool "CodeSourcery AArch64 2015.11"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -859,12 +859,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Sourcery CodeBench toolchain for the AArch64 architecture,
-	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24,
-	  glibc 2.18, gdb 7.7.50 and kernel headers 3.13.
+	  from Mentor Graphics. It uses gcc 4.9.1, binutils
+	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
+	  3.16.2.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.6 toolchain (experimental)"
@@ -970,7 +971,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1dc92ef..472f2af 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -39,7 +39,7 @@ sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-20
 # AMD64
 sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # Aarch64
-sha256 8ea78c5988b2bb507534f1ad46aa46659f66b39d55f2fc40e163a90b4195e70f  aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
 sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 158f9bd..95aa00d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -286,6 +286,22 @@ define TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
 		$(STAGING_DIR)/usr/include/gnu/
 endef
 
+# Buildroot picks up aarch64-linux-gnu/libc/lib64 and all its contents, but
+# does not pickup aarch64-linux-gnu/libc/lib to populate the staging directory.
+# aarch64-linux-gnu/libc/lib contain a single symlink which is lost during
+# Buildroot staging install :
+#   aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.20.so
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
+endef
+
+# For some reason aarch64-linux-gnu/libc/lib64/ld-2.20.so is not copied to
+# target directory.
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
+	cp -f $(STAGING_DIR)/lib/ld-2.20.so $(TARGET_DIR)/lib/
+	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
+endef
+
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
@@ -406,8 +422,10 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu.tar.
 endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+TOOLCHAIN_EXTERNAL_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-- 
2.4.3
