From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:03 -0700
Subject: [Buildroot] [PATCH 12/18] hotplug: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-12-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is one caveat with this, diethotplug-0.5.tar needs to be hosted some
place. It's not available anywhere that I can find. It's a custome version
written for buildroot.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/hotplug/hotplug.mk |   47 +++++++++++++------------------------------
 1 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/package/hotplug/hotplug.mk b/package/hotplug/hotplug.mk
index 0b354a8..04928cc 100644
--- a/package/hotplug/hotplug.mk
+++ b/package/hotplug/hotplug.mk
@@ -3,43 +3,24 @@
 # hotplug support
 #
 #############################################################
-HOTPLUG_VERSION:=0.5
-HOTPLUG_SOURCE=package/hotplug/diethotplug-$(HOTPLUG_VERSION).tar
-HOTPLUG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-$(HOTPLUG_VERSION)
-HOTPLUG_CAT=cat
+HOTPLUG_VERSION = 0.5
+HOTPLUG_SOURCE = package/hotplug/diethotplug-$(HOTPLUG_VERSION).tar
+HOTPLUG_SITE = $(BR2_KERNEL_MIRROR)linux/utils/kernel/hotplug
 
-$(HOTPLUG_DIR): $(HOTPLUG_SOURCE)
-	$(HOTPLUG_CAT) $(HOTPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HOTPLUG_DIR) package/hotplug/ hotplug\*.patch
-
-$(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)
+define HOTPLUG_BUILD_CMDS
 	$(MAKE) CROSS=$(TARGET_CROSS) DEBUG=false KLIBC=false \
 	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
-	    TARGET_DIR=$(TARGET_DIR) -C $(HOTPLUG_DIR)
-	$(STRIPCMD) $(HOTPLUG_DIR)/hotplug
-	touch -c $(HOTPLUG_DIR)/hotplug
-
-$(TARGET_DIR)/sbin/hotplug: $(HOTPLUG_DIR)/hotplug
-	cp $(HOTPLUG_DIR)/hotplug $(TARGET_DIR)/sbin/hotplug
-	touch -c $(TARGET_DIR)/sbin/hotplug
+	    TARGET_DIR=$(TARGET_DIR) -C $(@D)
+	$(STRIPCMD) $(@D)/hotplug
+endef
 
-hotplug: $(TARGET_DIR)/sbin/hotplug
+define HOTPLUG_INSTALL_TARGET_CMDS
+	cp $(@D)/hotplug $(TARGET_DIR)/sbin/hotplug
+endef
 
-hotplug-source: $(HOTPLUG_SOURCE)
-
-hotplug-clean:
+define HOTPLUG_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/sbin/hotplug
-	-$(MAKE) -C $(HOTPLUG_DIR) clean
-
-hotplug-dirclean:
-	rm -rf $(HOTPLUG_DIR)
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HOTPLUG),y)
-TARGETS+=hotplug
-endif
+$(eval $(call GENTARGETS,package,hotplug))
-- 
1.7.3
