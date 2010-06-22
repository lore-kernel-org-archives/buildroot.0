From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:20:58 +0200
Subject: [Buildroot] [PATCH 04/20] links : convert to autotools
	infrastructure & bump to 1.01pre1-no-ssl
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a6527f404e26debce3c2b535e2c7de7c8801a671.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default behaviour
 * No installation to staging is the default behaviour
 * Stripping is done globally
 * Remove incorrect cleaning rules

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/links/links.mk |   62 ++++-------------------------------------------
 1 files changed, 6 insertions(+), 56 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 298c165..2e17066 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -3,64 +3,14 @@
 # links (text based web browser)
 #
 #############################################################
-LINKS_VERSION:=0.99pre9-no-ssl
+LINKS_VERSION:=1.01pre1-no-ssl
 LINKS_SITE:=http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/links/download/no-ssl
 LINKS_SOURCE:=links-$(LINKS_VERSION).tar.gz
-LINKS_DIR:=$(BUILD_DIR)/links-$(LINKS_VERSION)
 
-$(DL_DIR)/$(LINKS_SOURCE):
-	$(call DOWNLOAD,$(LINKS_SITE),$(LINKS_SOURCE))
+LINKS_CONF_OPT = --localstatedir=/tmp
 
-links-source: $(DL_DIR)/$(LINKS_SOURCE)
+define LINKS_INSTALL_TARGET_CMDS
+	install -c $(@D)/links $(TARGET_DIR)/usr/bin/links
+endef
 
-$(LINKS_DIR)/.unpacked: $(DL_DIR)/$(LINKS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LINKS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LINKS_DIR)/.unpacked
-
-$(LINKS_DIR)/.configured: $(LINKS_DIR)/.unpacked
-	(cd $(LINKS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/tmp \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
-	touch $(LINKS_DIR)/.configured
-
-$(LINKS_DIR)/links: $(LINKS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LINKS_DIR)
-	$(STRIPCMD) $(LINKS_DIR)/links
-
-$(TARGET_DIR)/usr/bin/links: $(LINKS_DIR)/links
-	install -c $(LINKS_DIR)/links $(TARGET_DIR)/usr/bin/links
-
-links-clean:
-	-$(MAKE) -C $(LINKS_DIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/links
-
-links-dirclean:
-	rm -rf $(LINKS_DIR)
-
-links: $(TARGET_DIR)/usr/bin/links
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LINKS),y)
-TARGETS+=links
-endif
+$(eval $(call AUTOTARGETS,package,links))
-- 
1.7.0.4
