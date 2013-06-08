From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  8 Jun 2013 10:52:59 -0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.4.0
Message-ID: <1370699580-14502-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libpcap/libpcap-canusb-requires-pthread.patch  | 29 ----------------------
 package/libpcap/libpcap.mk                         | 16 +++---------
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/libpcap/libpcap-canusb-requires-pthread.patch

diff --git a/package/libpcap/libpcap-canusb-requires-pthread.patch b/package/libpcap/libpcap-canusb-requires-pthread.patch
deleted file mode 100644
index ed3bc1a..0000000
--- a/package/libpcap/libpcap-canusb-requires-pthread.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-canusb uses pthreads, but -lpthread is never added to LIBS hence missing
-from pcap-config, causing build failures. Fix this.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libpcap-1.3.0.orig//configure libpcap-1.3.0/configure
---- libpcap-1.3.0.orig//configure	2012-06-26 09:42:06.072155279 -0300
-+++ libpcap-1.3.0/configure	2012-06-26 09:42:12.617196326 -0300
-@@ -7607,7 +7607,7 @@
- $as_echo "#define PCAP_SUPPORT_CANUSB 1" >>confdefs.h
- 
- 		    CANUSB_SRC=pcap-canusb-linux.c
--		    LIBS="-lusb-1.0 $LIBS"
-+		    LIBS="-lusb-1.0 -lpthread $LIBS"
- 		    { $as_echo "$as_me:${as_lineno-$LINENO}: canusb sniffing is supported" >&5
- $as_echo "$as_me: canusb sniffing is supported" >&6;}
- 
-diff -Nura libpcap-1.3.0.orig//configure.in libpcap-1.3.0/configure.in
---- libpcap-1.3.0.orig//configure.in	2012-06-26 09:42:06.067155242 -0300
-+++ libpcap-1.3.0/configure.in	2012-06-26 09:42:22.267256741 -0300
-@@ -1406,7 +1406,7 @@
- 		[
- 		    AC_DEFINE(PCAP_SUPPORT_CANUSB, 1, [target host supports canusb])
- 		    CANUSB_SRC=pcap-canusb-linux.c
--		    LIBS="-lusb-1.0 $LIBS"
-+		    LIBS="-lusb-1.0 -lpthread $LIBS"
- 		    AC_MSG_NOTICE(canusb sniffing is supported)
- 		],
- 		AC_MSG_NOTICE(canusb sniffing is not supported; install libusb1.0 lib devel to enable it)
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 26f807b..bbbecdc 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,23 +4,13 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.3.0
+LIBPCAP_VERSION = 1.4.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
-
-# The configure.in file contains the necessary code to handle
-# --enable-shared/--disable-shared properly, but the configure script
-# bundled with the libpcap tarball is not up-to-date with the
-# configure.in file. In order to get proper handling of
-# --enable-shared/--disable-shared, which is needed when doing a
-# static library build, we autoreconfigure this package. This can be
-# removed when bumping libpcap, after checking that the bundled
-# configure script correctly handles --enable-shared/--disable-shared.
-LIBPCAP_AUTORECONF = YES
-
-LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
+LIBPCAP_DEPENDENCIES = zlib host-flex host-bison \
+	$(if $(BR2_PACKAGE_LIBNL),libnl)
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
-- 
1.8.1.5
