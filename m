From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 17:14:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.3.1
Message-ID: <20200104161430.3641764-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0004, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...bout-path-to-glapi-generated-headers.patch | 127 ------------------
 package/mesa3d/mesa3d.hash                    |   6 +-
 package/mesa3d/mesa3d.mk                      |   2 +-
 4 files changed, 5 insertions(+), 132 deletions(-)
 delete mode 100644 package/mesa3d/0004-scons-Make-scons-and-meson-agree-about-path-to-glapi-generated-headers.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ecd1a323d6..ab4a30d4c5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.7
+MESA3D_HEADERS_VERSION = 19.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-scons-Make-scons-and-meson-agree-about-path-to-glapi-generated-headers.patch b/package/mesa3d/0004-scons-Make-scons-and-meson-agree-about-path-to-glapi-generated-headers.patch
deleted file mode 100644
index 9d6c8e7851..0000000000
--- a/package/mesa3d/0004-scons-Make-scons-and-meson-agree-about-path-to-glapi-generated-headers.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 9e1f49aae1c5640af89228e356fd525a08006369 Mon Sep 17 00:00:00 2001
-From: Dylan Baker <dylan@pnwbakers.com>
-Date: Fri, 31 May 2019 09:39:32 -0700
-Subject: [PATCH] scons: Make scons and meson agree about path to glapi
- generated headers
-
-Currently scons puts them in src/mapi/glapi, meosn puts them in
-src/mapi/glapi/gen. This results in some things being compilable only by
-one or the other, put them in the same places so that everyone is happy.
-
-Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/mesa/mesa/commit/9e1f49aae1c5640af89228e356fd525a08006369]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gallium/targets/libgl-xlib/SConscript | 1 +
- src/gallium/targets/libgl-xlib/xlib.c     | 2 +-
- src/mapi/glapi/SConscript                 | 2 +-
- src/mapi/glapi/gen/SConscript             | 2 +-
- src/mapi/glapi/glapi_dispatch.c           | 2 +-
- src/mesa/drivers/osmesa/SConscript        | 1 +
- src/mesa/drivers/x11/SConscript           | 1 +
- src/mesa/drivers/x11/glxapi.c             | 2 +-
- 8 files changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/src/gallium/targets/libgl-xlib/SConscript b/src/gallium/targets/libgl-xlib/SConscript
-index b49b4e6fe2a..5764d4ff62f 100644
---- a/src/gallium/targets/libgl-xlib/SConscript
-+++ b/src/gallium/targets/libgl-xlib/SConscript
-@@ -11,6 +11,7 @@ env.Append(CPPPATH = [
-     '#/src/mesa/main',
-     '#src/gallium/state_trackers/glx/xlib',
-     Dir('../../../mapi'), # src/mapi build path for python-generated GL API files/headers
-+    Dir('../../../mapi/glapi/gen'), # src/mapi build path for python-generated GL API files/headers
- ])
- 
- env.Append(CPPDEFINES = ['USE_XSHM'])
-diff --git a/src/gallium/targets/libgl-xlib/xlib.c b/src/gallium/targets/libgl-xlib/xlib.c
-index 1b62afb29b5..85ddda9ed33 100644
---- a/src/gallium/targets/libgl-xlib/xlib.c
-+++ b/src/gallium/targets/libgl-xlib/xlib.c
-@@ -132,6 +132,6 @@ extern void (*linker_foo(const unsigned char *procName))()
- 
- /* skip normal ones */
- #define _GLAPI_SKIP_NORMAL_ENTRY_POINTS
--#include "glapi/glapitemp.h"
-+#include "glapitemp.h"
- 
- #endif /* GLX_INDIRECT_RENDERING */
-diff --git a/src/mapi/glapi/SConscript b/src/mapi/glapi/SConscript
-index 118da1d53f7..a086f435efc 100644
---- a/src/mapi/glapi/SConscript
-+++ b/src/mapi/glapi/SConscript
-@@ -27,7 +27,7 @@ env.Append(CPPPATH = [
-     '#/src/mapi',
-     '#/src/mesa',
-     Dir('.'), # src/mapi/glapi build path
--    Dir('..'), # src/mapi build path
-+    Dir('gen'), # src/mapi/glapi/gen build path
- ])
- 
- glapi_sources = [
-diff --git a/src/mapi/glapi/gen/SConscript b/src/mapi/glapi/gen/SConscript
-index ff0df745c2c..942b5594231 100644
---- a/src/mapi/glapi/gen/SConscript
-+++ b/src/mapi/glapi/gen/SConscript
-@@ -28,7 +28,7 @@ env.CodeGenerate(
-     )
- 
- env.CodeGenerate(
--    target = '../../../mapi/glapi/glapitemp.h',
-+    target = '../../../mapi/glapi/gen/glapitemp.h',
-     script = 'gl_apitemp.py',
-     source = sources,
-     command = python_cmd + ' $SCRIPT -f $SOURCE > $TARGET'
-diff --git a/src/mapi/glapi/glapi_dispatch.c b/src/mapi/glapi/glapi_dispatch.c
-index ca15449ed01..96fd0d6a285 100644
---- a/src/mapi/glapi/glapi_dispatch.c
-+++ b/src/mapi/glapi/glapi_dispatch.c
-@@ -175,6 +175,6 @@ GL_API void GL_APIENTRY glPrimitiveBoundingBox (GLfloat minX, GLfloat minY, GLfl
- #  endif
- #endif
- 
--#include "glapi/glapitemp.h"
-+#include "glapitemp.h"
- 
- #endif /* USE_X86_ASM */
-diff --git a/src/mesa/drivers/osmesa/SConscript b/src/mesa/drivers/osmesa/SConscript
-index b08a79eb8a5..d7e8fe84da6 100644
---- a/src/mesa/drivers/osmesa/SConscript
-+++ b/src/mesa/drivers/osmesa/SConscript
-@@ -8,6 +8,7 @@ env.Prepend(CPPPATH = [
-     '#src/mesa',
-     Dir('../../../mapi'), # src/mapi build path for python-generated GL API files/headers
-     Dir('../../../mapi/glapi'), # src/mapi/glapi build path
-+    Dir('../../../mapi/glapi/gen'), # src/mapi/glapi build path
- ])
- 
- env.Prepend(LIBS = [
-diff --git a/src/mesa/drivers/x11/SConscript b/src/mesa/drivers/x11/SConscript
-index b097dcc5900..cd9eaa3ea89 100644
---- a/src/mesa/drivers/x11/SConscript
-+++ b/src/mesa/drivers/x11/SConscript
-@@ -8,6 +8,7 @@ env.Append(CPPPATH = [
-     '#/src/mesa',
-     '#/src/mesa/main',
-     Dir('../../../mapi'), # src/mapi build path for python-generated GL API files/headers
-+    Dir('../../../mapi/glapi/gen'), # src/mapi/glapi/gen build path for python-generated GL API files/headers
- ])
- 
- env.Append(CPPDEFINES = ['USE_XSHM'])
-diff --git a/src/mesa/drivers/x11/glxapi.c b/src/mesa/drivers/x11/glxapi.c
-index 2ef675682e4..1ca8bb1c0ff 100644
---- a/src/mesa/drivers/x11/glxapi.c
-+++ b/src/mesa/drivers/x11/glxapi.c
-@@ -73,7 +73,7 @@ struct display_dispatch {
- 
- /* skip normal ones */
- #define _GLAPI_SKIP_NORMAL_ENTRY_POINTS
--#include "glapi/glapitemp.h"
-+#include "glapitemp.h"
- 
- #endif /* GLX_INDIRECT_RENDERING */
- 
--- 
-2.22.0
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 66e91a9c03..791877d210 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-December/000562.html
-sha256 e3799fb7896fd9ed2f90f651fb907b95cdebfbd494968ff116e6bf1be143579e  mesa-19.2.7.tar.xz
-sha512 87a82664381432e956ee23dc92bec5accf667606232e38d9458d67132c16fdc44584f65671293b83f00c58ad7742b80e942a5d1bd66d457705be60aaaf35395b  mesa-19.2.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-December/000564.html
+sha256 cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59  mesa-19.3.1.tar.xz
+sha512 338d2e37122ef22cc4e27a2f3c39e23e419703a507ace99383c749a563936c5f0428cce9a68ac80d0bd2ff57be8a55f42aee0ed6d16bf6b77b4e59d428729568  mesa-19.3.1.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 72686c72ea..92816bf110 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.7
+MESA3D_VERSION = 19.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
