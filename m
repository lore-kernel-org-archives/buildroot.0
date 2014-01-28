From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 21:59:45 +0100
Subject: [Buildroot] [git commit] libusb: bump to version 1.0.18
Message-ID: <20140128210416.1B2909C582@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f92aa38db31f3d741e22136f929c3135f034037e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusb/Config.in               |    2 +-
 package/libusb/libusb-01-uclinux.patch |   30 ------------------------------
 package/libusb/libusb.mk               |    8 +++++++-
 3 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 2c2b8ce..5238588 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBUSB
 	help
 	  Userspace library for accessing USB devices
 
-	  http://libusb.sourceforge.net/
+	  http://libusb.info/
 
 comment "libusb needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusb/libusb-01-uclinux.patch b/package/libusb/libusb-01-uclinux.patch
deleted file mode 100644
index cbf48a7..0000000
--- a/package/libusb/libusb-01-uclinux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-*-uclinux* is valid in the tuple for linux, it's used for flat binaries
-for example.
-Patch both configure* for consistency and to avoid an unnecessary autoreconf.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libusb-1.0.9.orig/configure libusb-1.0.9/configure
---- libusb-1.0.9.orig/configure	2013-09-03 10:13:52.212301259 -0300
-+++ libusb-1.0.9/configure	2013-09-03 10:19:08.443669386 -0300
-@@ -11093,7 +11093,7 @@
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking operating system" >&5
- $as_echo_n "checking operating system... " >&6; }
- case $host in
--*-linux*)
-+*-linux* | *-uclinux*)
- 	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: Linux" >&5
- $as_echo "Linux" >&6; }
- 	backend="linux"
-diff -Nura libusb-1.0.9.orig/configure.ac libusb-1.0.9/configure.ac
---- libusb-1.0.9.orig/configure.ac	2013-09-03 10:13:52.212301259 -0300
-+++ libusb-1.0.9/configure.ac	2013-09-03 10:19:00.573411346 -0300
-@@ -46,7 +46,7 @@
- 
- AC_MSG_CHECKING([operating system])
- case $host in
--*-linux*)
-+*-linux* | *-uclinux*)
- 	AC_MSG_RESULT([Linux])
- 	backend="linux"
- 	;;
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 99f571c..a595a12 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).9
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).18
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
@@ -17,5 +17,11 @@ ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPT += --disable-timerfd
 endif
 
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+LIBUSB_DEPENDENCIES += udev
+else
+LIBUSB_CONF_OPT += --disable-udev
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
