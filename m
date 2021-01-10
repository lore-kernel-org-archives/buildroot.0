From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 12:39:29 +0100
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.0.14
Message-ID: <20210110112545.0DA7B8375B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e0da5c40da82d90c3f6ca037170838a6689b65b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

patch 0001: already applied upstream
patch 0002: adapt patch to 2.0.14

Signed-off-by: Michael Fischer <mf@go-sys.de>
[yann.morin.1998 at free.fr:
  - renumber remaining patch
  - fix space-typo in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-directfb-SDL_DirectFB_render.c-fix-build.patch | 46 ----------------------
 ...video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch} | 34 ++++++++--------
 package/sdl2/sdl2.hash                             |  4 +-
 package/sdl2/sdl2.mk                               |  2 +-
 4 files changed, 20 insertions(+), 66 deletions(-)

diff --git a/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch b/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch
deleted file mode 100644
index 2fbad97402..0000000000
--- a/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7c6d466d98910a2896680351cc5cea1b7fb37ab9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Mar 2020 13:33:40 +0100
-Subject: [PATCH] src/video/directfb/SDL_DirectFB_render.c: fix build
-
-Build with directfb is broken due to a spurious '}' and a missing 'E'
-since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
-  202 |         case SDL_BLENDMODE_MUL:
-      |         ^~~~
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
-  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-      |                                                                   ^~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://hg.libsdl.org/SDL/rev/769f80095217]
----
- src/video/directfb/SDL_DirectFB_render.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/video/directfb/SDL_DirectFB_render.c b/src/video/directfb/SDL_DirectFB_render.c
-index 618009850..cc31fb8f4 100644
---- a/src/video/directfb/SDL_DirectFB_render.c
-+++ b/src/video/directfb/SDL_DirectFB_render.c
-@@ -198,11 +198,10 @@ SetBlendMode(DirectFB_RenderData * data, int blendMode,
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
- 
-             break;
--        }
-         case SDL_BLENDMODE_MUL:
-             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
-             data->drawFlags = DSDRAW_BLEND;
--            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-+            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
- 
-             break;
--- 
-2.25.1
-
diff --git a/package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch b/package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
similarity index 57%
rename from package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
rename to package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
index 89ca220add..47a13300eb 100644
--- a/package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
+++ b/package/sdl2/0001-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch
@@ -15,25 +15,25 @@ Fixes:
  - http://autobuild.buildroot.org/results/fafd20a01591032662f9ca025fcea3478239cf3c
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
 [Upstream: https://hg.libsdl.org/SDL/rev/389ce8cfa2a3]
----
- src/video/kmsdrm/SDL_kmsdrmvideo.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-index 216c45dab..459f96537 100644
---- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
-+++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
-@@ -391,7 +391,9 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window * window)
-     Uint32 height = dispdata->mode.vdisplay;
-     Uint32 surface_fmt = GBM_FORMAT_XRGB8888;
-     Uint32 surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
+
+
+Fixes: 
+ - Update patch to version 2.0.14
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+diff -purN a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c	2021-01-08 09:56:44.028217792 +0100
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c	2021-01-08 09:55:52.295932111 +0100
+@@ -1407,7 +1407,9 @@ KMSDRM_CreateSurfaces(_THIS, SDL_Window
+     uint32_t surface_flags = GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING;
+     uint32_t width, height;
+ 
 +#if SDL_VIDEO_OPENGL_EGL
      EGLContext egl_context;
 +#endif
  
-     if (!KMSDRM_gbm_device_is_format_supported(viddata->gbm, surface_fmt, surface_flags)) {
-         SDL_LogWarn(SDL_LOG_CATEGORY_VIDEO, "GBM surface format not supported. Trying anyway.");
--- 
-2.25.1
-
+     int ret = 0;
+ 
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index b72ae4bfcc..6b818fb002 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.12.tar.gz.sig
-sha256  349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863  SDL2-2.0.12.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.14.tar.gz.sig
+sha256  d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc  SDL2-2.0.14.tar.gz
 # Locally calculated
 sha256  ae4df3759a726538607b84c00ab8f8a5567d9f38ad5397486eb9b5c5f626caef  COPYING.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 6ef530fb43..bf43d71f04 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.12
+SDL2_VERSION = 2.0.14
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
