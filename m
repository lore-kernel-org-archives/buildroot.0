From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Sep 2012 00:28:35 +0200
Subject: [Buildroot] [PATCH 3/6] ttcp: convert to generic-package
	infrastructure
In-Reply-To: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
References: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1348266518-27665-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 080286b..894b0cb 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -4,47 +4,25 @@
 #
 #############################################################
 #
-TTCP_VERSION:=
-TTCP_SOURCE_URL=http://ftp.sunet.se/pub/network/monitoring/ttcp
-TTCP_SOURCE=ttcp$(TTCP_VERSION).c
-TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
+TTCP_VERSION =
+TTCP_SITE    = http://ftp.sunet.se/pub/network/monitoring/ttcp
+TTCP_SOURCE  = ttcp.c
+TTCP_LICENSE = public domain
 
-$(DL_DIR)/$(TTCP_SOURCE):
-	 $(call DOWNLOAD,$(TTCP_SOURCE_URL)/$(TTCP_SOURCE))
+TTCP_BINARY  = ttcp
 
-$(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
-	-mkdir $(TTCP_DIR)
-	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
-	support/scripts/apply-patches.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
-	touch $(TTCP_DIR)/.unpacked
+define TTCP_EXTRACT_CMDS
+	cp -f -t $(@D) $(DL_DIR)/$(TTCP_SOURCE)
+endef
 
-$(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
-	touch $(TTCP_DIR)/.configured
+define TTCP_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) \
+		-o $(TTCP_SRCDIR)/$(TTCP_BINARY) $(@D)/$(TTCP_SOURCE)
+endef
 
-$(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
-	$(TARGET_CC) -O2 -o $(TTCP_DIR)/ttcp $(TTCP_DIR)/$(TTCP_SOURCE)
+define TTCP_INSTALL_TARGET_CMDS
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$(TTCP_BINARY)
+	$(INSTALL) -D -m 0755 $(@D)/$(TTCP_BINARY) $(TARGET_DIR)/usr/bin
+endef
 
-$(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
-	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
-
-ttcp-legal-info:
-	@$(call legal-warning-pkg,ttcp,legal-info not yet implemented)
-
-ttcp: $(TARGET_DIR)/usr/bin/ttcp
-
-ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
-
-ttcp-clean:
-	rm -f $(TTCP_DIR)/*.o $(TTCP_DIR)/ttcp
-
-ttcp-dirclean:
-	rm -rf $(TTCP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TTCP),y)
-TARGETS+=ttcp
-endif
+$(eval $(generic-package))
-- 
1.7.12.1
