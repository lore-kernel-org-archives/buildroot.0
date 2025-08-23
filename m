Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A02CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 17:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E0783D78;
	Sat, 23 Aug 2025 17:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK-B7BF_uCEa; Sat, 23 Aug 2025 17:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC69D83330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC69D83330;
	Sat, 23 Aug 2025 17:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B63E71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D98561318
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQi4kJMtk0An for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 17:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67FDE612F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67FDE612F8
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67FDE612F8
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A6414C6B39B
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F27C606A7
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E9131C22C45A; 
 Sat, 23 Aug 2025 19:05:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Aug 2025 19:05:43 +0200
Message-ID: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755968751; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=s4fwO+xR406RueF5vcpEuKROOMncEJB35ILEH5JBRUg=;
 b=YjSfCk2hZkP8QPyAvbgiJK637eRwd7JGt9ScliXta3DWy+0zoshtjRaUYYX8aNgKA0VHjU
 LcWVxyDBXCVG+7fvOlQ9H6hp/iU99l0yZac5puszs7eN6B8VmEqGaoNQivhJutuXxjsMoZ
 hX9JYscFaL3eQBxz2jlDbBD4/Or9WlNucJizQDYZxuj57DTeUxK4qpjltGleqvDEZlw76d
 Bmp03DZtviq4zIxKjIOsh903tNVQrFu6llAouZKjbG7iG85rsfgdPuTm51XGzIceMLQC35
 7B4qe7u1uffHylbEfTPT0CmrWs5a6a7CWHtHOR56dMYT0GM879xpLqQiTiMGXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YjSfCk2h
Subject: [Buildroot] [PATCH 1/2] package/sdl: improve existing patches
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

- Replace patch 0001 by a properly Git-formatted patch, cherry-picked
  from the upstream Git repository at
  https://github.com/libsdl-org/SDL-1.2

- Add Upstream: tags on both patches, with the upstream Git
  commit. Updated .checkpackageignore accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  2 -
 ...-compilation-with-libX11-1.5.99.902.patch} | 51 +++++++++++--------
 ...x11yuv.c-fix-possible-use-after-free.patch |  5 +-
 3 files changed, 33 insertions(+), 25 deletions(-)
 rename package/sdl/{0001-fix-compilation-with-libx11.patch => 0001-Fix-compilation-with-libX11-1.5.99.902.patch} (57%)

diff --git a/.checkpackageignore b/.checkpackageignore
index ca7fec588a..7826734ecd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1044,8 +1044,6 @@ package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib
 package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
 package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
-package/sdl/0001-fix-compilation-with-libx11.patch lib_patch.Upstream
-package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
 package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch lib_patch.Upstream
 package/sdl_mixer/0002-configure__set_macro_directory.patch lib_patch.Upstream
 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch lib_patch.Upstream
diff --git a/package/sdl/0001-fix-compilation-with-libx11.patch b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
similarity index 57%
rename from package/sdl/0001-fix-compilation-with-libx11.patch
rename to package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
index 27f244883e..83f0ab2bb1 100644
--- a/package/sdl/0001-fix-compilation-with-libx11.patch
+++ b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
@@ -1,20 +1,24 @@
-sdl: Fix compilation with libX11 >= 1.5.99.902
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-# HG changeset patch
-# User Azamat H. Hackimov <azamat.hackimov@gmail.com>
-# Date 1370184533 -21600
-# Node ID 91ad7b43317a6387e115ecdf63a49137f47e42c8
-# Parent  f7fd5c3951b9ed922fdf696f7182e71b58a13268
-Fix compilation with libX11 >= 1.5.99.902.
+From 41410b72746cfc7ff515aefed62b0b179bf6e8da Mon Sep 17 00:00:00 2001
+From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
+Date: Sun, 2 Jun 2013 20:48:53 +0600
+Subject: [PATCH] Fix compilation with libX11 >= 1.5.99.902.
 
 These changes fixes bug #1769 for SDL 1.2
 (http://bugzilla.libsdl.org/show_bug.cgi?id=1769).
 
-diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
---- a/configure.in	Wed Apr 17 00:56:53 2013 -0700
-+++ b/configure.in	Sun Jun 02 20:48:53 2013 +0600
-@@ -1169,6 +1169,17 @@
+Upstream: 5d79977ec7a6b58afa6e4817035aaaba186f7e9f
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ configure.in               | 11 +++++++++++
+ include/SDL_config.h.in    |  1 +
+ src/video/x11/SDL_x11sym.h |  4 ++++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 08c8e1e9..89c526d4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1127,6 +1127,17 @@ AC_HELP_STRING([--enable-video-x11-xrandr], [enable X11 Xrandr extension for ful
              if test x$definitely_enable_video_x11_xrandr = xyes; then
                  AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR)
              fi
@@ -32,10 +36,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
          fi
      fi
  }
-diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
---- a/include/SDL_config.h.in	Wed Apr 17 00:56:53 2013 -0700
-+++ b/include/SDL_config.h.in	Sun Jun 02 20:48:53 2013 +0600
-@@ -283,6 +283,7 @@
+diff --git a/include/SDL_config.h.in b/include/SDL_config.h.in
+index 8bb1773c..78ca747b 100644
+--- a/include/SDL_config.h.in
++++ b/include/SDL_config.h.in
+@@ -282,6 +282,7 @@
  #undef SDL_VIDEO_DRIVER_WINDIB
  #undef SDL_VIDEO_DRIVER_WSCONS
  #undef SDL_VIDEO_DRIVER_X11
@@ -43,10 +48,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
  #undef SDL_VIDEO_DRIVER_X11_DGAMOUSE
  #undef SDL_VIDEO_DRIVER_X11_DYNAMIC
  #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XEXT
-diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
---- a/src/video/x11/SDL_x11sym.h	Wed Apr 17 00:56:53 2013 -0700
-+++ b/src/video/x11/SDL_x11sym.h	Sun Jun 02 20:48:53 2013 +0600
-@@ -165,7 +165,11 @@
+diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
+index 4875b989..bd83f7f5 100644
+--- a/src/video/x11/SDL_x11sym.h
++++ b/src/video/x11/SDL_x11sym.h
+@@ -165,7 +165,11 @@ SDL_X11_SYM(Bool,XShmQueryExtension,(Display* a),(a),return)
   */
  #ifdef LONG64
  SDL_X11_MODULE(IO_32BIT)
@@ -58,3 +64,6 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
  SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
  #endif
  
+-- 
+2.50.1
+
diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
index d7858d0f96..68e66bd5a2 100644
--- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
+++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
@@ -1,9 +1,10 @@
-From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
+From c24c08c9aa0f92213793e5ef404f2c387603d7f8 Mon Sep 17 00:00:00 2001
 From: Ozkan Sezer <sezeroz@gmail.com>
 Date: Sat, 18 Jun 2022 14:55:00 +0300
 Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
 
 Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
+Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/video/x11/SDL_x11yuv.c | 2 +-
@@ -24,5 +25,5 @@ index 62698dfd..0d5754e3 100644
  								0, width, height);
  		}
 -- 
-2.30.2
+2.50.1
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
