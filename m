From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 26 Oct 2019 11:01:42 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: remove upstream patch
Message-ID: <20191026090142.9546-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0004-meson-Link-xvmc-with-libxv.patch witch was backported to mesa3d
19.2. This patch was added to Buildroot at the time when mesa3d version 19.1
was used.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0004-meson-Link-xvmc-with-libxv.patch     | 78 -------------------
 1 file changed, 78 deletions(-)
 delete mode 100644 package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch

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
-- 
2.21.0
