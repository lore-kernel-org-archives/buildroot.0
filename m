From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 18 Jan 2012 09:18:36 +0100
Subject: [Buildroot] [PATCH 1/2] udev: bump to 177
Message-ID: <1326874717-1666-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/udev/Config.in |    9 ++++++++-
 package/udev/S10udev   |    2 +-
 package/udev/udev.mk   |   15 ++++++++++-----
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 391c718..e793496 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_UDEV
 	bool "udev"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_USBUTILS
+	select BR2_PACKAGE_KMOD
 	help
 	  Userspace device daemon.
 
@@ -8,6 +11,11 @@ config BR2_PACKAGE_UDEV
 
 if BR2_PACKAGE_UDEV
 
+config BR2_PACKAGE_UDEV_RULES_GEN
+	bool "enable rules generator"
+	help
+	  Enable persistant rules generator
+
 config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	bool "enable all extras"
 	depends on BR2_LARGEFILE # acl
@@ -15,7 +23,6 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	select BR2_PACKAGE_USBUTILS
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/udev/S10udev b/package/udev/S10udev
index 29eb107..928c7b6 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -17,7 +17,7 @@
 #
 
 # Check for missing binaries
-UDEV_BIN=/sbin/udevd
+UDEV_BIN=/lib/udev/udev/udevd
 test -x $UDEV_BIN || exit 5
 
 # Check for config file and read it
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 1825396..395899a 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION = 173
+UDEV_VERSION = 177
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_INSTALL_STAGING = YES
@@ -12,15 +12,20 @@ UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib/udev	\
+	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
+	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
+	--with-firmware-path=/lib/firmware				\
 	--disable-introspection
 
-UDEV_DEPENDENCIES = host-gperf host-pkg-config
+UDEV_DEPENDENCIES = host-gperf host-pkg-config e2fsprogs kmod usbutils
+
+ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
+UDEV_CONF_OPT += --enable-rule_generator
+endif
 
 ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
+UDEV_DEPENDENCIES += libusb libusb-compat acl hwdata libglib2
 UDEV_CONF_OPT +=							\
-	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
-	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
 	--enable-udev_acl
 else
 UDEV_CONF_OPT +=		\
-- 
1.7.1.1
