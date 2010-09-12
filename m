From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:04 +0200
Subject: [Buildroot] [PATCH 18/74] usbutils: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fcab98c31bd05bfa294fd9705275832e4256dcb1.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usbutils/usbutils.mk |   30 +++++++++++++++++++++++-------
 1 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 0f82128..508ca0d 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -14,18 +14,34 @@ else
 	USBUTILS_CONF_OPT = --disable-zlib
 endif
 
-$(eval $(call AUTOTARGETS,package,usbutils))
-
-$(USBUTILS_HOOK_POST_INSTALL):
+define USBUTILS_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/usb-devices
 	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
 	rm -f $(TARGET_DIR)/usr/share/pkgconfig/usbutils.pc
-ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
+endef
+
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_TARGET_CLEANUP
+
+define USBUTILS_REMOVE_UNCOMPRESSED_IDS
 	rm -f $(TARGET_DIR)/usr/share/usb.ids
-else
+endef
+
+define USBUTILS_REMOVE_COMPRESSED_IDS
 	rm -f $(TARGET_DIR)/usr/share/usb.ids.gz
+endef
+
+ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_UNCOMPRESSED_IDS
+else
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_COMPRESSED_IDS
 endif
-ifneq ($(BR2_HAVE_DEVFILES),y)
+
+define USBUTILS_REMOVE_DEVFILES
 	rm -f $(TARGET_DIR)/usr/bin/libusb-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
 endif
-	touch $@
+
+$(eval $(call AUTOTARGETS,package,usbutils))
-- 
1.7.0.4
