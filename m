From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:09 -0700
Subject: [Buildroot] [PATCH 18/18] logrotate: convert to gentargets and bump
	to 3.7.9
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-18-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/logrotate/logrotate.mk |   57 +++++++++++++++++-----------------------
 1 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 337fd8e..3a70a50 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -1,42 +1,33 @@
-LOGROTATE_VERSION:=3.7.7
-LOGROTATE_SOURCE:=logrotate-$(LOGROTATE_VERSION).tar.gz
-LOGROTATE_SITE:=https://fedorahosted.org/releases/l/o/logrotate/
-LOGROTATE_DIR:=$(BUILD_DIR)/logrotate-$(LOGROTATE_VERSION)
-LOGROTATE_BINARY:=logrotate
-LOGROTATE_TARGET_BINARY:=usr/sbin/$(LOGROTATE_BINARY)
-
-$(DL_DIR)/$(LOGROTATE_SOURCE):
-	$(call DOWNLOAD,$(LOGROTATE_SITE),$(LOGROTATE_SOURCE))
-
-$(LOGROTATE_DIR)/.source: $(DL_DIR)/$(LOGROTATE_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LOGROTATE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ logrotate\*.patch
-	touch $@
-
-$(LOGROTATE_DIR)/$(LOGROTATE_BINARY): $(LOGROTATE_DIR)/.source
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(LOGROTATE_DIR)
-
-$(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
-	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
+#############################################################
+#
+# logrotate
+#
+#############################################################
+LOGROTATE_VERSION = 3.7.9
+LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
+LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_BINARY = logrotate
+LOGROTATE_TARGET_BINARY = usr/sbin/$(LOGROTATE_BINARY)
+
+LOGROTATE_DEPENDENCIES = popt
+
+define LOGROTATE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(@D)
+endef
+
+define LOGROTATE_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX=$(TARGET_DIR) -C $(@D) install
 	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then \
 		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf; \
 	fi
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
+endef
 
-logrotate: popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
-
-logrotate-source: $(DL_DIR)/$(LOGROTATE_SOURCE)
-
-logrotate-clean:
+define LOGROTATE_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/etc/logrotate.conf
 	-rmdir $(TARGET_DIR)/etc/logrotate.d
-	-$(MAKE) -C $(LOGROTATE_DIR) clean
-
-logrotate-dirclean:
-	rm -rf $(LOGROTATE_DIR)
-
-ifeq ($(BR2_PACKAGE_LOGROTATE),y)
-TARGETS+=logrotate
-endif
+	-$(MAKE) -C $(@D) clean
+endef
 
+$(eval $(call GENTARGETS,package,logrotate))
-- 
1.7.3
