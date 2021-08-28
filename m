Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CD6C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:26:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DB160725
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5DB160725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F6B83E55;
	Sat, 28 Aug 2021 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAMhRxyr1Isb; Sat, 28 Aug 2021 13:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B10782FC9;
	Sat, 28 Aug 2021 13:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 741D11BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61EED400CB
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtPckrzth09h for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:26:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CB0E40015
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:26:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 503707802E5;
 Sat, 28 Aug 2021 15:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630157160;
 bh=sc6nenqXVenJPK+ui2cAQrRZwlvYmta3FrPWLE3Hq1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5cEhMCAG5Pgyj7QJVUEIvm38l1Ty2Oayp070o7Yh6rLAKo0TLxeMpCesseBCTjlB
 FhEFlG0Dm2GtQyIsXYKBk7IDNB0XmMTKRfGWllod4Tzv3WEsTvBsmL2sQmBSTeABLF
 rAxYcdjdU+ZJsS6wiBNOw5FXujJvtOSZ1tEWg37qyKJqZ3sYX2z6ZD4TL07HmoyKBd
 J293RiM9Ub2WfLfi5SrQ4ZaihgmsDpbMHIA6e5M7yrkM8iKDn030/V3WQ6RQ3UgAur
 Nm/Vj0jTgEv5EA+c0ukn34RHNmU9DFJ6ir7xjPAqwLvZzaW+rzhtlLOTjA95tPxKhG
 mdTbq88u9Ahfw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 15:25:54 +0200
Date: Sat, 28 Aug 2021 15:25:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210828132554.GK2661@scaer>
References: <20210828110513.782701-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828110513.782701-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next 1/1] package/sdl2: drop patch
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-28 13:05 +0200, Fabrice Fontaine spake thusly:
> Drop patch (and so SDL2_RUN_AUTOGEN) as patch is already in version
> 2.0.16 which was applied to next by commit
> c80fbf269c020c53a6140ffbf328d64674a8ada0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4f9026e94373fb31ef7e45f8b4fd55adc178013a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-building-with-KMSDRM-support-if-EGL.patch | 433 ------------------
>  package/sdl2/sdl2.mk                          |   8 -
>  2 files changed, 441 deletions(-)
>  delete mode 100644 package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
> 
> diff --git a/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch b/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
> deleted file mode 100644
> index b58c989f13..0000000000
> --- a/package/sdl2/0001-Buildsystem-Add-guards-for-not-building-with-KMSDRM-support-if-EGL.patch
> +++ /dev/null
> @@ -1,433 +0,0 @@
> -From 2fc987c28f14668a9ce360331f591e32e20c3906 Mon Sep 17 00:00:00 2001
> -From: Manuel Alfayate Corchete <redwindwanderer@gmail.com>
> -Date: Tue, 22 Dec 2020 14:15:33 +0100
> -Subject: [PATCH] [Buildsystem] Add guards for not building with KMSDRM support
> - if EGL is not available.
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/libsdl-org/SDL/commit/2fc987c28f14668a9ce360331f591e32e20c3906]
> ----
> - configure.ac                                  | 29 ++++++++++++++++++-
> - src/video/kmsdrm/SDL_kmsdrmopengles.c         |  4 +--
> - src/video/kmsdrm/SDL_kmsdrmopengles.h         |  4 +--
> - src/video/kmsdrm/SDL_kmsdrmvideo.c            | 22 +++++---------
> - src/video/kmsdrm/SDL_kmsdrmvideo.h            |  8 -----
> - .../SDL_kmsdrm_legacy_opengles.c              |  4 +--
> - .../SDL_kmsdrm_legacy_opengles.h              |  4 +--
> - .../kmsdrm_legacy/SDL_kmsdrm_legacy_video.c   | 20 ++-----------
> - .../kmsdrm_legacy/SDL_kmsdrm_legacy_video.h   |  6 ++--
> - 9 files changed, 47 insertions(+), 54 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b7e519b8f..acff858ba 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2236,7 +2236,10 @@ CheckKMSDRM()
> - AS_HELP_STRING([--enable-video-kmsdrm], [use KMSDRM video driver [[default=no]]]),
> -                   , enable_video_kmsdrm=no)
> - 
> --    if test x$enable_video = xyes -a x$enable_video_kmsdrm = xyes; then
> -+    if  test x$enable_video = xyes && \
> -+        test x$enable_video_kmsdrm = xyes && \
> -+        test x$video_opengl_egl = xyes; then
> -+
> -         video_kmsdrm=no
> - 
> -         PKG_CHECK_MODULES([LIBDRM], [libdrm >= 1.4.82], libdrm_avail=yes, libdrm_avail=no)
> -@@ -2418,6 +2421,28 @@ CheckOpenGLESX11()
> -     fi
> - }
> - 
> -+dnl Find EGL
> -+CheckEGLKMSDRM()
> -+{
> -+    AC_MSG_CHECKING(for EGL support)
> -+    video_opengl_egl=no
> -+    AC_TRY_COMPILE([
> -+      #define LINUX
> -+      #define EGL_API_FB
> -+      #define MESA_EGL_NO_X11_HEADERS
> -+      #define EGL_NO_X11
> -+      #include <EGL/egl.h>
> -+      #include <EGL/eglext.h>
> -+    ],[
> -+    ],[
> -+    video_opengl_egl=yes
> -+    ])
> -+    AC_MSG_RESULT($video_opengl_egl)
> -+    if test x$video_opengl_egl = xyes; then
> -+	AC_DEFINE(SDL_VIDEO_OPENGL_EGL, 1, [ ])
> -+    fi
> -+}
> -+
> - dnl Check for Windows OpenGL
> - CheckWINDOWSGL()
> - {
> -@@ -3555,6 +3580,8 @@ case "$host" in
> -         CheckRPI
> -         CheckX11
> -         CheckDirectFB
> -+        # Need to check for EGL first because KMSDRM depends on it.
> -+        CheckEGLKMSDRM
> -         CheckKMSDRM
> -         CheckOpenGLX11
> -         CheckOpenGLESX11
> -diff --git a/src/video/kmsdrm/SDL_kmsdrmopengles.c b/src/video/kmsdrm/SDL_kmsdrmopengles.c
> -index c9ec554b4..664621d2b 100644
> ---- a/src/video/kmsdrm/SDL_kmsdrmopengles.c
> -+++ b/src/video/kmsdrm/SDL_kmsdrmopengles.c
> -@@ -22,7 +22,7 @@
> - 
> - #include "../../SDL_internal.h"
> - 
> --#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
> -+#if SDL_VIDEO_DRIVER_KMSDRM
> - 
> - #include "SDL_kmsdrmvideo.h"
> - #include "SDL_kmsdrmopengles.h"
> -@@ -376,6 +376,6 @@ KMSDRM_GLES_SwapWindow(_THIS, SDL_Window * window)
> - 
> - SDL_EGL_MakeCurrent_impl(KMSDRM)
> - 
> --#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
> -+#endif /* SDL_VIDEO_DRIVER_KMSDRM */
> - 
> - /* vi: set ts=4 sw=4 expandtab: */
> -diff --git a/src/video/kmsdrm/SDL_kmsdrmopengles.h b/src/video/kmsdrm/SDL_kmsdrmopengles.h
> -index f81b0c3dc..c8db7da86 100644
> ---- a/src/video/kmsdrm/SDL_kmsdrmopengles.h
> -+++ b/src/video/kmsdrm/SDL_kmsdrmopengles.h
> -@@ -24,7 +24,7 @@
> - #ifndef SDL_kmsdrmopengles_h_
> - #define SDL_kmsdrmopengles_h_
> - 
> --#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
> -+#if SDL_VIDEO_DRIVER_KMSDRM
> - 
> - #include "../SDL_sysvideo.h"
> - #include "../SDL_egl_c.h"
> -@@ -42,7 +42,7 @@ extern SDL_GLContext KMSDRM_GLES_CreateContext(_THIS, SDL_Window * window);
> - extern int KMSDRM_GLES_SwapWindow(_THIS, SDL_Window * window);
> - extern int KMSDRM_GLES_MakeCurrent(_THIS, SDL_Window * window, SDL_GLContext context);
> - 
> --#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
> -+#endif /* SDL_VIDEO_DRIVER_KMSDRM */
> - 
> - #endif /* SDL_kmsdrmopengles_h_ */
> - 
> -diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
> -index e84bd5ebc..663bc2170 100644
> ---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
> -+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
> -@@ -846,7 +846,6 @@ KMSDRM_CreateDevice(int devindex)
> -     device->SetWindowGrab = KMSDRM_SetWindowGrab;
> -     device->DestroyWindow = KMSDRM_DestroyWindow;
> -     device->GetWindowWMInfo = KMSDRM_GetWindowWMInfo;
> --#if SDL_VIDEO_OPENGL_EGL
> -     device->GL_DefaultProfileConfig = KMSDRM_GLES_DefaultProfileConfig;
> -     device->GL_LoadLibrary = KMSDRM_GLES_LoadLibrary;
> -     device->GL_GetProcAddress = KMSDRM_GLES_GetProcAddress;
> -@@ -857,9 +856,7 @@ KMSDRM_CreateDevice(int devindex)
> -     device->GL_GetSwapInterval = KMSDRM_GLES_GetSwapInterval;
> -     device->GL_SwapWindow = KMSDRM_GLES_SwapWindow;
> -     device->GL_DeleteContext = KMSDRM_GLES_DeleteContext;
> --#endif
> --    device->PumpEvents = KMSDRM_PumpEvents;
> --    device->free = KMSDRM_DeleteDevice;
> -+
> - #if SDL_VIDEO_VULKAN
> -     device->Vulkan_LoadLibrary = KMSDRM_Vulkan_LoadLibrary;
> -     device->Vulkan_UnloadLibrary = KMSDRM_Vulkan_UnloadLibrary;
> -@@ -867,6 +864,10 @@ KMSDRM_CreateDevice(int devindex)
> -     device->Vulkan_CreateSurface = KMSDRM_Vulkan_CreateSurface;
> -     device->Vulkan_GetDrawableSize = KMSDRM_Vulkan_GetDrawableSize;
> - #endif
> -+
> -+    device->PumpEvents = KMSDRM_PumpEvents;
> -+    device->free = KMSDRM_DeleteDevice;
> -+
> -     return device;
> - 
> - cleanup:
> -@@ -1327,9 +1328,7 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
> -     SDL_DisplayData *dispdata = (SDL_DisplayData *)SDL_GetDisplayDriverData(0);
> -     KMSDRM_PlaneInfo plane_info = {0};
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     EGLContext egl_context;
> --#endif
> - 
> -     /********************************************************************/
> -     /* BLOCK 1: protect the PRIMARY PLANE before destroying the buffers */
> -@@ -1380,7 +1379,6 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
> -     /* will get wrong info and we will be in trouble.                          */
> -     /***************************************************************************/
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
> -     SDL_EGL_MakeCurrent(_this, EGL_NO_SURFACE, egl_context);
> - 
> -@@ -1388,7 +1386,6 @@ KMSDRM_DestroySurfaces(_THIS, SDL_Window *window)
> -         SDL_EGL_DestroySurface(_this, windata->egl_surface);
> -         windata->egl_surface = EGL_NO_SURFACE;
> -     }
> --#endif
> - 
> -     if (windata->gs) {
> -         KMSDRM_gbm_surface_destroy(windata->gs);
> -@@ -1431,7 +1428,6 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
> -         return SDL_SetError("Could not create GBM surface");
> -     }
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     /* We can't get the EGL context yet because SDL_CreateRenderer has not been called,
> -        but we need an EGL surface NOW, or GL won't be able to render into any surface
> -        and we won't see the first frame. */
> -@@ -1448,8 +1444,6 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
> -     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
> -     ret = SDL_EGL_MakeCurrent(_this, windata->egl_surface, egl_context);
> - 
> --#endif
> --
> - cleanup:
> - 
> -     if (ret) {
> -@@ -1478,11 +1472,11 @@ KMSDRM_DestroyWindow(_THIS, SDL_Window *window)
> - 
> -     if (!is_vulkan) {
> -         KMSDRM_DestroySurfaces(_this, window);
> --#if SDL_VIDEO_OPENGL_EGL
> -+
> -         if (_this->egl_data) {
> -             SDL_EGL_UnloadLibrary(_this);
> -         }
> --#endif
> -+
> -         if (dispdata->gbm_init) {
> -             KMSDRM_DeinitMouse(_this);
> -             KMSDRM_GBMDeinit(_this, dispdata);
> -@@ -1754,7 +1748,6 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * window)
> -                  goto cleanup;
> -          }
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -          /* Manually load the EGL library. KMSDRM_EGL_LoadLibrary() has already
> -             been called by SDL_CreateWindow() but we don't do anything there,
> -             precisely to be able to load it here.
> -@@ -1766,7 +1759,6 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * window)
> -                  goto cleanup;
> -              }
> -          }
> --#endif
> - 
> -          /* Can't init mouse stuff sooner because cursor plane is not ready. */
> -          KMSDRM_InitMouse(_this);
> -diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.h b/src/video/kmsdrm/SDL_kmsdrmvideo.h
> -index 2cf34522b..e58c922a8 100644
> ---- a/src/video/kmsdrm/SDL_kmsdrmvideo.h
> -+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.h
> -@@ -34,10 +34,8 @@
> - 
> - #include <gbm.h>
> - #include <assert.h>
> --#if SDL_VIDEO_OPENGL_EGL
> - #include <EGL/egl.h>
> - #include <EGL/eglext.h>
> --#endif
> - 
> - /****************************************************************************************/
> - /* Driverdata pointers are void struct* used to store backend-specific variables        */
> -@@ -101,10 +99,6 @@ typedef struct SDL_DisplayData
> -     EGLSyncKHR kms_fence;
> -     EGLSyncKHR gpu_fence;
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> --    EGLSurface old_egl_surface;
> --#endif
> --
> -     SDL_bool modeset_pending;
> -     SDL_bool gbm_init;
> - 
> -@@ -129,9 +123,7 @@ typedef struct SDL_WindowData
> -     struct gbm_bo *bo;
> -     struct gbm_bo *next_bo;
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     EGLSurface egl_surface;
> --#endif
> - 
> -     /* For scaling and AR correction. */
> -     int32_t src_w;
> -diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
> -index 890801891..a886eb326 100644
> ---- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
> -+++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.c
> -@@ -21,7 +21,7 @@
> - 
> - #include "../../SDL_internal.h"
> - 
> --#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
> -+#if SDL_VIDEO_DRIVER_KMSDRM
> - 
> - #include "SDL_log.h"
> - 
> -@@ -147,6 +147,6 @@ KMSDRM_LEGACY_GLES_SwapWindow(_THIS, SDL_Window * window) {
> - 
> - SDL_EGL_MakeCurrent_impl(KMSDRM_LEGACY)
> - 
> --#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
> -+#endif /* SDL_VIDEO_DRIVER_KMSDRM */
> - 
> - /* vi: set ts=4 sw=4 expandtab: */
> -diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
> -index 5e5ba96dc..2926cbe58 100644
> ---- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
> -+++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_opengles.h
> -@@ -23,7 +23,7 @@
> - #ifndef SDL_kmsdrmopengles_h_
> - #define SDL_kmsdrmopengles_h_
> - 
> --#if SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL
> -+#if SDL_VIDEO_DRIVER_KMSDRM
> - 
> - #include "../SDL_sysvideo.h"
> - #include "../SDL_egl_c.h"
> -@@ -41,7 +41,7 @@ extern SDL_GLContext KMSDRM_LEGACY_GLES_CreateContext(_THIS, SDL_Window * window
> - extern int KMSDRM_LEGACY_GLES_SwapWindow(_THIS, SDL_Window * window);
> - extern int KMSDRM_LEGACY_GLES_MakeCurrent(_THIS, SDL_Window * window, SDL_GLContext context);
> - 
> --#endif /* SDL_VIDEO_DRIVER_KMSDRM && SDL_VIDEO_OPENGL_EGL */
> -+#endif /* SDL_VIDEO_DRIVER_KMSDRM */
> - 
> - #endif /* SDL_kmsdrmopengles_h_ */
> - 
> -diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
> -index 36b1899bd..acddfc29a 100644
> ---- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
> -+++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.c
> -@@ -213,7 +213,7 @@ KMSDRM_LEGACY_CreateDevice(int devindex)
> -     device->SetWindowGrab = KMSDRM_LEGACY_SetWindowGrab;
> -     device->DestroyWindow = KMSDRM_LEGACY_DestroyWindow;
> -     device->GetWindowWMInfo = KMSDRM_LEGACY_GetWindowWMInfo;
> --#if SDL_VIDEO_OPENGL_EGL
> -+
> -     device->GL_LoadLibrary = KMSDRM_LEGACY_GLES_LoadLibrary;
> -     device->GL_GetProcAddress = KMSDRM_LEGACY_GLES_GetProcAddress;
> -     device->GL_UnloadLibrary = KMSDRM_LEGACY_GLES_UnloadLibrary;
> -@@ -223,7 +223,7 @@ KMSDRM_LEGACY_CreateDevice(int devindex)
> -     device->GL_GetSwapInterval = KMSDRM_LEGACY_GLES_GetSwapInterval;
> -     device->GL_SwapWindow = KMSDRM_LEGACY_GLES_SwapWindow;
> -     device->GL_DeleteContext = KMSDRM_LEGACY_GLES_DeleteContext;
> --#endif
> -+
> -     device->PumpEvents = KMSDRM_LEGACY_PumpEvents;
> -     device->free = KMSDRM_LEGACY_DeleteDevice;
> - 
> -@@ -369,14 +369,12 @@ KMSDRM_LEGACY_DestroySurfaces(_THIS, SDL_Window * window)
> -         windata->next_bo = NULL;
> -     }
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     SDL_EGL_MakeCurrent(_this, EGL_NO_SURFACE, EGL_NO_CONTEXT);
> - 
> -     if (windata->egl_surface != EGL_NO_SURFACE) {
> -         SDL_EGL_DestroySurface(_this, windata->egl_surface);
> -         windata->egl_surface = EGL_NO_SURFACE;
> -     }
> --#endif
> - 
> -     if (windata->gs) {
> -         KMSDRM_LEGACY_gbm_surface_destroy(windata->gs);
> -@@ -394,18 +392,14 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
> -     Uint32 height = dispdata->mode.vdisplay;
> -     Uint32 surface_fmt = GBM_FORMAT_XRGB8888;
> -     Uint32 surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
> --#if SDL_VIDEO_OPENGL_EGL
> -     EGLContext egl_context;
> --#endif
> - 
> -     if (!KMSDRM_LEGACY_gbm_device_is_format_supported(viddata->gbm, surface_fmt, surface_flags)) {
> -         SDL_LogWarn(SDL_LOG_CATEGORY_VIDEO, "GBM surface format not supported. Trying anyway.");
> -     }
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     SDL_EGL_SetRequiredVisualId(_this, surface_fmt);
> -     egl_context = (EGLContext)SDL_GL_GetCurrentContext();
> --#endif
> - 
> -     KMSDRM_LEGACY_DestroySurfaces(_this, window);
> - 
> -@@ -415,7 +409,6 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
> -         return SDL_SetError("Could not create GBM surface");
> -     }
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     windata->egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType)windata->gs);
> - 
> -     if (windata->egl_surface == EGL_NO_SURFACE) {
> -@@ -425,7 +418,6 @@ KMSDRM_LEGACY_CreateSurfaces(_THIS, SDL_Window * window)
> -     SDL_EGL_MakeCurrent(_this, windata->egl_surface, egl_context);
> - 
> -     windata->egl_surface_dirty = 0;
> --#endif
> - 
> -     return 0;
> - }
> -@@ -734,15 +726,9 @@ KMSDRM_LEGACY_SetDisplayMode(_THIS, SDL_VideoDisplay * display, SDL_DisplayMode
> -         SDL_Window *window = viddata->windows[i];
> -         SDL_WindowData *windata = (SDL_WindowData *)window->driverdata;
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -         /* Can't recreate EGL surfaces right now, need to wait until SwapWindow
> -            so the correct thread-local surface and context state are available */
> -         windata->egl_surface_dirty = 1;
> --#else
> --        if (KMSDRM_LEGACY_CreateSurfaces(_this, window)) {
> --            return -1;
> --        }
> --#endif
> - 
> -         /* Tell app about the resize */
> -         SDL_SendWindowEvent(window, SDL_WINDOWEVENT_RESIZED, mode->w, mode->h);
> -@@ -758,13 +744,11 @@ KMSDRM_LEGACY_CreateWindow(_THIS, SDL_Window * window)
> -     SDL_WindowData *windata;
> -     SDL_VideoDisplay *display;
> - 
> --#if SDL_VIDEO_OPENGL_EGL
> -     if (!_this->egl_data) {
> -         if (SDL_GL_LoadLibrary(NULL) < 0) {
> -             goto error;
> -         }
> -     }
> --#endif
> - 
> -     /* Allocate window internal data */
> -     windata = (SDL_WindowData *)SDL_calloc(1, sizeof(SDL_WindowData));
> -diff --git a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
> -index 28e1bc4fe..9df2bcfa3 100644
> ---- a/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
> -+++ b/src/video/kmsdrm_legacy/SDL_kmsdrm_legacy_video.h
> -@@ -31,9 +31,7 @@
> - #include <xf86drm.h>
> - #include <xf86drmMode.h>
> - #include <gbm.h>
> --#if SDL_VIDEO_OPENGL_EGL
> - #include <EGL/egl.h>
> --#endif
> - 
> - typedef struct SDL_VideoData
> - {
> -@@ -71,10 +69,10 @@ typedef struct SDL_WindowData
> -     struct gbm_bo *crtc_bo;
> -     SDL_bool waiting_for_flip;
> -     SDL_bool double_buffer;
> --#if SDL_VIDEO_OPENGL_EGL
> -+
> -     int egl_surface_dirty;
> -     EGLSurface egl_surface;
> --#endif
> -+
> - } SDL_WindowData;
> - 
> - typedef struct KMSDRM_LEGACY_FBInfo
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index f93c3fa879..1708180626 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -22,14 +22,6 @@ SDL2_CONF_OPTS += \
>  	--disable-pulseaudio \
>  	--disable-video-wayland
>  
> -# We're patching configure.ac but autoreconf breaks the build
> -# The script only uses autoconf, not automake or libtool
> -SDL2_DEPENDENCIES += host-autoconf
> -define SDL2_RUN_AUTOGEN
> -	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> -endef
> -SDL2_PRE_CONFIGURE_HOOKS += SDL2_RUN_AUTOGEN
> -
>  # We are using autotools build system for sdl2, so the sdl2-config.cmake
>  # include path are not resolved like for sdl2-config script.
>  # Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
