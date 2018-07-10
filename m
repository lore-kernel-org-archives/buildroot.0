From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 10 Jul 2018 16:42:09 -0700
Subject: [Buildroot] [PATCH v6 1/4] libgtk3: convert atk-bridge to optional
 dependency
In-Reply-To: <20180710234212.4297-1-joseph.kogut@gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
Message-ID: <20180710234212.4297-2-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 ...3-convert-atk-bridge-to-optional-dep.patch | 76 +++++++++++++++++++
 package/libgtk3/0003-disable-atk-bridge.patch | 45 -----------
 package/libgtk3/libgtk3.mk                    |  4 +
 3 files changed, 80 insertions(+), 45 deletions(-)
 create mode 100644 package/libgtk3/0003-convert-atk-bridge-to-optional-dep.patch
 delete mode 100644 package/libgtk3/0003-disable-atk-bridge.patch

diff --git a/package/libgtk3/0003-convert-atk-bridge-to-optional-dep.patch b/package/libgtk3/0003-convert-atk-bridge-to-optional-dep.patch
new file mode 100644
index 0000000000..d92bc96d5e
--- /dev/null
+++ b/package/libgtk3/0003-convert-atk-bridge-to-optional-dep.patch
@@ -0,0 +1,76 @@
+From 83aaf47828d40dbafc315c5184ff62fe9914e80a Mon Sep 17 00:00:00 2001
+From: Joseph Kogut <joseph.kogut@gmail.com>
+Date: Thu, 21 Jun 2018 10:55:04 -0700
+Subject: [PATCH] convert atk-bridge to optional dep
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ configure                   | 2 +-
+ configure.ac                | 9 ++++++---
+ gtk/a11y/gtkaccessibility.c | 4 ++--
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index 9a68486..6504451 100755
+--- a/configure
++++ b/configure
+@@ -27037,7 +27037,7 @@ $as_echo "yes" >&6; }
+ fi
+ 
+ GTK_PACKAGES="atk >= 2.15.1 cairo >= 1.14.0 cairo-gobject >= 1.14.0 gdk-pixbuf-2.0 >= 2.30.0 gio-2.0 >= 2.49.4"
+-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= 1.0"
++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $ATK_BRIDGE_PACKAGE $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= 1.0"
+ if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
+   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
+ fi
+diff --git a/configure.ac b/configure.ac
+index fef0ece..ddb4e04 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1394,15 +1394,18 @@ AC_SUBST(GDK_DEP_CFLAGS)
+ ########################################
+ 
+ if test x$enable_x11_backend = xyes; then
+-   ATK_PACKAGES="atk atk-bridge-2.0"
+-else
+    ATK_PACKAGES="atk"
++   PKG_CHECK_MODULES(ATK_BRIDGE, atk-bridge-2.0,
++      AC_DEFINE([HAVE_ATK_BRIDGE], [1], [Define to 1 if atk-bridge is available])
++      ATK_BRIDGE_PACKAGE="atk-bridge-2.0",
++      []
++   )
+ fi
+ 
+ PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
+ 
+ GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
+-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version"
++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $ATK_BRIDGE_PACKAGE $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version"
+ if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
+   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
+ fi
+diff --git a/gtk/a11y/gtkaccessibility.c b/gtk/a11y/gtkaccessibility.c
+index 7f0e520..f2ef2eb 100644
+--- a/gtk/a11y/gtkaccessibility.c
++++ b/gtk/a11y/gtkaccessibility.c
+@@ -37,7 +37,7 @@
+ #include <gtk/gtktogglebutton.h>
+ #include <gtk/gtkaccessible.h>
+ 
+-#ifdef GDK_WINDOWING_X11
++#ifdef HAVE_ATK_BRIDGE
+ #include <atk-bridge.h>
+ #endif
+ 
+@@ -988,7 +988,7 @@ _gtk_accessibility_init (void)
+   _gtk_accessibility_override_atk_util ();
+   do_window_event_initialization ();
+ 
+-#ifdef GDK_WINDOWING_X11
++#ifdef HAVE_ATK_BRIDGE
+   atk_bridge_adaptor_init (NULL, NULL);
+ #endif
+ 
+-- 
+2.17.1
+
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
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 1b85d00aae..75624a4203 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -31,6 +31,10 @@ LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pi
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
 
+ifeq ($(BR2_PACKAGE_AT_SPI2_ATK),y)
+LIBGTK3_DEPENDENCIES += at-spi2-atk
+endif
+
 LIBGTK3_CONF_OPTS += \
 	--enable-x11-backend \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-- 
2.18.0
