From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:05 -0700
Subject: [Buildroot] [PATCH 14/18] hwdata: convert to gentargets and bump to
	0.230
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-14-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/hwdata/hwdata.mk |   54 ++++++++++++----------------------------------
 1 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index ed81cd7..d6b7b4a 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -3,48 +3,22 @@
 # hwdata
 #
 #############################################################
-HWDATA_VERSION:=0.191
-HWDATA_SOURCE:=hwdata_$(HWDATA_VERSION).orig.tar.gz
-HWDATA_PATCH:=hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
-HWDATA_CAT:=$(ZCAT)
-HWDATA_DIR:=$(BUILD_DIR)/hwdata-$(HWDATA_VERSION)
-HWDATA_BINARY:=pci.ids
-HWDATA_TARGET_BINARY:=usr/share/hwdata/pci.ids
-
-$(DL_DIR)/$(HWDATA_SOURCE):
-	 $(call DOWNLOAD,$(HWDATA_SITE),$(HWDATA_SOURCE))
-
-$(DL_DIR)/$(HWDATA_PATCH):
-	 $(call DOWNLOAD,$(HWDATA_SITE),$(HWDATA_PATCH))
-
-hwdata-source: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
-
-$(HWDATA_DIR)/.unpacked: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
-	$(HWDATA_CAT) $(DL_DIR)/$(HWDATA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HWDATA_DIR) $(DL_DIR) $(HWDATA_PATCH)
-	touch $(HWDATA_DIR)/.unpacked
-
-$(TARGET_DIR)/$(HWDATA_TARGET_BINARY): $(HWDATA_DIR)/.unpacked
+HWDATA_VERSION = 0.230
+HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
+HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
+HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
+HWDATA_BINARY = pci.ids
+HWDATA_TARGET_BINARY = usr/share/hwdata/pci.ids
+
+define HWDATA_INSTALL_TARGET_CMDS
 	mkdir -p -m 755 $(TARGET_DIR)/usr/share/hwdata
-	cp -a $(HWDATA_DIR)/pci.ids $(TARGET_DIR)/usr/share/hwdata
-	cp -a $(HWDATA_DIR)/usb.ids $(TARGET_DIR)/usr/share/hwdata
-	-touch -c $(TARGET_DIR)/usr/share/hwdata/*
-
-hwdata: $(TARGET_DIR)/$(HWDATA_TARGET_BINARY)
+	cp -a $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata
+	cp -a $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata
+endef
 
-hwdata-clean:
+define HWDATA_CLEAN_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/hwdata
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+endef
 
-hwdata-dirclean:
-	rm -rf $(HWDATA_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HWDATA),y)
-TARGETS+=hwdata
-endif
+$(eval $(call GENTARGETS,package,hwdata))
-- 
1.7.3
