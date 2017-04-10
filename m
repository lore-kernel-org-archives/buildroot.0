From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:59:15 +0200
Subject: [Buildroot] [PATCH] libbson: new package
Message-ID: <20170410145915.22814-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam <semenak94@mail.ru>

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
[Arnout: remove _SOURCE, fix spelling in comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in            |  1 +
 package/libbson/Config.in    |  6 ++++++
 package/libbson/libbson.hash |  2 ++
 package/libbson/libbson.mk   | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/libbson/Config.in
 create mode 100644 package/libbson/libbson.hash
 create mode 100644 package/libbson/libbson.mk

diff --git a/package/Config.in b/package/Config.in
index c12e5b56f9..3683578f1e 100644
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
index 0000000000..719271c732
--- /dev/null
+++ b/package/libbson/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBBSON
+	bool "libbson"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libbson is a library providing useful routines related to
+	  building, parsing, and iterating BSON documents.
diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
new file mode 100644
index 0000000000..27abe90bfd
--- /dev/null
+++ b/package/libbson/libbson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	aad410123e4bd8a9804c3c3d79e03344e2df104872594dc2cf19605d492944ba libbson-1.6.2.tar.gz
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
new file mode 100644
index 0000000000..8a71fc394c
--- /dev/null
+++ b/package/libbson/libbson.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libbson
+#
+################################################################################
+
+LIBBSON_VERSION = 1.6.2
+LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
+LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
+LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
+LIBBSON_CONF_OPTS = \
+	--disable-tests \
+	--disable-examples \
+	--disable-man-pages \
+	--disable-html-docs
+
+LIBBSON_INSTALL_STAGING = YES
+
+# Also has CMake support, but that forces shared+static libs and static
+# lib has a different name.
+$(eval $(autotools-package))
-- 
2.11.0
