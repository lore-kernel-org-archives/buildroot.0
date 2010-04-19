From: keguang.zhang at gmail.com <keguang.zhang@gmail.com>
Date: Mon, 19 Apr 2010 15:06:45 +0800
Subject: [Buildroot] [PATCH] mplayer: convert to the generic-tools
	infrastructure
Message-ID: <1271660805-23631-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kelvin Cheung <keguang.zhang@gmail.com>

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/multimedia/mplayer/mplayer.mk |   63 +++++++++-----------------------
 1 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 538bac9..4d5e9e0 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -6,10 +6,7 @@
 MPLAYER_VERSION:=1.0rc2
 MPLAYER_SOURCE:=MPlayer-$(MPLAYER_VERSION).tar.bz2
 MPLAYER_SITE:=http://www7.mplayerhq.hu/MPlayer/releases
-MPLAYER_DIR:=$(BUILD_DIR)/MPlayer-$(MPLAYER_VERSION)
-MPLAYER_CAT:=$(BZCAT)
-MPLAYER_BINARY:=mplayer
-MPLAYER_TARGET_BINARY:=usr/bin/$(MPLAYER_BINARY)
+MPLAYER_DEPENDENCIES:=libmad alsa-lib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MPLAYER_ENDIAN:=--enable-big-endian
@@ -30,17 +27,8 @@ ifeq ($(BR2_i386),y)
 MPLAYER_CFLAGS:=-fomit-frame-pointer
 endif
 
-$(DL_DIR)/$(MPLAYER_SOURCE):
-	$(call DOWNLOAD,$(MPLAYER_SITE),$(MPLAYER_SOURCE))
-
-$(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
-	$(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/multimedia/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
-	$(CONFIG_UPDATE) $(MPLAYER_DIR)
-	touch $@
-
-$(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
-	(cd $(MPLAYER_DIR); rm -rf config.cache; \
+define MPLAYER_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS) $(MPLAYER_CFLAGS)" \
@@ -52,8 +40,6 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		--host-cc=$(HOSTCC) \
 		--cc=$(TARGET_CC) \
 		--as=$(TARGET_CROSS)as \
-		--with-extraincdir=$(STAGING_DIR)/usr/include \
-		--with-extralibdir=$(STAGING_DIR)/lib \
 		--charset=UTF-8 \
 		--enable-mad \
 		--enable-fbdev \
@@ -61,38 +47,25 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		$(MPLAYER_LARGEFILE) \
 		--enable-cross-compile \
 		--disable-ivtv \
-		--disable-tv \
-		--disable-live \
 		--enable-dynamic-plugins \
 	)
-	touch $@
-
-$(MPLAYER_DIR)/$(MPLAYER_BINARY): $(MPLAYER_DIR)/.configured
-	$(MAKE) -C $(MPLAYER_DIR)
-	touch -c $@
+endef
 
-$(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
-	$(INSTALL) -m 0755 -D $(MPLAYER_DIR)/$(MPLAYER_BINARY) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
-	touch -c $@
+define MPLAYER_BUILD_CMDS
+ $(MAKE) -C $(@D)
+endef
 
-mplayer: $(if $(BR2_PACKAGE_LIBMAD),libmad) $(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
+define MPLAYER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/mplayer $(TARGET_DIR)/usr/bin
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mplayer
+endef
 
-mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
-
-mplayer-unpacked: $(MPLAYER_DIR)/.unpacked
-
-mplayer-clean:
-	rm -f $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
+define MPLAYER_CLEAN_CMDS
 	-$(MAKE) -C $(MPLAYER_DIR) clean
+endef
 
-mplayer-dirclean:
-	rm -rf $(MPLAYER_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MPLAYER),y)
-TARGETS+=mplayer
-endif
+define MPLAYER_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/mplayer
+endef
+
+$(eval $(call GENTARGETS,package/multimedia,mplayer))
-- 
1.6.3.3
