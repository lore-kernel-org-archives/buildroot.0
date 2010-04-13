From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] libosip2: convert to the autotools
	infrastructure
Message-ID: <20100413195155.5D1B720F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aca0487261702a0cdf16551c262d83f8879329d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libosip2/libosip2.mk |   83 +++---------------------------------------
 1 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 04a75c5..441b84c 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -3,85 +3,14 @@
 # libosip2
 #
 #############################################################
-
 LIBOSIP2_VERSION=3.1.0
 LIBOSIP2_SOURCE=libosip2-$(LIBOSIP2_VERSION).tar.gz
 LIBOSIP2_SITE=http://www.antisip.com/download/exosip2
-LIBOSIP2_DIR=$(BUILD_DIR)/libosip2-$(LIBOSIP2_VERSION)
-LIBOSIP2_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(LIBOSIP2_SOURCE):
-	$(call DOWNLOAD,$(LIBOSIP2_SITE),$(LIBOSIP2_SOURCE))
-
-$(LIBOSIP2_DIR)/.unpacked: $(DL_DIR)/$(LIBOSIP2_SOURCE)
-	$(LIBOSIP2_CAT) $(DL_DIR)/$(LIBOSIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(LIBOSIP2_DIR)
-	touch $(LIBOSIP2_DIR)/.unpacked
-
-$(LIBOSIP2_DIR)/.configured: $(LIBOSIP2_DIR)/.unpacked
-	(cd $(LIBOSIP2_DIR); rm -rf config.cache; \
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
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--includedir=/usr/include \
-		--with-gnu-ld \
-		--enable-shared \
-		--enable-static \
-		$(DISABLE_NLS) \
-	)
-	touch $(LIBOSIP2_DIR)/.configured
-
-$(LIBOSIP2_DIR)/libosip2.so: $(LIBOSIP2_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBOSIP2_DIR)
-
-$(STAGING_DIR)/usr/lib/libosip2.so: $(LIBOSIP2_DIR)/.configured
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOSIP2_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libosip2.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libosipparser2.la
-
-$(TARGET_DIR)/usr/lib/libosip2.so: $(STAGING_DIR)/usr/lib/libosip2.so
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libosip2.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libosip2.so*
-
-$(TARGET_DIR)/usr/lib/libosipparser2.so: $(STAGING_DIR)/usr/lib/libosip2.so
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libosipparser2.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libosipparser2.so*
+LIBOSIP2_INSTALL_STAGING=YES
 
-libosip2: $(TARGET_DIR)/usr/lib/libosip2.so $(TARGET_DIR)/usr/lib/libosipparser2.so
+LIBOSIP2_CONF_OPT = \
+	--with-gnu-ld \
+	--enable-shared \
+	--enable-static
 
-libosip2-source: $(DL_DIR)/$(LIBOSIP2_SOURCE)
-
-libosip2-clean:
-	-$(MAKE) -C $(LIBOSIP2_DIR) clean
-	-rm -f $(STAGING_DIR)/usr/lib/libosip2.*
-	-rm -f $(STAGING_DIR)/usr/lib/libosipparser2.*
-	-rm -f $(TARGET_DIR)/usr/lib/libosip2.*
-	-rm -f $(TARGET_DIR)/usr/lib/libosipparser2.*
-
-libosip2-dirclean:
-	rm -rf $(LIBOSIP2_DIR)
-
-.PHONY: libosip2-headers libosip2-target-headers
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBOSIP2),y)
-TARGETS+=libosip2
-endif
+$(eval $(call AUTOTARGETS,package,libosip2))
-- 
1.6.3.3
