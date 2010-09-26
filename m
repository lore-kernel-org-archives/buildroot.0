From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:53 -0700
Subject: [Buildroot] [PATCH 02/18] axel: convert to gentargets and bump to
	2.4
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/axel/axel.mk |   67 ++++++++++++++++++++-----------------------------
 1 files changed, 27 insertions(+), 40 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 8891795..5c7ed23 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -3,53 +3,40 @@
 # axel
 #
 #############################################################
-AXEL_VERSION:=1.1
-AXEL_SOURCE:=axel-$(AXEL_VERSION).tar.gz
-AXEL_SITE:=http://alioth.debian.org/frs/download.php/2287
-AXEL_CAT:=$(ZCAT)
-AXEL_DIR:=$(BUILD_DIR)/axel-$(AXEL_VERSION)
-AXEL_BINARY:=axel
-AXEL_TARGET_BINARY:=usr/bin/axel
+AXEL_VERSION = 2.4
+AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
+AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 
-$(DL_DIR)/$(AXEL_SOURCE):
-	 $(call DOWNLOAD,$(AXEL_SITE),$(AXEL_SOURCE))
-
-axel-source: $(DL_DIR)/$(AXEL_SOURCE)
-
-$(AXEL_DIR)/.unpacked: $(DL_DIR)/$(AXEL_SOURCE)
-	$(AXEL_CAT) $(DL_DIR)/$(AXEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(AXEL_DIR) package/axel axel\*.patch
-	touch $@
+ifneq ($(BR2_ENABLE_LOCALE),y)
+AXEL_DISABLE_I18N=--i18n=0
+endif
 
-$(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
-	(cd $(AXEL_DIR); \
-		./configure --i18n=0 --prefix=/usr \
+define AXEL_CONFIGURE_CMDS
+	(cd $(@D); \
+		./configure \
+			--prefix=/usr \
+			$(AXEL_DISABLE_I18N) \
 	)
-	touch $@
+endef
 
-$(AXEL_DIR)/$(AXEL_BINARY): $(AXEL_DIR)/Makefile.settings
-	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(AXEL_DIR)
+define AXEL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(@D)
+endef
 
-$(TARGET_DIR)/$(AXEL_TARGET_BINARY): $(AXEL_DIR)/$(AXEL_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-bin
 ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-man
+define AXEL_INSTALL_DOCUMENTATION
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-man
+endef
 endif
 
-axel: $(TARGET_DIR)/$(AXEL_TARGET_BINARY)
+define AXEL_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-bin
+	$(AXEL_INSTALL_DOCUMENTATION)
+endef
 
-axel-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) uninstall
-	-$(MAKE) -C $(AXEL_DIR) clean
+define AXEL_CLEAN_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+	-$(MAKE) -C $(@D) clean
+endef
 
-axel-dirclean:
-	rm -rf $(AXEL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AXEL),y)
-TARGETS+=axel
-endif
+$(eval $(call GENTARGETS,package,axel))
-- 
1.7.3
