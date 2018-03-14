From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 14 Mar 2018 02:29:47 +0200
Subject: [Buildroot] [PATCH/next 1/3] brotli: new package
In-Reply-To: <20180314002949.109236-1-aperez@igalia.com>
References: <20180314002949.109236-1-aperez@igalia.com>
Message-ID: <20180314002949.109236-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the brotli package to Buildroot. This is needed by woff2, which in
turn is needed by webkitgtk from version 2.20.0 onwards. WebKitGTK+ used
to bundle a copy of the library, but it stopped doing so now that the
upstream has started making releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/brotli/Config.in   | 12 ++++++++++++
 package/brotli/brotli.hash |  5 +++++
 package/brotli/brotli.mk   | 17 +++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/brotli/Config.in
 create mode 100644 package/brotli/brotli.hash
 create mode 100644 package/brotli/brotli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e712..f3d265e421 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -62,6 +62,7 @@ F:	package/setools/
 F:	package/sngrep/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
+F:	package/brotli/
 F:	package/libepoxy/
 F:	package/webkitgtk/
 
diff --git a/package/Config.in b/package/Config.in
index 449ffcc47b..96d7ddb576 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -63,6 +63,7 @@ menu "Audio and video applications"
 endmenu
 
 menu "Compressors and decompressors"
+	source "package/brotli/Config.in"
 	source "package/bzip2/Config.in"
 	source "package/gzip/Config.in"
 	source "package/lz4/Config.in"
diff --git a/package/brotli/Config.in b/package/brotli/Config.in
new file mode 100644
index 0000000000..e40f5b6b9f
--- /dev/null
+++ b/package/brotli/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BROTLI
+	bool "brotli"
+	help
+	  Generic-purpose lossless compression library. The algorithm
+	  compresses data using a combination of a modern variant of
+	  the LZ77 algorithm, Huffman coding and 2nd order context
+	  modeling, with a compression ratio comparable to the best
+	  currently available general-purpose compression methods. It
+	  is similar in speed with deflate but offers more dense
+	  compression.
+
+	  https://github.com/google/brotli
diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
new file mode 100644
index 0000000000..7bdefcb7dd
--- /dev/null
+++ b/package/brotli/brotli.hash
@@ -0,0 +1,5 @@
+# Locally generated:
+sha512  93adcf437d730ac403e444285ac8aefbb2c8a6b5e1b064e8ee33684c067287a8159e0ee73d2217c167881e87da73fa494792d963a15508fd42b2ac4a5b52823c  v1.0.3.tar.gz
+
+# Hash for license files:
+sha512  16d7a62757f9854cd0ff9750eb0b374a1360deded0ba1646fde430f79a8f7c36a85f4884faaf1ea90db02537cd8d8c314cfcbcf492be25af24e1e77aa5919ebb  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
new file mode 100644
index 0000000000..cf1e811543
--- /dev/null
+++ b/package/brotli/brotli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# brotli
+#
+################################################################################
+
+BROTLI_VERSION = 1.0.3
+BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
+BROTLI_SITE = https://github.com/google/brotli/archive
+BROTLI_LICENSE = MIT
+BROTLI_LICENSE_FILES = LICENSE
+BROTLI_INSTALL_STAGING = YES
+BROTLI_CONF_OPTS = \
+	-DBROTLI_DISABLE_TESTS=ON \
+	-DBROTLI_BUNDLED_MODE=OFF
+
+$(eval $(cmake-package))
-- 
2.16.2
