Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2E0C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BF860C25;
	Mon,  6 Feb 2023 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BF860C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbn-c_SVBqtZ; Mon,  6 Feb 2023 21:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F175760C29;
	Mon,  6 Feb 2023 21:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F175760C29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A29941BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C5D181370
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5D181370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkmB2kVKAgb6 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:41:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2746881299
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2746881299
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16EAC83D46; Mon,  6 Feb 2023 21:41:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:40:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aab8c59d5b310540105166e7b48faf3d5bd200b
X-Git-Newrev: 488a87514e21877d25d4f0a31bbb9f71bd839aab
X-Patchwork-Hint: ignore
Message-Id: <20230206214131.16EAC83D46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/gummiboot: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=488a87514e21877d25d4f0a31bbb9f71bd839aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gummiboot package currently fails to build due to incompatibilies
with recent versions of the gnu-efi code.

It turns out that gummiboot has been marked deprecated/obsolete by its
maintainer since July 2015:

  https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d&utm_source=anzwix

Indeed, gummiboot ended up being integrated as part of systemd as
systemd-boot. While it made sense for a while to keep it as a separate
standalone package, it is not possible to maintain it in Buildroot
without an active upstream, and there are other options for simple EFI
bootloaders these days.

Therefore, let's retire this package.

Fixes:

  http://autobuild.buildroot.net/results/5929104a868d2f69ec1b71e5e897b6d1ebf347cf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  8 ++++
 DEVELOPERS                                         |  2 -
 boot/Config.in                                     |  1 -
 ...-Allow-building-with-newer-glibc-versions.patch | 31 -------------
 ...x-linking-for-non-host-compatible-targets.patch | 54 ----------------------
 boot/gummiboot/Config.in                           | 24 ----------
 boot/gummiboot/buildroot.conf                      |  4 --
 boot/gummiboot/gummiboot.mk                        | 41 ----------------
 boot/gummiboot/loader.conf                         |  2 -
 9 files changed, 8 insertions(+), 159 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8b7ecd840b..61686fdd11 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_TARGET_GUMMIBOOT
+	bool "gummiboot removed"
+	select BR2_LEGACY
+	help
+	  gummiboot has been deprecated since 2015, with no further
+	  updates. It became integrated into the systemd project as
+	  systemd-boot.
+
 config BR2_PACKAGE_IPUTILS_NINFOD
 	bool "iputils 20221126 removed ninfod"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 50c681df2c..f8acf8776c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -845,7 +845,6 @@ N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
 F:	package/szip/
 
 N:	Esben Haabendal <esben@haabendal.dk>
-F:	boot/gummiboot/
 F:	package/python-kiwisolver/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
@@ -2865,7 +2864,6 @@ F:	boot/beaglev-ddrinit/
 F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
-F:	boot/gummiboot/
 F:	configs/beaglev_defconfig
 F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
diff --git a/boot/Config.in b/boot/Config.in
index 2d4d077632..58366e035e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -12,7 +12,6 @@ source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
 source "boot/grub2/Config.in"
-source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
diff --git a/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch b/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch
deleted file mode 100644
index b35cd499bc..0000000000
--- a/boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 40ab4167b5a45c772304a879c71b47d54de3b0e3 Mon Sep 17 00:00:00 2001
-From: Esben Haabendal <esben@haabendal.dk>
-Date: Wed, 20 Mar 2019 14:19:40 +0100
-Subject: [PATCH] Allow building with newer glibc versions
-
-Newer glibc versions does not include sys/sysmacros.h from sys/types.h
-anymore.  Including it unconditionally should be safe.
-
-See https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html for why
-this was done.
-
-Signed-off-by: Esben Haabendal <esben@haabendal.dk>
----
- src/setup/setup.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/setup/setup.c b/src/setup/setup.c
-index 6a4275a2ae36..53429375a146 100644
---- a/src/setup/setup.c
-+++ b/src/setup/setup.c
-@@ -37,6 +37,7 @@
- #include <ftw.h>
- #include <stdbool.h>
- #include <blkid.h>
-+#include <sys/sysmacros.h>
- 
- #include "efivars.h"
- 
--- 
-2.21.0
-
diff --git a/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch b/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch
deleted file mode 100644
index 7104a581e2..0000000000
--- a/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From fc05ced797b87286b8ec7303fe32bf200a072972 Mon Sep 17 00:00:00 2001
-From: Esben Haabendal <esben@haabendal.dk>
-Date: Mon, 18 Mar 2019 11:14:31 +0100
-Subject: [PATCH] Fix linking for non-host compatible targets
-
-Without this, gummiboot build system will use host 'ld' when linking
-target binary, which is obviously not a good idea.
-
-Signed-off-by: Esben Haabendal <esben@haabendal.dk>
----
- Makefile.am  | 4 ++--
- configure.ac | 4 ++++
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6568a355ed74..9051dd44edd9 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -142,7 +142,7 @@ $(top_builddir)/src/efi/%.o: $(top_srcdir)/src/efi/%.c $(addprefix $(top_srcdir)
- 	$(AM_V_CC)$(EFI_CC) $(efi_cppflags) $(efi_cflags) -c $< -o $@
- 
- $(gummiboot_solib): $(gummiboot_objects)
--	$(AM_V_CCLD)$(LD) $(efi_ldflags) $(gummiboot_objects) \
-+	$(AM_V_CCLD)$(EFI_LD) $(efi_ldflags) $(gummiboot_objects) \
- 		-o $@ -lefi -lgnuefi $(shell $(CC) -print-libgcc-file-name); \
- 	nm -D -u $@ | grep ' U ' && exit 1 || :
- .DELETE_ON_ERROR: $(gummboot_solib)
-@@ -177,7 +177,7 @@ $(top_builddir)/src/efi/%.o: $(top_srcdir)/src/efi/%.c $(addprefix $(top_srcdir)
- 	$(AM_V_CC)$(EFI_CC) $(efi_cppflags) $(efi_cflags) -c $< -o $@
- 
- $(stub_solib): $(stub_objects)
--	$(AM_V_CCLD)$(LD) $(efi_ldflags) $(stub_objects) \
-+	$(AM_V_CCLD)$(EFI_LD) $(efi_ldflags) $(stub_objects) \
- 		-o $@ -lefi -lgnuefi $(shell $(CC) -print-libgcc-file-name); \
- 	nm -D -u $@ | grep ' U ' && exit 1 || :
- .DELETE_ON_ERROR: $(gummboot_solib)
-diff --git a/configure.ac b/configure.ac
-index 27bbe1d73396..b948696c220b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,6 +40,10 @@ dnl Don't try to use things like -std=c99 for efi compilation
- EFI_CC=$CC
- AC_SUBST([EFI_CC])
- 
-+dnl Allow specifying linker compatible with the compiler
-+EFI_LD=$LD
-+AC_SUBST([EFI_LD])
-+
- AC_PROG_CC_C99
- AM_PROG_CC_C_O
- AC_PROG_GCC_TRADITIONAL
--- 
-2.21.0
-
diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
deleted file mode 100644
index 1b5c4279f7..0000000000
--- a/boot/gummiboot/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_TARGET_GUMMIBOOT
-	bool "gummiboot"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
-	select BR2_PACKAGE_GNU_EFI
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	help
-	  gummiboot is a simple UEFI boot manager which executes
-	  configured EFI images. The default entry is selected by a
-	  configured pattern (glob) or an on-screen menu.
-
-	  gummiboot operates on the EFI System Partition (ESP)
-	  only. Configuration file fragments, kernels, initrds, other
-	  EFI images need to reside on the ESP. Linux kernels need to
-	  be built with CONFIG_EFI_STUB to be able to be directly
-	  executed as an EFI image.
-
-	  See the Grub2 help text for details on preparing an EFI
-	  capable disk image using Gummiboot: the instructions are
-	  exactly the same, except that the Gummiboot configuration
-	  files will be located in /loader/ inside the EFI partition.
-
-	  http://freedesktop.org/wiki/Software/gummiboot/
diff --git a/boot/gummiboot/buildroot.conf b/boot/gummiboot/buildroot.conf
deleted file mode 100644
index 8a6f02e56a..0000000000
--- a/boot/gummiboot/buildroot.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-title	Buildroot
-version	1
-linux	/bzImage
-options	console=ttyS0 root=/dev/sda2
diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
deleted file mode 100644
index eb1f3da78c..0000000000
--- a/boot/gummiboot/gummiboot.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-################################################################################
-#
-# gummiboot
-#
-################################################################################
-
-GUMMIBOOT_SITE = https://gitlab.freedesktop.org/archived-projects/gummiboot.git
-GUMMIBOOT_SITE_METHOD = git
-GUMMIBOOT_VERSION = 2bcd919c681c952eb867ef1bdb458f1bc49c2d55
-GUMMIBOOT_LICENSE = LGPL-2.1+
-GUMMIBOOT_LICENSE_FILES = LICENSE
-
-# The git archive does not have the autoconf/automake stuff generated.
-GUMMIBOOT_AUTORECONF = YES
-GUMMIBOOT_DEPENDENCIES = gnu-efi host-pkgconf util-linux
-GUMMIBOOT_INSTALL_TARGET = NO
-GUMMIBOOT_INSTALL_IMAGES = YES
-
-ifeq ($(BR2_i386),y)
-GUMMIBOOT_IMGARCH = ia32
-else ifeq ($(BR2_x86_64),y)
-GUMMIBOOT_IMGARCH = x64
-endif
-
-GUMMIBOOT_CONF_OPTS = \
-	--host=$(BR2_ARCH) \
-	--with-efi-libdir=$(STAGING_DIR)/usr/lib \
-	--with-efi-ldsdir=$(STAGING_DIR)/usr/lib \
-	--with-efi-includedir=$(STAGING_DIR)/usr/include \
-	--disable-manpages
-
-define GUMMIBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/gummiboot$(GUMMIBOOT_IMGARCH).efi \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(GUMMIBOOT_IMGARCH).efi
-	$(INSTALL) -D -m 0644 boot/gummiboot/loader.conf \
-		$(BINARIES_DIR)/efi-part/loader/loader.conf
-	$(INSTALL) -D -m 0644 boot/gummiboot/buildroot.conf \
-		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
-endef
-
-$(eval $(autotools-package))
diff --git a/boot/gummiboot/loader.conf b/boot/gummiboot/loader.conf
deleted file mode 100644
index 93b77b8f93..0000000000
--- a/boot/gummiboot/loader.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-timeout 3
-default buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
