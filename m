From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:07 +0800
Subject: [Buildroot] [PATCH 05/19] dialog : convert to autotools
	infrastructure & bump to 1.1-20100428
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-6-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/dialog/dialog.mk |   63 +++++++++------------------------------------
 1 files changed, 13 insertions(+), 50 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 9c6f2a9..c34510a 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -3,59 +3,22 @@
 # dialog
 #
 #############################################################
-DIALOG_VERSION:=1.1-20070704
+DIALOG_VERSION:=1.1-20100428
 DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE:=ftp://invisible-island.net/dialog
-DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
-DIALOG_BINARY:=dialog
-DIALOG_TARGET_BINARY:=usr/bin/dialog
 
-$(DL_DIR)/$(DIALOG_SOURCE):
-	$(call DOWNLOAD,$(DIALOG_SITE),$(DIALOG_SOURCE))
+DIALOG_INSTALL_STAGING = NO
+DIALOG_INSTALL_TARGET = YES
+DIALOG_DEPENDENCIES = ncurses
 
-$(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(DIALOG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(DIALOG_DIR)
-	touch $@
+define DIALOG_INSTALL_TARGET_CMDS
+	install -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
+	$(STRIPCMD) $(@D)/dialog
+endef
 
-$(DIALOG_DIR)/.configured: $(DIALOG_DIR)/.source
-	(cd $(DIALOG_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc; \
-	)
-	touch $@
+define DIALOG_POST_CLEAN
+	-$(MAKE) -C $(@D) clean
+	rm -f $(TARGET_DIR)/usr/bin/dialog
+endef
 
-$(DIALOG_DIR)/$(DIALOG_BINARY): $(DIALOG_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DIALOG_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/$(DIALOG_TARGET_BINARY): $(DIALOG_DIR)/$(DIALOG_BINARY)
-	$(MAKE) prefix=$(TARGET_DIR)/usr \
-		mandir=$(TARGET_DIR)/usr/share/man \
-		-C $(DIALOG_DIR) install
-
-dialog: ncurses $(TARGET_DIR)/$(DIALOG_TARGET_BINARY)
-
-dialog-source: $(DL_DIR)/$(DIALOG_SOURCE)
-
-dialog-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(DIALOG_DIR) uninstall
-	-$(MAKE) -C $(DIALOG_DIR) clean
-
-dialog-dirclean:
-	rm -rf $(DIALOG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DIALOG),y)
-TARGETS+=dialog
-endif
+$(eval $(call AUTOTARGETS,package,dialog))
-- 
1.7.0.4
