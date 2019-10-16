From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:46:53 +0200
Subject: [Buildroot] [git commit] package/glmark2: rework selection of
 flavours
Message-ID: <20191016204107.5C77681898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b831565d0c0a7fd127c5f4a4221dab7791f1fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.buildroot.net/buildroot/commit/?id=cf66a67112cd706d2e71665e45e8f6453fd53963
was not enough to fix building glmark2 because it was possible to
configure buildroot in a way that no flavour would be active:
http://lists.busybox.net/pipermail/buildroot/2019-October/261943.html
http://lists.busybox.net/pipermail/buildroot/2019-October/261944.html

The broken defconfig was fixed
https://git.buildroot.net/buildroot/commit/?id=ca6f9504dd3825fe4fbd0b4a4b3eea4261032d03

but we need to fix the selection of flavours to ensure that at least
on flavour is available:
http://lists.busybox.net/pipermail/buildroot/2019-October/262022.html

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glmark2/Config.in  | 54 +++++++++++++++++++++++++++++++++++++++-------
 package/glmark2/glmark2.mk | 39 ++++++++++++++++-----------------
 2 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index addd7a906e..153eb3b0af 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -1,27 +1,65 @@
-config BR2_PACKAGE_GLMARK2_EGL_GLES
+config BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+	bool
+
+config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+
+config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+
+config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+
+config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+
+config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
 	bool
 	default y
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 
-config BR2_PACKAGE_GLMARK2_GL
+config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 
 comment "glmark2 needs a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
-comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
+comment "glmark2 needs an OpenGL or an openGL ES and EGL backend"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
+	depends on !BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 
 config BR2_PACKAGE_GLMARK2
 	bool "glmark2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
+	depends on BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
 	help
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 7774cd2ab5..3d31003d06 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -8,36 +8,35 @@ GLMARK2_VERSION = 9e01aef1a786b28aca73135a5b00f85c357e8f5e
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
-GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
-	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
-	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
-	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GLMARK2_DEPENDENCIES += xlib_libX11
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-GLMARK2_FLAVORS += x11-glesv2
-endif
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-GLMARK2_FLAVORS += x11-gl
-endif
-endif
+GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES)$(BR2_PACKAGE_HAS_UDEV),yyy)
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
+GLMARK2_DEPENDENCIES += libgles udev
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_UDEV),yyy)
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GL),y)
+GLMARK2_DEPENDENCIES += libgl udev
 GLMARK2_FLAVORS += drm-gl
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
-GLMARK2_DEPENDENCIES += wayland
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2),y)
+GLMARK2_DEPENDENCIES += libgles xlib_libX11
+GLMARK2_FLAVORS += x11-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_X11_GL),y)
+GLMARK2_DEPENDENCIES += libgl xlib_libX11
+GLMARK2_FLAVORS += x11-gl
+endif
+
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2),y)
+GLMARK2_DEPENDENCIES += libgles wayland
 GLMARK2_FLAVORS += wayland-glesv2
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yyy)
-GLMARK2_DEPENDENCIES += wayland
+ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL),y)
+GLMARK2_DEPENDENCIES += libgl wayland
 GLMARK2_FLAVORS += wayland-gl
 endif
 
