From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 07:58:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.1
Message-ID: <20191012055846.18308-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0004-meson-Link-xvmc-with-libxv.patch, applied upstream:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=19.2&id=2dbf10ba3d129d59e1a6c0e46b24c20629b277c6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 .../0004-meson-Link-xvmc-with-libxv.patch     | 78 -------------------
 package/mesa3d/mesa3d.hash                    |  6 +-
 package/mesa3d/mesa3d.mk                      |  2 +-
 4 files changed, 5 insertions(+), 83 deletions(-)
 delete mode 100644 package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a34df2e93f..8670184742 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.0
+MESA3D_HEADERS_VERSION = 19.2.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch b/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch
deleted file mode 100644
index 821d282932..0000000000
--- a/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 1fbb69a58c3dc9d604f5c7851bd3c144af687539 Mon Sep 17 00:00:00 2001
-From: Dylan Baker <dylan@pnwbakers.com>
-Date: Thu, 26 Sep 2019 15:42:59 -0700
-Subject: [PATCH] meson: Link xvmc with libxv
-
-Prior to xvmc 1.0.12 libxvmc incorrectly required libxv, but that was
-fixed. This results in compilation failures for the gallium xvmc tracker
-and tools. This patch fixes that by explicitly linking to libxv.
-
-Fixes: 22a817af8a89eb3c762fc3e07b443a3ce37d7416
-       ("meson: build gallium xvmc state tracker")
-Closes: https://gitlab.freedesktop.org/mesa/mesa/issues/1844
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-
-[Romain: backported to 19.2]
-(cherry picked from commit e456a053c3d6ec4f3d4581edcad05c72dfdaa407)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- meson.build                                 |  4 +++-
- src/gallium/state_trackers/xvmc/meson.build | 10 +++++++---
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 4afd8ca663b..d536ef5a76d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -502,10 +502,12 @@ elif not (with_gallium_r600 or with_gallium_nouveau)
-   endif
- endif
- dep_xvmc = null_dep
-+dep_xv = null_dep
- with_gallium_xvmc = false
- if _xvmc != 'false'
-   dep_xvmc = dependency('xvmc', version : '>= 1.0.6', required : _xvmc == 'true')
--  with_gallium_xvmc = dep_xvmc.found()
-+  dep_xv = dependency('xv', required : _xvmc == 'true')
-+  with_gallium_xvmc = dep_xvmc.found() and dep_xv.found()
- endif
- 
- xvmc_drivers_path = get_option('xvmc-libs-path')
-diff --git a/src/gallium/state_trackers/xvmc/meson.build b/src/gallium/state_trackers/xvmc/meson.build
-index d120d533eef..4b7aad51125 100644
---- a/src/gallium/state_trackers/xvmc/meson.build
-+++ b/src/gallium/state_trackers/xvmc/meson.build
-@@ -23,7 +23,9 @@ libxvmc_st = static_library(
-   files('attributes.c', 'block.c', 'context.c', 'surface.c', 'subpicture.c'),
-   c_args : [c_vis_args],
-   include_directories : [inc_common],
--  dependencies : [dep_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3],
-+  dependencies : [
-+    dep_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xv,
-+  ],
- )
- 
- # These tests will not work without a working xvmc configuration. 
-@@ -36,7 +38,8 @@ if with_tools.contains('xvmc')
-       _name,
-       files('tests/test_ at 0@.c'.format(x), 'tests/testlib.c'),
-       dependencies : [
--        dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xvmcw,
-+        dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3,
-+        dep_xvmcw, dep_xv,
-       ],
-       install: true,
-     )
-@@ -46,7 +49,8 @@ if with_tools.contains('xvmc')
-     'xvmc_bench',
-     files('tests/xvmc_bench.c', 'tests/testlib.c'),
-     dependencies : [
--      dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xvmcw,
-+      dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3,
-+      dep_xvmcw, dep_xv,
-     ],
-     install: true,
-   )
--- 
-2.23.0
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 36b5307972..6dabb6fda4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-September/000547.html
-sha256 b060caa2a00f856431160ff7377d0e8f58f2aa48c16ee5a9e265ebdccb10852a  mesa-19.2.0.tar.xz
-sha512 7278bbfba9c29fe91d1959ff1a48422e917db85287460523d12ae8c6d7f49f76e9636bf4c0d8d7d89e5569b3c67135f1b23b8f6c9d52d39413d8ec22e3bb40f0  mesa-19.2.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-October/000548.html
+sha256 4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9  mesa-19.2.1.tar.xz
+sha512 decd74976fe866bf67fac4ae55a62d8e33ad24278dd58effe533e7d258b249f0ead848360e7e71444265184c6d9d9b04361caf0c6df99504e33599e7a0cd6c5d  mesa-19.2.1.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e85ed4f956..65d88561bf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.0
+MESA3D_VERSION = 19.2.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
