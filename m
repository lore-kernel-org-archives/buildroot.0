From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 21:37:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhid: Fix build with
	BR2_ENABLE_DEBUG=yes
Message-ID: <1413747441-8680-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated Thomas? patch fix also fix the case when debug is enabled, otherwise this error occurs:

/bin/bash ../libtool  --tag=CC   --mode=compile /home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
 -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
 -I/home/fli4l/br5/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include -D_LARGEFILE_SOURCE
 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe s -g2 -O0 -g -Wall -W -c -o hidparser.lo hidparser.c
libtool: compile:  /home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I.
 -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
 -I/home/fli4l/br5/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe s -g2 -O0
 -g -Wall -W -c hidparser.c  -fPIC -DPIC -o .libs/hidparser.o

i586-buildroot-linux-uclibc-gcc: error: s: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../libhid-0001-dont-fiddle-with-debug-flags.patch |   32 +++++++++++---------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch b/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
index 139357b..e9938ed 100644
--- a/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
+++ b/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
@@ -13,17 +13,21 @@ Completely ridiculous piece of code, so get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: libhid-0.2.16/m4/md_conf_debugging.m4
-===================================================================
---- libhid-0.2.16.orig/m4/md_conf_debugging.m4	2004-11-08 18:16:25.000000000 +0100
-+++ libhid-0.2.16/m4/md_conf_debugging.m4	2012-12-12 20:24:50.000000000 +0100
-@@ -1,7 +1,7 @@
- AC_DEFUN([MD_CONF_DEBUGGING],
-   [
--    CFLAGS=$(echo $CFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
--    CXXFLAGS=$(echo $CXXFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
-+#    CFLAGS=$(echo $CFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
-+#    CXXFLAGS=$(echo $CXXFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
-     MD_CHECK_ARG_ENABLE(debug,
-       [
-         DEBUG_FLAG=-g
+- updated patch to fix compile with BR2_ENABLE_DEBUG=yes
+
+downloaded from
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libhid/files/libhid-0.2.16-gentoo.patch?revision=1.1&view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libhid-0.2.16.org/configure.ac libhid-0.2.16/configure.ac
+--- libhid-0.2.16.org/configure.ac	2007-04-01 22:32:10.000000000 +0200
++++ libhid-0.2.16/configure.ac	2014-10-19 21:31:00.550091947 +0200
+@@ -78,7 +78,6 @@
+ AC_C_BIGENDIAN
+ AC_C_STRINGIZE
+ 
+-MD_CONF_DEBUGGING
+ MD_CONF_COMPILER
+ AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
+ AM_CONDITIONAL(OS_BSD, test "$MD_OS" = "bsd")
-- 
1.7.10.4
