From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Feb 2020 19:59:17 +0100
Subject: [Buildroot] [PATCH/next 2/2] replace MESA_EGL_NO_X11_HEADERS hack
 with upstream EGL_NO_X11
In-Reply-To: <20200220185917.37908-1-bernd.kuhls@t-online.de>
References: <20200220185917.37908-1-bernd.kuhls@t-online.de>
Message-ID: <20200220185917.37908-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3d 20.0.0 deprecated MESA_EGL_NO_X11_HEADERS:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mali-t76x/egl.pc                                  | 2 +-
 package/mali-t76x/glesv2.pc                               | 2 +-
 package/nvidia-driver/gl.pc                               | 2 +-
 ...e-forward-cflags-from-.pc-files-to-waffle-cflags.patch | 8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mali-t76x/egl.pc b/package/mali-t76x/egl.pc
index 614b700d64..3de3c3ffd3 100644
--- a/package/mali-t76x/egl.pc
+++ b/package/mali-t76x/egl.pc
@@ -8,4 +8,4 @@ Description: ARM Mali implementation of EGL
 Version: 1.5
 Requires:
 Libs: -L${libdir} -lEGL -lGLESv2
-Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
+Cflags: -I${includedir} -DEGL_NO_X11
diff --git a/package/mali-t76x/glesv2.pc b/package/mali-t76x/glesv2.pc
index 5997eac63f..6521a3862d 100644
--- a/package/mali-t76x/glesv2.pc
+++ b/package/mali-t76x/glesv2.pc
@@ -8,4 +8,4 @@ Description: ARM Mali implementation of OpenGL ESv2
 Version: 2.0
 Requires:
 Libs: -L${libdir} -lGLESv2 -lGLESv1_CM
-Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
+Cflags: -I${includedir} -DEGL_NO_X11
diff --git a/package/nvidia-driver/gl.pc b/package/nvidia-driver/gl.pc
index d822763f57..d01f5d6944 100644
--- a/package/nvidia-driver/gl.pc
+++ b/package/nvidia-driver/gl.pc
@@ -7,5 +7,5 @@ Name: gl
 Description: Nvidia OpenGL library
 Version: 10.4.2
 Libs: -L${libdir} -lGL -lm -lXext -lX11 -ldl
-Cflags: -I${includedir}  -DMESA_EGL_NO_X11_HEADERS
+Cflags: -I${includedir}  -DEGL_NO_X11
 glx_tls: no
diff --git a/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
index ffc1b5b8b1..126aa93300 100644
--- a/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
+++ b/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
@@ -4,12 +4,12 @@ Date: Sun, 24 Dec 2017 00:11:45 +0100
 Subject: [PATCH] cmake: forward cflags from *.pc files to waffle cflags
 
 When building mesa egl without x11 and gles2 the headers need a
-MESA_EGL_NO_X11_HEADERS define to avoid including X11 headers.
+EGL_NO_X11 define to avoid including X11 headers.
 
-This define MESA_EGL_NO_X11_HEADERS  is lost while building waffle
-since CGLAGS defined by pc files are not used.
+This define EGL_NO_X11 is lost while building waffle
+since CFLAGS defined by pc files are not used.
 
-MESA_EGL_NO_X11_HEADERS is defined in CFLAGS from egl.pc.
+EGL_NO_X11 is defined in CFLAGS from egl.pc.
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
-- 
2.20.1
