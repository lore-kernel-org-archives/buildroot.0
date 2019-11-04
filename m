From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:54:18 +0100
Subject: [Buildroot] [git commit] package/mesa3d: VDPAU needs x11
Message-ID: <20191104204721.14D3D8E640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e79ee3b0f91aa3eb1b20d86701a195e3bd9a26d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c898f95c275a105caacbb31adf92ef94bd4530c4 added support for
Gallium VDPAU state tracker by updating Config.in to add a dependency on
XORG7. However, mesa3d.mk was not updated to reflect this dependency.

XORG7 dependences is already managed under the ifeq
BR2_PACKAGE_MESA3D_OPENGL_GLX block so reuse this block by making ifeq
depends on a new BR2_PACKAGE_MESA3D_NEEDS_X11 hidden option

Fixes:
 - http://autobuild.buildroot.org/results/bbd102d59bbdca35fd1b5401df2790dd197d1e5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 23 +++++++++++++++--------
 package/mesa3d/mesa3d.mk |  2 +-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d247f57846..455091eb9d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -82,6 +82,19 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 config BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	bool
 
+# OpenGL GLX and Gallium VDPAU both needs X11
+config BR2_PACKAGE_MESA3D_NEEDS_X11
+	bool
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XORGPROTO
+
 comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
@@ -229,6 +242,7 @@ config BR2_PACKAGE_MESA3D_VDPAU
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	select BR2_PACKAGE_LIBVDPAU
 	help
 	  VDPAU state tracker (needs r600, radeonsi or nouveau gallium
@@ -338,14 +352,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XORGPROTO
+	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	help
 	  Enable GLX graphic acceleration (OpenGL + X11).
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9a7e0c9952..3f61253348 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -183,7 +183,7 @@ MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
 MESA3D_CONF_OPTS += -Dwayland-scanner-path=$(HOST_DIR)/bin/wayland-scanner
 endif
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
+ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
 MESA3D_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
