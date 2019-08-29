From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:14:45 +0200
Subject: [Buildroot] [git commit branch/next] package/libusb: bump to 1.0.23
Message-ID: <20190829201125.3C45B88312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8768178914dea3a7224fd3c60973603561aa1161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also remove obsolete patch and not calling autoreconf (as configure.ac
is not patched anymore)

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ac-fix-detection-of-clock_gettime-library.patch | 36 ----------------------
 package/libusb/libusb.hash                         |  2 +-
 package/libusb/libusb.mk                           |  4 +--
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch b/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch
deleted file mode 100644
index 89b89bb596..0000000000
--- a/package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7cc67ed294ad8566f2877d6f71649f1bd36f69a4 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 5 Jun 2018 14:22:21 +0300
-Subject: [PATCH] configure.ac: fix detection of clock_gettime library
-
-glibc before 2.17 requires link with librt for clock_gettime(). The
-AC_SEARCH_LIBS check in configure.ac should detect this dependency.
-Unfortunately commit cb77a25e51 (configure.ac: Remove obsolete AC_ERROR
-and make formatting consistent) inadvertently renamed to clock_gettime2,
-thus breaking librt detection.
-
-Restore the correct clock_gettime() name.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/libusb/libusb/pull/439
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5b16c6825d4b..63590d1351a4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -107,7 +107,7 @@ case $backend in
- linux)
- 	AC_DEFINE(OS_LINUX, 1, [Linux backend])
- 	AC_SUBST(OS_LINUX)
--	AC_SEARCH_LIBS([clock_gettime2], [rt], [], [], [-pthread])
-+	AC_SEARCH_LIBS([clock_gettime], [rt], [], [], [-pthread])
- 	AC_ARG_ENABLE([udev],
- 		[AC_HELP_STRING([--enable-udev], [use udev for device enumeration and hotplug support (recommended) [default=yes]])],
- 		[], [enable_udev=yes])
--- 
-2.17.1
-
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 7e9d2a2ad2..272dfb0877 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157  libusb-1.0.22.tar.bz2
+sha256 db11c06e958a82dac52cf3c65cb4dd2c3f339c8a988665110e0d24d19312ad8d  libusb-1.0.23.tar.bz2
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index fe38a1d2d2..ddc6b27b6c 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,15 +5,13 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).22
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).23
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
-# Patching configure.ac
-LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
