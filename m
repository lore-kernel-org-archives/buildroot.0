Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA857FC9EF9
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 11:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830AC42033;
	Sat,  7 Mar 2026 11:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PfvptbSvdd9; Sat,  7 Mar 2026 11:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFCE42036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772882478;
	bh=N1/hOYEpzQGxga/5ArjjK7VMzqeNEWmJfdHKjwpATu4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=glwqcQUZ0WTj++2LAgcQWD5ifMWL/CWi3Tr9AvHkO9sATm2Fl6RuI99DTFP7Y5TkI
	 PV3YrcLog/AR4d5zW+u2ZX51FDuI3aL+PvzFaq4qGVuYM9cuBp1HbI9uwl/xmLJfaE
	 oJsRKJ90pHbGDDC67EVK/necucP+MzwrxpyzqE8zy88I2PEwgn3FWTJHLCsUNzDQ0t
	 AGAigzDvGSajlPxxGJe5lTgbRafX8HZNKoghV1HMFEz+2xlg7NO/9P1f0kM6U9Q0Ou
	 IUjBc2u2nhBE1r0Z2MbPV2D24uWilKg4b9nriAxhqGClyxJHeOKhNcJfKhpHPaleKb
	 HK55aC+n0BNmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DFCE42036;
	Sat,  7 Mar 2026 11:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9376223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAEEB8424D
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxPp-eXhnS5Z for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 11:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 748CF84246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748CF84246
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 748CF84246
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AFB7A4C36C5
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:20:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vypiL-000000004DY-2Qrf
 for buildroot@buildroot.org; Sat, 07 Mar 2026 11:20:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 12:20:54 +0100
Message-ID: <20260307112057.31154-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772882458;
 bh=5ileDvPW5jbPTLAYr/HFU5U+kpvOqctSYXOOQ9TBbq4=;
 h=From:To:Subject:Date:From;
 b=oF3hxviCwGBgD96g9xBuRA5G9iHa3gwcRmffBSxHHWuCSjnd6K5C9N/RiNEQzcfLL
 nXyKYyJvgZY064sXWuttBLvtEy/huviwmg/QXyQe/7WbcXZr1Gzp0W26FtN+6BOTS5
 Yo9xRRG/9ual/QC+eYNl43z7YcnS9PjBK+wEIfz2ke/hKdu9aTOv41pDMPymeOanqb
 iJN6H0N0YQ931qgvM6kpt5oEMXoh/+MBC0Q7EXxat7ZqnJrbk8GPQSrnb/sC/J3Eyi
 2enyodjTSjPWjCHlnr1IpWEebD054pjCwka4PyrU4rqUcs997/uM94IiN/GUW9XoqL
 zW/RCuTuFTRbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oF3hxviC
Subject: [Buildroot] [PATCH 1/4] package/rubix: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last release dates back to 2008 and we see build errors with gcc
14.x:

cube.c: In function 'load_cube':
cube.c:260:26: error: passing argument 2 of 'strstr' makes pointer from
 integer without a cast [-Wint-conversion]
  260 |     ptr = strstr(buffer, '=');

Fixes:
https://autobuild.buildroot.net/results/0a8/0a86f131afa72ca1be73a10635c95ca7974b49f8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   2 -
 Config.in.legacy                              |   7 +
 package/Config.in                             |   1 -
 .../0001-dont-use-legacy-functions.patch      |  18 ---
 package/rubix/0002-misc-fixes.patch           | 135 ------------------
 package/rubix/Config.in                       |   8 --
 package/rubix/rubix.hash                      |   3 -
 package/rubix/rubix.mk                        |  30 ----
 8 files changed, 7 insertions(+), 197 deletions(-)
 delete mode 100644 package/rubix/0001-dont-use-legacy-functions.patch
 delete mode 100644 package/rubix/0002-misc-fixes.patch
 delete mode 100644 package/rubix/Config.in
 delete mode 100644 package/rubix/rubix.hash
 delete mode 100644 package/rubix/rubix.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 3ce5f08ba3..200bb1aff8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -844,8 +844,6 @@ package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch lib_pat
 package/rpcbind/0001-Remove-yellow-pages-support.patch lib_patch.Upstream
 package/rpcbind/S30rpcbind lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
-package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 494b153e4e..2f1a5cafd6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_RUBIX
+	bool "rubix removed"
+	select BR2_LEGACY
+	help
+	  Rubix was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	bool "EDK2 OVMF IA32 removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5c7ab57101..4011946695 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -292,7 +292,6 @@ menu "Games"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
-	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
 	source "package/solarus/Config.in"
 	source "package/stella/Config.in"
diff --git a/package/rubix/0001-dont-use-legacy-functions.patch b/package/rubix/0001-dont-use-legacy-functions.patch
deleted file mode 100644
index 9c34aee6d3..0000000000
--- a/package/rubix/0001-dont-use-legacy-functions.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Use strstr() instead of index(), since index() is a legacy function
-and it may not be available in uClibc, depending on the configuration.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: rubix-1.0.5/cube.c
-===================================================================
---- rubix-1.0.5.orig/cube.c	2010-02-14 14:19:05.000000000 +0100
-+++ rubix-1.0.5/cube.c	2010-02-14 14:19:14.000000000 +0100
-@@ -257,7 +257,7 @@
-     if (i==-1) goto finish;
-     if (buffer[0]=='%') goto new_section;
-     buffer[0]=toupper(buffer[0]);
--    ptr = index(buffer, '=');
-+    ptr = strstr(buffer, '=');
-     if (ptr) {
-       ++ptr;
-       while (isspace(*ptr)) ++ptr;
diff --git a/package/rubix/0002-misc-fixes.patch b/package/rubix/0002-misc-fixes.patch
deleted file mode 100644
index 3ce6dad220..0000000000
--- a/package/rubix/0002-misc-fixes.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-diff -Nrup rubix-1.0.5/fillpoly.c rubix-1.0.5-avr32/fillpoly.c
---- rubix-1.0.5/fillpoly.c	2003-10-12 15:41:43.000000000 -0400
-+++ rubix-1.0.5-avr32/fillpoly.c	2008-02-29 12:39:51.000000000 -0500
-@@ -435,7 +435,7 @@ void fill_lines(device *d, int thecol)
- 			);
- #endif
-     }
--  } else if (d->depth==16) { /* here 16bpp */
-+  } else if ((d->depth==16) | (d->depth==15)) { /* here 16bpp */
-     register int i;
- #ifndef PC_ARCHI
-     register int j;
-diff -Nrup rubix-1.0.5/line.c rubix-1.0.5-avr32/line.c
---- rubix-1.0.5/line.c	2003-10-12 14:15:19.000000000 -0400
-+++ rubix-1.0.5-avr32/line.c	2008-02-29 12:39:51.000000000 -0500
-@@ -1317,7 +1317,7 @@ void drawline(device *d, line *l)
- #endif
-   if (d->depth==8)
-     drawline8(d, l);
--  else if (d->depth==16)
-+  else if ((d->depth==16) | (d->depth==15))
-     drawline16(d, l);
-   else if (d->depth==24)
-     drawline24(d, l);
-diff -Nrup rubix-1.0.5/Makefile rubix-1.0.5-avr32/Makefile
---- rubix-1.0.5/Makefile	2003-12-04 14:27:58.000000000 -0500
-+++ rubix-1.0.5-avr32/Makefile	2008-02-29 12:58:30.000000000 -0500
-@@ -11,21 +11,17 @@
- # Customize to fit your needs (especially if it does not work for now).
- 
- LANGUAGE=ENGLISH
--GAMESDIR=/usr/games
- 
- #architecture=-DPC_ARCHI
- 
- # For Solaris
- #EXTRALIBS=-lsocket
- 
--CC=gcc
- CFLAGS=-Wall -O3 -fomit-frame-pointer -ffast-math \
-    -DGAMESDIR="\"$(GAMESDIR)\"" \
-    -D$(LANGUAGE) $(architecture)
- 
- #CFLAGS=-Wall -g -ffast-math -Iplayer $(architecture)
--XINC=-I/usr/X11R6/include
--XLIB=-L/usr/X11R6/lib -lX11
- 
- #the following should not be changed.
- 
-@@ -37,7 +33,7 @@ rubix : $(OBJ)
- 
- install :
- 	mkdir -p $(GAMESDIR)
--	install -c -s rubix $(GAMESDIR)
-+	install -c rubix $(GAMESDIR)
- 
- clean :
- 	rm -f *.o *~ core *.bak *.dat gmon.out
-diff -Nrup rubix-1.0.5/screen.c rubix-1.0.5-avr32/screen.c
---- rubix-1.0.5/screen.c	2004-04-26 04:26:05.000000000 -0400
-+++ rubix-1.0.5-avr32/screen.c	2008-02-29 12:39:51.000000000 -0500
-@@ -80,11 +80,17 @@ void error_statement(SCREEN *s)
- 
- int reset_data_buffers(SCREEN *s)
- {     
-+  int temp;
- 
-   if (s->im)
-     XDestroyImage(s->im);
-+  if (s->depth == 15) {
-+		temp=16;
-+  } else {
-+		temp=s->depth;
-+  }
- 
--  s->buffer=(char *)malloc(((SCREEN_X+7)/8)*SCREEN_Y*s->depth);
-+  s->buffer=(char *)malloc(((SCREEN_X+7)/8)*SCREEN_Y*temp);
- 
-   if (!s->buffer) {
-     error_statement(s);
-@@ -106,7 +112,7 @@ int reset_data_buffers(SCREEN *s)
-    */
-   /* Sed - december 2003 - no it has to be 8 */
-   s->im=XCreateImage(s->d, DefaultVisual(s->d, DefaultScreen(s->d)), 
--		     s->depth==32?24:s->depth, ZPixmap,
-+		     s->depth, ZPixmap,
- 		     0, s->buffer, SCREEN_X, SCREEN_Y, 8, 0);
- 
-   if (!s->im) {
-@@ -139,8 +145,8 @@ int init_screen(SCREEN *s)
- 
-   s->depth=DefaultDepth(s->d, DefaultScreen(s->d));
-   
--  if (s->depth!=8 && s->depth!=16 && s->depth!=24) {
--    fprintf(stderr, "screen depth not supported (only 8, 16 and 24bpp (which means 32bpp too) handled\n");
-+  if (s->depth!=8 && s->depth!=15 && s->depth!=16 && s->depth!=24) {
-+    fprintf(stderr, "screen depth not supported (only 8, 15, 16 and 24bpp (which means 32bpp too) handled\n");
-     XCloseDisplay(s->d);
-     s->d=(Display *)0;
-     return -1;
-@@ -182,10 +188,10 @@ int init_screen(SCREEN *s)
-    
-   /* let's create and map our window */
-   s->w=XCreateWindow(s->d, DefaultRootWindow(s->d), 0, 0, 
--		       SCREEN_X, SCREEN_Y, 3, s->depth==32?24:s->depth,
-+		       SCREEN_X, SCREEN_Y, 3, s->depth,
- 		       CopyFromParent, CopyFromParent, 0, NULL);
-   s->h=XCreateWindow(s->d, DefaultRootWindow(s->d), 0, 0, 
--		       HELP_X, HELP_Y, 3, s->depth==32?24:s->depth,
-+		       HELP_X, HELP_Y, 3, s->depth,
- 		       CopyFromParent, CopyFromParent, 0, NULL);     
-    
-   xch.res_name = "rubix";
-@@ -946,13 +952,18 @@ void close_screen(SCREEN *s)
- void clear_screen(SCREEN *s)
- {
-   /* fill s->im with pixel[10], avoid XPutPixel which is rather slow... */
--  int i, w, dw;
-+  int i, w, dw, temp;
-+  if (s->depth == 15) {
-+	temp = 16;
-+  } else {
-+	temp = s->depth;
-+  }
-   w = (SCREEN_X+7)/8;
--  dw = s->depth/8;
-+  dw = temp/8;
-   XPutPixel(s->im, 0, 0, pixel[10]);
-   for (i=1; i<8*w; i++)
-      memcpy(s->buffer + i*dw, s->buffer, dw);
--  w = w * s->depth;
-+  w = w * temp;
-   for (i=1; i<SCREEN_Y; i++)
-      memcpy(s->buffer + i*w, s->buffer, w);
- }
diff --git a/package/rubix/Config.in b/package/rubix/Config.in
deleted file mode 100644
index e814a95f57..0000000000
--- a/package/rubix/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_RUBIX
-	bool "rubix"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  A 3D rubiks cube game for X
-
-	  http://sed.free.fr/rubix
diff --git a/package/rubix/rubix.hash b/package/rubix/rubix.hash
deleted file mode 100644
index 8ff5431824..0000000000
--- a/package/rubix/rubix.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87  rubix-1.0.6.tar.bz2
-sha256  429d04118c02bc92d834c430601f8c0c8df1ab27e3617ec73ad3f66c5953475d  LICENCE
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
deleted file mode 100644
index 937339f546..0000000000
--- a/package/rubix/rubix.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# rubix
-#
-################################################################################
-
-RUBIX_VERSION = 1.0.6
-RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
-RUBIX_SITE = http://sed.free.fr/rubix
-RUBIX_LICENSE = Public Domain
-RUBIX_LICENSE_FILES = LICENCE
-RUBIX_DEPENDENCIES = xlib_libX11
-
-RUBIX_MAKE_OPTS = \
-	CC="$(TARGET_CC)" \
-	XINC="-I$(STAGING_DIR)/usr/include/X11" \
-	XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
-
-RUBIX_INSTALL_TARGET_OPTS = GAMESDIR=$(TARGET_DIR)/usr/games install
-
-define RUBIX_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RUBIX_MAKE_OPTS) rubix
-endef
-
-define RUBIX_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RUBIX_MAKE_OPTS) \
-		$(RUBIX_INSTALL_TARGET_OPTS)
-endef
-
-$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
