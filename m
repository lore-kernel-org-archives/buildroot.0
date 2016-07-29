From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jul 2016 12:26:47 +0300
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.9
Message-ID: <0fe5e4e62f4093b8d30fd1155d8832cd2482a57e.1469784407.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iperf2 is a fork of the original unmaintained iperf project, that continues
the development of the iperf 2.x series. Update homepage link, and download
location.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iperf/0001-add-missing-header.patch | 28 ++++++++++++++++++++++++++++
 package/iperf/Config.in                     |  2 +-
 package/iperf/iperf.hash                    |  4 +++-
 package/iperf/iperf.mk                      |  4 ++--
 4 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 package/iperf/0001-add-missing-header.patch

diff --git a/package/iperf/0001-add-missing-header.patch b/package/iperf/0001-add-missing-header.patch
new file mode 100644
index 000000000000..112738ea25ed
--- /dev/null
+++ b/package/iperf/0001-add-missing-header.patch
@@ -0,0 +1,28 @@
+util.h: add missing stdbool header
+
+C requires the stdbool.h header for the 'bool' type.
+
+Fixes the following build failure under uClibc-ng C library:
+
+.../arm-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c delay.c
+In file included from delay.c:55:0:
+../include/util.h:73:1: error: unknown type name ?bool?
+ bool setsock_blocking(int fd, bool blocking);
+ ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent to iperf2 maintainer
+
+diff -Nuar iperf-2.0.9.orig/include/util.h iperf-2.0.9/include/util.h
+--- iperf-2.0.9.orig/include/util.h	2016-06-06 21:48:21.000000000 +0300
++++ iperf-2.0.9/include/util.h	2016-07-29 11:27:23.028224148 +0300
+@@ -57,6 +57,8 @@
+     #include "config.h"
+ #endif
+ 
++#include <stdbool.h>
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index 86dd3e97c98c..21a2df8ace89 100644
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_IPERF
 	  Internet Protocol bandwidth measuring tool for measuring
 	  TCP/UDP performance.
 
-	  http://dast.nlanr.net/projects/iperf/
+	  https://sourceforge.net/projects/iperf2/
 
 comment "iperf needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 8d93b723d044..3dd491a2c0ee 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,2 +1,4 @@
+# From https://sourceforge.net/projects/iperf2/files/
+sha1	9e215f6af8edd97f947f2b0207ff5487845d83d4	iperf-2.0.9.tar.gz
 # Locally computed:
-sha256  636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b  iperf-2.0.5.tar.gz
+sha256  a5350777b191e910334d3a107b5e5219b72ffa393da4186da1e0a4552aeeded6  iperf-2.0.9.tar.gz
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 8496b95d83cc..f769238e4fc8 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.5
-IPERF_SITE = http://downloads.sourceforge.net/project/iperf
+IPERF_VERSION = 2.0.9
+IPERF_SITE = https://sourceforge.net/projects/iperf2/files
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
 
-- 
2.8.1
