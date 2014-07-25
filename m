From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 Jul 2014 08:47:15 +0300
Subject: [Buildroot] [PATCH] libpcap: fix build for uclinux target
Message-ID: <15676708c0726cb3fbed1dfaafae5e85c918ff3f.1406267235.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As usual, uclinux is also linux. Also, -lpthread is needed to link the canusb
test.

Fixes:
http://autobuild.buildroot.net/results/3af/3af796bc0eaa8563f0fd1dfce090083482fa57b9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...p-0002-configure.in-uclinux-is-also-linux.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch

diff --git a/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch b/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch
new file mode 100644
index 000000000000..605edf59b527
--- /dev/null
+++ b/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch
@@ -0,0 +1,39 @@
+From a904d1e35be72d0821a6680a75060815bce86642 Mon Sep 17 00:00:00 2001
+Message-Id: <a904d1e35be72d0821a6680a75060815bce86642.1406266983.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 25 Jul 2014 07:28:47 +0300
+Subject: [PATCH] configure.in: uclinux is also linux
+
+Also we need -lpthread for the test to build for noMMU targets.
+
+Signend-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ configure.in | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4530aed3a7d0..63f708b9b855 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1539,7 +1539,7 @@ AC_ARG_ENABLE([canusb],
+ if test "x$enable_canusb" != "xno" ; then
+ 	dnl check for canusb support
+ 	case "$host_os" in
+-	linux*)
++	linux*|uclinux*)
+ 		AC_CHECK_HEADER(libusb-1.0/libusb.h,
+ 		[
+ 		    AC_CHECK_LIB(usb-1.0, libusb_init,
+@@ -1549,7 +1549,8 @@ if test "x$enable_canusb" != "xno" ; then
+ 			LIBS="-lusb-1.0 -lpthread $LIBS"
+ 			ac_lbl_has_libusb=yes
+ 		    ],
+-		    ac_lbl_has_libusb=no
++		    ac_lbl_has_libusb=no,
++		    -lpthread
+ 		    )
+ 		],
+ 		ac_lbl_has_libusb=no
+-- 
+2.0.1
+
-- 
2.0.1
