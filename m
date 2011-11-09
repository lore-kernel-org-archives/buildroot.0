From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 Nov 2011 23:03:12 -0300
Subject: [Buildroot] [PATCH] devmem2: undeprecate and conver to gentargets
Message-ID: <1320804192-28868-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/devmem2/Config.in  |    1 -
 package/devmem2/devmem2.mk |   49 +++++++++++++++++--------------------------
 2 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
index 233b4b0..cb00a51 100644
--- a/package/devmem2/Config.in
+++ b/package/devmem2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DEVMEM2
 	bool "devmem2"
-	depends on BR2_DEPRECATED
 	help
 	  Simple program to read/write from/to any location in memory.
 
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index 457a181..f477589 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -4,39 +4,28 @@
 #
 #############################################################
 
-DEVMEM2_SOURCE:=devmem2.c
-DEVMEM2_SITE:=http://free-electrons.com/pub/mirror
-DEVMEM2_BINARY:=devmem2
-DEVMEM2_DIR:=$(BUILD_DIR)/devmem2
+DEVMEM2_SITE = http://free-electrons.com/pub/mirror
+DEVMEM2_SOURCE = devmem2.c
+DEVMEM2_VERSION = 1
 
-$(DL_DIR)/$(DEVMEM2_SOURCE):
-	$(call DOWNLOAD,$(DEVMEM2_SITE),$(DEVMEM2_SOURCE))
+define DEVMEM2_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+endef
 
-$(DEVMEM2_DIR)/$(DEVMEM2_SOURCE): $(DL_DIR)/$(DEVMEM2_SOURCE)
-	mkdir -p $(@D)
-	cp $^ $@
+define DEVMEM2_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) devmem2
+endef
 
-$(DEVMEM2_DIR)/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_SOURCE)
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
+define DEVMEM2_CLEAN_CMDS
+	rm -f $(@D)/devmem2
+endef
 
-$(TARGET_DIR)/sbin/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_BINARY)
-	cp $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+define DEVMEM2_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
+endef
 
-devmem2: $(TARGET_DIR)/sbin/$(DEVMEM2_BINARY)
+define DEVMEM2_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/devmem2
+endef
 
-devmem2-source: $(DL_DIR)/$(DEVMEM2_SOURCE)
-
-devmem2-clean:
-	rm -f $(TARGET_DIR/sbin/$(DEVMEM2_BINARY)
-
-devmem2-dirclean:
-	rm -rf $(DEVMEM2_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DEVMEM2),y)
-TARGETS+=devmem2
-endif
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
