From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:30:29 +0200
Subject: [Buildroot] [git commit] package/lrzip: new package
Message-ID: <20190915202643.4F6258E603@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d234c2d6cf27d5c9382ef003a72a3ec1d73ad6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lrzip is a compression utility that excels at compressing
large files (usually > 10-50 MB)

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
[Thomas: license is GPL-2.0+, not GPL-2.0]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                              |  3 +++
 package/Config.in                       |  1 +
 package/lrzip/0001-missing-stdarg.patch | 26 ++++++++++++++++++++++++++
 package/lrzip/Config.in                 | 22 ++++++++++++++++++++++
 package/lrzip/lrzip.hash                |  3 +++
 package/lrzip/lrzip.mk                  | 14 ++++++++++++++
 6 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d972f5b40..f2704d8f1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2031,6 +2031,9 @@ N:	Sam Bobroff <sam.bobroff@au1.ibm.com>
 F:	arch/Config.in.powerpc
 F:	package/librtas/
 
+N:	Sam Lancia <sam@gpsm.co.uk>
+F:	package/lrzip/
+
 N:	Samuel Martin <s.martin49@gmail.com>
 F:	package/armadillo/
 F:	package/canfestival/
diff --git a/package/Config.in b/package/Config.in
index 5abeb42c8c..6423dc5d80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -68,6 +68,7 @@ menu "Compressors and decompressors"
 	source "package/brotli/Config.in"
 	source "package/bzip2/Config.in"
 	source "package/gzip/Config.in"
+	source "package/lrzip/Config.in"
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
diff --git a/package/lrzip/0001-missing-stdarg.patch b/package/lrzip/0001-missing-stdarg.patch
new file mode 100644
index 0000000000..9ce0117a3c
--- /dev/null
+++ b/package/lrzip/0001-missing-stdarg.patch
@@ -0,0 +1,26 @@
+From 5ae1754025315d85fac11cb4eb2474789ee6475e Mon Sep 17 00:00:00 2001
+From: Sam Lancia <sam@gpsm.co.uk>
+Date: Sat, 7 Sep 2019 20:54:29 +0100
+Subject: [PATCH] Lrzip.h: add missing header for va_list on some platforms
+
+Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
+---
+ Lrzip.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lrzip.h b/Lrzip.h
+index 29bc2a9..8934c59 100644
+--- a/Lrzip.h
++++ b/Lrzip.h
+@@ -20,6 +20,7 @@
+ #ifndef LIBLRZIP_H
+ #define LIBLRZIP_H
+ 
++#include <stdarg.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+ #ifdef _WIN32
+-- 
+2.17.1
+
+
diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
new file mode 100644
index 0000000000..92540a5036
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
+comment "lrzip needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
new file mode 100644
index 0000000000..bdf63f0ed8
--- /dev/null
+++ b/package/lrzip/lrzip.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 10315c20d5a47590e7220c210735ba169677824d5672509266682eccec84d952  lrzip-0.631.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
new file mode 100644
index 0000000000..24edc847d3
--- /dev/null
+++ b/package/lrzip/lrzip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lrzip
+#
+################################################################################
+
+LRZIP_VERSION = 0.631
+LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
+LRZIP_AUTORECONF = YES
+LRZIP_LICENSE = GPL-2.0+
+LRZIP_LICENSE_FILES = COPYING
+LRZIP_DEPENDENCIES = zlib lzo bzip2
+
+$(eval $(autotools-package))
