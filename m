From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Feb 2020 11:31:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.0
Message-ID: <20200223103119.1019036-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added optional dependency to zstd present due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a8d941091f72923561a6c58b46ccb264b6a0e205

Replaced MESA_EGL_NO_X11_HEADERS define with EGL_NO_X11 due to upstream
commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: squashed EGL_NO_X11 patch (Yann)

 package/mali-t76x/egl.pc                                 | 2 +-
 package/mali-t76x/glesv2.pc                              | 2 +-
 package/mesa3d-headers/mesa3d-headers.mk                 | 2 +-
 package/mesa3d/mesa3d.hash                               | 8 ++++----
 package/mesa3d/mesa3d.mk                                 | 9 ++++++++-
 package/nvidia-driver/gl.pc                              | 2 +-
 ...-forward-cflags-from-.pc-files-to-waffle-cflags.patch | 8 ++++----
 7 files changed, 20 insertions(+), 13 deletions(-)

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
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7d428f2322..f4927a28c6 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.3.4
+MESA3D_HEADERS_VERSION = 20.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3237135b1c..e2ec6e625d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-February/000570.html
-sha256 1da467e6ae2799a517e242462331eafd29ae77d9872f3a845df81f7c308e8fe4  mesa-19.3.4.tar.xz
-sha512 2bbb3dc8f1d839f11fe12cc959393cd69607fa6714b2166b80299e0559d2d3b0ac38ed4e15ac3e5f472264eb24536d1901d350f7409f3a7e00d6f4ccbb2312fb  mesa-19.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-February/000572.html
+sha256 bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34  mesa-20.0.0.tar.xz
+sha512 3968820029434682fb6644947c76e12b6bb991a3d05cb519a6ea971ecc4aa9b21d03f84b9a452cc21cc77a7981db9e40dd2dfd3ea3dee85b3dd88a59b4842bbb  mesa-20.0.0.tar.xz
 
 # License
-sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
+sha256 1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2a22d2fddc..9c9f38d17e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.3.4
+MESA3D_VERSION = 20.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -257,4 +257,11 @@ else
 MESA3D_CONF_OPTS += -Dlmsensors=false
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MESA3D_CONF_OPTS += -Dzstd=true
+MESA3D_DEPENDENCIES += zstd
+else
+MESA3D_CONF_OPTS += -Dzstd=false
+endif
+
 $(eval $(meson-package))
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
