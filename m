From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 08:53:55 +0200
Subject: [Buildroot] [git commit] util-linux: drop
	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS dependency
Message-ID: <20110729065702.08A8188C82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=952d96d5aed88bf0e7f7e6df55003c9ad5115f10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the dependency as it isn't really nice that other packages need
to select it, and kconf complains about it:

warning: (BR2_PACKAGE_E2FSPROGS && BR2_PACKAGE_USBMOUNT) selects
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS which has unmet direct dependencies
 (!BR2_PACKAGE_BUSYBOX)

Instead ensure that only the libraries are built by default, so
busybox applets are still used unless explicitly configured.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    2 +-
 package/e2fsprogs/Config.in  |    1 -
 package/gdisk/Config.in      |    2 --
 package/usbmount/Config.in   |    1 -
 package/util-linux/Config.in |   22 ----------------------
 package/xfsprogs/Config.in   |    1 -
 6 files changed, 1 insertions(+), 28 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 61f8256..7112e05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,8 +514,8 @@ source "package/psmisc/Config.in"
 source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
-source "package/util-linux/Config.in"
 endif
+source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
 endmenu
 
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 91e1670..ebf5003 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
index 02bc188..24d305d 100644
--- a/package/gdisk/Config.in
+++ b/package/gdisk/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_GDISK
 config BR2_PACKAGE_GDISK_GDISK
 	bool "interactive gdisk"
 	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -25,7 +24,6 @@ config BR2_PACKAGE_GDISK_GDISK
 config BR2_PACKAGE_GDISK_SGDISK
 	bool "command line sgdisk"
 	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_POPT
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index dbbc72d..6980c8c 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_USBMOUNT
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 4bb614a..45b0a82 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -18,11 +18,9 @@ if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "build mount utilties"
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "build \"fsck\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	bool "build libuuid and uuid utilities"
@@ -30,7 +28,6 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 
 config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "build \"uuidd\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -39,39 +36,30 @@ config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "build \"agetty\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "build \"fsck.cramfs, mkfs.cramfs\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "build \"switch_root\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "build \"pivot_root\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "build \"fallocate\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "build \"unshare\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "build \"rename\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "build \"chrt, ionice, teskset\""
-	default y
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "build \"wall\""
-	default y
 
 ############################################
 # default disabled and should be enabled by
@@ -79,43 +67,33 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 #
 config BR2_PACKAGE_UTIL_LINUX_ARCH
 	bool "build \"arch\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_INIT
 	bool "build \"simpleinit, shutdown, initctl\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "build \"kill\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_LAST
 	bool "build \"last\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "build \"mesg\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "build \"addpart, delpart, partx\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "build \"raw\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_RESET
 	bool "build \"reset\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "build \"chfn, chsh, login, newgrp, vipw\""
-	default n
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
 	bool "build \"write\""
-	default n
 
 endif
 
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 6c4d547..fda068f 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-- 
1.7.3.4
