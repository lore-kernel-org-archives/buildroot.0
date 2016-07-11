From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:26 +0200
Subject: [Buildroot] [PATCH 03/12 v8] package/eudev: add option to enable
	the udev daemon
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <b87816d3b3207c0b290a87b972cb1dc1c5f8cf5f.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is currently forcefully enabled, and does not (yet) change the way
we handle eudev-based /dev/management, but will help introduce libudev
in followup commits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 21 ++++++++++++++++-----
 system/Config.in        |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6412675..f2d5725 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,10 +4,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_STATIC_LIBS # kmod
-	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_EUDEV_DAEMON
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining better
 	  compatibility with existing software such as OpenRC and Upstart,
@@ -18,6 +15,18 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool "udev daemon"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Install the udev daemon.
+
+if BR2_PACKAGE_EUDEV_DAEMON
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
@@ -32,7 +41,9 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	help
 	  Enables hardware database installation to /etc/udev/hwdb.d
 
-endif
+endif # BR2_PACKAGE_EUDEV_DAEMON
+
+endif # BR2_PACKAGE_EUDEV
 
 comment "eudev needs eudev /dev management"
 	depends on BR2_USE_MMU
diff --git a/system/Config.in b/system/Config.in
index b895db9..26861a5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -129,6 +129,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_EUDEV_DAEMON
 
 comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.7.4
