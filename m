From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:04 +0800
Subject: [Buildroot] [PATCH 02/19] dmalloc : convert to autotools
	infrastructure
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-3-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/dmalloc/dmalloc.mk |   95 ++++++++++++--------------------------------
 1 files changed, 26 insertions(+), 69 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index dd83583..bf09868 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -6,100 +6,57 @@
 DMALLOC_VERSION:=5.4.3
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VERSION).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
-DMALLOC_DIR:=$(BUILD_DIR)/dmalloc-$(DMALLOC_VERSION)
-DMALLOC_CAT:=$(ZCAT)
-DMALLOC_BINARY:=dmalloc
 DMALLOC_TARGET_BINARY:=usr/bin/dmalloc
 
-$(DL_DIR)/$(DMALLOC_SOURCE):
-	 $(call DOWNLOAD,$(DMALLOC_SITE),$(DMALLOC_SOURCE))
-
-dmalloc-source: $(DL_DIR)/$(DMALLOC_SOURCE)
-
-$(DMALLOC_DIR)/.unpacked: $(DL_DIR)/$(DMALLOC_SOURCE)
-	$(DMALLOC_CAT) $(DL_DIR)/$(DMALLOC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DMALLOC_DIR) package/dmalloc dmalloc\*.patch
-	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(DMALLOC_DIR)/configure
-	$(SED) 's/(ld -/($${LD-ld} -/' $(DMALLOC_DIR)/configure
-	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(DMALLOC_DIR)/configure
-	-$(SED) 's/ar cr/$$(AR) cr/' $(DMALLOC_DIR)/Makefile.in
-	touch $@
+DMALLOC_INSTALL_STAGING = YES
+DMALLOC_INSTALL_TARGET = YES
+DMALLOC_CONF_OPT:= --enable-shlib
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-DMALLOC_CONFIG_ARGS:=--enable-cxx
+DMALLOC_CONF_OPT+=--enable-cxx
 else
-DMALLOC_CONFIG_ARGS:=--disable-cxx
+DMALLOC_CONF_OPT+=--disable-cxx
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-DMALLOC_CONFIG_ARGS+=--disable-threads
+DMALLOC_CONF_OPT+=--disable-threads
 else
-DMALLOC_CONFIG_ARGS+=--enable-threads
+DMALLOC_CONF_OPT+=--enable-threads
 endif
 
+define DMALLOC_POST_PATCH
+	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
+	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
+	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
+	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
+endef
 
+DMALLOC_POST_PATCH_HOOKS += DMALLOC_POST_PATCH
 
-$(DMALLOC_DIR)/.configured: $(DMALLOC_DIR)/.unpacked
-	(cd $(DMALLOC_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="-g" \
-		LDFLAGS="-g" \
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
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shlib \
-		$(DMALLOC_CONFIG_ARGS) \
-	)
-	touch $@
-
-$(DMALLOC_DIR)/$(DMALLOC_BINARY): $(DMALLOC_DIR)/.configured
-	$(MAKE) -C $(DMALLOC_DIR)
-
-$(TARGET_DIR)/$(DMALLOC_TARGET_BINARY): $(DMALLOC_DIR)/$(DMALLOC_BINARY)
-	# both DESTDIR and PREFIX are ignored..
+# both DESTDIR and PREFIX are ignored..
+define DMALLOC_INSTALL_STAGING_CMDS
 	$(MAKE) includedir="$(STAGING_DIR)/usr/include" \
 		bindir="$(STAGING_DIR)/usr/bin" \
 		libdir="$(STAGING_DIR)/usr/lib" \
 		shlibdir="$(STAGING_DIR)/usr/lib" \
 		includedir="$(STAGING_DIR)/usr/share/info/" \
-		-C $(DMALLOC_DIR) install
-	(cd $(STAGING_DIR)/usr/lib; \
-		mv libdmalloc*.so $(TARGET_DIR)/usr/lib)
-	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+		-C $(@D) install
+endef
+
+define DMALLOC_INSTALL_TARGET_CMDS
+	mv $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/$(DMALLOC_TARGET_BINARY) $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+endef
 
-dmalloc: $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 
-dmalloc-clean:
+define DMALLOC_CLEAN_CMDS
 	-rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
 	-rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
 	rm -f $(STAGING_DIR)/usr/include/dmalloc.h
 	rm -f $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 	-$(MAKE) -C $(DMALLOC_DIR) clean
-
-dmalloc-dirclean:
-	rm -rf $(DMALLOC_DIR)
+endef
 
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DMALLOC),y)
-TARGETS+=dmalloc
-endif
+$(eval $(call AUTOTARGETS,package,dmalloc))
-- 
1.7.0.4
