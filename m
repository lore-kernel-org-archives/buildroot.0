From: heiko at zuerker.org <heiko@zuerker.org>
Date: Tue,  7 Dec 2010 10:24:54 -0600
Subject: [Buildroot] [PATCH] hwdata: ensure hwdata's usb.ids and pci.ids is
	used
Message-ID: <42c4bb22ac27f4b61978355733b0189d351a4aca.1291738310.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

When pciutils and/or usbutils gets installed, they install their own version
of the .ids files in /usr/share, which we don't want.
Delete them and symlink to the more current hwdata versions.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/hwdata/hwdata.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7a0cef8..94a86eb 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,9 +8,24 @@ HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
 HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
 
+HWDATA_DEPENDENCIES=
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
+    HWDATA_DEPENDENCIES+=pciutils
+endif
+ifeq ($(BR2_PACKAGE_USBUTILS),y)
+    HWDATA_DEPENDENCIES+=usbutils
+endif
+
 define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
 	install -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
+
+	# get rid of the pci.ids and usb.ids provided by usbutils and pciutils
+	# and link them to our more current version
+	test -e $(TARGET_DIR)/usr/share/pci.ids* && rm $(TARGET_DIR)/usr/share/pci.ids*
+	ln -sf hwdata/pci.ids $(TARGET_DIR)/usr/share/pci.ids
+	test -e $(TARGET_DIR)/usr/share/usb.ids* && rm $(TARGET_DIR)/usr/share/usb.ids*
+	ln -sf hwdata/usb.ids $(TARGET_DIR)/usr/share/usb.ids
 endef
 
 define HWDATA_UNINSTALL_TARGET_CMDS
-- 
1.7.3.2
