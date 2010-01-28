From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] flex: convert to autotools
	infrastructure
Message-ID: <20100128150632.73C0477719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4bbd68f4894d07834334518f35d7c4de10c3b763
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |  125 ++++++++------------------------------------------
 1 files changed, 19 insertions(+), 106 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index d8a85bd..223f58e 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,118 +9,31 @@ FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
-FLEX_CAT:=$(ZCAT)
-FLEX_BINARY:=flex
-FLEX_TARGET_BINARY:=usr/bin/flex
 
-$(DL_DIR)/$(FLEX_SOURCE):
-	 $(call DOWNLOAD,$(FLEX_SITE),$(FLEX_SOURCE))
+# lex -> flex
+define FLEX_INSTALL_LEX
+cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
+endef
 
-$(DL_DIR)/$(FLEX_PATCH):
-	 $(call DOWNLOAD,$(FLEX_SITE),$(FLEX_PATCH))
+define FLEX_UNINSTALL_LEX
+-rm $(TARGET_DIR)/usr/bin/lex
+endef
 
-flex-source: $(DL_DIR)/$(FLEX_SOURCE) $(DL_DIR)/$(FLEX_PATCH)
+FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
+FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LEX
 
-$(FLEX_DIR)/.unpacked: $(DL_DIR)/$(FLEX_SOURCE) $(DL_DIR)/$(FLEX_PATCH)
-	$(FLEX_CAT) $(DL_DIR)/$(FLEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(FLEX_PATCH),)
-	toolchain/patch-kernel.sh $(FLEX_DIR) $(DL_DIR) $(FLEX_PATCH)
-	if [ -d $(FLEX_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(FLEX_DIR) $(FLEX_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	$(CONFIG_UPDATE) $(FLEX_DIR)
-	touch $@
-
-$(FLEX_DIR)/.configured: $(FLEX_DIR)/.unpacked
-	(cd $(FLEX_DIR); rm -rf config.cache; \
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
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--includedir=$(TARGET_DIR)/usr/include \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(FLEX_DIR)/$(FLEX_BINARY): $(FLEX_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FLEX_DIR)
-
-$(TARGET_DIR)/$(FLEX_TARGET_BINARY): $(FLEX_DIR)/$(FLEX_BINARY)
-	$(MAKE1) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    sharedstatedir=$(TARGET_DIR)/usr/com \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(FLEX_DIR) install
+# libfl installation
 ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
-	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	(cd $(TARGET_DIR)/usr/bin; ln -snf flex lex)
+define FLEX_INSTALL_LIBFL
+install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
+endef
 
-flex: $(TARGET_DIR)/$(FLEX_TARGET_BINARY)
+define FLEX_UNINSTALL_LIBFL
+-rm $(STAGING_DIR)/lib/libfl.a
+endef
 
-flex-clean:
-	$(MAKE) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    sharedstatedir=$(TARGET_DIR)/usr/com \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/share/info \
-	    mandir=$(TARGET_DIR)/usr/share/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-		-C $(FLEX_DIR) uninstall
-	rm -f $(TARGET_DIR)/usr/bin/lex
-ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
-	-rm $(STAGING_DIR)/lib/libfl.a
+FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
+FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
-	-$(MAKE) -C $(FLEX_DIR) clean
-
-flex-dirclean:
-	rm -rf $(FLEX_DIR)
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FLEX),y)
-TARGETS+=flex
-endif
+$(eval $(call AUTOTARGETS,package,flex))
-- 
1.6.3.3
