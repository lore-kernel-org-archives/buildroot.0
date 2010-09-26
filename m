From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:55 -0700
Subject: [Buildroot] [PATCH 04/18] bsdiff: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/bsdiff/bsdiff.mk |   51 +++++++++++++--------------------------------
 1 files changed, 15 insertions(+), 36 deletions(-)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 62608e9..d450083 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -3,23 +3,13 @@
 # bsdiff
 #
 #############################################################
-BSDIFF_VERSION:=4.3
-BSDIFF_SOURCE:=bsdiff-$(BSDIFF_VERSION).tar.gz
-BSDIFF_SITE:=http://www.daemonology.net/bsdiff
-BSDIFF_DIR:=$(BUILD_DIR)/bsdiff-$(BSDIFF_VERSION)
-BSDIFF_BINARY:=bsdiff
-BSDIFF_TARGET_BINARY:=usr/bin/bsdiff
-BSDIFF_ZCAT=$(ZCAT)
+BSDIFF_VERSION = 4.3
+BSDIFF_SOURCE = bsdiff-$(BSDIFF_VERSION).tar.gz
+BSDIFF_SITE = http://www.daemonology.net/bsdiff
+BSDIFF_DEPENDENCIES = bzip2
 
-$(DL_DIR)/$(BSDIFF_SOURCE):
-	$(call DOWNLOAD,$(BSDIFF_SITE),$(BSDIFF_SOURCE))
-
-$(BSDIFF_DIR)/.source: $(DL_DIR)/$(BSDIFF_SOURCE)
-	$(BSDIFF_ZCAT) $(DL_DIR)/$(BSDIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(BSDIFF_DIR)/.source
-
-$(BSDIFF_DIR)/$(BSDIFF_BINARY): $(BSDIFF_DIR)/.source
-	(cd $(BSDIFF_DIR); \
+define BSDIFF_BUILD_CMDS
+	(cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
@@ -28,27 +18,16 @@ $(BSDIFF_DIR)/$(BSDIFF_BINARY): $(BSDIFF_DIR)/.source
 		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
 			$(TARGET_CFLAGS) bspatch.c -o bspatch; \
 	)
+endef
 
-$(TARGET_DIR)/$(BSDIFF_TARGET_BINARY): $(BSDIFF_DIR)/$(BSDIFF_BINARY)
-	cp -dpf $(BSDIFF_DIR)/bsdiff $(TARGET_DIR)/usr/bin/.
-	cp -dpf $(BSDIFF_DIR)/bspatch $(TARGET_DIR)/usr/bin/.
-
-bsdiff: bzip2 $(TARGET_DIR)/$(BSDIFF_TARGET_BINARY)
+define BSDIFF_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/bsdiff $(TARGET_DIR)/usr/bin/bsdiff
+	cp -dpf $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
+endef
 
-bsdiff-source: $(DL_DIR)/$(BSDIFF_SOURCE)
-
-bsdiff-clean:
+define BSDIFF_CLEAN_CMDS
 	-rm $(TARGET_DIR)/usr/bin/{bsdiff,bspatch}
-	-rm $(BSDIFF_DIR)/{bsdiff,bspatch}
-
-bsdiff-dirclean:
-	rm -rf $(BSDIFF_DIR)
+	-rm $(@D)/{bsdiff,bspatch}
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BSDIFF),y)
-TARGETS+=bsdiff
-endif
+$(eval $(call GENTARGETS,package,bsdiff))
-- 
1.7.3
