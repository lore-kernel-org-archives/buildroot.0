From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:14:17 +0100
Subject: [Buildroot] [git commit] connman-gtk: new package
Message-ID: <20160320211442.62A36800B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a7bbfae962e4c1cfd6f210f546c11f6558d6690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was added to the networking category close to connman for the ability
to tweak connman features without going around (i.e. add support for
wifi and so on).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/connman-gtk/Config.in        | 20 ++++++++++++++++++++
 package/connman-gtk/connman-gtk.hash |  2 ++
 package/connman-gtk/connman-gtk.mk   | 15 +++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a3c2a65..323407f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1348,6 +1348,7 @@ menu "Networking applications"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
+	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
diff --git a/package/connman-gtk/Config.in b/package/connman-gtk/Config.in
new file mode 100644
index 0000000..c7857d0
--- /dev/null
+++ b/package/connman-gtk/Config.in
@@ -0,0 +1,20 @@
+comment "connman-gtk needs libgtk3 and a toolchain w/ wchar, threads, resolver, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3
+
+config BR2_PACKAGE_CONNMAN_GTK
+	bool "connman-gtk"
+	depends on BR2_USE_WCHAR # libglib2, connman
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, connman
+	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS # connman
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # connman
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_CONNMAN
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GTK GUI for ConnMan.
+
+	  https://github.com/jgke/connman-gtk
diff --git a/package/connman-gtk/connman-gtk.hash b/package/connman-gtk/connman-gtk.hash
new file mode 100644
index 0000000..034064e
--- /dev/null
+++ b/package/connman-gtk/connman-gtk.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9e9008d40ada97aa20d627b7ad966e9a2ae69afcae3971b1b29a225cf7110e27	connman-gtk-1.1.tar.bz2
diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
new file mode 100644
index 0000000..570c3c8
--- /dev/null
+++ b/package/connman-gtk/connman-gtk.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# connman-gtk
+#
+################################################################################
+
+CONNMAN_GTK_VERSION = 1.1
+CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONNMAN_GTK_VERSION)
+CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
+CONNMAN_GTK_INSTALL_STAGING = YES
+CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3
+CONNMAN_GTK_LICENSE = GPLv2+
+CONNMAN_GTK_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
