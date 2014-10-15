From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Oct 2014 14:52:23 +0200
Subject: [Buildroot] [git commit] libgtk3: new package
Message-ID: <20141015125351.F1734B2DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4ec97d505e080298c2225c123d1f3ec560018e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides Gtk+ 3.0, a graphical toolkit.

[Peter: fix Config.in deps, ensure atleast 1 backend, remove redundant info]
Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Eric: added backend support, use of pkgconf for host-libgtk3]
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/libgtk3/Config.in                          |   87 ++++++++++
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |   25 +++
 .../libgtk3-0002-fix-introspection-check.patch     |   28 ++++
 .../libgtk3/libgtk3-0003-disable-atk-bridge.patch  |   45 +++++
 package/libgtk3/libgtk3.mk                         |  169 ++++++++++++++++++++
 6 files changed, 355 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ec22c35..93e148d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -643,6 +643,7 @@ menu "Graphics"
 	source "package/libglew/Config.in"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
+	source "package/libgtk3/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
new file mode 100644
index 0000000..07e44f7
--- /dev/null
+++ b/package/libgtk3/Config.in
@@ -0,0 +1,87 @@
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
+	# atleast 1 backend must be enabled
+	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
+	       !(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	help
+	  The GTK+ version 3 graphical user interface library
+
+	  http://www.gtk.org/
+
+if BR2_PACKAGE_LIBGTK3
+
+comment "GDK backend"
+
+config BR2_PACKAGE_LIBGTK3_X11
+	bool "GDK X11 backend"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  This enables the X11 backend for GDK.
+
+config BR2_PACKAGE_LIBGTK3_WAYLAND
+	bool "GDK Wayland backend"
+	default y
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This enables the Wayland backend for GDK.
+
+config BR2_PACKAGE_LIBGTK3_BROADWAY
+	bool "GDK Broadway backend"
+	help
+	  This enables the Broadway backend for GDK, which provides support
+	  for displaying GTK+ applications in a web browser, using HTML5 and
+	  web sockets.
+
+	  For example, to run gtk3-demo on a target which IP address is
+	  192.168.0.1 and use it from a web browser, execute the following
+	  commands:
+
+	    $ broadwayd -a 192.168.0.1 -p 8080 :2 &
+	    $ export GDK_BACKEND=broadway
+	    $ export BROADWAY_DISPLAY=:2
+	    $ gtk3-demo
+
+	  Then open a web browser at address http://192.168.0.1:8080.
+	  Javascript and web sockets should be enabled.
+
+config BR2_PACKAGE_LIBGTK3_DEMO
+	bool "Install libgtk3 demo program"
+	select BR2_PACKAGE_SHARED_MIME_INFO
+	select BR2_PACKAGE_HICOLOR_ICON_THEME
+	help
+	  The GTK+ source base contains a demo program. This
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
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
new file mode 100644
index 0000000..6dede73
--- /dev/null
+++ b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
@@ -0,0 +1,25 @@
+Same patch as for systemd in commit
+http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
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
index 0000000..4c2806d
--- /dev/null
+++ b/package/libgtk3/libgtk3-0002-fix-introspection-check.patch
@@ -0,0 +1,28 @@
+Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
+
+During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolved because we
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
index 0000000..c92174f
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
index 0000000..31aa1b3
--- /dev/null
+++ b/package/libgtk3/libgtk3.mk
@@ -0,0 +1,169 @@
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
+LIBGTK3_CONF_OPTS = --disable-glibtest \
+	--enable-explicit-deps=no \
+	--enable-gtk2-dependency \
+	--disable-introspection
+
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
+
+LIBGTK3_CONF_OPTS += \
+	--enable-x11-backend \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+else
+LIBGTK3_CONF_OPTS += --disable-x11-backend
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+LIBGTK3_DEPENDENCIES += wayland libxkbcommon
+LIBGTK3_CONF_OPTS += --enable-wayland-backend
+else
+LIBGTK3_CONF_OPTS += --disable-wayland-backend
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_BROADWAY),y)
+LIBGTK3_CONF_OPTS += --enable-broadway-backend
+else
+LIBGTK3_CONF_OPTS += --disable-broadway-backend
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+LIBGTK3_CONF_OPTS += --enable-xinerama
+LIBGTK3_DEPENDENCIES += xlib_libXinerama
+else
+LIBGTK3_CONF_OPTS += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+LIBGTK3_CONF_OPTS += --enable-xrandr
+LIBGTK3_DEPENDENCIES += xlib_libXrandr
+else
+LIBGTK3_CONF_OPTS += --disable-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+LIBGTK3_DEPENDENCIES += xlib_libXcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+LIBGTK3_CONF_OPTS += --enable-xfixes
+LIBGTK3_DEPENDENCIES += xlib_libXfixes
+else
+LIBGTK3_CONF_OPTS += --disable-xfixes
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+LIBGTK3_CONF_OPTS += --enable-xcomposite
+LIBGTK3_DEPENDENCIES += xlib_libXcomposite
+else
+LIBGTK3_CONF_OPTS += --disable-xcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+LIBGTK3_CONF_OPTS += --enable-xdamage
+LIBGTK3_DEPENDENCIES += xlib_libXdamage
+else
+LIBGTK3_CONF_OPTS += --disable-xdamage
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+LIBGTK3_CONF_OPTS += --enable-xkb
+LIBGTK3_DEPENDENCIES += xlib_libxkbfile
+else
+LIBGTK3_CONF_OPTS += --disable-xkb
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK3_CONF_OPTS += --enable-cups
+LIBGTK3_DEPENDENCIES += cups
+else
+LIBGTK3_CONF_OPTS += --disable-cups
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
+LIBGTK3_DEPENDENCIES += hicolor-icon-theme shared-mime-info
+else
+define LIBGTK3_REMOVE_DEMOS
+	$(RM) $(TARGET_DIR)/usr/bin/gtk3-demo \
+		$(TARGET_DIR)/usr/bin/gtk3-demo-application
+endef
+LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_REMOVE_DEMOS
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
+LIBGTK3_CONF_OPTS += --enable-installed-tests
+else
+LIBGTK3_CONF_OPTS += --disable-installed-tests
+endif
+
+define LIBGTK3_COMPILE_GLIB_SCHEMAS
+	$(HOST_DIR)/usr/bin/glib-compile-schemas \
+		$(TARGET_DIR)/usr/share/glib-2.0/schemas
+endef
+
+LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
+
+# gtk+ >= 3.10 can build a native version of gtk-update-icon-cache if
+# --enable-gtk2-dependency=no is set when invoking './configure'.
+#
+# Unfortunately, if the target toolchain is based on uClibc, the macro
+# AM_GLIB_GNU_GETTEXT will detect the libintl built for the target and
+# will add '-lintl' to the default list of libraries for the linker (used
+# for both native and target builds).
+#
+# But no native version of libintl is available (the functions are
+# provided by glibc). So gtk-update-icon-cache will not build.
+#
+# As a workaround, we build gtk-update-icon-cache on our own, set
+# --enable-gtk2-dependency=yes and force './configure' to use our version.
+
+HOST_LIBGTK3_DEPENDENCIES = \
+	host-libglib2 \
+	host-libpng \
+	host-gdk-pixbuf \
+	host-pkgconf
+
+HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkgconf \
+		      --cflags --libs gdk-pixbuf-2.0)
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
