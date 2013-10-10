From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Oct 2013 22:12:07 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-input-evdev: enable compile
	without udev dependency.
Message-ID: <1381435927-7090-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |  4 --
 ...01-Enable-compile-wihtout-udev-dependency.patch | 58 ++++++++++++++++++++++
 .../xdriver_xf86-input-evdev.mk                    | 10 +++-
 3 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index cc159c9..798fffc 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
-	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  Generic Linux input driver
-
-comment "xf86-input-evdev requires udev to be enabled"
-        depends on !BR2_PACKAGE_UDEV
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch
new file mode 100644
index 0000000..5ffb501
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch
@@ -0,0 +1,58 @@
+From 34a982b2731c29d5326d46b13d28995772b80cde Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 10 Oct 2013 21:50:40 +0200
+Subject: [PATCH] Enable compile wihtout udev dependency.
+
+---
+ configure.ac | 2 +-
+ src/evdev.c  | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dff2bcf..23baad8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,7 +46,7 @@ XORG_DEFAULT_OPTIONS
+ 
+ # Obtain compiler/linker options from server and required extensions
+ PKG_CHECK_MODULES(XORG, [xorg-server >= 1.10] xproto inputproto)
+-PKG_CHECK_MODULES(UDEV, libudev)
++PKG_CHECK_MODULES(UDEV, libudev, [AC_DEFINE([HAVE_UDEV], [1], [Use UDEV])], [ ])
+ 
+ PKG_CHECK_MODULES(XI22, [inputproto >= 2.1.99.3] [xorg-server >= 1.11.99.901], HAVE_XI22="yes", HAVE_XI22="no")
+ 
+diff --git a/src/evdev.c b/src/evdev.c
+index d540b87..0eedcdd 100644
+--- a/src/evdev.c
++++ b/src/evdev.c
+@@ -38,7 +38,9 @@
+ 
+ #include <linux/version.h>
+ #include <sys/stat.h>
++#ifdef HAVE_UDEV
+ #include <libudev.h>
++#endif
+ #include <unistd.h>
+ #include <errno.h>
+ #include <fcntl.h>
+@@ -294,6 +296,7 @@ SetXkbOption(InputInfoPtr pInfo, char *name, char **option)
+ static BOOL
+ EvdevDeviceIsVirtual(const char* devicenode)
+ {
++#ifdef HAVE_UDEV
+     struct udev *udev = NULL;
+     struct udev_device *device = NULL;
+     struct stat st;
+@@ -322,6 +325,9 @@ out:
+     udev_device_unref(device);
+     udev_unref(udev);
+     return rc;
++#else
++    return FALSE;
++#endif
+ }
+ 
+ #ifndef HAVE_SMOOTH_SCROLLING
+-- 
+1.8.1.4
+
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 61f0ce7..e2092bf 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,6 +9,14 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto udev
+XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
+
+# autoreconf required because of patched configure.ac, see
+# xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch
+XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES += udev
+endif
 
 $(eval $(autotools-package))
-- 
1.8.1.4
