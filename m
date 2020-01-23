From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Jan 2020 06:15:15 +0100
Subject: [Buildroot] [PATCH 1/3] package/kodi: add optional support for
 wayland
Message-ID: <20200123051517.3726-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see upstream PR 12664.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 44 +++++++++++++++++++++++++++++++++++++++---
 package/kodi/kodi.mk   | 16 +++++++++++++++
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f592e18e13..630813b437 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -28,6 +28,27 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_PACKAGE_WAYLAND # waylandpp
+	select BR2_PACKAGE_WAYLANDPP
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_PACKAGE_WAYLAND # waylandpp
+	select BR2_PACKAGE_WAYLANDPP
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
 	bool
 	default y
@@ -189,6 +210,17 @@ config BR2_PACKAGE_KODI_PLATFORM_RBPI
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 
+config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL
+	bool "Wayland/OpenGL"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES
+	bool "Wayland/GLES"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+
 config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	bool "X11/OpenGL"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
@@ -242,13 +274,19 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	depends on BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+	depends on \
+		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL || \
+		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES || \
+		BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs platform 'X11/OpenGL'"
-	depends on !BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+comment "libva support needs platform 'Wayland' or 'X11/OpenGL'"
+	depends on \
+		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL && \
+		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES && \
+		!BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 435f47cae8..fd20cd38f7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -179,6 +179,22 @@ KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=rbpi
 KODI_DEPENDENCIES += libinput libxkbcommon rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL),y)
+KODI_CONF_OPTS += \
+	-DCORE_PLATFORM_NAME=wayland \
+	-DWAYLAND_RENDER_SYSTEM=gl
+KODI_DEPENDENCIES += libegl libgl libglu libxkbcommon waylandpp
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES),y)
+KODI_CONF_OPTS += \
+	-DCORE_PLATFORM_NAME=wayland \
+	-DWAYLAND_RENDER_SYSTEM=gles
+KODI_C_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+KODI_CXX_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+KODI_DEPENDENCIES += libegl libgles libxkbcommon waylandpp
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL),y)
 KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=x11
 KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
-- 
2.20.1
