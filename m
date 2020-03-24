From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Mar 2020 23:22:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: fix kmsdrm build without EGL
Message-ID: <20200324222241.5808-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/fafd20a01591032662f9ca025fcea3478239cf3c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...o-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch

diff --git a/package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch b/package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
new file mode 100644
index 0000000000..6021647a38
--- /dev/null
+++ b/package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
@@ -0,0 +1,39 @@
+From d265b1ee94aa4faf5fa405f14cc731a25d7a00ab Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Mar 2020 14:11:14 +0100
+Subject: [PATCH] src/video/kmsdrm/SDL_kmsdrmvideo.c: fix build
+
+Build is broken without EGL since version 2.0.12 and
+https://hg.libsdl.org/SDL/rev/9761858bd6a3:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/build/sdl2-2.0.12/src/video/kmsdrm/SDL_kmsdrmvideo.c: In function 'KMSDRM_CreateSurfaces':
+/home/giuliobenetti/autobuild/run/instance-1/output-1/build/sdl2-2.0.12/src/video/kmsdrm/SDL_kmsdrmvideo.c:394:5: error: unknown type name 'EGLContext'
+     EGLContext egl_context;
+     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fafd20a01591032662f9ca025fcea3478239cf3c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugzilla.libsdl.org/show_bug.cgi?id=5057]
+---
+ src/video/kmsdrm/SDL_kmsdrmvideo.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+index 216c45dab..459f96537 100644
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+@@ -391,7 +391,9 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
+     Uint32 height = dispdata->mode.vdisplay;
+     Uint32 surface_fmt = GBM_FORMAT_XRGB8888;
+     Uint32 surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
++#if SDL_VIDEO_OPENGL_EGL
+     EGLContext egl_context;
++#endif
+ 
+     if (!KMSDRM_gbm_device_is_format_supported(viddata->gbm, surface_fmt, surface_flags)) {
+         SDL_LogWarn(SDL_LOG_CATEGORY_VIDEO, "GBM surface format not supported. Trying anyway.");
+-- 
+2.25.1
+
-- 
2.25.1
