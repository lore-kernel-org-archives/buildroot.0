From: Charlie Turner <cturner@igalia.com>
Date: Mon,  6 Apr 2020 18:42:05 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/cog: support choosing either DRM
 or FDO platform
In-Reply-To: <20200406174205.25939-1-cturner@igalia.com>
References: <20200406174205.25939-1-cturner@igalia.com>
Message-ID: <20200406174205.25939-3-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new DRM platform has landed, now you can choose to build with the
DRM or FDO platform, or neither. If neither are selected, Cog will
fallback to a simple WPE backend like WPEBackend-rdk
(https://github.com/WebPlatformForEmbedded/WPEBackend-rdk).

Don't be confused that in both cases the *wpebackend-fdo* package is
required. This is an unfortunate naming issue.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 package/cog/Config.in | 25 +++++++++++++++++++++++--
 package/cog/cog.mk    | 18 +++++++++++++++---
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index c20ee86827..64a4f3d0b7 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -8,9 +8,7 @@ config BR2_PACKAGE_COG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
 	  Single "window" launcher for the WebKit WPE port, and
 	  helper library for implementing WPE launcher. It does
@@ -29,4 +27,27 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  string is used, there is no default and the URI to open
 	  must be always specified in the command line.
 
+config BR2_PACKAGE_COG_PLATFORM_FDO
+	bool "FreeDesktop.org backend"
+        default y
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Enable the FreeDesktop.org backend. Cog will interface with
+	  a compositor over the Wayland protocol.
+
+config BR2_PACKAGE_COG_PLATFORM_DRM
+	bool "DRM backend"
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT
+	help
+	  Enable the DRM platform backend. Cog will interface directly
+	  with video drivers that support kernel mode-setting (KMS)
+	  via the DRM user-space API.
+
+comment "DRM platform needs mesa3d w/ EGL driver and GBM"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index c6fae34a65..a826252829 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,15 +8,27 @@ COG_VERSION = 0.6.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo libxkbcommon wayland wayland-protocols
+COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
-	-DCOG_PLATFORM_FDO=ON \
-	-DCOG_PLATFORM_DRM=OFF \
 	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
 
+ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
+COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
+COG_DEPENDENCIES += libxkbcommon wayland-protocols
+else
+COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
+COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
+COG_DEPENDENCIES += libdrm libinput
+else
+COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
