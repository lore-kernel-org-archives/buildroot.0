From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:11 +0800
Subject: [Buildroot] [PATCH 09/19] libfuse : convert to autotools
	infrastructure & bump to 2.8.4
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-10-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/fuse/libfuse.mk |   66 ++++++++++++----------------------------------
 1 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index b45f9ee..4c10501 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -3,75 +3,43 @@
 # libfuse
 #
 #############################################################
-LIBFUSE_VERSION:=2.8.1
+LIBFUSE_VERSION:=2.8.4
 LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
-LIBFUSE_DIR:=$(BUILD_DIR)/fuse-$(LIBFUSE_VERSION)
-LIBFUSE_BINARY:=libfuse
-$(DL_DIR)/$(LIBFUSE_SOURCE):
-	$(call DOWNLOAD,$(LIBFUSE_SITE),$(LIBFUSE_SOURCE))
 
-$(LIBFUSE_DIR)/.source: $(DL_DIR)/$(LIBFUSE_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LIBFUSE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBFUSE_DIR) package/fuse/ \*.patch
-	touch $@
-
-
-$(LIBFUSE_DIR)/.configured: $(LIBFUSE_DIR)/.source
-	(cd $(LIBFUSE_DIR); rm -rf config.cache ; \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--program-prefix="" \
+LIBFUSE_INSTALL_STAGING = YES
+LIBFUSE_INSTALL_TARGET = YES
+LIBFUSE_LIBTOOL_PATCH = NO
+LIBFUSE_CONF_OPT= --program-prefix="" \
 		--enable-shared \
 		--enable-static \
 		--disable-nls \
 		--disable-example \
 		--disable-kernel-module \
 		--enable-lib \
-		--enable-util \
-	);
-	touch $@
+		--enable-util
 
-$(LIBFUSE_DIR)/.compiled: $(LIBFUSE_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBFUSE_DIR)
-	touch $@
+define LIBFUSE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)/ install
+endef
 
-$(STAGING_DIR)/usr/lib/libfuse.so: $(LIBFUSE_DIR)/.compiled
-	$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libfuse.so: $(STAGING_DIR)/usr/lib/libfuse.so
+define LIBFUSE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/fusermount
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfuse.so
-	touch -c $@
-
-libfuse: $(TARGET_DIR)/usr/lib/libfuse.so
+endef
 
-libfuse-source: $(DL_DIR)/$(LIBFUSE_SOURCE)
 
-libfuse-clean:
-	-$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(LIBFUSE_DIR) clean
+define LIBFUSE_CLEAN_CMDS
+	-$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
+	-$(MAKE) -C $(@D) clean
 	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 
 libfuse-dirclean:
-	rm -rf $(LIBFUSE_DIR)
+	rm -rf $(@D)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-TARGETS+=libfuse
-endif
+$(eval $(call AUTOTARGETS,package,libfuse))
-- 
1.7.0.4
