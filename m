From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:06 -0700
Subject: [Buildroot] [PATCH 15/18] liberation: convert to gentargets and
	bump to 1.06.0.20100721
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-15-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/liberation/liberation.mk |   39 ++++++++-----------------------------
 1 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index ad65670..fdba4ba 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -3,40 +3,19 @@
 # liberation
 #
 #############################################################
-LIBERATION_VERSION = 1.04
+LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
-LIBERATION_SOURCE = liberation-fonts-$(LIBERATION_VERSION).tar.gz
-LIBERATION_DIR = $(BUILD_DIR)/liberation-fonts-$(LIBERATION_VERSION)
-LIBERATION_CAT:=$(ZCAT)
-LIBERATION_TARGET_DIR:=$(TARGET_DIR)/usr/share/fonts/liberation
+LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
-$(DL_DIR)/$(LIBERATION_SOURCE):
-	$(call DOWNLOAD,$(LIBERATION_SITE),$(LIBERATION_SOURCE))
+LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 
-liberation-source: $(DL_DIR)/$(LIBERATION_SOURCE)
-
-$(LIBERATION_DIR)/.unpacked: $(DL_DIR)/$(LIBERATION_SOURCE)
-	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
+define LIBERATION_INSTALL_TARGET_CMDS
 	mkdir -p $(LIBERATION_TARGET_DIR)
-	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(LIBERATION_TARGET_DIR)
-	touch -c $@
+	$(INSTALL) -m0644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)
+endef
 
-liberation: $(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf
-
-liberation-clean:
+define LIBERATION_CLEAN_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
+endef
 
-liberation-dirclean:
-	rm -rf $(LIBERATION_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBERATION),y)
-TARGETS+=liberation
-endif
+$(eval $(call GENTARGETS,package,liberation))
-- 
1.7.3
