From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jul 2016 09:16:20 +0200
Subject: [Buildroot] [PATCH 1/1] gtksourceview: new package
Message-ID: <1469776580-30311-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GtkSourceView is a portable C library that extends the
standard GTK+ framework for multiline text editing with
support for configurable syntax highlighting, unlimited
undo/redo, search and replace, a completion framework,
printing and other features typical of a source code editor.

https://projects.gnome.org/gtksourceview

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                        |  1 +
 package/gtksourceview/Config.in          | 32 ++++++++++++++++++++++++++++++++
 package/gtksourceview/gtksourceview.hash |  2 ++
 package/gtksourceview/gtksourceview.mk   | 17 +++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/gtksourceview/Config.in
 create mode 100644 package/gtksourceview/gtksourceview.hash
 create mode 100644 package/gtksourceview/gtksourceview.mk

diff --git a/package/Config.in b/package/Config.in
index ab9c42f..cf1d54e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ menu "Development tools"
 	source "package/git/Config.in"
 	source "package/gperf/Config.in"
 	source "package/grep/Config.in"
+	source "package/gtksourceview/Config.in"
 	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
diff --git a/package/gtksourceview/Config.in b/package/gtksourceview/Config.in
new file mode 100644
index 0000000..be7536b
--- /dev/null
+++ b/package/gtksourceview/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_GTKSOURCEVIEW
+	bool "gtksourceview"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		BR2_PACKAGE_HAS_LIBGL # libgtk3
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGTK3
+	help
+	  GtkSourceView is a portable C library that extends the
+	  standard GTK+ framework for multiline text editing with
+	  support for configurable syntax highlighting, unlimited
+	  undo/redo, search and replace, a completion framework,
+	  printing and other features typical of a source code editor.
+
+	  https://projects.gnome.org/gtksourceview
+
+comment "gtksourceview needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
+
+comment "gtksourceview needs an OpenGL or OpenGL EGL backend provided by mesa3d"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
new file mode 100644
index 0000000..1fd22af
--- /dev/null
+++ b/package/gtksourceview/gtksourceview.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.21/gtksourceview-3.21.3.sha256sum:
+sha256	12ea703e1903215629580ddab7751e419bf73a8aacfbbc53c75dc1b9cb0dfba7	gtksourceview-3.21.3.tar.xz
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
new file mode 100644
index 0000000..9424418
--- /dev/null
+++ b/package/gtksourceview/gtksourceview.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gtksourceview
+#
+################################################################################
+
+GTKSOURCEVIEW_VERSION_MAJOR = 3.21
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).3
+GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
+GTKSOURCEVIEW_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
+GTKSOURCEVIEW_LICENSE = LGPLv2+
+GTKSOURCEVIEW_LICENSE_FILES = COPYING
+GTKSOURCEVIEW_INSTALL_STAGING = YES
+GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk3
+
+$(eval $(autotools-package))
-- 
2.7.4
