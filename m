From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Oct 2014 19:31:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libhid: Fix build with
	BR2_ENABLE_DEBUG=yes
Message-ID: <1414348288-3328-1-git-send-email-bernd.kuhls@t-online.de>
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
 .../libhid-0001-dont-fiddle-with-debug-flags.patch |   42 ++++++++------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch b/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
index 139357b..44a1728 100644
--- a/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
+++ b/package/libhid/libhid-0001-dont-fiddle-with-debug-flags.patch
@@ -1,29 +1,19 @@
-Don't do horrible magic with CFLAGS and CXXFLAGS
+MD_CONF_DEBUGGING changes CFLAGS and CXXFLAGS with a horrible magic so disable
+it to prevent compilation errors.
 
-The purpose of the lines being removed is to suppress the
--g<something> option from the CFLAGS or CXXFLAGS, when --enable-debug
-is not used. This is stupid because it is up to the user to pass these
-flags or not.
+downloaded from
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libhid/files/libhid-0.2.16-gentoo.patch?revision=1.1&view=markup
 
-But it is not only stupid, but utterly broken: if your CFLAGS contains
-a flags like -mfloat-gprs=double, then this option gets truncated to
--mfloat simply because the option contained the -g string!
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
-Completely ridiculous piece of code, so get rid of it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
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
