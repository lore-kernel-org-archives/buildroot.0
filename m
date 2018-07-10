From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Jul 2018 09:05:33 +0300
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.12
Message-ID: <5deab2d1a94ff8d5b29e4031b0114dc99a31a126.1531202733.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch #1; not needed anymore.

Drop patch #2; fixed upstream in a slightly different way.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-util.h-add-missing-stdbool-header.patch | 54 -------------------
 ...0002-fix-speed-display-in-csv-report.patch | 39 --------------
 package/iperf/iperf.hash                      |  4 +-
 package/iperf/iperf.mk                        |  4 +-
 4 files changed, 3 insertions(+), 98 deletions(-)
 delete mode 100644 package/iperf/0001-util.h-add-missing-stdbool-header.patch
 delete mode 100644 package/iperf/0002-fix-speed-display-in-csv-report.patch

diff --git a/package/iperf/0001-util.h-add-missing-stdbool-header.patch b/package/iperf/0001-util.h-add-missing-stdbool-header.patch
deleted file mode 100644
index 6eeed72a6cd1..000000000000
--- a/package/iperf/0001-util.h-add-missing-stdbool-header.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From babf9a5c2bbce4725963b21e47f413962e33ea88 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sat, 30 Jul 2016 14:24:33 +0200
-Subject: [PATCH] util.h: add missing stdbool header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-C requires the stdbool.h header for the 'bool' type.
-
-Fixes the following build failure under uClibc-ng C library:
-
-.../arm-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c delay.c
-In file included from delay.c:55:0:
-../include/util.h:73:1: error: unknown type name ?bool?
- bool setsock_blocking(int fd, bool blocking);
- ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Thomas: add AC_PROG_CC_C99, since C99 is needed for the bool type.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac   | 1 +
- include/util.h | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index d59107a..ba30cb7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,6 +46,7 @@ dnl ===================================================================
- AC_PROG_CXX
- CXXFLAGS=`echo " $CXXFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
- AC_PROG_CC
-+AC_PROG_CC_C99
- CFLAGS=`echo " $CFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
- AC_ISC_POSIX
- AC_PROG_INSTALL
-diff --git a/include/util.h b/include/util.h
-index f4ae3d8..91540a9 100644
---- a/include/util.h
-+++ b/include/util.h
-@@ -57,6 +57,8 @@
-     #include "config.h"
- #endif
- 
-+#include <stdbool.h>
-+
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.7.4
-
diff --git a/package/iperf/0002-fix-speed-display-in-csv-report.patch b/package/iperf/0002-fix-speed-display-in-csv-report.patch
deleted file mode 100644
index b06c7099e9ab..000000000000
--- a/package/iperf/0002-fix-speed-display-in-csv-report.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f035e70b72d4285dcdbd393e680777a927cb9da4 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 28 Jul 2016 19:04:01 -0500
-Subject: [PATCH] perf: fix "speed" display in csv report
-
-Some parameters displayed in the CSV reports are declared
-as uint64_t, but the printf format doesn't reflect this.
-
-Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
-
-Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
-Signed-off-by: Atul Singh <atul.singh.mandla@gmail.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/Locale.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/Locale.c b/src/Locale.c
-index b5d42b1..7b924fa 100644
---- a/src/Locale.c
-+++ b/src/Locale.c
-@@ -260,11 +260,12 @@ const char reportCSV_bw_format[] =
- const char reportCSV_bw_jitter_loss_format[] =
- "%s,%s,%d,%.1f-%.1f,%I64d,%I64d,%.3f,%d,%d,%.3f,%d\n";
- #else
-+#include "inttypes.h"
- const char reportCSV_bw_format[] =
--"%s,%s,%d,%.1f-%.1f,%d,%d\n";
-+"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 "\n";
- 
- const char reportCSV_bw_jitter_loss_format[] =
--"%s,%s,%d,%.1f-%.1f,%d,%d,%.3f,%d,%d,%.3f,%d\n";
-+"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 ",%.3f,%d,%d,%.3f,%d\n";
- #endif //WIN32
- #endif //HAVE_QUAD_SUPPORT
- /* -------------------------------------------------------------------
--- 
-1.9.1
-
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 0752bfc3561b..3540c6e9304c 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	8b44a23385044bb454e7891966c37339d3bb3711	iperf-2.0.10.tar.gz
+sha1	909b469bbbc38508cd268e334a6ec319c3116f15	iperf-2.0.12.tar.gz
 # Locally computed:
-sha256  7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2  iperf-2.0.10.tar.gz
+sha256  367f651fb1264b13f6518e41b8a7e08ce3e41b2a1c80e99ff0347561eed32646  iperf-2.0.12.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 644980754f52..c712de61e02b 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.10
+IPERF_VERSION = 2.0.12
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-# patching configure.ac
-IPERF_AUTORECONF = YES
 
 IPERF_CONF_OPTS = \
 	--disable-web100
-- 
2.18.0
