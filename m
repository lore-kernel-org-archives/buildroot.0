From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:39:49 +0100
Subject: [Buildroot] [git commit] libpcap: bump to version 1.7.2
Message-ID: <20150311203750.BAAF08081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b99794de12618a0849ce7a9674405fafa9b4ce1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch (uclinux), adapt libnl patch to new version.
And add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libpcap/0001-remove-libnl-include-path.patch   |   17 +++++----
 .../0002-configure.in-uclinux-is-also-linux.patch  |   39 --------------------
 package/libpcap/libpcap.hash                       |    2 +
 package/libpcap/libpcap.mk                         |    2 +-
 4 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/package/libpcap/0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
index 7b7106b..a4039ef 100644
--- a/package/libpcap/0001-remove-libnl-include-path.patch
+++ b/package/libpcap/0001-remove-libnl-include-path.patch
@@ -1,16 +1,19 @@
 Remove hardcoded path to libnl3 include directory
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Gustavo: update for 1.7.2]
 
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -445,7 +445,6 @@
+diff -Nura libpcap-1.7.2.orig/configure.in libpcap-1.7.2/configure.in
+--- libpcap-1.7.2.orig/configure.in	2015-03-11 10:02:44.416189921 -0300
++++ libpcap-1.7.2/configure.in	2015-03-11 10:03:03.967633673 -0300
+@@ -466,9 +466,8 @@
  			AC_DEFINE(HAVE_LIBNL_3_x,1,[if libnl exists and is version 3.x])
  			AC_DEFINE(HAVE_LIBNL_NLE,1,[libnl has NLE_FAILURE])
  			AC_DEFINE(HAVE_LIBNL_SOCKETS,1,[libnl has new-style socket api])
--			V_INCLS="$V_INCLS -I/usr/include/libnl3"
+-			V_INCLS="$V_INCLS ${incdir}"
  			have_any_nl="yes"
- 		])
+-		],[], ${incdir} ${libnldir} -lnl-genl-3 -lnl-3 )
++		],[], ${libnldir} -lnl-genl-3 -lnl-3 )
  
+ 		if test x$have_any_nl = xno ; then
+ 			#
diff --git a/package/libpcap/0002-configure.in-uclinux-is-also-linux.patch b/package/libpcap/0002-configure.in-uclinux-is-also-linux.patch
deleted file mode 100644
index 55be25e..0000000
--- a/package/libpcap/0002-configure.in-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a904d1e35be72d0821a6680a75060815bce86642 Mon Sep 17 00:00:00 2001
-Message-Id: <a904d1e35be72d0821a6680a75060815bce86642.1406266983.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 25 Jul 2014 07:28:47 +0300
-Subject: [PATCH] configure.in: uclinux is also linux
-
-Also we need -lpthread for the test to build for noMMU targets.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- configure.in | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 4530aed3a7d0..63f708b9b855 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1539,7 +1539,7 @@ AC_ARG_ENABLE([canusb],
- if test "x$enable_canusb" != "xno" ; then
- 	dnl check for canusb support
- 	case "$host_os" in
--	linux*)
-+	linux*|uclinux*)
- 		AC_CHECK_HEADER(libusb-1.0/libusb.h,
- 		[
- 		    AC_CHECK_LIB(usb-1.0, libusb_init,
-@@ -1549,7 +1549,8 @@ if test "x$enable_canusb" != "xno" ; then
- 			LIBS="-lusb-1.0 -lpthread $LIBS"
- 			ac_lbl_has_libusb=yes
- 		    ],
--		    ac_lbl_has_libusb=no
-+		    ac_lbl_has_libusb=no,
-+		    -lpthread
- 		    )
- 		],
- 		ac_lbl_has_libusb=no
--- 
-2.0.1
-
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
new file mode 100644
index 0000000..967f2dd
--- /dev/null
+++ b/package/libpcap/libpcap.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1a4abc1f268b68f97e69a497f53695c9acc7a13f1d522a4d940dea276e6698ae	libpcap-1.7.2.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index bfcf19a..68d6614 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.6.2
+LIBPCAP_VERSION = 1.7.2
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
