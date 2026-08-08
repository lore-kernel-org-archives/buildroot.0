Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0805BC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A261260656;
	Sat,  8 Aug 2026 13:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrWLP-1wrKvK; Sat,  8 Aug 2026 13:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E7B60672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786194019;
	bh=L0GgDxO7DNfB6JICvNQMKNuy8cjWrLkMkJGM9oKq2Y8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=P3HWefXPPBnuoRg4Marx/TZisZuWUbMV15B47gmuPe1QWKjUUj8UQJQ2fjz2f1OQd
	 sJXsYJhzOdUsIKSv9Y31iWuPdCJvlpkEcipiJdpA7aE7aPiVb6Pzrx6thn3oSs2OxK
	 zjM90kOYgN5OKxz9STpe25ZwaXQqJK0k4X/+qy9b/sMNjx8oRp0Wn7dasdORgKNDhz
	 EpJe8JXdpIoCIWB1nBWS/dKRCQ+Khz+VGijDT7npVgvnyqqDIEnQKlLW7wuQVvCwTW
	 iHI9ZSjobJH0C84Cx7YXZbyItrVNTVyN+Z3XALeMOYRWF4D5hmswzd7LCB4PJAUmJz
	 Nsth74VkMIwHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E7B60672;
	Sat,  8 Aug 2026 13:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1CB2B6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605EF400A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQMtPUCrmkTi for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0660C4004B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0660C4004B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0660C4004B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:00:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 818CE4E4115C
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48EC76045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:00:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 783A911C484A4; 
 Sat,  8 Aug 2026 15:00:06 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 15:00:03 +0200
Message-ID: <20260808130004.1231694-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786194007; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Rul9h27dNZOx2xSz37WusCxwTkJRwg8hBHuoKHEIRx0=;
 b=GA8dwqu3+G1BNcOi76CD2lnvRl6hnc1x5RwX8Tfuz8xr/bSQCyOR5EGzKJxphCm3ZzKP/N
 mUkh/bLv3XmYRtrXcXsZ7ehyLn1GuvRgTtxMkjJGYFr3kA1Qe1KYnizDl49S8f22jDlIIF
 lq8DFhfBk+wRQ4h1a7kE6UDM/zL7x+xB490/yYtEJRXYUgexp21ft62J3sZ4xRsyF2BaDE
 bgyLLZsdiEj2ydmPsojIJolWo4/ZA3FMDGz2VdOxuFDAHzjNliF+U5Bst86JVLB74uOpfi
 BBAwdFFrJUwRW4scH4SQ0940vnZ4hbMw6FLNpmk0vL48HUEccMm50OuHOZXgkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GA8dwqu3
Subject: [Buildroot] [PATCH] boot/grub2: fix build issue since 2.14 version
 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...-Check-linker-for-image-base-support.patch | 75 +++++++++++++++++++
 ...-Print-a-more-helpful-error-if-autoc.patch | 36 +++++++++
 boot/grub2/grub2.mk                           |  7 ++
 3 files changed, 118 insertions(+)
 create mode 100644 boot/grub2/0001-Revert-configure-Check-linker-for-image-base-support.patch
 create mode 100644 boot/grub2/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
