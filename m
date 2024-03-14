Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B1C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C17DC415A6;
	Thu, 14 Mar 2024 18:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqLXDw4flb5p; Thu, 14 Mar 2024 18:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3A34159F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3A34159F;
	Thu, 14 Mar 2024 18:49:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B54E1BF422
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B8640951
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hr3nIy7ZpJTq for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6BA414CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A6BA414CD
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:49:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E244A8833B; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 19:47:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3629797616433b0cd5b876aa3ae0996ff90b696
X-Git-Newrev: 53a8c5150e5eeeb6dbbead0275dbf9141f507511
X-Patchwork-Hint: ignore
Message-Id: <20240314184919.E244A8833B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: drop codesourcery arm/aarch64
 toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53a8c5150e5eeeb6dbbead0275dbf9141f507511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

codesourcery arm/aarch64 toolchains are old (2014) and use glibc
2.18/2.20 which are not compatible with 64-bit time_t raising the
following build failure with libcgroup since commit
1c2dbcdcf0bb589d325c379246acaa39bb07b7be:

In file included from ./libcgroup-internal.h:25:0,
                 from parse.y:21:
/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^

Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
 - http://autobuild.buildroot.org/results/e28f955f2b360f6e7bb231a5a3800cfbd17a23d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: add Config.in.legacy entries]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   | 14 ++++
 package/guile/guile.mk                             |  5 --
 package/mesa3d/mesa3d.mk                           |  6 --
 package/tpm2-totp/Config.in                        |  2 -
 .../autobuild/sourcery-arm-armv4t.config           |  4 -
 .../autobuild/sourcery-arm-thumb2.config           |  7 --
 .../config-fragments/autobuild/sourcery-arm.config |  3 -
 .../autobuild/toolchain-configs.csv                |  5 --
 support/testing/tests/toolchain/test_external.py   | 97 ----------------------
 toolchain/Config.in                                |  1 -
 toolchain/toolchain-external/Config.in             |  4 -
 .../Config.in                                      | 19 -----
 .../Config.in.options                              |  9 --
 .../toolchain-external-codesourcery-aarch64.hash   |  3 -
 .../toolchain-external-codesourcery-aarch64.mk     | 12 ---
 .../toolchain-external-codesourcery-arm/Config.in  | 35 --------
 .../Config.in.options                              |  9 --
 .../toolchain-external-codesourcery-arm.hash       |  3 -
 .../toolchain-external-codesourcery-arm.mk         | 13 ---
 19 files changed, 14 insertions(+), 237 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e899fc3afa..b99d9c1fb5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+        bool "CodeSourcery AArch64 2014.11"
+	select BR2_LEGACY
+	help
+	  The Sourcery CodeBench AArch64 toolchain has been removed,
+	  use an ARM/Bootlin/Linaro toolchain instead.
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+        bool "Sourcery CodeBench ARM 2014.05 has been removed"
+	select BR2_LEGACY
+	help
+	  The Sourcery CodeBench ARM toolchain has been removed, use
+	  an ARM/Bootlin/Linaro toolchain instead.
+
 config BR2_BINUTILS_VERSION_2_39_X
 	bool "binutils 2.39 has been removed"
 	select BR2_LEGACY
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 1d2e8038f0..82daaf5ad4 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -44,11 +44,6 @@ ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
 
-# Triggers assembler error with -Os
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM)$(BR2_OPTIMIZE_S),yy)
-GUILE_CFLAGS += -O2
-endif
-
 # jit triggers build failures with gcc < 5
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 GUILE_CONF_OPTS += --disable-jit
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e3cd7245d..df0079bf80 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -29,12 +29,6 @@ MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
 	-Dpower8=disabled
 
-# Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
-# flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
-MESA3D_CONF_OPTS += -Db_asneeded=false
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
 MESA3D_CONF_OPTS += -Ddri3=enabled
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
index dcadf5a5f2..a26604abb8 100644
--- a/package/tpm2-totp/Config.in
+++ b/package/tpm2-totp/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TPM2_TOTP
 	bool "tpm2-totp"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
 	select BR2_PACKAGE_LIBQRENCODE
 	select BR2_PACKAGE_TPM2_TSS
 	help
@@ -20,4 +19,3 @@ config BR2_PACKAGE_TPM2_TOTP
 
 comment "tpm2-totp needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/support/config-fragments/autobuild/sourcery-arm-armv4t.config b/support/config-fragments/autobuild/sourcery-arm-armv4t.config
deleted file mode 100644
index 4c0e01fecb..0000000000
--- a/support/config-fragments/autobuild/sourcery-arm-armv4t.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_arm=y
-BR2_arm920t=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/support/config-fragments/autobuild/sourcery-arm-thumb2.config b/support/config-fragments/autobuild/sourcery-arm-thumb2.config
deleted file mode 100644
index e726757a16..0000000000
--- a/support/config-fragments/autobuild/sourcery-arm-thumb2.config
+++ /dev/null
@@ -1,7 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_ARM_EABI=y
-BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
-BR2_TARGET_OPTIMIZATION=""
diff --git a/support/config-fragments/autobuild/sourcery-arm.config b/support/config-fragments/autobuild/sourcery-arm.config
deleted file mode 100644
index 8ade4647f2..0000000000
--- a/support/config-fragments/autobuild/sourcery-arm.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_arm=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index a65e9bacc3..2c4fa45fe7 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -18,9 +18,6 @@ support/config-fragments/autobuild/bootlin-x86-64-musl.config,x86_64
 # Test a MMU toolchain without dynamic library support
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 
-# Test a toolchain with an old gcc version (gcc 4.8)
-support/config-fragments/autobuild/sourcery-arm.config,x86
-
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
@@ -66,8 +63,6 @@ support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
-support/config-fragments/autobuild/sourcery-arm-armv4t.config,x86
-support/config-fragments/autobuild/sourcery-arm-thumb2.config,x86
 support/config-fragments/autobuild/sourcery-mips64.config,x86
 support/config-fragments/autobuild/sourcery-mips.config,x86
 support/config-fragments/autobuild/sourcery-nios2.config,x86
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index d22f38cedc..27dfd68500 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -37,103 +37,6 @@ class TestExternalToolchain(infra.basetest.BRTest):
             self.assertTrue(os.path.exists(interp_path))
 
 
-class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
-    config = BASIC_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_arm920t=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
-        """
-    toolchain_prefix = "arm-none-linux-gnueabi"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-        # Check the architecture variant
-        arch = infra.get_file_arch(self.builddir,
-                                   self.toolchain_prefix,
-                                   "lib/libc.so.6")
-        self.assertEqual(arch, "v4T")
-
-        # Check the sysroot symlink
-        symlink = os.path.join(self.builddir, "staging", "armv4t")
-        self.assertTrue(os.path.exists(symlink))
-        self.assertEqual(os.readlink(symlink), "./")
-
-        # Boot the system
-        img = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", img])
-        self.emulator.login()
-
-
-class TestExternalToolchainSourceryArmv5(TestExternalToolchain):
-    config = BASIC_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
-        """
-    toolchain_prefix = "arm-none-linux-gnueabi"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-        # Check the architecture variant
-        arch = infra.get_file_arch(self.builddir,
-                                   self.toolchain_prefix,
-                                   "lib/libc.so.6")
-        self.assertEqual(arch, "v5TE")
-
-        # Boot the system
-        img = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", img])
-        self.emulator.login()
-
-
-class TestExternalToolchainSourceryArmv7(TestExternalToolchain):
-    config = BASIC_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_cortex_a8=y
-        BR2_ARM_EABI=y
-        BR2_ARM_INSTRUCTIONS_THUMB2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
-        """
-    toolchain_prefix = "arm-none-linux-gnueabi"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-        # Check the architecture variant
-        arch = infra.get_file_arch(self.builddir,
-                                   self.toolchain_prefix,
-                                   "lib/libc.so.6")
-        self.assertEqual(arch, "v7")
-        isa = infra.get_elf_arch_tag(self.builddir,
-                                     self.toolchain_prefix,
-                                     "lib/libc.so.6",
-                                     "Tag_THUMB_ISA_use")
-        self.assertEqual(isa, "Thumb-2")
-
-        # Check we have the sysroot symlink
-        symlink = os.path.join(self.builddir, "staging", "thumb2")
-        self.assertTrue(os.path.exists(symlink))
-        self.assertEqual(os.readlink(symlink), "./")
-
-        # Boot the system
-        img = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv7",
-                           kernel="builtin",
-                           options=["-initrd", img])
-        self.emulator.login()
-
-
 class TestExternalToolchainLinaroArm(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3dd6e83d35..1641dbae06 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -886,7 +886,6 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64 && \
 		BR2_TOOLCHAIN_HAS_THREADS && \
 		!BR2_BINFMT_FLAT
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c1c159cb8e..b5432b71d7 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,7 +11,6 @@ choice
 # Aarch64 (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
@@ -23,7 +22,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
@@ -115,7 +113,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 # Aarch64
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
@@ -127,7 +124,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.o
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
deleted file mode 100644
index 8c0f985c5b..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	bool "CodeSourcery AArch64 2014.11"
-	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
-	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	help
-	  Sourcery CodeBench toolchain for the AArch64 architecture,
-	  from Mentor Graphics. It uses gcc 4.9.1, binutils
-	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
-	  3.16.2.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
deleted file mode 100644
index 1eab839216..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64-amd-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-aarch64"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
deleted file mode 100644
index 8f8fca0d0c..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256  3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
deleted file mode 100644
index 192763a0e0..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-aarch64
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
deleted file mode 100644
index aea2ba34f2..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ /dev/null
@@ -1,35 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-	bool "Sourcery CodeBench ARM 2014.05"
-	depends on BR2_arm
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABI
-	# Unsupported ARM cores
-	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
-	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
-	  for the following variants:
-	    - ARMv5TE, little endian, soft-float, glibc
-	      Select ARM926T, ARM10T, XScale or another ARMv5 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv4T, little endian, soft-float, glibc
-	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mthumb
-
-comment "Sourcery CodeBench toolchains available for the EABI ABI"
-	depends on BR2_arm
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
-	depends on !BR2_ARM_EABI
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
deleted file mode 100644
index 7f3654dc70..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arm-none-linux-gnueabi"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-arm"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
deleted file mode 100644
index c01a7b17c5..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-sha256  e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
deleted file mode 100644
index f15a50c43e..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-arm
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION = 2014.05-29
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SOURCE = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_ACTUAL_SOURCE_TARBALL = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
