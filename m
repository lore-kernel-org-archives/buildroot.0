From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 26 Sep 2017 16:47:22 +0200
Subject: [Buildroot] [PATCH 2/3] sdl2: Remove patches that were merged
	upstream
In-Reply-To: <20170926144723.17619-1-olivier.schonken@gmail.com>
References: <20170926144723.17619-1-olivier.schonken@gmail.com>
Message-ID: <20170926144723.17619-2-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/sdl2/0001-ppc.patch  | 47 --------------------------------
 package/sdl2/0002-gcc6.patch | 64 --------------------------------------------
 2 files changed, 111 deletions(-)
 delete mode 100644 package/sdl2/0001-ppc.patch
 delete mode 100644 package/sdl2/0002-gcc6.patch

diff --git a/package/sdl2/0001-ppc.patch b/package/sdl2/0001-ppc.patch
deleted file mode 100644
index 0161103067..0000000000
--- a/package/sdl2/0001-ppc.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fixed bug 3466 - Can't build 2.0.5 on ppc64
-
-/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
-/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
-const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
-^ 
-
-Downloaded from upstream repo
-https://hg.libsdl.org/SDL/rev/5184186d4366
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -r 71d4148e32de -r 5184186d4366 src/video/SDL_blit_N.c
---- a/src/video/SDL_blit_N.c	Wed Oct 19 21:22:42 2016 -0700
-+++ b/src/video/SDL_blit_N.c	Sat Oct 22 11:01:55 2016 -0700
-@@ -118,12 +118,6 @@
-         16, 8, 0, 24,
-         0, NULL
-     };
--    if (!srcfmt) {
--        srcfmt = &default_pixel_format;
--    }
--    if (!dstfmt) {
--        dstfmt = &default_pixel_format;
--    }
-     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
-                                                        0x04, 0x04, 0x04, 0x04,
-                                                        0x08, 0x08, 0x08, 0x08,
-@@ -136,6 +130,14 @@
-     Uint32 gmask = RESHIFT(srcfmt->Gshift) << (dstfmt->Gshift);
-     Uint32 bmask = RESHIFT(srcfmt->Bshift) << (dstfmt->Bshift);
-     Uint32 amask;
-+
-+    if (!srcfmt) {
-+        srcfmt = &default_pixel_format;
-+    }
-+    if (!dstfmt) {
-+        dstfmt = &default_pixel_format;
-+    }
-+
-     /* Use zero for alpha if either surface doesn't have alpha */
-     if (dstfmt->Amask) {
-         amask =
-
-
-
-
diff --git a/package/sdl2/0002-gcc6.patch b/package/sdl2/0002-gcc6.patch
deleted file mode 100644
index 6b5e901dfe..0000000000
--- a/package/sdl2/0002-gcc6.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-
-# HG changeset patch
-# User Sam Lantinga <slouken@libsdl.org>
-# Date 1479201270 28800
-# Node ID ea44906e19b837f4d5b309525ca79ed9d00b1897
-# Parent  6b2307dbec54f0bf4d5d8abf86241e29f3a03562
-Fixed bug 3490 - Build failure with --enable-video-directfb
-
-felix
-
-Building SDL 2.0.5, or even the Mercurial snapshot (r10608) with GCC 6.2.1 and --enable-video-directfb generates a number of compiler diagnostics and fails.
-
-Downloaded from upstream repo
-https://hg.libsdl.org/SDL/rev/ea44906e19b8
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -r 6b2307dbec54 -r ea44906e19b8 src/video/directfb/SDL_DirectFB_render.c
---- a/src/video/directfb/SDL_DirectFB_render.c	Tue Nov 15 01:12:27 2016 -0800
-+++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Nov 15 01:14:30 2016 -0800
-@@ -1273,7 +1273,7 @@
-                      Uint32 format, void * pixels, int pitch)
- {
-     Uint32 sdl_format;
--    void * laypixels;
-+    unsigned char* laypixels;
-     int laypitch;
-     DFBSurfacePixelFormat dfb_format;
-     DirectFB_RenderData *data = (DirectFB_RenderData *) renderer->driverdata;
-@@ -1303,7 +1303,7 @@
-     SDL_Window *window = renderer->window;
-     SDL_DFB_WINDOWDATA(window);
-     Uint32 sdl_format;
--    void * laypixels;
-+    unsigned char* laypixels;
-     int laypitch;
-     DFBSurfacePixelFormat dfb_format;
- 
-diff -r 6b2307dbec54 -r ea44906e19b8 src/video/directfb/SDL_DirectFB_shape.c
---- a/src/video/directfb/SDL_DirectFB_shape.c	Tue Nov 15 01:12:27 2016 -0800
-+++ b/src/video/directfb/SDL_DirectFB_shape.c	Tue Nov 15 01:14:30 2016 -0800
-@@ -37,17 +37,19 @@
- SDL_WindowShaper*
- DirectFB_CreateShaper(SDL_Window* window) {
-     SDL_WindowShaper* result = NULL;
-+    SDL_ShapeData* data;
-+    int resized_properly;
- 
-     result = malloc(sizeof(SDL_WindowShaper));
-     result->window = window;
-     result->mode.mode = ShapeModeDefault;
-     result->mode.parameters.binarizationCutoff = 1;
-     result->userx = result->usery = 0;
--    SDL_ShapeData* data = SDL_malloc(sizeof(SDL_ShapeData));
-+    data = SDL_malloc(sizeof(SDL_ShapeData));
-     result->driverdata = data;
-     data->surface = NULL;
-     window->shaper = result;
--    int resized_properly = DirectFB_ResizeWindowShape(window);
-+    resized_properly = DirectFB_ResizeWindowShape(window);
-     SDL_assert(resized_properly == 0);
- 
-     return result;
-
-- 
2.11.0
