Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AD9C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F65404C6;
	Sat, 13 Jul 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88PIdOLKyfGM; Sat, 13 Jul 2024 19:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1BAA404C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1BAA404C8;
	Sat, 13 Jul 2024 19:55:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 409301BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7C2607A1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fu1MrcYS2uCa for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC2860718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC2860718
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 578C686604; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90f0a484671098f9a94ce66b8f8af94e106ae106
X-Git-Newrev: 2c0d7b72c0993a55c8dcb7b38d85792e1bf6e8bc
X-Patchwork-Hint: ignore
Message-Id: <20240713195553.578C686604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: make X11 support optional
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c0d7b72c0993a55c8dcb7b38d85792e1bf6e8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The X11 support in mupdf is actually optional, and it does require
libXext in addition to libX11, so adjust the packaging accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mupdf/Config.in | 2 --
 package/mupdf/mupdf.mk  | 8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index cf97711160..34c5e7d538 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MUPDF
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
 	select BR2_PACKAGE_HARFBUZZ
@@ -11,7 +10,6 @@ config BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_OPENJPEG
-	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_ZLIB
 	help
 	  MuPDF is a lightweight PDF, XPS, and E-book viewer.
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 5f73b680a6..d813d9b7de 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -19,7 +19,6 @@ MUPDF_DEPENDENCIES = \
 	host-pkgconf \
 	jbig2dec jpeg \
 	lcms2 openjpeg \
-	xlib_libX11 \
 	zlib
 
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
@@ -39,6 +38,13 @@ else
 MUPDF_MAKE_OPTS += shared=yes
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
+MUPDF_MAKE_OPTS += HAVE_X11=yes
+MUPDF_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+MUPDF_MAKE_OPTS += HAVE_X11=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MUPDF_DEPENDENCIES += libfreeglut
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
