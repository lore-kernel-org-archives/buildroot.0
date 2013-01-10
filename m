From: Jan Pedersen <jp@jp-embedded.com>
Date: Thu, 10 Jan 2013 11:13:28 +0100
Subject: [Buildroot] [PATCH 2/2] now using generic-package
In-Reply-To: <1357812808-3317-1-git-send-email-jp@jp-embedded.com>
References: <1357812808-3317-1-git-send-email-jp@jp-embedded.com>
Message-ID: <1357812808-3317-2-git-send-email-jp@jp-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
---
 package/infozip/infozip.mk |   46 ++++++++++++--------------------------------
 1 file changed, 12 insertions(+), 34 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 996a709..ce6e88f 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -3,41 +3,19 @@
 # infozip
 #
 #############################################################
-INFOZIP_VERSION:=30
-INFOZIP_SOURCE:=zip$(INFOZIP_VERSION).tgz
-INFOZIP_SITE:=ftp://ftp.info-zip.org/pub/infozip/src/
-INFOZIP_DIR = $(BUILD_DIR)/zip$(INFOZIP_VERSION)
+INFOZIP_VERSION = 30
+INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
+INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+INFOZIP_LICENSE = Info-ZIP
+INFOZIP_LICENSE_FILES = LICENCE
 
-$(DL_DIR)/$(INFOZIP_SOURCE):
-	$(call DOWNLOAD,$(INFOZIP_SITE)/$(INFOZIP_SOURCE))
+define INFOZIP_BUILD_CMDS
+	$(MAKE) -C $(@D) -f unix/Makefile generic CC=$(TARGET_CC)
+endef
 
-$(INFOZIP_DIR)/.source: $(DL_DIR)/$(INFOZIP_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(INFOZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
+define INFOZIP_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f unix/Makefile install prefix=$(TARGET_DIR)/usr CC=$(TARGET_CC)
+endef
 
-$(INFOZIP_DIR)/.build: $(INFOZIP_DIR)/.source
-	make -C $(INFOZIP_DIR) -f unix/Makefile generic CC=$(TARGET_CC)
-	touch $@
+$(eval $(generic-package))
 
-$(INFOZIP_DIR)/.install: $(INFOZIP_DIR)/.build
-	make -C $(INFOZIP_DIR) -f unix/Makefile install prefix=$(TARGET_DIR)/usr CC=$(TARGET_CC)
-	touch $@
-
-infozip: $(INFOZIP_DIR)/.install
-
-infozip-source: $(DL_DIR)/$(INFOZIP_SOURCE)
-
-infozip-clean:
-	rm -rf $(INFOZIP_DIR)
-
-infozip-dirclean:
-	rm -rf $(INFOZIP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_INFOZIP),y)
-TARGETS += infozip
-endif
-- 
1.7.10.4
