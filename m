From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:00:02 +0100
Subject: [Buildroot] [git commit] json-glib: new package
Message-ID: <20130318210058.81D659B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a2a3c9cd6a873a0ca190c9f20e9a42a9d1df58a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JSON-GLib is a library providing serialization and deserialization
support for the JavaScript Object Notation (JSON) format described by
RFC 4627.

https://live.gnome.org/JsonGlib/

[Peter: add license info, tweak help text]
Signed-off-by: Henrique Camargo <henrique@henriquecamargo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/json-glib/Config.in    |   14 ++++++++++++++
 package/json-glib/json-glib.mk |   21 +++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 10ce824..167eb5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -597,6 +597,7 @@ source "package/cjson/Config.in"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/json-c/Config.in"
+source "package/json-glib/Config.in"
 source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
new file mode 100644
index 0000000..3ebc76d
--- /dev/null
+++ b/package/json-glib/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JSON_GLIB
+	bool "json-glib"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  JSON-GLib is a library providing serialization and
+	  deserialization support for the JavaScript Object Notation
+	  (JSON) format described by RFC 4627.
+
+	  https://live.gnome.org/JsonGlib/
+
+comment "json-glib requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
new file mode 100644
index 0000000..4e3f987
--- /dev/null
+++ b/package/json-glib/json-glib.mk
@@ -0,0 +1,21 @@
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
+JSON_GLIB_LICENSE = LGPLv2.1+
+JSON_GLIB_LICENSE_FILES = COPYING
+JSON_GLIB_INSTALL_STAGING = YES
+
+JSON_GLIB_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	host-pkgconf \
+	libglib2
+
+$(eval $(autotools-package))
