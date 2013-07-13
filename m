From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Jul 2013 23:58:18 +0200
Subject: [Buildroot] [git commit] usbutils: bump to version 007
Message-ID: <20130713220730.ED0AD9A3FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d1478267580d5110a1958d9f1b09b68091ffede
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move entire USBUTILS_REMOVE_PYTHON handling inside conditional]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbutils/usbutils.mk |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index c56702b..00904cb 100644
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
+
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_PYTHON
+endif
+
 define USBUTILS_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/usb-devices
 	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
