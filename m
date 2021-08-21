Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28286C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 09:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BA4611EF
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 09:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0BA4611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5EEC605DE;
	Sat, 21 Aug 2021 09:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVGVlP8TfchQ; Sat, 21 Aug 2021 09:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7C9605E2;
	Sat, 21 Aug 2021 09:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F58F1BF82F
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 09:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C960605E2
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 09:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHbfdcaWupuk for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 09:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C8F605DE
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 09:40:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso10588689wmg.4
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJJ3hI91eGfPjqEOijVYlp0Y+ZDBOiieHowPn7ncs/A=;
 b=fkPPVj0MbCdp9dOs7vDJ7UlMb6uR5odNgriS9qUpmgYrBw4ALueY9qQ37J421V7zbr
 zb2Bz1X3Fw+ud6FL/oUQa34S07kY7ayxEda5hlNUC2kWiFFqozr0vIz/WZZ8WWgkG5qX
 j0t7OPc6oHKMK3hENjipeeycM3S8oNTJPau9IuetJ6lPyohdxlf7nqCbWZJcBuaAFY92
 16Q1xiuIK9yrTM2HjTQSl3p3pcsLgHh4THO5GRcwZnQhJQMStsCmDxPJfbVmoMRFm4p7
 sRhZkN6fag9HKkrEte+uY76WV+cu/bU82Jt1zENv5Ay7bZ0Tg0gcMFs2xbMUBAN4NgBP
 YIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJJ3hI91eGfPjqEOijVYlp0Y+ZDBOiieHowPn7ncs/A=;
 b=Xk8qQeaOrymyqQR5xVfhT06nNiLD+6YdLYfazwqguxMg94SpkLwjM20cgMRIil2mjl
 XO9BKqQWEI+6f3LcmQksWHwD+DExOQq/920+NzsmI7jztp8p13VBX0bwCn8WgMp55cML
 D2LiCA+mPBZCfzEZ+7YMpABQhTGL3aojS6ntAUL+STiaNB0qwwYqpG1d7q2CbO64YMSP
 54IYsDbu9iFUiyvfMtof4co5S9BsRHWrm9JF4NtytVkQrh2GUwlCOvT32dwPncHr7g2t
 FbB7/Z6EdBA6YSDE+0ZILSyH+Zy+NI/A9w0uDv9S4bvQFpptsgaNbwFaGNqfRniOKhIh
 bztg==
X-Gm-Message-State: AOAM530wSwe1nanvA1xUpzg+bTcw1uMRMkR4WTJtO5LM2jgfR5weKavw
 0gjw8lEUz2hVyqh90c9bQgPSPyz5oeZx4w==
X-Google-Smtp-Source: ABdhPJw+VNRaQG4Ffet+JNrpUt2sldUo6NWmAD2ZpZQ7qs3UpthJ+fr22gfIxDzDxvNPwFOWs8JlPA==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr7577345wmj.88.1629538800610; 
 Sat, 21 Aug 2021 02:40:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id l18sm14761902wmc.30.2021.08.21.02.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 02:40:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 11:39:08 +0200
Message-Id: <20210821093908.677218-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
References: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/sdl2: fix build with kmsdrm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build with kmsdrm is broken since bump to version 2.0.14 in commit
5e0da5c40da82d90c3f6ca037170838a6689b65b. Indeed, first patch was
already applied in this version:
https://github.com/libsdl-org/SDL/commit/9354aea19834ada7ffb90d379600a242a7aa820f
but upstream made other changes that requires EGL so add an upstream
patch to fix the build failure

Moreover, run autogen.sh instead of autoreconf as it breaks the build
and is not recommended by upstream:
https://github.com/libsdl-org/SDL/pull/4214

Fixes:
 - http://autobuild.buildroot.org/results/355c7e5092e7641d8b04ecb550e2671d70720bd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-building-with-KMSDRM-support-if-EGL.patch | 433 ++++++++++++++++++
 ...o-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch |  39 --
 package/sdl2/sdl2.mk                          |   6 +
 3 files changed, 439 insertions(+), 39 deletions(-)
 create mode 100644 package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
 delete mode 100644 package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch

diff --git a/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch b/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
new file mode 100644
index 0000000000..b58c989f13
--- /dev/null
+++ b/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
@@ -0,0 +1,433 @@
+From 2fc987c28f14668a9ce360331f591e32e20c3906 Mon Sep 17 00:00:00 2001
+From: Manuel Alfayate Corchete <redwindwanderer@gmail.com>
+Date: Tue, 22 Dec 2020 14:15:33 +0100
+Subject: [PATCH] [Buildsystem] Add guards for not building with KMSDRM support
+ if EGL is not available.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/libsdl-org/SDL/commit/2fc987c28f14668a9ce360331f591e32e20c3906]
+---
+ configure.ac                                  | 29 ++++++++++++++++++-
+ src/video/kmsdrm/SDL_kmsdrmopengles.c         |  4 +--
+ src/video/kmsdrm/SDL_kmsdrmopengles.h         |  4 +--
+ src/video/kmsdrm/SDL_kmsdrmvideo.c            | 22 +++++---------
+ src/video/kmsdrm/SDL_kmsdrmvideo.h            |  8 -----
+ .../SDL_kmsdrm_legacy_opengles.c              |  4 +--
+ .../SDL_kmsdrm_legacy_opengles.h              |  4 +--
+ .../kmsdrm_legacy/SDL_kmsdrm_legacy_video.c   | 20 ++-----------
+ .../kmsdrm_legacy/SDL_kmsdrm_legacy_video.h   |  6 ++--
+ 9 files changed, 47 insertions(+), 54 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b7e519b8f..acff858ba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2236,7 +2236,10 @@ CheckKMSDRM()
+ AS_HELP_STRING([--enable-video-kmsdrm], [use KMSDRM video driver [[default=no]]]),
+                   , enable_video_kmsdrm=no)
+ 
+-    if test x$enable_video = xyes -a x$enable_video_kmsdrm = xyes; then
++    if  test x$enable_video = xyes && \
++        test x$enable_video_kmsdrm = xyes && \
++        test x$video_opengl_egl = xyes; then
++
+         video_kmsdrm=no
+ 
+         PKG_CHECK_MODULES([LIBDRM], [libdrm >= 1.4.82], libdrm_avail=yes, libdrm_avail=no)
+@@ -2418,6 +2421,28 @@ CheckOpenGLESX11()
+     fi
+ }
+ 
++dnl Find EGL
++CheckEGLKMSDRM()
++{
++    AC_MSG_CHECKING(for EGL support)
++    video_opengl_egl=no
++    AC_TRY_COMPILE([
++      #define LINUX
++      #define EGL_API_FB
++      #define MESA_EGL_NO_X11_HEADERS
++      #define EGL_NO_X11
++      #include <EGL/egl.h>
++      #include <EGL/eglext.h>
++    ],[
++    ],[
++    video_opengl_egl=yes
++    ])
++    AC_MSG_RESULT($video_opengl_egl)
++    if test x$video_opengl_egl = xyes; then
++	AC_DEFINE(SDL_VIDEO_OPENGL_EGL, 1, [ ])
++    fi
++}
++
+ dnl Check for Windows OpenGL
+ CheckWINDOWSGL()
+ {
+@@ -3555,6 +3580,8 @@ case "$host" in
+         CheckRPI
+         CheckX11
+         CheckDirectFB
++        # Need to check for EGL first because KMSDRM depends on it.
++        CheckEGLKMSDRM
+         CheckKMSDRM
+         CheckOpenGLX11
+         CheckOpenGLESX11
+diff --git a/src/video/kmsdrm/SDL_kmsdrmopengles.c b/src/video/kmsdrm/SDL_kmsdrmopengles.c
+index c9ec554b4..664621d2b 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmopengles.c
++++ b/src/video/kmsdrm/SDL_kmsdrmopengles.c
+@@ -22,7 +22,7 @@
+ 
+ #include "../../SDL_internal.h"
+ 
+-#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
++#if SDL_VIDEO_DRIVER_KMSDRM
+ 
+ #include "SDL_kmsdrmvideo.h"
+ #include "SDL_kmsdrmopengles.h"
+@@ -376,6 +376,6 @@ KMSDRM_GLES_SwapWindow(_THIS, SDL_Window * window)
+ 
+ SDL_EGL_MakeCurrent_impl(KMSDRM)
+ 
+-#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
++#endif /* SDL_VIDEO_DRIVER_KMSDRM */
+ 
+ /* vi: set ts=4 sw=4 expandtab: */
+diff --git a/src/video/kmsdrm/SDL_kmsdrmopengles.h b/src/video/kmsdrm/SDL_kmsdrmopengles.h
+index f81b0c3dc..c8db7da86 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmopengles.h
++++ b/src/video/kmsdrm/SDL_kmsdrmopengles.h
+@@ -24,7 +24,7 @@
+ #ifndef SDL_kmsdrmopengles_h_
+ #define SDL_kmsdrmopengles_h_
+ 
+-#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
++#if SDL_VIDEO_DRIVER_KMSDRM
+ 
+ #include "../SDL_sysvideo.h"
+ #include "../SDL_egl_c.h"
+@@ -42,7 +42,7 @@ extern SDL_GLContext KMSDRM_GLES_CreateContext(_THIS, SDL_Window * window);
+ extern int KMSDRM_GLES_SwapWindow(_THIS, SDL_Window * window);
+ extern int KMSDRM_GLES_MakeCurrent(_THIS, SDL_Window * window, SDL_GLContext context);
+ 
+-#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
++#endif /* SDL_VIDEO_DRIVER_KMSDRM */
+ 
+ #endif /* SDL_kmsdrmopengles_h_ */
+ 
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+index e84bd5ebc..663bc2170 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+@@ -846,7 +846,6 @@ KMSDRM_CreateDevice(int devindex)
+     device->SetWindowGrab = KMSDRM_SetWindowGrab;
+     device->DestroyWindow = KMSDRM_DestroyWindow;
+     device->GetWindowWMInfo = KMSDRM_GetWindowWMInfo;
+-#if SDL_VIDEO_OPENGL_EGL
+     device->GL_DefaultProfileConfig = KMSDRM_GLES_DefaultProfileConfig;
+     device->GL_LoadLibrary = KMSDRM_GLES_LoadLibrary;
+     device->GL_GetProcAddress = KMSDRM_GLES_GetProcAddress;
+@@ -857,9 +856,7 @@ KMSDRM_CreateDevice(int devindex)
+     device->GL_GetSwapInterval = KMSDRM_GLES_GetSwapInterval;
+     device->GL_SwapWindow = KMSDRM_GLES_SwapWindow;
+     device->GL_DeleteContext = KMSDRM_GLES_DeleteContext;
+-#endif
+-    device->PumpEvents = KMSDRM_PumpEvents;
+-    device->free = KMSDRM_DeleteDevice;
++
+ #if SDL_VIDEO_VULKAN
+     device->Vulkan_LoadLibrary = KMSDRM_Vulkan_LoadLibrary;
+     device->Vulkan_UnloadLibrary = KMSDRM_Vulkan_UnloadLibrary;
+@@ -867,6 +864,10 @@ KMSDRM_CreateDevice(int devindex)
+     device->Vulkan_CreateSurface = KMSDRM_Vulkan_CreateSurface;
+     device->Vulkan_GetDrawableSize = KMSDRM_Vulkan_GetDrawableSize;
+ #endif
++
++    device->PumpEvents = KMSDRM_PumpEvents;
++    device->free = KMSDRM_DeleteDevice;
++
+     return device;
+ 
+ cleanup:
+@@ -1327,9 +1328,7 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
+     SDL_DisplayData *dispdata = (SDL_DisplayData *)SDL_GetDisplayDriverData(0);
+     KMSDRM_PlaneInfo plane_info = {0};
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     EGLContext egl_context;
+-#endif
+ 
+     /********************************************************************/
+     /* BLOCK 1: protect the PRIMARY PLANE before destroying the buffers */
+@@ -1380,7 +1379,6 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
+     /* will get wrong info and we will be in trouble.                          */
+     /***************************************************************************/
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
+     SDL_EGL_MakeCurrent(_this, EGL_NO_SURFACE, egl_context);
+ 
+@@ -1388,7 +1386,6 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
+         SDL_EGL_DestroySurface(_this, windata->egl_surface);
+         windata->egl_surface = EGL_NO_SURFACE;
+     }
+-#endif
+ 
+     if (windata->gs) {
+         KMSDRM_gbm_surface_destroy(windata->gs);
+@@ -1431,7 +1428,6 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
+         return SDL_SetError("Could not create GBM surface");
+     }
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     /* We can't get the EGL context yet because SDL_CreateRenderer has not been called,
+        but we need an EGL surface NOW, or GL won't be able to render into any surface
+        and we won't see the first frame. */
+@@ -1448,8 +1444,6 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
+     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
+     ret = SDL_EGL_MakeCurrent(_this, windata->egl_surface, egl_context);
+ 
+-#endif
+-
+ cleanup:
+ 
+     if (ret) {
+@@ -1478,11 +1472,11 @@ KMSDRM_DestroyWindow(_THIS, SDL_Window *window)
+ 
+     if (!is_vulkan) {
+         KMSDRM_DestroySurfaces(_this, window);
+-#if SDL_VIDEO_OPENGL_EGL
++
+         if (_this->egl_data) {
+             SDL_EGL_UnloadLibrary(_this);
+         }
+-#endif
++
+         if (dispdata->gbm_init) {
+             KMSDRM_DeinitMouse(_this);
+             KMSDRM_GBMDeinit(_this, dispdata);
+@@ -1754,7 +1748,6 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * window)
+                  goto cleanup;
+          }
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+          /* Manually load the EGL library. KMSDRM_EGL_LoadLibrary() has already
+             been called by SDL_CreateWindow() but we don't do anything there,
+             precisely to be able to load it here.
+@@ -1766,7 +1759,6 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * window)
+                  goto cleanup;
+              }
+          }
+-#endif
+ 
+          /* Can't init mouse stuff sooner because cursor plane is not ready. */
+          KMSDRM_InitMouse(_this);
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.h b/src/video/kmsdrm/SDL_kmsdrmvideo.h
+index 2cf34522b..e58c922a8 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.h
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.h
+@@ -34,10 +34,8 @@
+ 
+ #include <gbm.h>
+ #include <assert.h>
+-#if SDL_VIDEO_OPENGL_EGL
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
+-#endif
+ 
+ /****************************************************************************************/
+ /* Driverdata pointers are void struct* used to store backend-specific variables        */
+@@ -101,10 +99,6 @@ typedef struct SDL_DisplayData
+     EGLSyncKHR kms_fence;
+     EGLSyncKHR gpu_fence;
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+-    EGLSurface old_egl_surface;
+-#endif
+-
+     SDL_bool modeset_pending;
+     SDL_bool gbm_init;
+ 
+@@ -129,9 +123,7 @@ typedef struct SDL_WindowData
+     struct gbm_bo *bo;
+     struct gbm_bo *next_bo;
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     EGLSurface egl_surface;
+-#endif
+ 
+     /* For scaling and AR correction. */
+     int32_t src_w;
+diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
+index 890801891..a886eb326 100644
+--- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
++++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
+@@ -21,7 +21,7 @@
+ 
+ #include "../../SDL_internal.h"
+ 
+-#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
++#if SDL_VIDEO_DRIVER_KMSDRM
+ 
+ #include "SDL_log.h"
+ 
+@@ -147,6 +147,6 @@ KMSDRM_LEGACY_GLES_SwapWindow(_THIS, SDL_Window * window) {
+ 
+ SDL_EGL_MakeCurrent_impl(KMSDRM_LEGACY)
+ 
+-#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
++#endif /* SDL_VIDEO_DRIVER_KMSDRM */
+ 
+ /* vi: set ts=4 sw=4 expandtab: */
+diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
+index 5e5ba96dc..2926cbe58 100644
+--- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
++++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
+@@ -23,7 +23,7 @@
+ #ifndef SDL_kmsdrmopengles_h_
+ #define SDL_kmsdrmopengles_h_
+ 
+-#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
++#if SDL_VIDEO_DRIVER_KMSDRM
+ 
+ #include "../SDL_sysvideo.h"
+ #include "../SDL_egl_c.h"
+@@ -41,7 +41,7 @@ extern SDL_GLContext KMSDRM_LEGACY_GLES_CreateContext(_THIS, SDL_Window * window
+ extern int KMSDRM_LEGACY_GLES_SwapWindow(_THIS, SDL_Window * window);
+ extern int KMSDRM_LEGACY_GLES_MakeCurrent(_THIS, SDL_Window * window, SDL_GLContext context);
+ 
+-#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
++#endif /* SDL_VIDEO_DRIVER_KMSDRM */
+ 
+ #endif /* SDL_kmsdrmopengles_h_ */
+ 
+diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
+index 36b1899bd..acddfc29a 100644
+--- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
++++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
+@@ -213,7 +213,7 @@ KMSDRM_LEGACY_CreateDevice(int devindex)
+     device->SetWindowGrab = KMSDRM_LEGACY_SetWindowGrab;
+     device->DestroyWindow = KMSDRM_LEGACY_DestroyWindow;
+     device->GetWindowWMInfo = KMSDRM_LEGACY_GetWindowWMInfo;
+-#if SDL_VIDEO_OPENGL_EGL
++
+     device->GL_LoadLibrary = KMSDRM_LEGACY_GLES_LoadLibrary;
+     device->GL_GetProcAddress = KMSDRM_LEGACY_GLES_GetProcAddress;
+     device->GL_UnloadLibrary = KMSDRM_LEGACY_GLES_UnloadLibrary;
+@@ -223,7 +223,7 @@ KMSDRM_LEGACY_CreateDevice(int devindex)
+     device->GL_GetSwapInterval = KMSDRM_LEGACY_GLES_GetSwapInterval;
+     device->GL_SwapWindow = KMSDRM_LEGACY_GLES_SwapWindow;
+     device->GL_DeleteContext = KMSDRM_LEGACY_GLES_DeleteContext;
+-#endif
++
+     device->PumpEvents = KMSDRM_LEGACY_PumpEvents;
+     device->free = KMSDRM_LEGACY_DeleteDevice;
+ 
+@@ -369,14 +369,12 @@ KMSDRM_LEGACY_DestroySurfaces(_THIS, SDL_Window * window)
+         windata->next_bo = NULL;
+     }
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     SDL_EGL_MakeCurrent(_this, EGL_NO_SURFACE, EGL_NO_CONTEXT);
+ 
+     if (windata->egl_surface != EGL_NO_SURFACE) {
+         SDL_EGL_DestroySurface(_this, windata->egl_surface);
+         windata->egl_surface = EGL_NO_SURFACE;
+     }
+-#endif
+ 
+     if (windata->gs) {
+         KMSDRM_LEGACY_gbm_surface_destroy(windata->gs);
+@@ -394,18 +392,14 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
+     Uint32 height = dispdata->mode.vdisplay;
+     Uint32 surface_fmt = GBM_FORMAT_XRGB8888;
+     Uint32 surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
+-#if SDL_VIDEO_OPENGL_EGL
+     EGLContext egl_context;
+-#endif
+ 
+     if (!KMSDRM_LEGACY_gbm_device_is_format_supported(viddata->gbm, surface_fmt, surface_flags)) {
+         SDL_LogWarn(SDL_LOG_CATEGORY_VIDEO, "GBM surface format not supported. Trying anyway.");
+     }
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     SDL_EGL_SetRequiredVisualId(_this, surface_fmt);
+     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
+-#endif
+ 
+     KMSDRM_LEGACY_DestroySurfaces(_this, window);
+ 
+@@ -415,7 +409,6 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
+         return SDL_SetError("Could not create GBM surface");
+     }
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     windata->egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType)windata->gs);
+ 
+     if (windata->egl_surface == EGL_NO_SURFACE) {
+@@ -425,7 +418,6 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
+     SDL_EGL_MakeCurrent(_this, windata->egl_surface, egl_context);
+ 
+     windata->egl_surface_dirty = 0;
+-#endif
+ 
+     return 0;
+ }
+@@ -734,15 +726,9 @@ KMSDRM_LEGACY_SetDisplayMode(_THIS, SDL_VideoDisplay * display, SDL_DisplayMode
+         SDL_Window *window = viddata->windows[i];
+         SDL_WindowData *windata = (SDL_WindowData *)window->driverdata;
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+         /* Can't recreate EGL surfaces right now, need to wait until SwapWindow
+            so the correct thread-local surface and context state are available */
+         windata->egl_surface_dirty = 1;
+-#else
+-        if (KMSDRM_LEGACY_CreateSurfaces(_this, window)) {
+-            return -1;
+-        }
+-#endif
+ 
+         /* Tell app about the resize */
+         SDL_SendWindowEvent(window, SDL_WINDOWEVENT_RESIZED, mode->w, mode->h);
+@@ -758,13 +744,11 @@ KMSDRM_LEGACY_CreateWindow(_THIS, SDL_Window * window)
+     SDL_WindowData *windata;
+     SDL_VideoDisplay *display;
+ 
+-#if SDL_VIDEO_OPENGL_EGL
+     if (!_this->egl_data) {
+         if (SDL_GL_LoadLibrary(NULL) < 0) {
+             goto error;
+         }
+     }
+-#endif
+ 
+     /* Allocate window internal data */
+     windata = (SDL_WindowData *)SDL_calloc(1, sizeof(SDL_WindowData));
+diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
+index 28e1bc4fe..9df2bcfa3 100644
+--- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
++++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
+@@ -31,9 +31,7 @@
+ #include <xf86drm.h>
+ #include <xf86drmMode.h>
+ #include <gbm.h>
+-#if SDL_VIDEO_OPENGL_EGL
+ #include <EGL/egl.h>
+-#endif
+ 
+ typedef struct SDL_VideoData
+ {
+@@ -71,10 +69,10 @@ typedef struct SDL_WindowData
+     struct gbm_bo *crtc_bo;
+     SDL_bool waiting_for_flip;
+     SDL_bool double_buffer;
+-#if SDL_VIDEO_OPENGL_EGL
++
+     int egl_surface_dirty;
+     EGLSurface egl_surface;
+-#endif
++
+ } SDL_WindowData;
+ 
+ typedef struct KMSDRM_LEGACY_FBInfo
diff --git a/package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch b/package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
deleted file mode 100644
index 47a13300eb..0000000000
--- a/package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d265b1ee94aa4faf5fa405f14cc731a25d7a00ab Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Mar 2020 14:11:14 +0100
-Subject: [PATCH] src/video/kmsdrm/SDL_kmsdrmvideo.c: fix build
-
-Build is broken without EGL since version 2.0.12 and
-https://hg.libsdl.org/SDL/rev/9761858bd6a3:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/build/sdl2-2.0.12/src/video/kmsdrm/SDL_kmsdrmvideo.c: In function 'KMSDRM_CreateSurfaces':
-/home/giuliobenetti/autobuild/run/instance-1/output-1/build/sdl2-2.0.12/src/video/kmsdrm/SDL_kmsdrmvideo.c:394:5: error: unknown type name 'EGLContext'
-     EGLContext egl_context;
-     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/fafd20a01591032662f9ca025fcea3478239cf3c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-[Upstream: https://hg.libsdl.org/SDL/rev/389ce8cfa2a3]
-
-
-Fixes: 
- - Update patch to version 2.0.14
-
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-
-diff -purN a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c	2021-01-08 09:56:44.028217792 +0100
-+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c	2021-01-08 09:55:52.295932111 +0100
-@@ -1407,7 +1407,9 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window
-     uint32_t surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
-     uint32_t width, height;
- 
-+#if SDL_VIDEO_OPENGL_EGL
-     EGLContext egl_context;
-+#endif
- 
-     int ret = 0;
- 
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index ff6b29f29c..8c6a4c2f64 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -22,6 +22,12 @@ SDL2_CONF_OPTS += \
 	--disable-pulseaudio \
 	--disable-video-wayland
 
+# We're patching configure.ac but autoreconf breaks the build
+define SDL2_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+SDL2_PRE_CONFIGURE_HOOKS += SDL2_RUN_AUTOGEN
+
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
 # Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
