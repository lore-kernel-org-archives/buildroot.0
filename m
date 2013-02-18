From: Henrique Camargo <henrique@henriquecamargo.com>
Date: Mon, 18 Feb 2013 18:29:03 -0300
Subject: [Buildroot] [PATCH] json-glib: new package
Message-ID: <1361222943-1892-1-git-send-email-henrique@henriquecamargo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JSON-GLib is a library providing serialization and deserialization
support for the JavaScript Object Notation (JSON) format described by
RFC 4627.

https://live.gnome.org/JsonGlib/

Signed-off-by: Henrique Camargo <henrique@henriquecamargo.com>
---
 package/Config.in              |    1 +
 package/json-glib/Config.in    |   14 ++++++++++++++
 package/json-glib/json-glib.mk |   20 ++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/json-glib/Config.in
 create mode 100644 package/json-glib/json-glib.mk

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..4959680 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -586,6 +586,7 @@ source "package/cjson/Config.in"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/json-c/Config.in"
+source "package/json-glib/Config.in"
 source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
new file mode 100644
index 0000000..f2e3a7c
--- /dev/null
+++ b/package/json-glib/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JSON_GLIB
+	bool "json-glib"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  JSON-GLib is a library providing serialization and deserialization
+	  support for the JavaScript Object Notation (JSON) format described by
+	  RFC 4627.
+
+	  https://live.gnome.org/JsonGlib/
+
+comment "json-glib requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
new file mode 100644
index 0000000..06e33ab
--- /dev/null
+++ b/package/json-glib/json-glib.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# json-glib
+#
+#############################################################
+
+JSON_GLIB_MAJOR_VERSION = 0.14
+JSON_GLIB_MINOR_VERSION = 2
+JSON_GLIB_VERSION = $(JSON_GLIB_MAJOR_VERSION).$(JSON_GLIB_MINOR_VERSION)
+JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_MAJOR_VERSION)
+JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
+
+JSON_GLIB_INSTALL_STAGING = YES
+
+JSON_GLIB_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	host-pkgconf \
+	libglib2
+
+$(eval $(autotools-package))
-- 
1.7.10.4
