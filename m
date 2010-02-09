From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 11:40:47 +0100
Subject: [Buildroot] [git commit master] nbd: convert to
	Makefile.autotools.in format
Message-ID: <20100209104124.732D477735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1b4e71a1392d1be8a0281a0b7eada3eaa9c984bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/nbd.mk |   79 ++++++++--------------------------------------------
 1 files changed, 12 insertions(+), 67 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index bcb8677..8bffaf8 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -1,77 +1,22 @@
 #############################################################
 #
-# nbd (client only)
+# nbd
 #
 #############################################################
 
-NBD_VERSION=2.9.11
-NBD_SOURCE=nbd-$(NBD_VERSION).tar.bz2
-NBD_CAT:=$(BZCAT)
+NBD_VERSION = 2.9.11
+NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
-NBD_DIR=$(BUILD_DIR)/nbd-$(NBD_VERSION)
+NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
+NBD_DEPENDENCIES = libglib2
 
-ifeq ($(BR2_NBD_CLIENT),y)
-NBD_TARGET_BINARY+= $(TARGET_DIR)/sbin/nbd-client
+$(eval $(call AUTOTARGETS,package,nbd))
+
+$(NBD_HOOK_POST_INSTALL): $(NBD_TARGET_INSTALL_TARGET)
+ifneq ($(BR2_NBD_CLIENT),y)
+	rm -f $(TARGET_DIR)/usr/sbin/nbd-client
 endif
-ifeq ($(BR2_NBD_SERVER),y)
-NBD_TARGET_BINARY+= $(TARGET_DIR)/bin/nbd-server
+ifneq ($(BR2_NBD_SERVER),y)
+	rm -f $(TARGET_DIR)/usr/bin/nbd-server
 endif
-
-$(DL_DIR)/$(NBD_SOURCE):
-	$(call DOWNLOAD,$(NBD_SITE),$(NBD_SOURCE))
-
-$(NBD_DIR)/.unpacked: $(DL_DIR)/$(NBD_SOURCE)
-	$(NBD_CAT) $(DL_DIR)/$(NBD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(NBD_DIR)/.patched: $(NBD_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(NBD_DIR) package/nbd/ nbd\*.patch
 	touch $@
-
-$(NBD_DIR)/.configured: $(NBD_DIR)/.patched
-	(cd $(NBD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CC=$(TARGET_CC) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs) \
-	)
-	touch $@
-
-$(NBD_DIR)/nbd-client: $(NBD_DIR)/.configured
-	$(MAKE) -C $(NBD_DIR) nbd-client
-
-$(TARGET_DIR)/sbin/nbd-client: $(NBD_DIR)/nbd-client
-	cp $< $@
-	$(STRIPCMD) $@
-
-$(NBD_DIR)/nbd-server: $(NBD_DIR)/.configured
-	$(MAKE) -C $(NBD_DIR) nbd-server
-
-$(TARGET_DIR)/bin/nbd-server: $(NBD_DIR)/nbd-server
-	cp $< $@
-	$(STRIPCMD) $@
-
-nbd: libglib2 $(NBD_TARGET_BINARY)
-
-nbd-source: $(DL_DIR)/$(NBD_SOURCE)
-
-nbd-clean:
-	rm -f $(NBD_TARGET_BINARY)
-	-$(MAKE) -C $(NBD_DIR) clean
-
-nbd-dirclean:
-	rm -rf $(NBD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NBD),y)
-TARGETS+=nbd
-endif
-- 
1.6.3.3
