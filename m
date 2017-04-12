From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:49:59 +0200
Subject: [Buildroot] [git commit] libbson: new package
Message-ID: <20170412195137.1F7DC82239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f821d2bd0445a5642d41991842168187b4039f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
[Arnout: remove _SOURCE, fix spelling in comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add missing Config.in comment, and DEVELOPERS entry.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libbson/Config.in    |  9 +++++++++
 package/libbson/libbson.hash |  2 ++
 package/libbson/libbson.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a298669..a7e1849 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1417,6 +1417,7 @@ F:	package/yaml-cpp/
 
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
+F:	package/libbson/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
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
index 0000000..4305ca9
--- /dev/null
+++ b/package/libbson/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBBSON
+	bool "libbson"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libbson is a library providing useful routines related to
+	  building, parsing, and iterating BSON documents.
+
+comment "libbson needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..8a71fc3
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
