From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:13 +0200
Subject: [Buildroot] [PATCH 04/16] package: add libgail package
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <952612134ccfd2f2a0206765ca396ac9c76d660c.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

This package include a patch for directfb support. This patch has been
proposed for upstream integration
(https://bugzilla.gnome.org/show_bug.cgi?id=614199).

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Config.in                                  |    1 +
 package/libgail/Config.in                          |   15 +++++++
 .../libgail-1.22.3-Relax-X11-dependencies.patch    |   42 ++++++++++++++++++++
 package/libgail/libgail.mk                         |   28 +++++++++++++
 4 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 package/libgail/Config.in
 create mode 100644 package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch
 create mode 100644 package/libgail/libgail.mk

diff --git a/package/Config.in b/package/Config.in
index fe96939..3b9a942 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -267,6 +267,7 @@ source "package/gtk2-themes/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
+source "package/libgail/Config.in"
 source "package/libglade/Config.in"
 source "package/libgtk12/Config.in"
 source "package/libgtk2/Config.in"
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
new file mode 100644
index 0000000..533fb9c
--- /dev/null
+++ b/package/libgail/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBGAIL
+	bool "libgail"
+	select BR2_PACKAGE_GTK2
+	help
+	  GAIL provides accessibility support for gtk+ and
+          libgnomecanvas by implementing AtkObjects for widgets in
+          gtk+ and libgnomecanvas. The GAIL library is a GTK+ module.
+          For example, if the module is loaded in a program which
+          calls gtk_widget_get_accessible() for a GtkEntry an instance
+          of GailEntry is returned. This module is normally used with
+          the atk-bridge GTK+ module from at-spi to allow an assistive
+          technology, e.g a screenreader, to query or drive the
+          program.
+
+          http://developer.gnome.org/projects/gap
diff --git a/package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch b/package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch
new file mode 100644
index 0000000..97e5656
--- /dev/null
+++ b/package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch
@@ -0,0 +1,42 @@
+From cca72c48b5643fa62e1d55b7b181e147f5ba7fe9 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Sun, 28 Mar 2010 21:47:38 +0200
+Subject: [PATCH] Relax X11 dependency
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ configure.in      |    4 +++-
+ gail/gailwindow.c |    2 +-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 3801655..abaf417 100644
+--- a/configure.in
++++ b/configure.in
+@@ -86,7 +86,9 @@ GTK_REQUIRED_VERSION=2.9.4
+ PKG_CHECK_MODULES(DEP, $ATK_PACKAGES >= $ATK_REQUIRED_VERSION \
+ 	$GTK_PACKAGES >= $GTK_REQUIRED_VERSION)
+ 
+-if test "$gail_native_win32" != "yes"; then
++AC_ARG_ENABLE(x, [      --disable-x     disable x11 backend ],x11_backend=no,x11_backend=yes)
++
++if test "$gail_native_win32" != "yes" -a "$x11_backend" != "no"; then
+ 
+ PKG_CHECK_MODULES(X, x11, :, [
+ # pkg-config modules not found (only present since X11R7 aka Xorg); use
+diff --git a/gail/gailwindow.c b/gail/gailwindow.c
+index 616b25e..add454b 100644
+--- a/gail/gailwindow.c
++++ b/gail/gailwindow.c
+@@ -1071,7 +1071,7 @@ gail_window_get_mdi_zorder (AtkComponent *component)
+   return get_window_zorder (widget->window);
+ }
+ 
+-#elif defined (GDK_WINDOWING_WIN32)
++#elif defined (GDK_WINDOWING_WIN32) || defined (GDK_WINDOWING_DIRECTFB)
+ 
+ static gint
+ gail_window_get_mdi_zorder (AtkComponent *component)
+-- 
+1.7.0.2
+
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
new file mode 100644
index 0000000..58ff93d
--- /dev/null
+++ b/package/libgail/libgail.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# libgail
+#
+#############################################################
+LIBGAIL_VERSION_MAJOR = 1.22
+LIBGAIL_VERSION_MINOR = 3
+LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).$(LIBGAIL_VERSION_MINOR)
+LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
+LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
+
+LIBGAIL_AUTORECONF = YES
+LIBGAIL_LIBTOOL_PATCH = NO
+LIBGAIL_INSTALL_STAGING = YES
+LIBGAIL_INSTALL_TARGET = YES
+
+LIBGAIL_CONF_OPT = --enable-shared \
+		--enable-static
+
+ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+LIBGAIL_CONF_OPT += --disable-x
+endif
+
+LIBGAIL_DEPENDENCIES = libgtk2 pango
+
+HOST_LIBGAIL_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,libgail))
-- 
1.7.0.4
