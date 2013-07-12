From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Jul 2013 08:34:45 -0300
Subject: [Buildroot] [PATCH] usbutils: bump to version 007
Message-ID: <1373628885-12093-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/usbutils.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index c56702b..d809463 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 006
-USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils/
-USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
+USBUTILS_VERSION = 007
+USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb
 USBUTILS_INSTALL_STAGING = YES
-# no configure in tarball
-USBUTILS_AUTORECONF = YES
 USBUTILS_LICENSE = GPLv2+
 USBUTILS_LICENSE_FILES = COPYING
 
@@ -25,6 +22,15 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	USBUTILS_DEPENDENCIES += busybox
 endif
 
+# Nice lsusb.py script only if there's python
+ifeq ($(BR2_PACKAGE_PYTHON),)
+define USBUTILS_REMOVE_PYTHON
+	rm -f $(TARGET_DIR)/usr/bin/lsusb.py
+endef
+endif
+
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_PYTHON
+
 define USBUTILS_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/usb-devices
 	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
-- 
1.8.1.5
