From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Mar 2021 07:44:53 -0000
Subject: [Buildroot] [git commit] package/{wlroots,
 cage}: change mesa3d dependency to virtual libegl/libgles
Message-ID: <20210308072134.6AF9A88918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fed835768aac18f2457544ff40f3b59b387117ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commits:
https://github.com/swaywm/wlroots/commit/c2288a7b88240e4377bfc1c67b44efb58f704a42
https://github.com/swaywm/wlroots/commit/e18599b05e0f0cbeba11adbd489e801285470eab

Mesa dependency is no longer required. Wlroots is able to run on
drivers that provide EGL and GLES2.0 support, and with specific EGL
wayland extensions.  (thus the BR2_PACKAGE_HAS_LIBEGL_WAYLAND
dependency)

This was verified on NXP's i.MX8MMini using imx-gpu-viv driver.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cage/Config.in     | 12 +++++++-----
 package/wlroots/Config.in  | 15 +++++++--------
 package/wlroots/wlroots.mk |  3 ++-
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 3bef08f037..0844d6ff62 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,7 @@
-comment "cage needs udev, mesa3d w/ EGL and GLES support"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+comment "cage needs udev, EGL w/ Wayland backend and OpenGL ES support"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "cage needs a toolchain w/ threads, dynamic library"
@@ -11,9 +12,10 @@ config BR2_PACKAGE_CAGE
 	bool "cage"
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
 	select BR2_PACKAGE_WLROOTS
 	help
 	  Kiosk compositor for Wayland, which displays a single
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 2f72fd4945..694aa79de4 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -1,6 +1,7 @@
-comment "wlroots needs udev, mesa3d w/ EGL and GLES support"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+comment "wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "wlroots needs a toolchain w/ threads, dynamic library"
@@ -12,11 +13,9 @@ config BR2_PACKAGE_WLROOTS
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
-	# Technically wlroots should work with any OpenGL implementation
-	# which provides EGL, GLES2, and libgbm; but in practice only
-	# Mesa ships an usable libgbm.
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 5665d5a956..0160b1aedb 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -15,7 +15,8 @@ WLROOTS_DEPENDENCIES = \
 	host-wayland \
 	libinput \
 	libxkbcommon \
-	mesa3d \
+	libegl \
+	libgles \
 	pixman \
 	udev \
 	wayland \
