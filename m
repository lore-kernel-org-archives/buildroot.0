From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 11:32:39 +0200
Subject: [Buildroot] [PATCH v5 07/10] package/mesa3d: add a new option to
 enable GLX support
In-Reply-To: <20190728093242.4481-1-bernd.kuhls@t-online.de>
References: <20190728093242.4481-1-bernd.kuhls@t-online.de>
Message-ID: <20190728093242.4481-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

When switching to meson build system, enabling GLX support
require at least one DRI or Gallium dirver.

So add a dependency on BR2_PACKAGE_MESA3D_DRIVER for
BR2_PACKAGE_MESA3D_OPENGL_GLX option.

quoting the meson build system:
"dri based GLX requires at least one DRI driver." [1]
"Even when building just gallium drivers the user probably wants dri." [2]

[1] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n340
[2] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n266

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Bernd: moved x11 dependencies from glx condition to xorg7 condition to
 fix build error with enabled egl without glx
 BR2_PACKAGE_HAS_LIBGL needs to depend on BR2_PACKAGE_MESA3D_OPENGL_GLX]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: fixed libgl dependency (Bernd)
v4: fixed EGL build error (Bernd)

 package/mesa3d/Config.in | 16 ++++++++++++++--
 package/mesa3d/mesa3d.mk | 20 ++++++++++----------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eba218efb2..6d95fec57f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
@@ -281,6 +281,18 @@ comment "OSMesa classic requires dri (classic) swrast"
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
+comment "OpenGL API Support"
+
+config BR2_PACKAGE_MESA3D_OPENGL_GLX
+	bool "OpenGL GLX"
+	depends on BR2_PACKAGE_XORG7
+	help
+	  Enable GLX graphic acceleration (OpenGL + X11).
+	  GLX support needs X11 and at least one DRI or Gallium driver.
+
+comment "OpenGL GLX support needs X11"
+	depends on !BR2_PACKAGE_XORG7
+
 comment "Additional API Support"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -301,7 +313,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	default "mesa3d" if BR2_PACKAGE_XORG7
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index caa38771e6..648a99adfd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -72,16 +72,7 @@ MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
 MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-MESA3D_DEPENDENCIES += \
-	xlib_libX11 \
-	xlib_libXext \
-	xlib_libXdamage \
-	xlib_libXfixes \
-	xlib_libXrandr \
-	xlib_libXxf86vm \
-	xorgproto \
-	libxcb
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_CONF_OPTS += --enable-glx --disable-mangling
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += --enable-xa
@@ -196,6 +187,15 @@ MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
 endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
+MESA3D_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXdamage \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xlib_libXxf86vm \
+	xorgproto \
+	libxcb
 MESA3D_PLATFORMS += x11
 endif
 
-- 
2.20.1
