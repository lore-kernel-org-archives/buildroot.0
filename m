From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:30:03 +0200
Subject: [Buildroot] [git commit] iperf: bump to version 2.0.9
Message-ID: <20160730123049.907A481D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11cc12eefd9bb656cca84771685f31940f4bdbdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iperf2 is a fork of the original unmaintained iperf project, that
continues the development of the iperf 2.x series. Update homepage
link, and download location.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Thomas:
 - change the download location to use downloads.sourceforge.net
 - turn the patch into a Git-formatted one, since upstream uses Git as
   its version control system
 - as noticed by Khem Raj, a C99 compiler is needed for the bool type,
   so added AC_PROG_CC_C99 to configure.ac, and consequently added
   IPERF_AUTORECONF = YES.
 - removed two <pkg>_CONF_ENV variables related to the bool type, they
   were added by an older commit
   e13ac0ec8788092c6508636da94fe0198c18dffd back when we had a
   config.cache shared between packages (which is no longer the case
   today)]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-util.h-add-missing-stdbool-header.patch   | 54 ++++++++++++++++++++++
 package/iperf/Config.in                            |  2 +-
 package/iperf/iperf.hash                           |  4 +-
 package/iperf/iperf.mk                             | 10 ++--
 4 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/package/iperf/0001-util.h-add-missing-stdbool-header.patch b/package/iperf/0001-util.h-add-missing-stdbool-header.patch
new file mode 100644
index 0000000..6eeed72
--- /dev/null
+++ b/package/iperf/0001-util.h-add-missing-stdbool-header.patch
@@ -0,0 +1,54 @@
+From babf9a5c2bbce4725963b21e47f413962e33ea88 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sat, 30 Jul 2016 14:24:33 +0200
+Subject: [PATCH] util.h: add missing stdbool header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+C requires the stdbool.h header for the 'bool' type.
+
+Fixes the following build failure under uClibc-ng C library:
+
+.../arm-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I../include -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c delay.c
+In file included from delay.c:55:0:
+../include/util.h:73:1: error: unknown type name ???bool???
+ bool setsock_blocking(int fd, bool blocking);
+ ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Thomas: add AC_PROG_CC_C99, since C99 is needed for the bool type.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac   | 1 +
+ include/util.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d59107a..ba30cb7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,6 +46,7 @@ dnl ===================================================================
+ AC_PROG_CXX
+ CXXFLAGS=`echo " $CXXFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
+ AC_PROG_CC
++AC_PROG_CC_C99
+ CFLAGS=`echo " $CFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
+ AC_ISC_POSIX
+ AC_PROG_INSTALL
+diff --git a/include/util.h b/include/util.h
+index f4ae3d8..91540a9 100644
+--- a/include/util.h
++++ b/include/util.h
+@@ -57,6 +57,8 @@
+     #include "config.h"
+ #endif
+ 
++#include <stdbool.h>
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-- 
+2.7.4
+
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index 86dd3e9..21a2df8 100644
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
index 8d93b72..3dd491a 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,2 +1,4 @@
+# From https://sourceforge.net/projects/iperf2/files/
+sha1	9e215f6af8edd97f947f2b0207ff5487845d83d4	iperf-2.0.9.tar.gz
 # Locally computed:
-sha256  636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b  iperf-2.0.5.tar.gz
+sha256  a5350777b191e910334d3a107b5e5219b72ffa393da4186da1e0a4552aeeded6  iperf-2.0.9.tar.gz
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 8496b95..d2071bd 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.5
-IPERF_SITE = http://downloads.sourceforge.net/project/iperf
+IPERF_VERSION = 2.0.9
+IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
+# patching configure.ac
+IPERF_AUTORECONF = YES
 
 IPERF_CONF_ENV = \
-	ac_cv_func_malloc_0_nonnull=yes \
-	ac_cv_type_bool=yes \
-	ac_cv_sizeof_bool=1
+	ac_cv_func_malloc_0_nonnull=yes
 
 IPERF_CONF_OPTS = \
 	--disable-web100
