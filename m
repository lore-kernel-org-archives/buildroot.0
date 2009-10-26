From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 21:41:11 +0100
Subject: [Buildroot] [git commit master] lzma: convert to
	Makefile.autotools.in format
Message-ID: <20091026204433.60DD8777B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=04bd29b8d853fa36db7c6a39bf736a327865712e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzma/lzma.mk |   83 ++++++++------------------------------------------
 1 files changed, 13 insertions(+), 70 deletions(-)

diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 7cb432b..a5fae5b 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -5,27 +5,30 @@
 #############################################################
 LZMA_VERSION:=4.32.6
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
-LZMA_CAT:=$(ZCAT)
 LZMA_SITE:=http://tukaani.org/lzma/
+LZMA_INSTALL_STAGING = YES
+LZMA_INSTALL_TARGET = YES
+LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
+
+$(eval $(call AUTOTARGETS,package,lzma))
+
+######################################################################
+#
+# lzma host
+#
+######################################################################
+
+LZMA_CAT:=$(ZCAT)
 LZMA_HOST_DIR:=$(TOOLCHAIN_DIR)/lzma-$(LZMA_VERSION)
-LZMA_TARGET_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VERSION)
-LZMA_TARGET_BINARY:=bin/lzma
 
 # lzma binary for use on the host
 LZMA=$(TOOLCHAIN_DIR)/bin/lzma
 HOST_LZMA_BINARY=$(shell package/lzma/lzmacheck.sh)
 HOST_LZMA_IF_ANY=$(shell toolchain/dependencies/check-host-lzma.sh)
 
-
 $(DL_DIR)/$(LZMA_SOURCE):
 	$(call DOWNLOAD,$(LZMA_SITE),$(LZMA_SOURCE))
 
-######################################################################
-#
-# lzma host
-#
-######################################################################
-
 $(LZMA_HOST_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
 	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) package/lzma/ lzma\*.patch
@@ -72,63 +75,3 @@ lzma-host-dirclean:
 	rm -rf $(LZMA_HOST_DIR)
 
 lzma-host-install: /usr/local/bin/lzma
-
-######################################################################
-#
-# lzma target
-#
-######################################################################
-
-$(LZMA_TARGET_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
-	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LZMA_TARGET_DIR) package/lzma/ lzma\*.patch
-	touch $@
-
-$(LZMA_TARGET_DIR)/.configured: $(LZMA_TARGET_DIR)/.unpacked
-	(cd $(LZMA_TARGET_DIR); rm -f config.cache;\
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		ac_cv_func_malloc_0_nonnull=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=$(TARGET_DIR)/usr/bin \
-		--libdir=$(TARGET_DIR)/lib \
-		--includedir=$(TARGET_DIR)/include \
-		--disable-debug \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(LZMA_TARGET_DIR)/src/lzma/lzma: $(LZMA_TARGET_DIR)/.configured
-	$(MAKE) -C $(LZMA_TARGET_DIR) all
-	touch -c $@
-
-$(TARGET_DIR)/$(LZMA_TARGET_BINARY): $(LZMA_TARGET_DIR)/src/lzma/lzma
-	cp -dpf $(LZMA_TARGET_DIR)/src/lzma/lzma $@
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	touch -c $@
-
-lzma: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
-
-lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
-
-lzma-clean:
-	rm -f $(TARGET_DIR)/usr/bin/lzma
-	-$(MAKE) -C $(LZMA_TARGET_DIR) clean
-
-lzma-dirclean:
-	rm -rf $(LZMA_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LZMA),y)
-TARGETS+=lzma
-endif
-- 
1.6.3.3
