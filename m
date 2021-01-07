From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Thu,  7 Jan 2021 10:25:39 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Cherry-pick
 KMSDRM_CreateWindow fix
Message-ID: <20210107102540.534088-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes crashes on SDL2 when using GLES on some devices with vc4 and mali gpus.

Cherry-pick of https://hg.libsdl.org/SDL/rev/fb6395c49ce97ad3f70de2dfd616c715ab0ebc6d

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 .../sdl2/0003-fix-kmsdrm-createwindow.patch   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/sdl2/0003-fix-kmsdrm-createwindow.patch

diff --git a/package/sdl2/0003-fix-kmsdrm-createwindow.patch b/package/sdl2/0003-fix-kmsdrm-createwindow.patch
new file mode 100644
index 0000000000..d46d4d4c91
--- /dev/null
+++ b/package/sdl2/0003-fix-kmsdrm-createwindow.patch
@@ -0,0 +1,35 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1592588234 25200
+#      Fri Jun 19 10:37:14 2020 -0700
+# Node ID fb6395c49ce97ad3f70de2dfd616c715ab0ebc6d
+# Parent  b622185b81ce31ac8e0c418f7d2cefd3feb6ffd4
+Fixed bug 5199 - Fix KMSDRM_CreateWindow() segfault when starting L?VE2D engine.
+
+Manuel Alfayate Corchete
+
+This small patch fixes the KMSDRM_CreateSurfaces() call in KMSDRM_CreateWindow(), that was segfaulting deeper into SDL internals because the windata->viddata pointer wasn't set before the KMSDRM_CreateSurfaces() call.
+So that's what this small patch does.
+
+Now, L?VE2D works perfectly well on the Raspberry Pi 3, instead of just segfaulting.
+
+diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
+@@ -798,6 +798,7 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * 
+     }
+ 
+     /* Setup driver data for this window */
++    windata->viddata = viddata;
+     window->driverdata = windata;
+ 
+     if (KMSDRM_CreateSurfaces(_this, window)) {
+@@ -807,8 +808,6 @@ KMSDRM_CreateWindow(_THIS, SDL_Window * 
+     /* Add window to the internal list of tracked windows. Note, while it may
+        seem odd to support multiple fullscreen windows, some apps create an
+        extra window as a dummy surface when working with multiple contexts */
+-    windata->viddata = viddata;
+-
+     if (viddata->num_windows >= viddata->max_windows) {
+         int new_max_windows = viddata->max_windows + 1;
+         viddata->windows = (SDL_Window **)SDL_realloc(viddata->windows,
-- 
2.27.0
