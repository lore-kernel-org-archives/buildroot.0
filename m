From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  7 Feb 2021 11:51:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/wlroots: change mesa3d dependency
 to virtual libegl/libgles
Message-ID: <20210207105155.516654-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Olivain <ju.o@free.fr>

Since commits:
https://github.com/swaywm/wlroots/commit/c2288a7b88240e4377bfc1c67b44efb58f704a42
https://github.com/swaywm/wlroots/commit/e18599b05e0f0cbeba11adbd489e801285470eab

Mesa dependency is no longer required. Wlroots is able to run on drivers
that provide EGL and GLES2.0 support (with specific EGL wayland extensions)

This was verified on NXP's i.MX8MMini using imx-gpu-viv driver.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/wlroots/Config.in  | 13 +++++--------
 package/wlroots/wlroots.mk |  3 ++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 2f72fd4945..0dbe57eaad 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -1,6 +1,6 @@
-comment "wlroots needs udev, mesa3d w/ EGL and GLES support"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+comment "wlroots needs udev, EGL and OpenGL ES support"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "wlroots needs a toolchain w/ threads, dynamic library"
@@ -12,11 +12,8 @@ config BR2_PACKAGE_WLROOTS
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
-	# Technically wlroots should work with any OpenGL implementation
-	# which provides EGL, GLES2, and libgbm; but in practice only
-	# Mesa ships an usable libgbm.
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBEGL
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
-- 
2.25.1
