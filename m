Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871E0D58B29
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8521282479;
	Sun, 15 Mar 2026 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuN41z2YQjIf; Sun, 15 Mar 2026 13:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC0A82468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580275;
	bh=1NXZeChdTE5hejQnl9q8tM0Aba6QBbl5sWed0IVD5AM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvCkGcJnwQMsGJWY8tjgnRO7WTRdZRgNHnJjBkA+iiyQgwWd/SKkTYVsFrieTdOG1
	 lndVPMG85GJ9JoIJdMXlyqj/oDqdBG+5RpcCPtyZMAxLHLs5MrFs1koAet3m3LvI7/
	 LeCdisl0kQUWMuQMLH9bDjdyP4sfGUVHQGncc2Emacs7grltMFIz9IB7Jg+Wynq/HB
	 9DsxGJnG8zcnZb+xjjYzjv5iIvvw+R0BYH9aRhPbUQpzbcarQcW4sxFIKlp97BHVsg
	 ySXhTc3EeJVE26H9JP5e1aHSOUYA0FBzdZsc6ExKL8iqfj87USKgtdoEK9poop0OZd
	 vKL8mVbr6nLiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC0A82468;
	Sun, 15 Mar 2026 13:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C84E2201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A96E082468
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMTeQQK5cYsG for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1089682457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1089682457
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1089682457
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 738CBA4C130A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 14:11:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lFL-000000006LA-25Xh
 for buildroot@buildroot.org; Sun, 15 Mar 2026 13:11:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 14:11:07 +0100
Message-ID: <20260315131107.3959487-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315131107.3959487-1-bernd@kuhls.net>
References: <20260315131107.3959487-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580268;
 bh=pXNSV7mNmnhpJBn7EN1PEW3yqDu+Hzi7eQQfrP0VbXc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AuOG3Y3V/YWpAZpMSRw1eWZBrJqovPNK5C1WzeTFWgbbdO3nofCCDlPDB3Wz3z36d
 duU7+GrhsXQa3BOMfjnyYTwcMqtuOD2HE9Kgp45oSGmPsYnyKqQRrO1QDyAEQmMwuh
 5JZ5GDPqdMGUruEsBI6+pArcHov2X5AIVxTHoQuBz+XC/756aoRjv1SrsHbaXJRc0q
 7EP50dIW/ny6a/W49QDHAPQkSEV4Gbo3M6qnzjZoU770zM2tjP+nDt4R/ylc/Oe+wY
 yn2kMdORQE4iiIxX1/mJJC4Qcc/rUdPI9bQEOxwOA0TR1bKEjRqXSKFbviNOMVeUKH
 zfsRdl5TbwdkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AuOG3Y3V
Subject: [Buildroot] [PATCH 3/3] package/giflib: security bump version to
 6.1.2
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

https://sourceforge.net/p/giflib/code/ci/6.1.2/tree/NEWS

Patch 0001 was removed because it is included in this release:
https://sourceforge.net/p/giflib/code/ci/dd8b375e2a5ddfabb9709c99e38bbe0fd3b212a4/

Patch 0002 is not needed anymore because upstream removed gif2rgb from
the list of installable make targets:
https://sourceforge.net/p/giflib/code/ci/35dc68311aab89bb678ac422d1d18cd37246f803/

Updated license hash due to upstream commit
https://sourceforge.net/p/giflib/code/ci/4a425b734811799662762b3edc46458c180e3770/

The CVEs mentioned in the release notes (CVE-2021-40633 &
CVE-2025-31344) are related to gif2rgb only.

Build-tested using this defconfig:

  BR2_x86_64=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_PACKAGE_KODI=y
  BR2_PACKAGE_EFL=y
  # BR2_PACKAGE_EFL_EEZE is not set
  # BR2_PACKAGE_EFL_FONTCONFIG is not set
  # BR2_PACKAGE_EFL_GSTREAMER1 is not set
  # BR2_PACKAGE_EFL_LIBFRIBIDI is not set
  # BR2_PACKAGE_EFL_ELPUT is not set
  # BR2_PACKAGE_EFL_LIBSNDFILE is not set
  # BR2_PACKAGE_EFL_PULSEAUDIO is not set
  # BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT is not set
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
  BR2_PACKAGE_MESA3D_OPENGL_EGL=y
  BR2_PACKAGE_MESA3D_OPENGL_ES=y
  BR2_PACKAGE_XORG7=y
  BR2_PACKAGE_LUAJIT=y
  BR2_PACKAGE_OPENJDK=y
  BR2_PACKAGE_PYTHON3=y
  BR2_PACKAGE_PYTHON3_PY_ONLY=y
  BR2_PACKAGE_IMLIB2=y
  BR2_PACKAGE_IMLIB2_GIF=y
  BR2_PACKAGE_LEPTONICA=y
  BR2_PACKAGE_LIBGDIPLUS=y
  BR2_PACKAGE_WEBP=y
  BR2_PACKAGE_DLIB=y
  BR2_PACKAGE_GDAL=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...dd-targets-to-manage-static-building.patch | 73 -------------------
 ...veral-defects-found-by-Coverity-scan.patch | 61 ----------------
 package/giflib/giflib.hash                    | 10 +--
 package/giflib/giflib.mk                      |  4 +-
 4 files changed, 7 insertions(+), 141 deletions(-)
 delete mode 100644 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
 delete mode 100644 package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch

diff --git a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
deleted file mode 100644
index 31d7542e60..0000000000
--- a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 409af8210f2256eed4d2c73083aa75975f03424b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Jul 2019 12:20:38 +0200
-Subject: [PATCH] Makefile: add targets to manage static building
-
-Add static-lib, shared-lib, install-static-lib and install-shared-lib
-targets to allow the user to build giflib when dynamic library support
-is not available or enable on the toolchain
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://sourceforge.net/p/giflib/code/merge-requests/7
----
- Makefile | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 87966a96cd4f..4a93aace54b8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -87,13 +87,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
- LIBUTILSOMAJOR	= libutil.$(LIBMAJOR).$(SOEXTENSION)
- endif
- 
--all: $(LIBGIFSO) libgif.a $(LIBUTILSO) libutil.a $(UTILS)
-+SHARED_LIBS = $(LIBGIFSO) $(LIBUTILSO)
-+STATIC_LIBS = libgif.a libutil.a
-+
-+all: shared-lib static-lib $(UTILS)
- ifeq ($(UNAME), Darwin)
- else
- 	$(MAKE) -C doc
- endif
- 
--$(UTILS):: libgif.a libutil.a
-+$(UTILS):: $(STATIC_LIBS)
-+
-+shared-lib: $(SHARED_LIBS)
-+
-+static-lib: $(STATIC_LIBS)
- 
- $(LIBGIFSO): $(OBJECTS) $(HEADERS)
- ifeq ($(UNAME), Darwin)
-@@ -116,7 +123,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
- 	$(AR) rcs libutil.a $(UOBJECTS)
- 
- clean:
--	rm -f $(UTILS) $(TARGET) libgetarg.a libgif.a $(LIBGIFSO) libutil.a $(LIBUTILSO) *.o
-+	rm -f $(UTILS) $(TARGET) libgetarg.a $(SHARED_LIBS) $(STATIC_LIBS) *.o
- 	rm -f $(LIBGIFSOVER)
- 	rm -f $(LIBGIFSOMAJOR)
- 	rm -fr doc/*.1 *.html doc/staging
-@@ -141,12 +148,15 @@ install-bin: $(INSTALLABLE)
- install-include:
- 	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
- 	$(INSTALL) -m 644 gif_lib.h "$(DESTDIR)$(INCDIR)"
--install-lib:
-+install-static-lib:
- 	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
- 	$(INSTALL) -m 644 libgif.a "$(DESTDIR)$(LIBDIR)/libgif.a"
-+install-shared-lib:
-+	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
- 	$(INSTALL) -m 755 $(LIBGIFSO) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOVER)"
- 	ln -sf $(LIBGIFSOVER) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOMAJOR)"
- 	ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
-+install-lib: install-static-lib install-shared-lib
- install-man:
- 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
- 	$(INSTALL) -m 644 $(MANUAL_PAGES) "$(DESTDIR)$(MANDIR)/man1"
--- 
-2.43.0
-
diff --git a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
deleted file mode 100644
index 77f21b402e..0000000000
--- a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 7c3bce4add77944e5b479ef5da81ae7fd71a7e95 Mon Sep 17 00:00:00 2001
-From: Sandro Mani <manisandro@gmail.com>
-Date: Tue, 5 Dec 2023 16:38:48 -0700
-Subject: [PATCH] Fix several defects found by Coverity scan
-
-From: giflib-5.2.1-17.fc39.src.rpm
-Upstream: Not submitted
-
-Signed-off-by: Sandro Mani <manisandro@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
-[Fabrice: updated for 5.2.2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- gif2rgb.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gif2rgb.c b/gif2rgb.c
-index d51226d65d3d..50c43ae44ee2 100644
---- a/gif2rgb.c
-+++ b/gif2rgb.c
-@@ -165,6 +165,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
- 	/* Open stdout for the output file: */
- 	if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
- 		PrintGifError(Error);
-+		free(OutputBuffer);
-+		GifFreeMapObject(OutputColorMap);
- 		exit(EXIT_FAILURE);
- 	}
- 
-@@ -173,6 +175,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
- 	    EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
- 	        GIF_ERROR) {
- 		PrintGifError(Error);
-+		free(OutputBuffer);
-+		GifFreeMapObject(OutputColorMap);
- 		exit(EXIT_FAILURE);
- 	}
- 
-@@ -182,6 +186,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
- 
- 	for (i = 0; i < Height; i++) {
- 		if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
-+			free(OutputBuffer);
-+			GifFreeMapObject(OutputColorMap);
- 			exit(EXIT_FAILURE);
- 		}
- 		GifQprintf("\b\b\b\b%-4d", Height - i - 1);
-@@ -191,6 +197,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
- 
- 	if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
- 		PrintGifError(Error);
-+		free(OutputBuffer);
-+		GifFreeMapObject(OutputColorMap);
- 		exit(EXIT_FAILURE);
- 	}
- }
--- 
-2.43.0
-
diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index dcc384a523..8c1b1d06f5 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/giflib/files/giflib-5.x/
-md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
-sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
+# From https://sourceforge.net/projects/giflib/files/giflib-6.x/
+md5  d4ad42777ef499a7c6f8aabf2ccf7716  giflib-6.1.2.tar.gz
+sha1  bf0440c7aee5a0a151d7abbbe3657d3c1998ce86  giflib-6.1.2.tar.gz
 # Locally computed
-sha256  be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb  giflib-5.2.2.tar.gz
-sha256  0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e  COPYING
+sha256  2421abb54f5906b14965d28a278fb49e1ec9fe5ebbc56244dd012383a973d5c0  giflib-6.1.2.tar.gz
+sha256  ed5d90cb4a041bddad679470a071302ab05ae5d0ec2cf8f9c97ad7b2708751e6  COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 00922ce2db..bb563ee689 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GIFLIB_VERSION_MAJOR = 5
-GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).2.2
+GIFLIB_VERSION_MAJOR = 6
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).1.2
 GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
