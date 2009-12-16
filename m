From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] zlib: rework on top of the generic
	infrastructure
Message-ID: <20091216153044.5641C77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9e1d5ccd4dc0f3f2a614baccb0b79ea3975e0629
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zlib/zlib.mk |   93 +++++++++++++++----------------------------------
 1 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index f207bcf..5365b30 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -5,31 +5,19 @@
 #############################################################
 ZLIB_VERSION:=1.2.3
 ZLIB_SOURCE:=zlib-$(ZLIB_VERSION).tar.bz2
-ZLIB_CAT:=$(BZCAT)
 ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
-ZLIB_DIR:=$(BUILD_DIR)/zlib-$(ZLIB_VERSION)
-
-$(DL_DIR)/$(ZLIB_SOURCE):
-	$(call DOWNLOAD,$(ZLIB_SITE),$(ZLIB_SOURCE))
-
-$(ZLIB_DIR)/.patched: $(DL_DIR)/$(ZLIB_SOURCE)
-	$(ZLIB_CAT) $(DL_DIR)/$(ZLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ZLIB_DIR) package/zlib/ zlib\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
+ZLIB_INSTALL_STAGING=YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ZLIB_PIC :=
 ZLIB_SHARED :=
-ZLIB_TARGET := $(STAGING_DIR)/usr/lib/libz.a
 else
 ZLIB_PIC := -fPIC
 ZLIB_SHARED := --shared
-ZLIB_TARGET := $(TARGET_DIR)/usr/lib/libz.so
 endif
 
-$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
-	(cd $(ZLIB_DIR); rm -rf config.cache; \
+define ZLIB_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
@@ -40,55 +28,32 @@ $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
 		--libdir=$(STAGING_DIR)/usr/lib \
 		--includedir=$(STAGING_DIR)/usr/include \
 	)
-	touch $@
-
-$(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
-	$(MAKE) -C $(ZLIB_DIR) all libz.a
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libz.a: $(ZLIB_DIR)/libz.a
-	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
-	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
-	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.a
-	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
-	touch -c $@
+endef
+
+define ZLIB_BUILD_CMDS
+	$(MAKE) -C $(@D) all libz.a
+endef
+
+define ZLIB_INSTALL_STAGING_CMDS
+	$(INSTALL) -D $(@D)/libz.a $(STAGING_DIR)/usr/lib/libz.a
+	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
+	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
+	cp -dpf $(@D)/libz.so* $(STAGING_DIR)/usr/lib/
+endef
+
+ifeq ($(BR2_HAVE_DEVFILES),y)
+define ZLIB_INSTALL_TARGET_HEADERS
+	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
+	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
+endef
+endif
 
-$(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
+define ZLIB_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.a
-	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/zlib.h
-	$(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
-	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
-	touch -c $@
-
-zlib: $(ZLIB_TARGET) $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/libz.a)
+	cp -dpf $(@D)/libz.so* $(TARGET_DIR)/usr/lib
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libz.so*
+	$(INSTALL) -D $(@D)/libz.a $(TARGET_DIR)/usr/lib/libz.a
+	$(ZLIB_INSTALL_TARGET_HEADERS)
+endef
 
-zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
-
-zlib-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libz.* \
-	      $(TARGET_DIR)/usr/include/zlib.h \
-	      $(TARGET_DIR)/usr/include/zconf.h \
-	      $(STAGING_DIR)/usr/include/zlib.h \
-	      $(STAGING_DIR)/usr/include/zconf.h \
-	      $(STAGING_DIR)/usr/lib/libz.*
-	-$(MAKE) -C $(ZLIB_DIR) clean
-
-zlib-dirclean:
-	rm -rf $(ZLIB_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-TARGETS+=zlib
-endif
+$(eval $(call GENTARGETS,package,zlib))
-- 
1.6.3.3
