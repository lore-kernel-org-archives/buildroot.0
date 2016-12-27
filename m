From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 17:58:54 +0100
Subject: [Buildroot] [git commit] package/sdl2: fix build with gcc6
Message-ID: <20161227165913.9348D81DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4091d60557d251e5a8d5405e00e6f811e31d96d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b99/b997c2b6307deb48a42e9b317715a00b65f90149/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/0002-gcc6.patch | 64 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/sdl2/0002-gcc6.patch b/package/sdl2/0002-gcc6.patch
new file mode 100644
index 0000000..6b5e901
--- /dev/null
+++ b/package/sdl2/0002-gcc6.patch
@@ -0,0 +1,64 @@
+
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1479201270 28800
+# Node ID ea44906e19b837f4d5b309525ca79ed9d00b1897
+# Parent  6b2307dbec54f0bf4d5d8abf86241e29f3a03562
+Fixed bug 3490 - Build failure with --enable-video-directfb
+
+felix
+
+Building SDL 2.0.5, or even the Mercurial snapshot (r10608) with GCC 6.2.1 and --enable-video-directfb generates a number of compiler diagnostics and fails.
+
+Downloaded from upstream repo
+https://hg.libsdl.org/SDL/rev/ea44906e19b8
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -r 6b2307dbec54 -r ea44906e19b8 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Tue Nov 15 01:12:27 2016 -0800
++++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Nov 15 01:14:30 2016 -0800
+@@ -1273,7 +1273,7 @@
+                      Uint32 format, void * pixels, int pitch)
+ {
+     Uint32 sdl_format;
+-    void * laypixels;
++    unsigned char* laypixels;
+     int laypitch;
+     DFBSurfacePixelFormat dfb_format;
+     DirectFB_RenderData *data = (DirectFB_RenderData *) renderer->driverdata;
+@@ -1303,7 +1303,7 @@
+     SDL_Window *window = renderer->window;
+     SDL_DFB_WINDOWDATA(window);
+     Uint32 sdl_format;
+-    void * laypixels;
++    unsigned char* laypixels;
+     int laypitch;
+     DFBSurfacePixelFormat dfb_format;
+ 
+diff -r 6b2307dbec54 -r ea44906e19b8 src/video/directfb/SDL_DirectFB_shape.c
+--- a/src/video/directfb/SDL_DirectFB_shape.c	Tue Nov 15 01:12:27 2016 -0800
++++ b/src/video/directfb/SDL_DirectFB_shape.c	Tue Nov 15 01:14:30 2016 -0800
+@@ -37,17 +37,19 @@
+ SDL_WindowShaper*
+ DirectFB_CreateShaper(SDL_Window* window) {
+     SDL_WindowShaper* result = NULL;
++    SDL_ShapeData* data;
++    int resized_properly;
+ 
+     result = malloc(sizeof(SDL_WindowShaper));
+     result->window = window;
+     result->mode.mode = ShapeModeDefault;
+     result->mode.parameters.binarizationCutoff = 1;
+     result->userx = result->usery = 0;
+-    SDL_ShapeData* data = SDL_malloc(sizeof(SDL_ShapeData));
++    data = SDL_malloc(sizeof(SDL_ShapeData));
+     result->driverdata = data;
+     data->surface = NULL;
+     window->shaper = result;
+-    int resized_properly = DirectFB_ResizeWindowShape(window);
++    resized_properly = DirectFB_ResizeWindowShape(window);
+     SDL_assert(resized_properly == 0);
+ 
+     return result;
+
