From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:26:07 +0200
Subject: [Buildroot] [git commit] libpcap: fix build for uclinux target
Message-ID: <20140726073240.84D639D302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79d03a865dbaa388c94d438f445001bcc2a719a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As usual, uclinux is also linux. Also, -lpthread is needed to link the canusb
test.

Fixes:
http://autobuild.buildroot.net/results/3af/3af796bc0eaa8563f0fd1dfce090083482fa57b9/

[Thomas: fix typo in SoB line inside the newly added patch.]

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...p-0002-configure.in-uclinux-is-also-linux.patch |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch b/package/libpcap/libpcap-0002-configure.in-uclinux-is-also-linux.patch
new file mode 100644
index 0000000..55be25e
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
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
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
