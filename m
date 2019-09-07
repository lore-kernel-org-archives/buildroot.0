From: sam at gpsm.co.uk <sam@gpsm.co.uk>
Date: Sat,  7 Sep 2019 19:56:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/lrzip: Add new package lrzip (Long
 Range ZIP or LZMA RZIP)
Message-ID: <20190907185615.7800-1-sam@gpsm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Lancia <sam@gpsm.co.uk>

lrzip is a compression utility that excels at compressing
large files (usually > 10-50 MB)

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
---
 package/Config.in        |  1 +
 package/lrzip/Config.in  | 22 ++++++++++++++++++++++
 package/lrzip/lrzip.hash |  2 ++
 package/lrzip/lrzip.mk   | 14 ++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/lrzip/Config.in
 create mode 100644 package/lrzip/lrzip.hash
 create mode 100644 package/lrzip/lrzip.mk

diff --git a/package/Config.in b/package/Config.in
index 9336261c5d..bb82de6ef1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -70,6 +70,7 @@ menu "Compressors and decompressors"
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
+        source "package/lrzip/Config.in"
 	source "package/p7zip/Config.in"
 	source "package/pigz/Config.in"
 	source "package/pixz/Config.in"
diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
new file mode 100644
index 0000000000..e4badfc09d
--- /dev/null
+++ b/package/lrzip/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LRZIP
+	bool "lrzip"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_BZIP2
+	help
+	  A compression utility that excels at compressing large files
+	  (usually > 10-50 MB). Larger files and/or more free RAM means
+	  that the utility will be able to more effectively compress
+	  your files (ie: faster / smaller size), especially if the
+	  filesize(s) exceed 100 MB. You can either choose to optimise
+	  for speed (fast compression / decompression) or size,
+	  but not both.
+
+	  https://github.com/ckolivas/lrzip
+
+comment "lrzip needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
new file mode 100644
index 0000000000..ebd658845d
--- /dev/null
+++ b/package/lrzip/lrzip.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 10315c20d5a47590e7220c210735ba169677824d5672509266682eccec84d952  lrzip-v0.631.tar.gz
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
new file mode 100644
index 0000000000..b3865f2682
--- /dev/null
+++ b/package/lrzip/lrzip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lrzip
+#
+################################################################################
+
+LRZIP_VERSION = v0.631
+LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
+LRZIP_AUTORECONF = YES
+LRZIP_LICENSE = GPL-2.0
+LRZIP_LICENSE_FILES = COPYING
+LRZIP_DEPENDENCIES = zlib lzo bzip2
+
+$(eval $(autotools-package))
-- 
2.17.1
