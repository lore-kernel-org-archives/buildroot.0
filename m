From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 19 Oct 2015 13:20:23 -0400
Subject: [Buildroot] [PATCH 1/2] xdriver_xf86-video-intel: add upstream
	patches fixing fstat build errors
Message-ID: <1445275224-3928-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempting to build xdriver_xf86-video-intel version 2.99.917 with udev
results in compilation failures. The provided patches ([1], [2])
corrects the `implicit declaration of function 'fstat'` occurrences
during the building of this driver.

[1] http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=12af8a575d1518d40416f83195049157c3a062a5
[2] http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=369ceec0e4910ba2c37736a59c55c0d6c26433bf

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 .../0001-sna-udev-fstat.patch                      | 57 ++++++++++++++++++++++
 .../0002-uxa-udev-fstat.patch                      | 27 ++++++++++
 .../xdriver_xf86-video-intel.mk                    |  1 +
 3 files changed, 85 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch

diff --git a/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch b/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
new file mode 100644
index 0000000..7e276ac
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
@@ -0,0 +1,57 @@
+From 12af8a575d1518d40416f83195049157c3a062a5 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Tue, 24 Feb 2015 15:25:40 +0000
+Subject: sna: udev integration depends on fstat and sys/stat.h
+
+src/sna/sna_driver.c: In function 'sna_handle_uevents':
+src/sna/sna_driver.c:759:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
+
+Also take the opportunity to include udev support in the configure
+summary.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index 7476e2b..de3a4b3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -197,11 +197,15 @@ AC_ARG_ENABLE(udev,
+ 
+ if test "x$UDEV" != "xno"; then
+ 	PKG_CHECK_MODULES(UDEV, [libudev], [udev="yes"], [udev="no"])
++	AC_CHECK_HEADERS([sys/stat.h], [], [udev="no"])
+ 	if test "x$UDEV" = "xyes" -a "x$udev" != "xyes"; then
+ 		AC_MSG_ERROR([udev support requested but not found (libudev)])
+ 	fi
+ 	if test "x$udev" = "xyes"; then
+ 		AC_DEFINE(HAVE_UDEV,1,[Enable udev-based monitor hotplug detection])
++		udev_msg=" yes"
++	else
++		udev_msg=" no"
+ 	fi
+ fi
+ 
+@@ -911,6 +915,7 @@ echo "  Support for Kernel Mode Setting? $KMS"
+ echo "  Support for legacy User Mode Setting (for i810)? $UMS"
+ echo "  Support for Direct Rendering Infrastructure:$dri_msg"
+ echo "  Support for Xv motion compensation (XvMC and libXvMC):$xvmc_msg"
++echo "  Support for display hotplug notifications (udev):$udev_msg"
+ echo "  Build additional tools and utilities?$tools_msg"
+ if test -n "$xp_msg"; then
+ echo "  Experimental support:$xp_msg"
+diff --git a/src/sna/sna_driver.c b/src/sna/sna_driver.c
+index 8c0d0b5..bc20ef0 100644
+--- a/src/sna/sna_driver.c
++++ b/src/sna/sna_driver.c
+@@ -740,6 +740,8 @@ sna_wakeup_handler(WAKEUPHANDLER_ARGS_DECL)
+ }
+ 
+ #if HAVE_UDEV
++#include <sys/stat.h>
++
+ static void
+ sna_handle_uevents(int fd, void *closure)
+ {
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch b/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch
new file mode 100644
index 0000000..6679356
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch
@@ -0,0 +1,27 @@
+From 369ceec0e4910ba2c37736a59c55c0d6c26433bf Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Tue, 24 Feb 2015 15:25:40 +0000
+Subject: uxa: udev integration depends on fstat and sys/stat.h
+
+src/uxa/intel_driver.c: In function 'I830HandleUEvents':
+src/uxa/intel_driver.c:738:14: error: storage size of 's' isn't known
+src/uxa/intel_driver.c:746:2: error: implicit declaration of function 'fstat' [-Werror=implicit-function-declaration]
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+
+diff --git a/src/uxa/intel_driver.c b/src/uxa/intel_driver.c
+index c554124..6e64b8c 100644
+--- a/src/uxa/intel_driver.c
++++ b/src/uxa/intel_driver.c
+@@ -728,6 +728,8 @@ intel_flush_callback(CallbackListPtr *list,
+ }
+ 
+ #if HAVE_UDEV
++#include <sys/stat.h>
++
+ static void
+ I830HandleUEvents(int fd, void *closure)
+ {
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 707cedd..a06e652 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -9,6 +9,7 @@ XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VE
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 
 # this fixes a getline-related compilation error in src/sna/kgem.c
 XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
-- 
1.9.5.msysgit.1
