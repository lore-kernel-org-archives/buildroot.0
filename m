From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  8 Jun 2018 15:59:28 -0700
Subject: [Buildroot] [RFC PATCH 4/8] libgtk3: remove patch to disable
 atk-bridge support
In-Reply-To: <20180608225932.13127-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
Message-ID: <20180608225932.13127-5-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libgtk3/0003-disable-atk-bridge.patch | 45 -------------------
 package/libgtk3/Config.in                     |  1 +
 package/libgtk3/libgtk3.mk                    |  3 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/libgtk3/0003-disable-atk-bridge.patch

diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
deleted file mode 100644
index c92174f400..0000000000
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Remove atk-bridge support.
-
-atk-bridge doesn't seem useful for now in Buildroot and requires to
-add two new packages just for it: at-spi2-core and at-spi2-atk.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1349,11 +1349,7 @@
- # Check for Accessibility Toolkit flags
- ########################################
-
--if test x$enable_x11_backend = xyes; then
--   ATK_PACKAGES="atk atk-bridge-2.0"
--else
--   ATK_PACKAGES="atk"
--fi
-+ATK_PACKAGES="atk"
-
- PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
-
---- a/gtk/a11y/gtkaccessibility.c
-+++ b/gtk/a11y/gtkaccessibility.c
-@@ -37,10 +37,6 @@
- #include <gtk/gtkcombobox.h>
- #include <gtk/gtkaccessible.h>
-
--#ifdef GDK_WINDOWING_X11
--#include <atk-bridge.h>
--#endif
--
- static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
-                                          guint                  n_param_values,
-                                          const GValue          *param_values,
-@@ -987,9 +983,5 @@
-   _gtk_accessibility_override_atk_util ();
-   do_window_event_initialization ();
-
--#ifdef GDK_WINDOWING_X11
--  atk_bridge_adaptor_init (NULL, NULL);
--#endif
--
-   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
- }
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 12e64707bd..f14b9deaf8 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 1b85d00aae..e3c3dc5237 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -26,7 +26,8 @@ LIBGTK3_CONF_OPTS = \
 LIBGTK3_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf libepoxy
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk at-spi2-atk libglib2 \
+		       cairo pango gdk-pixbuf libepoxy
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
-- 
2.17.1
