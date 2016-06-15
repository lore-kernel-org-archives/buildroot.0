From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 15:17:46 +0200
Subject: [Buildroot] [PATCH 1/3] libfastjson: new package
Message-ID: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libfastjson is a fork of json-c, and a dependency of newer versions of
rsyslog.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |  1 +
 package/libfastjson/Config.in        | 16 ++++++++++++++++
 package/libfastjson/libfastjson.hash |  2 ++
 package/libfastjson/libfastjson.mk   | 15 +++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libfastjson/Config.in
 create mode 100644 package/libfastjson/libfastjson.hash
 create mode 100644 package/libfastjson/libfastjson.mk

diff --git a/package/Config.in b/package/Config.in
index ff08f27..0431dec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1059,6 +1059,7 @@ menu "JSON/XML"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
diff --git a/package/libfastjson/Config.in b/package/libfastjson/Config.in
new file mode 100644
index 0000000..5a94113
--- /dev/null
+++ b/package/libfastjson/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBFASTJSON
+	bool "libfastjson"
+	# uses __sync_val_compare_and_swap_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	help
+	  Libfastjson - A fast json library for C
+
+	  Libfastjson is a fork from json-c. The aim of this project
+	  is not to provide a slightly modified clone of json-c.
+	  Its aim is to provide:
+
+	  - a small library with essential json handling functions
+	  - sufficiently good json support (not 100% standards compliant)
+	  - be very fast in processing
+
+	  https://github.com/rsyslog/libfastjson/
diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
new file mode 100644
index 0000000..8531dac
--- /dev/null
+++ b/package/libfastjson/libfastjson.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f  libfastjson-v0.99.2.tar.gz
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
new file mode 100644
index 0000000..ec5390c
--- /dev/null
+++ b/package/libfastjson/libfastjson.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libfastjson
+#
+################################################################################
+
+LIBFASTJSON_VERSION = v0.99.2
+LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
+LIBFASTJSON_INSTALL_STAGING = YES
+# From git
+LIBFASTJSON_AUTORECONF = YES
+LIBFASTJSON_LICENSE = MIT
+LIBFASTJSON_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.0
