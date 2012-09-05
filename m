From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 23:03:26 +0200
Subject: [Buildroot] [git commit] rp-pppoe: bump to version 3.11
Message-ID: <20120905215422.02F7597020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=602b051634bada61ac67c4e8d39765f4549ef9e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../rp-pppoe-3.10-001-configure-bitfield.patch     |   34 --------------------
 .../rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch    |   20 ++++++-----
 package/rp-pppoe/rp-pppoe.mk                       |    4 ++-
 3 files changed, 14 insertions(+), 44 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe-3.10-001-configure-bitfield.patch b/package/rp-pppoe/rp-pppoe-3.10-001-configure-bitfield.patch
deleted file mode 100644
index 8cc472f..0000000
--- a/package/rp-pppoe/rp-pppoe-3.10-001-configure-bitfield.patch
+++ /dev/null
@@ -1,34 +0,0 @@
---- rp-pppoe-3.10.orig/src/configure.in	2006-04-02 16:29:42.000000000 +0200
-+++ rp-pppoe-3.10/src/configure.in	2007-08-24 11:51:04.000000000 +0200
-@@ -231,6 +231,7 @@ esac
- 
- dnl Figure out packing order of structures
- AC_MSG_CHECKING([packing order of bit fields])
-+if test "x$rpppoe_cv_pack_bitfields" = "x" ; then
- AC_TRY_RUN([
- union foo {
-     struct bar {
-@@ -254,8 +255,8 @@ main(void)
- 	return 2;
-     }
- }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
--$ECHO "no defaults for cross-compiling"; exit 0)
--
-+$ECHO "no defaults for cross-compiling")
-+fi
- if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
- 	AC_MSG_RESULT(reversed)
- 	AC_DEFINE(PACK_BITFIELDS_REVERSED)
---- rp-pppoe-3.10.orig/src/configure	2010-08-20 10:46:39.000000000 -0700
-+++ rp-pppoe-3.10/src/configure	2010-08-20 11:02:16.000000000 -0700
-@@ -6272,7 +6272,9 @@ esac
- { echo "$as_me:$LINENO: checking packing order of bit fields" >&5
- echo $ECHO_N "checking packing order of bit fields... $ECHO_C" >&6; }
- if test "$cross_compiling" = yes; then
--  $ECHO "no defaults for cross-compiling"; exit 0
-+if test "x$rpppoe_cv_pack_bitfields" = "x" ; then
-+  $ECHO "no defaults for cross-compiling"
-+fi
- else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
diff --git a/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch b/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
index 27c8357..d364e86 100644
--- a/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
+++ b/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
@@ -1,17 +1,19 @@
---- rp-pppoe-3.10/src/configure.theorig  2008-02-05 13:57:15.000000000 -0800
-+++ rp-pppoe-3.10/src/configure  2008-02-05 13:24:36.000000000 -0800
-@@ -6151,7 +6151,7 @@ modprobe ppp_synctty > /dev/null 2>&1
+diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
+--- rp-pppoe-3.11.orig/src/configure	2012-08-21 10:01:10.536440032 -0300
++++ rp-pppoe-3.11/src/configure	2012-08-21 10:01:45.353442397 -0300
+@@ -4517,7 +4517,7 @@
  modprobe pppoe > /dev/null 2>&1
  fi
- if test "$cross_compiling" = yes; then
+ if test "$cross_compiling" = yes; then :
 -  ac_cv_linux_kernel_pppoe=no; $ECHO "cross-compiling, default: "
 +  ac_cv_linux_kernel_pppoe=yes; $ECHO "cross-compiling, default: "
  else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
---- rp-pppoe-3.10/src/pppoe-server.c.theorig     2006-04-02 07:29:42.000000000 -0700
-+++ rp-pppoe-3.10/src/pppoe-server.c     2008-02-05 13:52:15.000000000 -0800
-@@ -20,6 +20,9 @@ static char const RCSID[] =
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+diff -Nura rp-pppoe-3.11.orig/src/pppoe-server.c rp-pppoe-3.11/src/pppoe-server.c
+--- rp-pppoe-3.11.orig/src/pppoe-server.c	2012-08-21 10:01:10.535440032 -0300
++++ rp-pppoe-3.11/src/pppoe-server.c	2012-08-21 10:02:02.597443569 -0300
+@@ -20,6 +20,9 @@
  
  #include "config.h"
  
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index cf12d64..106d310 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-RP_PPPOE_VERSION = 3.10
+RP_PPPOE_VERSION = 3.11
 RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
+RP_PPPOE_LICENSE = GPLv2
+RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
 RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
