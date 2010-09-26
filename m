From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:00 -0700
Subject: [Buildroot] [PATCH 09/18] fbset: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-9-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/fbset/fbset.mk |   59 +++++++++++++----------------------------------
 1 files changed, 17 insertions(+), 42 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 32ab4b8..748920d 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -3,49 +3,24 @@
 # fbset
 #
 #############################################################
-FBSET_VERSION:=2.1
-FBSET_SOURCE:=fbset-$(FBSET_VERSION).tar.gz
-FBSET_SITE:=http://users.telenet.be/geertu/Linux/fbdev
-FBSET_DIR:=$(BUILD_DIR)/fbset-$(FBSET_VERSION)
-FBSET_CAT:=$(ZCAT)
-FBSET_BINARY:=fbset
-FBSET_TARGET_BINARY:=usr/sbin/$(FBSET_BINARY)
-
-$(DL_DIR)/$(FBSET_SOURCE):
-	$(call DOWNLOAD,$(FBSET_SITE),$(FBSET_SOURCE))
-
-$(FBSET_DIR)/.unpacked: $(DL_DIR)/$(FBSET_SOURCE)
-	$(FBSET_CAT) $(DL_DIR)/$(FBSET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FBSET_DIR) package/fbset/ \
-		fbset-$(FBSET_VERSION)\*.patch \
-		fbset-$(FBSET_VERSION)\*.patch.$(ARCH)
-	touch $@
-
-$(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(FBSET_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
-	$(INSTALL) -m 755 $(FBSET_DIR)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
+FBSET_VERSION = 2.1
+FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
+FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_BINARY = fbset
+FBSET_TARGET_BINARY = usr/sbin/$(FBSET_BINARY)
+
+define FBSET_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FBSET_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	touch -c $@
-
-fbset: $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-
-fbset-source: $(DL_DIR)/$(FBSET_SOURCE)
+endef
 
-fbset-clean:
+define FBSET_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	-$(MAKE) -C $(FBSET_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-fbset-dirclean:
-	rm -rf $(FBSET_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FBSET),y)
-TARGETS+=fbset
-endif
+$(eval $(call GENTARGETS,package,fbset))
-- 
1.7.3
