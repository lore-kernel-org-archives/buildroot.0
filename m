From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:45:26 +0100
Subject: [Buildroot] [git commit] brotli: new package
Message-ID: <20180324105507.5319881524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f634160b2a106f7e34b4bb018b34e77c8dda2a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the brotli package to Buildroot. This is needed by woff2, which in
turn is needed by webkitgtk from version 2.20.0 onwards. WebKitGTK+ used
to bundle a copy of the library, but it stopped doing so now that the
upstream has started making releases.

[Peter: fix license hash]
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/brotli/Config.in   | 12 ++++++++++++
 package/brotli/brotli.hash |  5 +++++
 package/brotli/brotli.mk   | 17 +++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1faefc45fc..2d5f2108a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -62,6 +62,7 @@ F:	package/setools/
 F:	package/sngrep/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
+F:	package/brotli/
 F:	package/libepoxy/
 F:	package/webkitgtk/
 
diff --git a/package/Config.in b/package/Config.in
index 58dfd6306d..26ded5ebb2 100644
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
index 0000000000..954d44eb70
--- /dev/null
+++ b/package/brotli/brotli.hash
@@ -0,0 +1,5 @@
+# Locally generated:
+sha512  93adcf437d730ac403e444285ac8aefbb2c8a6b5e1b064e8ee33684c067287a8159e0ee73d2217c167881e87da73fa494792d963a15508fd42b2ac4a5b52823c  v1.0.3.tar.gz
+
+# Hash for license files:
+sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
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
