From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Sep 2020 18:21:56 +0200
Subject: [Buildroot] [PATCH] package/cog: add a variant with WebKitGTK
Message-ID: <20200907162156.1458163-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wayland is useful only with wpewebkit.
BR2_PACKAGE_WAYLAND is already selected by BR2_PACKAGE_WPEWEBKIT.
backend options BR2_PACKAGE_COG_PLATFORM_* depend on BR2_PACKAGE_WPEWEBKIT.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cog/Config.in | 11 +++++++----
 package/cog/cog.mk    | 10 +++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index a9ca7473a..45ff5780f 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -1,14 +1,13 @@
-comment "cog needs wpewebkit and a toolchain w/ threads"
+comment "cog needs [wpe]webkit[gtk] and a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_WPEWEBKIT || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on (!BR2_PACKAGE_WPEWEBKIT && !BR2_PACKAGE_WEBKITGTK) || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_COG
 	bool "cog"
-	depends on BR2_PACKAGE_WPEWEBKIT
+	depends on BR2_PACKAGE_WPEWEBKIT || BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_WAYLAND
 	help
 	  Single "window" launcher for the WebKit WPE port, and
 	  helper library for implementing WPE launcher. It does
@@ -27,6 +26,8 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  string is used, there is no default and the URI to open
 	  must be always specified in the command line.
 
+if BR2_PACKAGE_WPEWEBKIT
+
 config BR2_PACKAGE_COG_PLATFORM_FDO
 	bool "FreeDesktop.org backend"
 	default y
@@ -51,3 +52,5 @@ comment "DRM platform needs mesa3d w/ EGL driver and GBM"
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 endif
+
+endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index a82625282..639be3463 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,7 +8,7 @@ COG_VERSION = 0.6.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
+COG_DEPENDENCIES = dbus
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
@@ -17,6 +17,14 @@ COG_CONF_OPTS = \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK),y)
+COG_CONF_OPTS += -DCOG_USE_WEBKITGTK=ON
+COG_DEPENDENCIES += webkitgtk
+else
+COG_CONF_OPTS += -DCOG_USE_WEBKITGTK=OFF
+COG_DEPENDENCIES += wpewebkit wpebackend-fdo wayland
+endif
+
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
-- 
2.25.1
