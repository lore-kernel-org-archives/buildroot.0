From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 23:10:20 +0200
Subject: [Buildroot] [git commit] ttcp: convert to generic-package
	infrastructure
Message-ID: <20121009073903.927009980B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cb9b7430fb99acfe11f4d23ac93dcb3a6dfed9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor fixes]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ttcp/ttcp.mk |   55 +++++++++++++------------------------------------
 1 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 080286b..d8d03ec 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -4,47 +4,22 @@
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
+define TTCP_EXTRACT_CMDS
+	cp -f -t $(@D) $(DL_DIR)/$(TTCP_SOURCE)
+endef
 
-$(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
-	-mkdir $(TTCP_DIR)
-	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
-	support/scripts/apply-patches.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
-	touch $(TTCP_DIR)/.unpacked
+define TTCP_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) \
+		-o $(@D)/ttcp $(@D)/$(TTCP_SOURCE)
+endef
 
-$(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
-	touch $(TTCP_DIR)/.configured
+define TTCP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ttcp $(TARGET_DIR)/usr/bin/ttcp
+endef
 
-$(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
-	$(TARGET_CC) -O2 -o $(TTCP_DIR)/ttcp $(TTCP_DIR)/$(TTCP_SOURCE)
-
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
