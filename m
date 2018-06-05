From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Jun 2018 14:42:10 +0300
Subject: [Buildroot] [PATCH] libusb: fix clock_gettime librt dependency check
Message-ID: <8cd6b40c6debfeb4861bc79b899417a01466e962.1528198930.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The detection of the librt dependency of clock_gettime in glibc before
2.17 is broken. We do not support glibc older than 2.17 for target, but
we still need to support hosts using old glibc. Add a patch fixing that.

Should fix (host-imx-usb-loader):
http://autobuild.buildroot.net/results/0a1/0a156449e5f38a6092ab9c88e3e3f5ea9abc0f03/
http://autobuild.buildroot.net/results/347/347f1b9bce2f0854e8ca6d49b9a9b3fa55de24b1/
http://autobuild.buildroot.net/results/f6a/f6a3a62909ccb500ca122ec3f03119d7706fb88a/

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...x-detection-of-clock_gettime-library.patch | 36 +++++++++++++++++++
 package/libusb/libusb.mk                      |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch

diff --git a/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch b/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch
new file mode 100644
index 000000000000..89b89bb5960a
--- /dev/null
+++ b/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch
@@ -0,0 +1,36 @@
+From 7cc67ed294ad8566f2877d6f71649f1bd36f69a4 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 5 Jun 2018 14:22:21 +0300
+Subject: [PATCH] configure.ac: fix detection of clock_gettime library
+
+glibc before 2.17 requires link with librt for clock_gettime(). The
+AC_SEARCH_LIBS check in configure.ac should detect this dependency.
+Unfortunately commit cb77a25e51 (configure.ac: Remove obsolete AC_ERROR
+and make formatting consistent) inadvertently renamed to clock_gettime2,
+thus breaking librt detection.
+
+Restore the correct clock_gettime() name.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/libusb/libusb/pull/439
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5b16c6825d4b..63590d1351a4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -107,7 +107,7 @@ case $backend in
+ linux)
+ 	AC_DEFINE(OS_LINUX, 1, [Linux backend])
+ 	AC_SUBST(OS_LINUX)
+-	AC_SEARCH_LIBS([clock_gettime2], [rt], [], [], [-pthread])
++	AC_SEARCH_LIBS([clock_gettime], [rt], [], [], [-pthread])
+ 	AC_ARG_ENABLE([udev],
+ 		[AC_HELP_STRING([--enable-udev], [use udev for device enumeration and hotplug support (recommended) [default=yes]])],
+ 		[], [enable_udev=yes])
+-- 
+2.17.1
+
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 8d7aed1619cc..aee3622f8d8f 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -12,6 +12,8 @@ LIBUSB_LICENSE = LGPL-2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
+# Patching configure.ac
+LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
-- 
2.17.1
