Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC42C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 22:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DFC040573;
	Fri, 27 Jan 2023 22:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFC040573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKMCJSgwLkVl; Fri, 27 Jan 2023 22:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57737404AF;
	Fri, 27 Jan 2023 22:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57737404AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B64131BF5DE
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 22:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CF6D81CE1
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 22:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF6D81CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjDsLFy2yrpr for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 22:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6646581A34
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6646581A34
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 22:39:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4530471wms.2
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qd58JoDHZ0qTWG/n9VOmQdXWoEX99yd+Nz+Jmuak51o=;
 b=6g9rCvXtFajjcl9+suR9TxZk6edMuWHuaEeGUg4eGv6vU8wZD+DLvKnOYf0AUgSNLj
 VhxUq6dpT1ndpu2ho9j70LJxeySr+MBZL+UX4Ip8hKPdP1uQgzRxyrwTsZILksXWY+yG
 I3uQkXF3TEcEAoUp2Z9m0FNb9WQ2rWCcqEUVuRrjWehfrOxcHu5Arh/uLqHrnWWPngmY
 RWWdsk8MejrXS9KHqe/o82bsWTuqxFMUf4k+HmWt7LZLuD7Oed0+zpwDridn2pDysBsr
 ld2jw5o/xEEYGwTmo/NVzBNXyVXgrQDOga18o26eXEawZ4pLfykz4t3ads2rxf6QjgZ6
 7uNw==
X-Gm-Message-State: AO0yUKUGtc7gNWP69ecQvvGEkiyggIfZ94djgph2MBipZAHOfxq+IA82
 UwosvA+I9HfZNY1Sqbsg50OD+BhKr98=
X-Google-Smtp-Source: AK7set8KmndBHHb3ztbZW3GAoGHxrx2ztQUcpu+xq93dJpuiMWuzO+QsHPbfuZUoZfkpRrgCfhUgTQ==
X-Received: by 2002:a05:600c:54e6:b0:3dc:489e:1867 with SMTP id
 jb6-20020a05600c54e600b003dc489e1867mr61357wmb.36.1674859140013; 
 Fri, 27 Jan 2023 14:39:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o40-20020a05600c512800b003dc0b0e1e47sm10316217wms.48.2023.01.27.14.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 14:38:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 23:38:55 +0100
Message-Id: <20230127223855.72359-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qd58JoDHZ0qTWG/n9VOmQdXWoEX99yd+Nz+Jmuak51o=;
 b=nkTsXAZ63ntrN9Q4JMYKKa67DF59VpJHwlmaX7t+vxJm2lWlzk6dQUT6keh0DdWE7r
 YW+VsGMoQIpx2NQiYbzEUk9SiUYggizQ3ow11GTgh9IdZO9ZtN5i5R2rKBaKo9LbAeQB
 Gny9bLYQQqQLURLVgciXnO96hlHpK+9lSAxkOqQcUJqNhVr2b4QX4tdcbZs2fox12A8v
 ht1V4asr/hNANlujIite/IqTH0AT1YtUqQMLFTPSq71ByAFmKzyUBqdWOtKDnwqRjmIW
 ZrfHpuGq+X8ZkhxAILy/V/VQ4XY2ymnRFQWsrosoTI/E6Ij7KwpJzLRsVWfSNS0Ey0m3
 ehHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nkTsXAZ6
Subject: [Buildroot] [PATCH 1/1] package/sdl2: security bump to version
 2.26.2
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
Cc: Michael Fischer <mf@go-sys.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Fix CVE-2022-4743: A potential memory leak issue was discovered in
  SDL2 in GLES_CreateTexture() function in SDL_render_gles.c. The
  vulnerability allows an attacker to cause a denial of service attack.

https://github.com/libsdl-org/SDL/releases/tag/release-2.26.0
https://github.com/libsdl-org/SDL/releases/tag/release-2.26.1
https://github.com/libsdl-org/SDL/releases/tag/release-2.26.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-have-a-mode-configured-use-the-pre.patch | 76 -------------------
 package/sdl2/sdl2.hash                        |  4 +-
 package/sdl2/sdl2.mk                          |  2 +-
 3 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch

diff --git a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch b/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
deleted file mode 100644
index c8be280c56..0000000000
--- a/package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29 Mon Sep 17 00:00:00 2001
-From: Sam Lantinga <slouken@libsdl.org>
-Date: Fri, 18 Nov 2022 12:17:27 -0800
-Subject: [PATCH] If a CRTC doesn't have a mode configured, use the preferred
- or largest mode as the default mode
-
-Fixes https://github.com/libsdl-org/SDL/issues/6421
-
-[mf@go-sys.de: backport from upstream]
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-[yann.morin.1998@free.fr: do an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/video/kmsdrm/SDL_kmsdrmvideo.c | 35 +++++++++++++++++++++++++-----
- 1 file changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-index eae721455..eeeefef2b 100644
---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
-+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-@@ -666,8 +666,8 @@ KMSDRM_CrtcGetVrr(uint32_t drm_fd, uint32_t crtc_id)
- /* Gets a DRM connector, builds an SDL_Display with it, and adds it to the
-    list of SDL Displays in _this->displays[]  */
- static void
--KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
--
-+KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources)
-+{
-     SDL_VideoData *viddata = ((SDL_VideoData *)_this->driverdata);
-     SDL_DisplayData *dispdata = NULL;
-     SDL_VideoDisplay display = {0};
-@@ -770,14 +770,37 @@ KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
-         drmModeModeInfo *mode = &connector->modes[i];
- 
-         if (!SDL_memcmp(mode, &crtc->mode, sizeof(crtc->mode))) {
--          mode_index = i;
--          break;
-+            mode_index = i;
-+            break;
-         }
-     }
- 
-     if (mode_index == -1) {
--      ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
--      goto cleanup;
-+        int current_area, largest_area = 0;
-+
-+        /* Find the preferred mode or the highest resolution mode */
-+        for (i = 0; i < connector->count_modes; i++) {
-+            drmModeModeInfo *mode = &connector->modes[i];
-+
-+            if (mode->type & DRM_MODE_TYPE_PREFERRED) {
-+                mode_index = i;
-+                break;
-+            }
-+
-+            current_area = mode->hdisplay * mode->vdisplay;
-+            if (current_area > largest_area) {
-+                mode_index = i;
-+                largest_area = current_area;
-+            }
-+        }
-+        if (mode_index != -1) {
-+            crtc->mode = connector->modes[mode_index];
-+        }
-+    }
-+
-+    if (mode_index == -1) {
-+        ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
-+        goto cleanup;
-     }
- 
-     /*********************************************/
--- 
-2.25.1
-
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 923a900dc0..86e0d86e7c 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.24.2.tar.gz.sig
-sha256  b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f  SDL2-2.24.2.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.2.tar.gz.sig
+sha256  95d39bc3de037fbdfa722623737340648de4f180a601b0afad27645d150b99e0  SDL2-2.26.2.tar.gz
 # Locally calculated
 sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a1dc8b5b73..8995178e71 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.24.2
+SDL2_VERSION = 2.26.2
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
