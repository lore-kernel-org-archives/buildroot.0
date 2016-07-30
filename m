From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:51:39 +0200
Subject: [Buildroot] [git commit] gtksourceview: new package
Message-ID: <20160730135209.7FD1580F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8a52bceaed96d969b5717f9afb1bd05b34bfd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GtkSourceView is a portable C library that extends the
standard GTK+ framework for multiline text editing with
support for configurable syntax highlighting, unlimited
undo/redo, search and replace, a completion framework,
printing and other features typical of a source code editor.

https://projects.gnome.org/gtksourceview

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas:
 - simplify the Config.in by using "depends on BR2_PACKAGE_LIBGTK3"
   instead of a select. It is pretty obvious that Gtk is needed if you
   want to use gtksourceview.
 - license is LGPLv2.1+, not LGPLv2+.
 - change location in package/Config.in, gtksourceview is a library,
   it should not go under "Development tools".]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/gtksourceview/Config.in          | 12 ++++++++++++
 package/gtksourceview/gtksourceview.hash |  2 ++
 package/gtksourceview/gtksourceview.mk   | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5584d36..875d755 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -938,6 +938,7 @@ menu "Graphics"
 	source "package/granite/Config.in"
 	source "package/graphite2/Config.in"
 	source "package/gtkmm3/Config.in"
+	source "package/gtksourceview/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
diff --git a/package/gtksourceview/Config.in b/package/gtksourceview/Config.in
new file mode 100644
index 0000000..e87969b
--- /dev/null
+++ b/package/gtksourceview/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GTKSOURCEVIEW
+	bool "gtksourceview"
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GtkSourceView is a portable C library that extends the
+	  standard GTK+ framework for multiline text editing with
+	  support for configurable syntax highlighting, unlimited
+	  undo/redo, search and replace, a completion framework,
+	  printing and other features typical of a source code editor.
+
+	  https://projects.gnome.org/gtksourceview
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
index 0000000..601d6e0
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
+GTKSOURCEVIEW_LICENSE = LGPLv2.1+
+GTKSOURCEVIEW_LICENSE_FILES = COPYING
+GTKSOURCEVIEW_INSTALL_STAGING = YES
+GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk3
+
+$(eval $(autotools-package))
