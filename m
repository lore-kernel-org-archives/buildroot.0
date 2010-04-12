From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:32 +0200
Subject: [Buildroot] [PATCH 20/21] libmad: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <97bb1c40446257b08b65daf43cadc0e06fbd843e.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/libmad/libmad.mk |   77 +++++------------------------------
 1 files changed, 10 insertions(+), 67 deletions(-)

diff --git a/package/multimedia/libmad/libmad.mk b/package/multimedia/libmad/libmad.mk
index 83be902..1cc1248 100644
--- a/package/multimedia/libmad/libmad.mk
+++ b/package/multimedia/libmad/libmad.mk
@@ -7,75 +7,18 @@
 LIBMAD_VERSION=0.15.1b
 LIBMAD_SOURCE=libmad-$(LIBMAD_VERSION).tar.gz
 LIBMAD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
-LIBMAD_DIR=$(BUILD_DIR)/libmad-$(LIBMAD_VERSION)
-LIBMAD_CAT:=$(ZCAT)
+LIBMAD_INSTALL_STAGING=YES
+LIBMAD_LIBTOOL_PATCH=NO
 
-$(DL_DIR)/$(LIBMAD_SOURCE):
-	$(call DOWNLOAD,$(LIBMAD_SITE),$(LIBMAD_SOURCE))
-
-$(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
-	$(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(LIBMAD_DIR)
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/multimedia/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/multimedia/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
+define LIBMAD_PREVENT_AUTOMAKE
 	# Prevent automake from running.
-	(cd $(LIBMAD_DIR); touch -c config* aclocal.m4 Makefile*);
-	touch $@
-
-$(LIBMAD_DIR)/.configured: $(LIBMAD_DIR)/.unpacked
-	(cd $(LIBMAD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--disable-debugging \
-		--enable-speed \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
-	rm -f $@
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBMAD_DIR)
-
-$(STAGING_DIR)/usr/lib/libmad.so.0: $(LIBMAD_DIR)/libmad.la
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libmad.la
-
-$(TARGET_DIR)/usr/lib/libmad.so.0: $(STAGING_DIR)/usr/lib/libmad.so.0
-ifeq ($(BR2_HAVE_DEVFILES),y)
-	mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.la $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.a $(TARGET_DIR)/usr/lib/
-endif
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so.* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmad.so.*
-
-libmad: $(TARGET_DIR)/usr/lib/libmad.so.0
+	(cd $(@D); touch -c config* aclocal.m4 Makefile*);
+endef
 
-libmad-source: $(DL_DIR)/$(LIBMAD_SOURCE)
-
-libmad-clean:
-	-$(MAKE) -C $(LIBMAD_DIR) clean
-	-rm -f $(STAGING_DIR)/usr/lib/libmad.*
-	rm -f $(STAGING_DIR)/usr/include/mad.h
-	-rm -f $(TARGET_DIR)/usr/lib/libmad.*
-	rm -f $(TARGET_DIR)/usr/include/mad.h
+LIBMAD_POST_PATCH_HOOKS += LIBMAD_PREVENT_AUTOMAKE
 
+LIBMAD_CONF_OPT = \
+		--disable-debugging \
+		--enable-speed
 
-libmad-dirclean:
-	rm -rf $(LIBMAD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBMAD),y)
-TARGETS+=libmad
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,libmad))
\ No newline at end of file
-- 
1.6.3.3
