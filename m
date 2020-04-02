From: Charlie Turner <cturner@igalia.com>
Date: Thu,  2 Apr 2020 12:34:55 +0100
Subject: [Buildroot] [PATCH v4] package/cog: add option for platform DRM.
In-Reply-To: <20200312194700.2836-1-cturner@igalia.com>
References: <20200312194700.2836-1-cturner@igalia.com>
Message-ID: <20200402113455.4391-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that there's two platforms, the default-on behaviour for FDO has
been made configurable, so that you can choose DRM only platform for FDO
platform. Don't be confused that in both cases the *wpebackend-fdo*
package is required. This is an unfortunate naming issue.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
Changes v3 -> v4:
  - Depend on BR2_PACKAGE_MESA3D_OPENGL_EGL only for the DRM platform,
    rather than FDO and DRM. Not clear how to "require EGL" when it
    can come from Mesa or a board-specific provider.
  - Fixup documentation as per Adri?n's suggestions.

 package/cog/Config.in | 28 ++++++++++++++++++++++++++++
 package/cog/cog.mk    | 18 +++++++++++++++---
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index b25991d4ae..6a7c5668a5 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -7,7 +7,9 @@ config BR2_PACKAGE_COG
 	depends on BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+
 	select BR2_PACKAGE_DBUS
+
 	help
 	  Single "window" launcher for the WebKit WPE port, and
 	  helper library for implementing WPE launcher. It does
@@ -26,4 +28,30 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  string is used, there is no default and the URI to open
 	  must be always specified in the command line.
 
+config BR2_PACKAGE_COG_PLATFORM_FDO
+	bool "FreeDesktop.org backend"
+
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+	help
+	  Enable the FreeDesktop.org backend. Cog will interface with
+	  a compositor over the Wayland protocol.
+
+config BR2_PACKAGE_COG_PLATFORM_DRM
+	bool "DRM backend"
+
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT
+
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
index d0e5b79c38..339187126a 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,13 +8,25 @@ COG_VERSION = 0.4.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
+COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland wayland-protocols
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
-	-DCOG_PLATFORM_FDO=ON \
-	-DCOG_PLATFORM_DRM=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
 
+ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
+COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
+COG_DEPENDENCIES += libxkbcommon
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
