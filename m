From: Semyon Kolganov <semenak94@mail.ru>
Date: Mon, 10 Apr 2017 14:16:48 +0300
Subject: [Buildroot] [PATCHv3] libbson: new package
In-Reply-To: <libbson: new package>
References: <libbson: new package>
Message-ID: <1491823008-28670-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>

---
Changes between v2 and v3:
 - changed cmake method to autotools
 - append licenses
 - change download from github to prepared tarball on github
 - added dependency from BR2_TOOLCHAIN_HAS_THREADS
 - added force dynamic library

Changes between v1 and v2:
 - changed license to right one
 - formatting fix
---
 package/Config.in            |  1 +
 package/libbson/Config.in    |  7 +++++++
 package/libbson/libbson.hash |  2 ++
 package/libbson/libbson.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/libbson/Config.in
 create mode 100644 package/libbson/libbson.hash
 create mode 100644 package/libbson/libbson.mk

diff --git a/package/Config.in b/package/Config.in
index c12e5b5..3683578 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1159,6 +1159,7 @@ menu "JSON/XML"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/libbson/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
diff --git a/package/libbson/Config.in b/package/libbson/Config.in
new file mode 100644
index 0000000..df28462
--- /dev/null
+++ b/package/libbson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBBSON
+	bool "libbson"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # CMakeLists forces dynamic library
+	help
+	  libbson is a library providing useful routines related to
+	  building, parsing, and iterating BSON documents.
diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
new file mode 100644
index 0000000..27abe90
--- /dev/null
+++ b/package/libbson/libbson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	aad410123e4bd8a9804c3c3d79e03344e2df104872594dc2cf19605d492944ba libbson-1.6.2.tar.gz
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
new file mode 100644
index 0000000..b2faa4b
--- /dev/null
+++ b/package/libbson/libbson.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libbson
+#
+################################################################################
+
+LIBBSON_VERSION = 1.6.2
+LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
+LIBBSON_SOURCE = libbson-$(LIBBSON_VERSION).tar.gz
+LIBBSON_LICENSE = Apache-2.0, MIT(jsonl), ISC(b64), Zlib(md5)
+LIBBSON_LICENSE_FILES = COPYING
+LIBBSON_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
