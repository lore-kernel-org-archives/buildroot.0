From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:35:03 +0200
Subject: [Buildroot] [PATCH 08/12] package: add gdk-pixbuf package (splitted
	out from GTK+)
In-Reply-To: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bb915b1d3583cb79b1f658886cf8d61471f743f0.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Config.in                |    1 +
 package/gdk-pixbuf/Config.in     |   12 +++++++++
 package/gdk-pixbuf/gdk-pixbuf.mk |   51 ++++++++++++++++++++++++++++++++++++++
 package/libgtk2/Config.in        |    1 +
 package/libgtk2/libgtk2.mk       |    6 +---
 5 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 package/gdk-pixbuf/Config.in
 create mode 100644 package/gdk-pixbuf/gdk-pixbuf.mk

diff --git a/package/Config.in b/package/Config.in
index 3b6cd19..3693603 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -264,6 +264,7 @@ source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libgail/Config.in"
 source "package/libglade/Config.in"
+source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
 source "package/librsvg/Config.in"
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
new file mode 100644
index 0000000..384f076
--- /dev/null
+++ b/package/gdk-pixbuf/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GDK_PIXBUF
+	bool "gdk-pixbuf"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	help
+
+	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
+	  and the GLib, to integrate well with GNOME applications.
+
+	  http://www.gtk.org/
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
new file mode 100644
index 0000000..4c3e108
--- /dev/null
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -0,0 +1,51 @@
+#############################################################
+#
+# gdk-pixbuf
+#
+#############################################################
+
+GDK_PIXBUF_MAJOR_VERSION = 2.22
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).0
+GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.bz2
+GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
+GDK_PIXBUF_INSTALL_STAGING = YES
+
+GDK_PIXBUF_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
+	gio_can_sniff=no
+
+GDK_PIXBUF_CONF_OPT = --disable-glibtest
+
+ifneq ($(BR2_LARGEFILE),y)
+GDK_PIXBUF_CONF_OPT += --disable-largefile
+endif
+
+ifneq ($(BR2_PACKAGE_LIBPNG),y)
+GDK_PIXBUF_CONF_OPT += --without-libpng
+else
+GDK_PIXBUF_DEPENDENCIES += libpng
+endif
+
+ifneq ($(BR2_PACKAGE_JPEG),y)
+GDK_PIXBUF_CONF_OPT += --without-libjpeg
+else
+GDK_PIXBUF_DEPENDENCIES += jpeg
+endif
+
+ifneq ($(BR2_PACKAGE_TIFF),y)
+GDK_PIXBUF_CONF_OPT += --without-libtiff
+else
+GDK_PIXBUF_DEPENDENCIES += tiff
+endif
+
+GDK_PIXBUF_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 libiconv
+
+$(eval $(call AUTOTARGETS,package,gdk-pixbuf))
+
+HOST_GDK_PIXBUF_CONF_OPT = \
+	--without-libjpeg \
+	--without-libtiff
+
+HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng
+
+$(eval $(call AUTOTARGETS,package,gdk-pixbuf,host))
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index bc4ca9d..bb01bef 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_GDK_PIXBUF
 	# libgtk2 on DirectFB is deprecated because it is no longer
 	# supported in recent versions of Gtk. We will remove support
 	# for Gtk over DirectFB in the next Buildroot version unless
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d669622..d6f2324 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -72,7 +72,7 @@ LIBGTK2_CONF_OPT = --enable-shared \
 		--enable-explicit-deps=no \
 		--disable-debug
 
-LIBGTK2_DEPENDENCIES = host-pkg-config host-libgtk2 libglib2 cairo pango atk
+LIBGTK2_DEPENDENCIES = host-pkg-config host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
@@ -133,7 +133,7 @@ LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK_POST_INSTALL_TWEAKS
 # gtk-update-icon-cache, which are the host tools needed to build Gtk
 # for the target.
 
-HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng
+HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
 HOST_LIBGTK2_AUTORECONF = YES
 HOST_LIBGTK2_CONF_OPT = \
 		--disable-static \
@@ -151,12 +151,10 @@ endef
 HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
 
 define HOST_LIBGTK2_BUILD_CMDS
- $(HOST_MAKE_ENV) make -C $(@D)/gdk-pixbuf
  $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
 endef
 
 define HOST_LIBGTK2_INSTALL_CMDS
- $(HOST_MAKE_ENV) make -C $(@D)/gdk-pixbuf install
  cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
 endef
 
-- 
1.7.0.4
