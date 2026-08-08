Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FE6C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF9F80E78;
	Sat,  8 Aug 2026 14:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uC70u_2lwQgi; Sat,  8 Aug 2026 14:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E9280EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786199993;
	bh=XJGvO0l1E9yKt0Nrb3wezLTPDAgE1sPF2EnX7J3fQSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kc9ST6nCKGtERjPDzRrKaL9mAD/ciUdd/kBJ2qpXH3oOCuOPujjTYBQu7HcsOjBxl
	 KiNKS0wfajeHtwS9iZy4WJ/lRCKzS9Hi/fPZXvHNtDVrEgDOgOTKsJ2b+6kfzOhAZ+
	 q4XgtnrKzVAdNAA5NjTmwaoYapIPTNtGP5IcbkyFHKe6TC6kYhmwUGAef8S6FukYpL
	 M4qWm2GrA8rCrNcQIbPPPUTbRaP+0hDbxae/Ei8yJwojv6h6vzIFNixX4WyvrSzIpA
	 hAYn1pin55yArDYd0GK+g3tZHCG6Vt1t3DPE/KlKjdeEFYfQklYtvhbyPC9C4f0zaZ
	 JPudYYaV7uOng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E9280EA1;
	Sat,  8 Aug 2026 14:39:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B451218
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B2C6065E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UsnH8CKkKNP for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2664B605F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2664B605F5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08F2D8CA36; Sat,  8 Aug 2026 14:39:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 16:22:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fa59eb7dbc4016086ff14cb3c9a3ebead507d08
X-Git-Newrev: e427f85e29f7027319a5cd1ce1024d80ef4a29ea
X-Patchwork-Hint: ignore
Message-Id: <20260808143904.08F2D8CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix build issue since 2.14
 version bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e427f85e29f7027319a5cd1ce1024d80ef4a29ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of grub2 to version 2.14, the build fails on some
configurations with:

/home/autobuild/autobuild/instance-8/output-1/host/bin/grub-mkimage: error: `/home/autobuild/autobuild/instance-8/output-1/build/grub2-2.14/build-i386-pc/grub-core//kernel.img' is miscompiled: its start address is 0x9074 instead of 0x9000: ld.gold bug?.

We are not the only ones affected: OpenEmbedded has the issue as well,
addressed in commit
https://github.com/openembedded/openembedded-core/commit/66aefeca482e2985fef5b936ff611ba8b7f81b85,
and this commit points that libreboot and Gentoo have also adopted the
same temporary fix: revert two upstream commits.

So to fix the issue in Buildroot, we take the same approach. It is
temporary, and there is an upstream patch series under discussion to
really fix the problem. But as this series has 9 patches still under
discussion, we take the simpler approach of reverting two simpler
patches for the time being.

host-pkgconf is needed as an additional dependency because
configure.ac using m4 macros provided by host-pkgconf.

Fixes:

  https://autobuild.buildroot.net/results/89b/89b907278cada3d7ca1fee2d08d66921ffb4d7cc/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...igure-Check-linker-for-image-base-support.patch | 75 ++++++++++++++++++++++
 ...igure-Print-a-more-helpful-error-if-autoc.patch | 36 +++++++++++
 boot/grub2/grub2.mk                                |  7 ++
 3 files changed, 118 insertions(+)

diff --git a/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch b/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
new file mode 100644
index 0000000000..edfaea2de8
--- /dev/null
+++ b/boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
@@ -0,0 +1,75 @@
+From 3a9d2dd2f5fb07b75a74c307d61b9b9fc5d20a62 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 27 Feb 2026 11:46:54 +0800
+Subject: [PATCH] Revert "configure: Check linker for --image-base support"
+
+This reverts commit 1a5417f39a0ccefcdd5440f2a67f84d2d2e26960.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Upstream: temporary revert, until upstream fixes the issue, see
+discussion at
+https://lists.gnu.org/archive/html/grub-devel/2026-02/msg00039.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ acinclude.m4 |  5 -----
+ configure.ac | 14 ++------------
+ 2 files changed, 2 insertions(+), 17 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 70c1912f8..fa7840f09 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -79,11 +79,6 @@ AC_DEFUN([grub_PROG_OBJCOPY_ABSOLUTE],
+ [AC_MSG_CHECKING([whether ${TARGET_OBJCOPY} works for absolute addresses])
+ AC_CACHE_VAL(grub_cv_prog_objcopy_absolute,
+ [cat > conftest.c <<\EOF
+-asm (
+-    ".globl start, _start, __start\n"
+-    ".ifdef cmain; .set start = _start = __start = cmain\n.endif\n"
+-    ".ifdef _cmain; .set start = _start = __start = _cmain\n.endif\n"
+-);
+ void cmain (void);
+ void
+ cmain (void)
+diff --git a/configure.ac b/configure.ac
+index d8ca1b7c1..041cfbab4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1461,6 +1461,7 @@ elif test x$grub_cv_target_cc_link_format = x-mi386pe || test x$grub_cv_target_c
+   TARGET_IMG_LDSCRIPT='$(top_srcdir)'"/conf/i386-cygwin-img-ld.sc"
+   TARGET_IMG_LDFLAGS="-Wl,-T${TARGET_IMG_LDSCRIPT}"
+   TARGET_IMG_LDFLAGS_AC="-Wl,-T${srcdir}/conf/i386-cygwin-img-ld.sc"
++  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
+   TARGET_IMG_CFLAGS=
+ else
+   TARGET_APPLE_LINKER=0
+@@ -1468,6 +1469,7 @@ else
+   TARGET_IMG_LDSCRIPT=
+   TARGET_IMG_LDFLAGS='-Wl,-N'
+   TARGET_IMG_LDFLAGS_AC='-Wl,-N'
++  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
+   TARGET_IMG_CFLAGS=
+ fi
+ 
+@@ -1798,18 +1800,6 @@ grub_PROG_TARGET_CC
+ m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
+ 
+ if test "x$TARGET_APPLE_LINKER" != x1 ; then
+-AX_CHECK_LINK_FLAG([-Wl,--image-base,0x400000],
+-    [TARGET_IMG_BASE_LDOPT="-Wl,--image-base"],
+-    [TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"],
+-    [],
+-    [AC_LANG_SOURCE([
+-asm (".globl start; start:");
+-asm (".globl _start; _start:");
+-asm (".globl __start; __start:");
+-void __main (void);
+-void __main (void) {}
+-int main (void);
+-    ])])
+ grub_PROG_OBJCOPY_ABSOLUTE
+ fi
+ grub_PROG_LD_BUILD_ID_NONE
+-- 
+2.43.0
+
diff --git a/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch b/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
new file mode 100644
index 0000000000..8e38bb9d3f
--- /dev/null
+++ b/boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
@@ -0,0 +1,36 @@
+From d0f516385dc73e8dd92b78ce08c1df100434fe67 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 27 Feb 2026 13:58:44 +0800
+Subject: [PATCH] Revert "configure: Print a more helpful error if
+ autoconf-archive is not installed"
+
+This reverts commit ac042f3f58d33ce9cd5ff61750f06da1a1d7b0eb.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Upstream: temporary revert, until upstream fixes the issue, see
+discussion at
+https://lists.gnu.org/archive/html/grub-devel/2026-02/msg00039.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 041cfbab4..209c0fb11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1794,11 +1794,6 @@ LIBS=""
+ # Defined in acinclude.m4.
+ grub_ASM_USCORE
+ grub_PROG_TARGET_CC
+-
+-# The error message produced by autoconf if autoconf-archive is not installed is
+-# quite misleading and not very helpful. So, try point people in the right direction.
+-m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
+-
+ if test "x$TARGET_APPLE_LINKER" != x1 ; then
+ grub_PROG_OBJCOPY_ABSOLUTE
+ fi
+-- 
+2.43.0
+
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index b3614a7da6..85b3925c1e 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -15,6 +15,13 @@ HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
 	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
+# 0001-Revert-configure-Check-linker-for-image-base-support.patch
+# 0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
+GRUB2_AUTORECONF = YES
+GRUB2_DEPENDENCIES += host-pkgconf
+HOST_GRUB2_AUTORECONF = YES
+HOST_GRUB2_DEPENDENCIES += host-pkgconf
+
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
