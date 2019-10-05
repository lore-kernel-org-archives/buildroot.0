From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Oct 2019 11:30:08 +0200
Subject: [Buildroot] [PATCH 3/4] package/mesa3d: add xlib_libXv dependency
 to mesa3d xvmc
In-Reply-To: <20191005093009.1020308-1-romain.naour@gmail.com>
References: <20191005093009.1020308-1-romain.naour@gmail.com>
Message-ID: <20191005093009.1020308-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]
"Prior to xvmc 1.0.12 libxvmc incorrectly required libxv, but that was
fixed. This results in compilation failures for the gallium xvmc tracker
and tools. This patch fixes that by explicitly linking to libxv."

Add xlib_libXv dependency to mesa3d when BR2_PACKAGE_MESA3D_XVMC is set.

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=e456a053c3d6ec4f3d4581edcad05c72dfdaa407

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0004-meson-Link-xvmc-with-libxv.patch     | 78 +++++++++++++++++++
 package/mesa3d/Config.in                      |  1 +
 package/mesa3d/mesa3d.mk                      |  2 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch

diff --git a/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch b/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch
new file mode 100644
index 0000000000..821d282932
--- /dev/null
+++ b/package/mesa3d/0004-meson-Link-xvmc-with-libxv.patch
@@ -0,0 +1,78 @@
+From 1fbb69a58c3dc9d604f5c7851bd3c144af687539 Mon Sep 17 00:00:00 2001
+From: Dylan Baker <dylan@pnwbakers.com>
+Date: Thu, 26 Sep 2019 15:42:59 -0700
+Subject: [PATCH] meson: Link xvmc with libxv
+
+Prior to xvmc 1.0.12 libxvmc incorrectly required libxv, but that was
+fixed. This results in compilation failures for the gallium xvmc tracker
+and tools. This patch fixes that by explicitly linking to libxv.
+
+Fixes: 22a817af8a89eb3c762fc3e07b443a3ce37d7416
+       ("meson: build gallium xvmc state tracker")
+Closes: https://gitlab.freedesktop.org/mesa/mesa/issues/1844
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+[Romain: backported to 19.2]
+(cherry picked from commit e456a053c3d6ec4f3d4581edcad05c72dfdaa407)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ meson.build                                 |  4 +++-
+ src/gallium/state_trackers/xvmc/meson.build | 10 +++++++---
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4afd8ca663b..d536ef5a76d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -502,10 +502,12 @@ elif not (with_gallium_r600 or with_gallium_nouveau)
+   endif
+ endif
+ dep_xvmc = null_dep
++dep_xv = null_dep
+ with_gallium_xvmc = false
+ if _xvmc != 'false'
+   dep_xvmc = dependency('xvmc', version : '>= 1.0.6', required : _xvmc == 'true')
+-  with_gallium_xvmc = dep_xvmc.found()
++  dep_xv = dependency('xv', required : _xvmc == 'true')
++  with_gallium_xvmc = dep_xvmc.found() and dep_xv.found()
+ endif
+ 
+ xvmc_drivers_path = get_option('xvmc-libs-path')
+diff --git a/src/gallium/state_trackers/xvmc/meson.build b/src/gallium/state_trackers/xvmc/meson.build
+index d120d533eef..4b7aad51125 100644
+--- a/src/gallium/state_trackers/xvmc/meson.build
++++ b/src/gallium/state_trackers/xvmc/meson.build
+@@ -23,7 +23,9 @@ libxvmc_st = static_library(
+   files('attributes.c', 'block.c', 'context.c', 'surface.c', 'subpicture.c'),
+   c_args : [c_vis_args],
+   include_directories : [inc_common],
+-  dependencies : [dep_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3],
++  dependencies : [
++    dep_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xv,
++  ],
+ )
+ 
+ # These tests will not work without a working xvmc configuration. 
+@@ -36,7 +38,8 @@ if with_tools.contains('xvmc')
+       _name,
+       files('tests/test_ at 0@.c'.format(x), 'tests/testlib.c'),
+       dependencies : [
+-        dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xvmcw,
++        dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3,
++        dep_xvmcw, dep_xv,
+       ],
+       install: true,
+     )
+@@ -46,7 +49,8 @@ if with_tools.contains('xvmc')
+     'xvmc_bench',
+     files('tests/xvmc_bench.c', 'tests/testlib.c'),
+     dependencies : [
+-      dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3, dep_xvmcw,
++      dep_real_xvmc, dep_x11_xcb, dep_xcb, dep_xcb_dri2, dep_xcb_dri3,
++      dep_xvmcw, dep_xv,
+     ],
+     install: true,
+   )
+-- 
+2.23.0
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6757e4911c..cbc7ebce26 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -246,6 +246,7 @@ config BR2_PACKAGE_MESA3D_XVMC
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XLIB_LIBXVMC
 	help
 	  XvMC state tracker (needs r600 or nouveau gallium drivers).
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 767d137e2e..6ded913311 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -217,7 +217,7 @@ MESA3D_CONF_OPTS += -Dgles1=false -Dgles2=false
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
-MESA3D_DEPENDENCIES += xlib_libXvMC
+MESA3D_DEPENDENCIES += xlib_libXv xlib_libXvMC
 MESA3D_CONF_OPTS += -Dgallium-xvmc=true
 else
 MESA3D_CONF_OPTS += -Dgallium-xvmc=false
-- 
2.23.0
