Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B2C636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCFB740002;
	Wed,  1 Feb 2023 22:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCFB740002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmV0x9bIRc-g; Wed,  1 Feb 2023 22:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB68340B29;
	Wed,  1 Feb 2023 22:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB68340B29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79C451BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538738137A
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538738137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NdPk51ss65g for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:51:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF77812F0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CF77812F0
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:51:07 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout09.t-online.de (Postfix) with SMTP id 9DD45C3CD
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 23:51:04 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pNLwW-1jYb3J0; Wed, 1 Feb 2023 23:51:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43632)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pNLwW-0003jr-0C
 for buildroot@buildroot.org; Wed, 01 Feb 2023 23:51:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:51:04 +0100
Message-Id: <20230201225104.3433262-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675291864-E5D7A2C2-16AB4498/0/0 CLEAN NORMAL
X-TOI-MSGID: dca32cec-238b-46ce-9619-ced93686cc9c
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build error with newer
 mesa3d
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error:

output/build/kodi-19.5-Matrix/xbmc/windowing/X11/GLContextEGL.h:16:10:
 fatal error: EGL/eglextchromium.h: No such file or directory
   16 | #include <EGL/eglextchromium.h>

introduced by mesa3d 22.3 with this commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/f5bb9dd738ace274c97507adea073b6c609469b2

using this defconfig

BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0005-Fix-EGL-build.patch | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/kodi/0005-Fix-EGL-build.patch

diff --git a/package/kodi/0005-Fix-EGL-build.patch b/package/kodi/0005-Fix-EGL-build.patch
new file mode 100644
index 0000000000..cefa8cbdb4
--- /dev/null
+++ b/package/kodi/0005-Fix-EGL-build.patch
@@ -0,0 +1,58 @@
+From 3fed131284b53b0e42c87c672f02dc3e91e40b22 Mon Sep 17 00:00:00 2001
+From: Alan Swanson <reiver@improbability.net>
+Date: Mon, 19 Dec 2022 21:28:13 +0200
+Subject: [PATCH] Work around Mesa eglchromium.h removal
+
+I have polished Alan's snippet to buildable state and tested
+on Kodi from Debian sid.
+
+Backported EGL fix from upstream commit:
+https://github.com/xbmc/xbmc/commit/2968130023ea6ee4327119dc969758840c4a5941
+
+Signed-off-by: Vasyl Gello <vasek.gello@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/modules/FindEGL.cmake       | 6 ++++++
+ xbmc/windowing/X11/GLContextEGL.h | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/cmake/modules/FindEGL.cmake b/cmake/modules/FindEGL.cmake
+index b00fe08a25f95..a68a8db901222 100644
+--- a/cmake/modules/FindEGL.cmake
++++ b/cmake/modules/FindEGL.cmake
+@@ -9,6 +9,7 @@
+ # EGL_INCLUDE_DIRS - the EGL include directory
+ # EGL_LIBRARIES - the EGL libraries
+ # EGL_DEFINITIONS - the EGL definitions
++# HAVE_EGLEXTANGLE - if eglext_angle.h exists else use eglextchromium.h
+ #
+ # and the following imported targets::
+ #
+@@ -35,6 +36,11 @@ if(EGL_FOUND)
+   set(EGL_LIBRARIES ${EGL_LIBRARY})
+   set(EGL_INCLUDE_DIRS ${EGL_INCLUDE_DIR})
+   set(EGL_DEFINITIONS -DHAS_EGL=1)
++  include(CheckIncludeFiles)
++  check_include_files("EGL/egl.h;EGL/eglext.h;EGL/eglext_angle.h" HAVE_EGLEXTANGLE)
++  if(HAVE_EGLEXTANGLE)
++    list(APPEND EGL_DEFINITIONS "-DHAVE_EGLEXTANGLE=1")
++  endif()
+ 
+   if(NOT TARGET EGL::EGL)
+     add_library(EGL::EGL UNKNOWN IMPORTED)
+diff --git a/xbmc/windowing/X11/GLContextEGL.h b/xbmc/windowing/X11/GLContextEGL.h
+index 99a6a9024e8c6..afea0b7c43eac 100644
+--- a/xbmc/windowing/X11/GLContextEGL.h
++++ b/xbmc/windowing/X11/GLContextEGL.h
+@@ -13,7 +13,11 @@
+ #include "threads/CriticalSection.h"
+ 
+ #include <EGL/eglext.h>
++#ifdef HAVE_EGLEXTANGLE
++#include <EGL/eglext_angle.h>
++#else
+ #include <EGL/eglextchromium.h>
++#endif
+ #include <X11/Xutil.h>
+ 
+ class CGLContextEGL : public CGLContext
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
