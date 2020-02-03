From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 11:19:34 +0100
Subject: [Buildroot] [git commit] package/kodi: add optional support for
 wayland
Message-ID: <20200203100843.4625988687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9756f6a7ac8a4aa962786bbf800fa77594424b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see upstream PR 12664.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - add BR2_PACKAGE_HAS_LIBGL dependency to
   BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
 - don't select BR2_PACKAGE_WAYLANDPP from the blind options, but
   instead from the visible options]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/Config.in | 45 ++++++++++++++++++++++++++++++++++++++++++---
 package/kodi/kodi.mk   | 16 ++++++++++++++++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 40ce3bfc59..cd3bc99bf9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,6 +27,26 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_PACKAGE_WAYLAND # waylandpp
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
+	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
 	bool
 	default y
@@ -188,6 +208,19 @@ config BR2_PACKAGE_KODI_PLATFORM_RBPI
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 
+config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL
+	bool "Wayland/OpenGL"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLANDPP
+
+config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES
+	bool "Wayland/GLES"
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLANDPP
+
 config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	bool "X11/OpenGL"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
@@ -241,13 +274,19 @@ config BR2_PACKAGE_KODI_LIBUSB
 
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
index 1036151a89..2f2a92a889 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -174,6 +174,22 @@ KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=rbpi
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
