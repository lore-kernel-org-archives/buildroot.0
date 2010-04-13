From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] vtun: convert to the autotools
	infrastructure
Message-ID: <20100413195153.A361620F94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=516708f94fa1ed9f23c680e7fee6dce78b05f09f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vtun/vtun.mk |   76 +++----------------------------------------------
 1 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 15eba01..0990820 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -6,81 +6,15 @@
 # to enable that within busybox
 #
 #############################################################
-#Old version 2.6
 VTUN_VERSION:=3.0.2
 VTUN_SOURCE:=vtun-$(VTUN_VERSION).tar.gz
 VTUN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/vtun/
-VTUN_DIR:=$(BUILD_DIR)/vtun-$(VTUN_VERSION)
-VTUN_CAT:=$(ZCAT)
-VTUN_BINARY:=vtund
-VTUN_TARGET_BINARY:=usr/sbin/vtund
+VTUN_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+VTUN_DEPENDENCIES = zlib lzo openssl
 
-$(DL_DIR)/$(VTUN_SOURCE):
-	 $(call DOWNLOAD,$(VTUN_SITE),$(VTUN_SOURCE))
-
-vtun-source: $(DL_DIR)/$(VTUN_SOURCE)
-
-$(VTUN_DIR)/.unpacked: $(DL_DIR)/$(VTUN_SOURCE)
-	$(VTUN_CAT) $(DL_DIR)/$(VTUN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(VTUN_DIR)/.patched: $(VTUN_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(VTUN_DIR) package/vtun/ vtun-$(VTUN_VERSION)\*.patch
-	touch $@
-
-
-
-$(VTUN_DIR)/.configured: $(VTUN_DIR)/.patched
-	(cd $(VTUN_DIR); rm -rf config.cache; \
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
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+VTUN_CONF_OPT = \
 		--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
 		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
-		--with-lzo-lib=$(STAGING_DIR)/usr/lib \
-	)
-	touch $(VTUN_DIR)/.configured
-
-$(VTUN_DIR)/$(VTUN_BINARY): $(VTUN_DIR)/.configured
-	$(MAKE) -C $(VTUN_DIR)
-
-$(TARGET_DIR)/$(VTUN_TARGET_BINARY): $(VTUN_DIR)/$(VTUN_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(VTUN_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-vtun: zlib lzo openssl $(TARGET_DIR)/$(VTUN_TARGET_BINARY)
+		--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
-vtun-unpacked: $(VTUN_DIR)/.unpacked
-
-vtun-patched: $(VTUN_DIR)/.patched
-
-vtun-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(VTUN_DIR) uninstall
-	-$(MAKE) -C $(VTUN_DIR) clean
-
-vtun-dirclean:
-	rm -rf $(VTUN_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VTUN),y)
-TARGETS+=vtun
-endif
+$(eval $(call AUTOTARGETS,package,vtun))
-- 
1.6.3.3
