From: Elias Woods <eliaswoods@gmail.com>
Date: Mon, 17 Jan 2011 02:17:24 -0500
Subject: [Buildroot] [PATCH 1/2] Add libjson-glib to packages
Message-ID: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libjson-glib/Config.in       |    8 ++++++++
 package/libjson-glib/libjson-glib.mk |   31 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/libjson-glib/Config.in
 create mode 100644 package/libjson-glib/libjson-glib.mk

diff --git a/package/libjson-glib/Config.in b/package/libjson-glib/Config.in
new file mode 100644
index 0000000..c3ee871
--- /dev/null
+++ b/package/libjson-glib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBJSONGLIB
+	bool "libjson-glib"
+	depends on BR2_PACKAGE_LIBGLIB2 # glib2
+	help
+	Many high-level languages already provide native modules for parsing, generating and manipulating JSON data streams. JSON-GLib is a C library based on GLib and released under the terms of the GNU Lesser General Public License version 2.1. It provides a parser and a generator GObject classes and various wrappers for the complex data types employed by JSON, such as arrays and objects.
+
+comment "libjson-glib requires libglib2 to be installed"
+	depends on !BR2_PACKAGE_LIBGLIB2
diff --git a/package/libjson-glib/libjson-glib.mk b/package/libjson-glib/libjson-glib.mk
new file mode 100644
index 0000000..24e1755
--- /dev/null
+++ b/package/libjson-glib/libjson-glib.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# libjson-glib
+#
+#############################################################
+LIBJSONGLIB_VERSION_MAJOR = 0
+LIBJSONGLIB_VERSION_MINOR = 12
+LIBJSONGLIB_VERSION_MICRO = 2
+LIBJSONGLIB_VERSION = $(LIBJSONGLIB_VERSION_MAJOR).$(LIBJSONGLIB_VERSION_MINOR).$(LIBJSONGLIB_VERSION_MICRO)
+LIBJSONGLIB_SOURCE = json-glib-$(LIBJSONGLIB_VERSION).tar.bz2
+
+LIBJSONGLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(LIBJSONGLIB_VERSION_MAJOR).$(LIBJSONGLIB_VERSION_MINOR)
+
+LIBJSONGLIB_LIBTOOL_PATCH = NO
+LIBJSONGLIB_INSTALL_STAGING = YES
+LIBJSONGLIB_INSTALL_TARGET = YES
+#LIBJSONGLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+
+
+LIBJSONGLIB_CONF_OPT = --enable-shared \
+		--enable-static
+
+HOST_LIBJSONGLIB_CONF_OPT = \
+		--enable-shared \
+		--disable-static \
+		--disable-gtk-doc \
+		--enable-debug=no \
+
+LIBJSONGLIB_DEPENDENCIES = libglib2 host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,LIBJSONGLIB))
-- 
1.7.1
