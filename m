From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 29 Dec 2009 22:46:14 +0100
Subject: [Buildroot] [PATCH] libungif: convert to autotools
	infrastructure
In-Reply-To: <4d28d4b50912290216l31ba262cvccf62dc5a3def244@mail.gmail.com>
References: <4d28d4b50912290216l31ba262cvccf62dc5a3def244@mail.gmail.com>
Message-ID: <1262123174.5867.52.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libungif/libungif.mk |   65 ++++++-----------------------------------
 1 files changed, 10 insertions(+), 55 deletions(-)

diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 6e3be9c..31934c1 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -6,64 +6,19 @@
 LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/giflib
-LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VERSION)
-LIBUNGIF_CAT:=$(BZCAT)
-LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VERSION)
-LIBUNGIF_TARGET_BINARY:=usr/lib/libungif.so
+LIBUNGIF_INSTALL_STAGING = YES
+LIBUNGIF_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(LIBUNGIF_SOURCE):
-	$(call DOWNLOAD,$(LIBUNGIF_SITE),$(LIBUNGIF_SOURCE))
+LIBUNGIF_CONF_OPT = --without-x
 
-libungif-source: $(DL_DIR)/$(LIBUNGIF_SOURCE)
-
-$(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
-	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VERSION)\*.patch\*
-	$(CONFIG_UPDATE) $(LIBUNGIF_DIR)
-	touch $@
-
-$(LIBUNGIF_DIR)/.configured: $(LIBUNGIF_DIR)/.unpacked
-	(cd $(LIBUNGIF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--enable-static \
-		--prefix=/usr \
-		--without-x \
-	)
-	touch $@
-
-$(LIBUNGIF_DIR)/lib/.libs/libungif.a: $(LIBUNGIF_DIR)/.configured
-	$(MAKE) -C $(LIBUNGIF_DIR)
-
-$(STAGING_DIR)/usr/lib/libungif.a: $(LIBUNGIF_DIR)/lib/.libs/libungif.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBUNGIF_DIR) install
+define LIBUNGIF_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libungif.la
+endef
 
-$(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libungif.a
-	cp -dpf $(STAGING_DIR)/$(LIBUNGIF_TARGET_BINARY)* $(TARGET_DIR)/usr/lib/
+define LIBUNGIF_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libungif.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
+endef
 
-libungif: $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
-
-libungif-clean:
-	rm -f $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
-	-$(MAKE) -C $(LIBUNGIF_DIR) clean
-
-libungif-dirclean:
-	rm -rf $(LIBUNGIF_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBUNGIF),y)
-TARGETS+=libungif
-endif
+$(eval $(call AUTOTARGETS,package,libungif))
-- 
1.6.5.7
