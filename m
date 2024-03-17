Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8777FC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3172F40595;
	Sun, 17 Mar 2024 21:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ON-qG7gEOCMn; Sun, 17 Mar 2024 21:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC6D4058A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC6D4058A;
	Sun, 17 Mar 2024 21:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16EE81BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7133E402E6
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f297PBq3qWKb for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0496C4058B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0496C4058B
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E237E8054F; Sun, 17 Mar 2024 21:35:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 22:32:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a69af5fa4b545767ab292d1ad01266b87d45e92
X-Git-Newrev: 33605ea6d9b370d052dbf6b06d89e7b2a16d4275
X-Patchwork-Hint: ignore
Message-Id: <20240317213506.E237E8054F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: drop codescape mips toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33605ea6d9b370d052dbf6b06d89e7b2a16d4275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Codescape mips toolchains are old (2018) and use glibc 2.20 which is not
compatible with 64-bit time_t raising the following build failure with
libselinux since commit 1c2dbcdcf0bb589d325c379246acaa39bb07b7be:

In file included from selinux_restorecon.c:17:0:
/home/buildroot/autobuild/instance-1/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^~~~~

Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
 - http://autobuild.buildroot.org/results/a4d38af627a42a2c55d60129787c51353d5883bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy                                   | 16 ++++-
 package/openblas/Config.in                         |  4 --
 toolchain/toolchain-external/Config.in             |  6 +-
 .../Config.in                                      | 66 -------------------
 .../Config.in.options                              |  9 ---
 .../toolchain-external-codescape-img-mips.hash     |  4 --
 .../toolchain-external-codescape-img-mips.mk       | 51 ---------------
 .../Config.in                                      | 76 ----------------------
 .../Config.in.options                              |  9 ---
 .../toolchain-external-codescape-mti-mips.hash     |  4 --
 .../toolchain-external-codescape-mti-mips.mk       | 51 ---------------
 11 files changed, 16 insertions(+), 280 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5aaaae0eec..1d3dc8b5c8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,8 +146,22 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	bool "Codescape IMG GNU Linux Toolchain 2018.09 has been removed"
+	select BR2_LEGACY
+	help
+	  The Codescape IMG GNU Linux toolchain has been removed, use a
+	  Bootlin toolchain instead.
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	bool "Codescape MTI GNU Linux Toolchain 2018.09 has been removed"
+	select BR2_LEGACY
+	help
+	  The Codescape MTI GNU Linux toolchain has been removed, use a
+	  Bootlin toolchain instead.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	bool "CodeSourcery AArch64 2014.11"
+	bool "CodeSourcery AArch64 2014.11 has been removed"
 	select BR2_LEGACY
 	help
 	  The Sourcery CodeBench AArch64 toolchain has been removed,
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 74c4a3aa5c..7d4727003b 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -26,11 +26,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC970"          if BR2_powerpc_970
 	default "PPC440"          if BR2_powerpc_440
 	default "PPC440FP2"       if BR2_powerpc_440fp
-	# P5600 is built with MSA support which is only available in Codescape toolchains
-	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	default "MIPS64_GENERIC"  if BR2_MIPS_CPU_MIPS64
-	# I6400 is built with MSA support which is only available in Codescape toolchains
-	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	# OpenBLAS assumes SPARC=Sparc v9
 	default "SPARC"           if BR2_sparc_v9
 	# Cortex-A15 always have a VFPv4
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b5432b71d7..af9082cf6e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -26,10 +26,8 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
-# MIPS (use codesourcery toolchain by default)
+# MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
-source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
-source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
 
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
@@ -130,8 +128,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.o
 
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
 
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
deleted file mode 100644
index d49c610237..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ /dev/null
@@ -1,66 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2018.09"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS
-	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
-	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
-	  4.7. It has support for the following variants:
-	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
-	      microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI,
-	      microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
deleted file mode 100644
index 3eaa2a9522..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "mips-img-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codescape-img-mips"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
deleted file mode 100644
index 65e1861f12..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Codescape toolchains from MIPS Tech LLC
-# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
-sha256  ac035f3b6a8767522977963d8e1490520d58bccca7956f4503a1eefff6492b71  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
-sha256  09280f4fcbb993607905bf9a43bf5f3db2beed85726f0675b8453e19a9ddc429  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
deleted file mode 100644
index 55424918c7..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
+++ /dev/null
@@ -1,51 +0,0 @@
-################################################################################
-#
-# toolchain-external-codescape-img-mips
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2018.09-02
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
-else
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
-endif
-
-# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
-# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
-# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
-# tools in the appropriate location.
-ifeq ($(BR2_MIPS_OABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = o32
-else ifeq ($(BR2_MIPS_NABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n32
-else ifeq ($(BR2_MIPS_NABI64),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n64
-endif
-
-define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS
-	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
-	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
-	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
-endef
-
-# The Codescape toolchain uses a sysroot layout that places them
-# side-by-side instead of nested like multilibs. A symlink is needed
-# much like for the nested sysroots which are handled in
-# copy_toolchain_sysroot but there is not enough information in there
-# to determine whether the sysroot layout was nested or side-by-side.
-# Add the symlink here for now.
-define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
-	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
-	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
-endef
-
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_POST_INSTALL_STAGING_HOOKS += \
-	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS \
-	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
-
-$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
deleted file mode 100644
index 720d705d14..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ /dev/null
@@ -1,76 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	bool "Codescape MTI GNU Linux Toolchain 2018.09"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT)
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS
-	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
-	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
-	  4.7. It has support for the following variants:
-	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r2 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Big-Endian, Soft-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
-	      microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI,
-	      microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n32 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n32 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n64 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n64 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
deleted file mode 100644
index 464c9b8448..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "mips-mti-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codescape-mti-mips"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
deleted file mode 100644
index b07281de48..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Codescape toolchains from MIPS Tech LLC
-# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
-sha256  c883a404fd7ea5718e2249a530802e223381f2be52265f88e9b1ce7035c232f3  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
-sha256  d6310a970b0a8a19ad8e0a2b3ead8c38ee90d0e284a9b2511200ce447f460d2c  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
deleted file mode 100644
index 9bee1ab87d..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
+++ /dev/null
@@ -1,51 +0,0 @@
-################################################################################
-#
-# toolchain-external-codescape-mti-mips
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2018.09-02
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STRIP_COMPONENTS = 2
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
-else
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
-endif
-
-# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
-# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
-# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
-# tools in the appropriate location.
-ifeq ($(BR2_MIPS_OABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = o32
-else ifeq ($(BR2_MIPS_NABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n32
-else ifeq ($(BR2_MIPS_NABI64),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n64
-endif
-
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS
-	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
-	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
-	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
-endef
-
-# The Codescape toolchain uses a sysroot layout that places them
-# side-by-side instead of nested like multilibs. A symlink is needed
-# much like for the nested sysroots which are handled in
-# copy_toolchain_sysroot but there is not enough information in there
-# to determine whether the sysroot layout was nested or side-by-side.
-# Add the symlink here for now.
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
-	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
-	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
-endef
-
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_POST_INSTALL_STAGING_HOOKS += \
-	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS \
-	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
