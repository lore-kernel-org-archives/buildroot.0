From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri,  1 Aug 2014 03:33:46 +0200
Subject: [Buildroot] [PATCH v4 1/3] libgtk3: new package
In-Reply-To: <1406856828-17350-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1406856828-17350-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1406856828-17350-2-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - add a patch to remove atk-bridge support, so we no longer need
    at-spi2-core and at-spi2-atk.
  - change the way we check for introspection to fix autoreconf error
    (Eric)
  - remove unnecessary extra definitions

Changes v3 -> v4:
  - fix typo and formatting (Thomas)
  - add missing description + SoB in no-gtk-doc patch (Thomas)
---
 package/Config.in                                  |   1 +
 package/libgtk3/Config.in                          |  46 +++++++
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |  25 ++++
 .../libgtk3-0002-fix-introspection-check.patch     |  28 +++++
 .../libgtk3/libgtk3-0003-disable-atk-bridge.patch  |  45 +++++++
 package/libgtk3/libgtk3.mk                         | 136 +++++++++++++++++++++
 6 files changed, 281 insertions(+)
 create mode 100644 package/libgtk3/Config.in
 create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 create mode 100644 package/libgtk3/libgtk3-0002-fix-introspection-check.patch
 create mode 100644 package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
 create mode 100644 package/libgtk3/libgtk3.mk

diff --git a/package/Config.in b/package/Config.in
index 8e1c391..853851f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -610,6 +610,7 @@ menu "Graphics"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
 	source "package/libgtk2/Config.in"
+	source "package/libgtk3/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
new file mode 100644
index 0000000..47b1ac1
--- /dev/null
+++ b/package/libgtk3/Config.in
@@ -0,0 +1,46 @@
+config BR2_PACKAGE_LIBGTK3
+	bool "libgtk3"
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PS
+	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXI # required for building X11 backend
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	help
+	  The GTK+ version 3 graphical user interface library
+
+	  http://www.gtk.org/
+
+if BR2_PACKAGE_LIBGTK3
+
+config BR2_PACKAGE_LIBGTK3_DEMO
+	bool "Install libgtk3 demo program"
+	help
+	  The GTK+ source base contains demo programs. This
+	  option allows to install this program to the target.
+
+config BR2_PACKAGE_LIBGTK3_TESTS
+	bool "Install libgtk3 tests"
+	help
+	  The GTK+ source base contains tests. This option
+	  allows to install them to the target.
+
+endif
+
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
new file mode 100644
index 0000000..926a263
--- /dev/null
+++ b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
@@ -0,0 +1,25 @@
+Same patch as for systemd in commit
+7144f2f04b705538a893e538a6b851f536f433b6:
+
+Fix deactivation of gtk-doc
+
+The tarball contains the Makefile for building documentation with gtk-doc,
+Unfortunately the AM_CONDITIONAL variable is not the correct one, which
+results in an error when running autoreconf.
+
+This patch fixes this issue.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/gtk-doc.make
++++ b/gtk-doc.make
+@@ -267,7 +267,7 @@
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
diff --git a/package/libgtk3/libgtk3-0002-fix-introspection-check.patch b/package/libgtk3/libgtk3-0002-fix-introspection-check.patch
new file mode 100644
index 0000000..5b56b3a
--- /dev/null
+++ b/package/libgtk3/libgtk3-0002-fix-introspection-check.patch
@@ -0,0 +1,28 @@
+Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+
+During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolve because we
+don't have introspection which provides its custom m4 macro. Reconfigure fails
+with:
+
+gdk/Makefile.am:196: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+gtk/Makefile.am:1347: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+
+We avoid to add a copy of introspection.m4 in the m4 directory of libgtk3 by
+adding a check, as performed in Systemd.
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -1621,7 +1621,10 @@
+ # GObject introspection
+ ##################################################
+ 
+-GOBJECT_INTROSPECTION_CHECK(introspection_required_version)
++m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
++         [GOBJECT_INTROSPECTION_CHECK(introspection_required_version)],
++         [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
++          enable_introspection=no])
+ 
+ ##################################################
+ # colord module
diff --git a/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch b/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
new file mode 100644
index 0000000..30ff92d
--- /dev/null
+++ b/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
@@ -0,0 +1,45 @@
+Remove atk-bridge support.
+
+atk-bridge doesn't seem useful for now in Buildroot and requires to
+add two new packages just for it: at-spi2-core and at-spi2-atk.
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -1349,11 +1349,7 @@
+ # Check for Accessibility Toolkit flags
+ ########################################
+ 
+-if test x$enable_x11_backend = xyes; then
+-   ATK_PACKAGES="atk atk-bridge-2.0"
+-else
+-   ATK_PACKAGES="atk"
+-fi
++ATK_PACKAGES="atk"
+ 
+ PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
+ 
+--- a/gtk/a11y/gtkaccessibility.c
++++ b/gtk/a11y/gtkaccessibility.c
+@@ -37,10 +37,6 @@
+ #include <gtk/gtkcombobox.h>
+ #include <gtk/gtkaccessible.h>
+ 
+-#ifdef GDK_WINDOWING_X11
+-#include <atk-bridge.h>
+-#endif
+-
+ static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
+                                          guint                  n_param_values,
+                                          const GValue          *param_values,
+@@ -987,9 +983,5 @@
+   _gtk_accessibility_override_atk_util ();
+   do_window_event_initialization ();
+ 
+-#ifdef GDK_WINDOWING_X11
+-  atk_bridge_adaptor_init (NULL, NULL);
+-#endif
+-
+   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
+ }
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
new file mode 100644
index 0000000..62aacd5
--- /dev/null
+++ b/package/libgtk3/libgtk3.mk
@@ -0,0 +1,136 @@
+################################################################################
+#
+# libgtk3
+#
+################################################################################
+
+LIBGTK3_VERSION_MAJOR = 3.12
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
+LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
+LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_LICENSE = LGPLv2+
+LIBGTK3_LICENSE_FILES = COPYING
+LIBGTK3_INSTALL_STAGING = YES
+LIBGTK3_AUTORECONF = YES
+
+LIBGTK3_CONF_ENV = \
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
+
+LIBGTK3_CONF_OPT = --disable-glibtest \
+	--enable-explicit-deps=no \
+	--enable-gtk2-dependency \
+	--disable-debug \
+	--disable-introspection
+
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 libglib2 cairo pango atk \
+	gdk-pixbuf
+
+# Xorg dependencies
+LIBGTK3_CONF_OPT += --with-x \
+	--enable-x11-backend \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender \
+		xlib_libXi
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+LIBGTK3_CONF_OPT += --enable-xinerama
+LIBGTK3_DEPENDENCIES += xlib_libXinerama
+else
+LIBGTK3_CONF_OPT += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+LIBGTK3_CONF_OPT += --enable-xrandr
+LIBGTK3_DEPENDENCIES += xlib_libXrandr
+else
+LIBGTK3_CONF_OPT += --disable-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+LIBGTK3_DEPENDENCIES += xlib_libXcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+LIBGTK3_CONF_OPT += --enable-xfixes
+LIBGTK3_DEPENDENCIES += xlib_libXfixes
+else
+LIBGTK3_CONF_OPT += --disable-xfixes
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+LIBGTK3_CONF_OPT += --enable-xcomposite
+LIBGTK3_DEPENDENCIES += xlib_libXcomposite
+else
+LIBGTK3_CONF_OPT += --disable-xcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+LIBGTK3_CONF_OPT += --enable-xdamage
+LIBGTK3_DEPENDENCIES += xlib_libXdamage
+else
+LIBGTK3_CONF_OPT += --disable-xdamage
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+LIBGTK3_CONF_OPT += --enable-xkb
+LIBGTK3_DEPENDENCIES += xlib_libxkbfile
+else
+LIBGTK3_CONF_OPT += --disable-xkb
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK3_CONF_OPT += --enable-cups
+LIBGTK3_DEPENDENCIES += cups
+else
+LIBGTK3_CONF_OPT += --disable-cups
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),)
+define LIBGTK3_POST_INSTALL_TWEAKS
+	rm -rf $(TARGET_DIR)/usr/bin/gtk3-demo \
+		$(TARGET_DIR)/usr/bin/gtk3-demo-application
+endef
+
+LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_POST_INSTALL_TWEAKS
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
+LIBGTK3_CONF_OPT += --enable-installed-tests
+else
+LIBGTK3_CONF_OPT += --disable-installed-tests
+endif
+
+# We do not build a full version of libgtk3 for the host, because that
+# requires compiling Cairo, Pango, ATK and X.org for the host.
+# Therefore, we hack the build to only build gdk-pixbuf-from-source and
+# gtk-update-icon-cache, which are the host tools needed to build Gtk
+# for the target.
+
+HOST_LIBGTK3_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
+
+HOST_LIBGTK3_CFLAGS = \
+	$(shell $(HOST_CONFIGURE_OPTS) $(PKG_CONFIG_HOST_BINARY) \
+		--cflags --libs gdk-pixbuf-2.0)
+
+define HOST_LIBGTK3_CONFIGURE_CMDS
+	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
+	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
+	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
+endef
+
+define HOST_LIBGTK3_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/gtk/updateiconcache.c \
+		$(HOST_LIBGTK3_CFLAGS) \
+		-o $(@D)/gtk/gtk-update-icon-cache
+endef
+
+define HOST_LIBGTK3_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
+		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.1
