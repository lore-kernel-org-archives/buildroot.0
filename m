Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E2C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 14:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2F4740354;
	Sun,  2 Oct 2022 14:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F4740354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lOephEHFxhW; Sun,  2 Oct 2022 14:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6116403AC;
	Sun,  2 Oct 2022 14:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6116403AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7CD91BF41B
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC0F40994
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC0F40994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6b-b9fiDRgd for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 14:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359704098C
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 359704098C
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 14:46:40 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout10.t-online.de (Postfix) with SMTP id 922F012E47
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 16:46:36 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.166]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1of0Eg-1Euk9R0; Sun, 2 Oct 2022 16:46:30 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60770)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1of0Ef-00053Q-3B
 for buildroot@buildroot.org; Sun, 02 Oct 2022 16:46:30 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 16:46:29 +0200
Message-Id: <20221002144629.2105385-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221002144629.2105385-1-bernd.kuhls@t-online.de>
References: <20221002144629.2105385-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664721990-01449CE0-E58B798D/0/0 CLEAN NORMAL
X-TOI-MSGID: b6f1529c-0e29-4f9f-b925-ae8fb3a263d2
Subject: [Buildroot] [PATCH 2/2] package/kodi: fix build with fmt >= 9.x
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

For details see https://github.com/xbmc/xbmc/pull/21674

Build-tested using this previously broken defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...char-as-formatting-of-non-void-point.patch | 54 +++++++++++++++++++
 ...t-as-char-as-formatting-of-non-void-.patch | 33 ++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
 create mode 100644 package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch

diff --git a/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
new file mode 100644
index 0000000000..af68de220c
--- /dev/null
+++ b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
@@ -0,0 +1,54 @@
+From 44b30c116682968bacf8aec566fc9c193026ecc9 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 6 Jul 2022 22:48:35 +1000
+Subject: [PATCH] GLUtils: cast as char as formatting of non-void pointers
+ is disallowed
+
+Downloaded from upstream commit:
+https://github.com/xbmc/xbmc/commit/44b30c116682968bacf8aec566fc9c193026ecc9
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/utils/GLUtils.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/utils/GLUtils.cpp b/xbmc/utils/GLUtils.cpp
+index 1ef804709f..c36dcf6a20 100644
+--- a/xbmc/utils/GLUtils.cpp
++++ b/xbmc/utils/GLUtils.cpp
+@@ -148,27 +148,27 @@ void _VerifyGLState(const char* szfile, const char* szfunction, int lineno)
+ void LogGraphicsInfo()
+ {
+ #if defined(HAS_GL) || defined(HAS_GLES)
+-  const GLubyte *s;
++  const char* s;
+ 
+-  s = glGetString(GL_VENDOR);
++  s = reinterpret_cast<const char*>(glGetString(GL_VENDOR));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VENDOR = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VENDOR = NULL");
+ 
+-  s = glGetString(GL_RENDERER);
++  s = reinterpret_cast<const char*>(glGetString(GL_RENDERER));
+   if (s)
+     CLog::Log(LOGINFO, "GL_RENDERER = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_RENDERER = NULL");
+ 
+-  s = glGetString(GL_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VERSION = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VERSION = NULL");
+ 
+-  s = glGetString(GL_SHADING_LANGUAGE_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_SHADING_LANGUAGE_VERSION = %s", s);
+   else
+-- 
+2.30.2
+
diff --git a/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch b/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
new file mode 100644
index 0000000000..41dc3356bd
--- /dev/null
+++ b/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
@@ -0,0 +1,33 @@
+From 651c82853fe69dc5aa3e6a50f2eb2f752caafba0 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 11 Jul 2022 09:39:02 +0000
+Subject: [PATCH] WinSystemX11: cast as char as formatting of non-void
+ pointers is disallowed
+
+Downloaded from upstream commit:
+https://github.com/xbmc/xbmc/commit/651c82853fe69dc5aa3e6a50f2eb2f752caafba0
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/windowing/X11/WinSystemX11.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/xbmc/windowing/X11/WinSystemX11.cpp b/xbmc/windowing/X11/WinSystemX11.cpp
+index 8a18288fd8..033c0f77bf 100644
+--- a/xbmc/windowing/X11/WinSystemX11.cpp
++++ b/xbmc/windowing/X11/WinSystemX11.cpp
+@@ -1038,7 +1038,10 @@ bool CWinSystemX11::HasWindowManager()
+ 
+   if(status == Success && items_read)
+   {
+-    CLog::Log(LOGDEBUG,"Window Manager Name: %s", data);
++    const char* s;
++
++    s = reinterpret_cast<const char*>(data);
++    CLog::Log(LOGDEBUG, "Window Manager Name: {}", s);
+   }
+   else
+     CLog::Log(LOGDEBUG,"Window Manager Name: ");
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
