From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 11:17:10 -0300
Subject: [Buildroot] [PATCHv2] usbutils: bump to version 008
Message-ID: <1415715430-6657-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now uses hwdb from libudev for usb information.
Drop all redundant/obsolete dependencies and cleanup hooks.
Don't install to staging, it's pointless, it provides no libraries at
all and it doesn't bundle usb.ids any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/Config.in     | 18 +++++-------------
 package/usbutils/usbutils.hash |  2 +-
 package/usbutils/usbutils.mk   | 33 ++-------------------------------
 3 files changed, 8 insertions(+), 45 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index a64e674..3e948b7 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,24 +1,16 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
 
 	  http://linux-usb.sourceforge.net/
 
-if BR2_PACKAGE_USBUTILS
-
-config BR2_PACKAGE_USBUTILS_ZLIB
-	bool "compressed data support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable use of zlib for a compressed usb.ids.gz
-	  This makes the data file smaller if you're not using a compressed
-	  filesystem, but it also makes lsusb slower since it has
-	  to decompress the file every time it's run.
-
-endif
-
 comment "usbutils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HAS_UDEV
+
+comment "usbutils requires eudev or systemd to be enabled"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 6023f39..37c829a 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256	7593a01724bbc0fd9fe48e62bc721ceb61c76654f1d7b231b3c65f6dfbbaefa4	usbutils-007.tar.xz
+sha256	44741af0bae9d402a0ef160a29b2fa700bb656ab5e0a4b3343d51249c2a44c8c	usbutils-008.tar.xz
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 0e9b52f..56fa0ba 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,20 +4,13 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 007
+USBUTILS_VERSION = 008
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
-USBUTILS_DEPENDENCIES = host-pkgconf libusb
-USBUTILS_INSTALL_STAGING = YES
+USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
 USBUTILS_LICENSE = GPLv2+
 USBUTILS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
-	USBUTILS_DEPENDENCIES += zlib
-else
-	USBUTILS_CONF_OPTS = --disable-zlib
-endif
-
 # Build after busybox since it's got a lightweight lsusb
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	USBUTILS_DEPENDENCIES += busybox
@@ -34,30 +27,8 @@ endif
 
 define USBUTILS_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/usb-devices
-	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
-	rm -f $(TARGET_DIR)/usr/share/pkgconfig/usbutils.pc
 endef
 
 USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_TARGET_CLEANUP
 
-define USBUTILS_REMOVE_UNCOMPRESSED_IDS
-	rm -f $(TARGET_DIR)/usr/share/usb.ids
-endef
-
-define USBUTILS_REMOVE_COMPRESSED_IDS
-	rm -f $(TARGET_DIR)/usr/share/usb.ids.gz
-endef
-
-ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
-USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_UNCOMPRESSED_IDS
-else
-USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_COMPRESSED_IDS
-endif
-
-define USBUTILS_REMOVE_DEVFILES
-	rm -f $(TARGET_DIR)/usr/bin/libusb-config
-endef
-
-USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
-
 $(eval $(autotools-package))
-- 
2.0.4
