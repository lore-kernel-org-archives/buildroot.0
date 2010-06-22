From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:21:11 +0200
Subject: [Buildroot] [PATCH 17/20] libgpg-error : convert to autotools
	infrastructure & bump to 1.8
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7bb992889072af977f24acffcff6ec9475143f54.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/libgpg-error/libgpg-error.mk |   71 ++--------------------------------
 1 files changed, 4 insertions(+), 67 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 0b513ff..89ff24c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -3,74 +3,11 @@
 # libgpg-error
 #
 #############################################################
-LIBGPG_ERROR_VERSION:=1.5
+LIBGPG_ERROR_VERSION:=1.8
 LIBGPG_ERROR_SOURCE:=libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
-LIBGPG_ERROR_DIR:=$(BUILD_DIR)/libgpg-error-$(LIBGPG_ERROR_VERSION)
-LIBGPG_ERROR_LIBRARY:=src/libgpg-error.la
-LIBGPG_ERROR_DESTDIR:=usr/lib
-LIBGPG_ERROR_TARGET_LIBRARY=$(LIBGPG_ERROR_DESTDIR)/libgpg-error.so
 
-$(DL_DIR)/$(LIBGPG_ERROR_SOURCE):
-	$(call DOWNLOAD,$(LIBGPG_ERROR_SITE),$(LIBGPG_ERROR_SOURCE))
+LIBGPG_ERROR_LIBTOOL_PATCH = NO
+LIBGPG_ERROR_INSTALL_STAGING = YES
 
-$(LIBGPG_ERROR_DIR)/.source: $(DL_DIR)/$(LIBGPG_ERROR_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(LIBGPG_ERROR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBGPG_ERROR_DIR) package/libgpg-error/ libgpg-error\*.patch
-	$(CONFIG_UPDATE) $(LIBGPG_ERROR_DIR)
-	touch $(LIBGPG_ERROR_DIR)/.source
-
-$(LIBGPG_ERROR_DIR)/.configured: $(LIBGPG_ERROR_DIR)/.source
-	(cd $(LIBGPG_ERROR_DIR); rm -f config.cache; \
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
-		--libdir=/usr/lib \
-		--libexecdir=/$(LIBGPG_ERROR_DESTDIR) \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
-	touch $(LIBGPG_ERROR_DIR)/.configured
-
-$(LIBGPG_ERROR_DIR)/$(LIBGPG_ERROR_LIBRARY): $(LIBGPG_ERROR_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBGPG_ERROR_DIR)
-
-$(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY): $(LIBGPG_ERROR_DIR)/$(LIBGPG_ERROR_LIBRARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBGPG_ERROR_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgpg-error.la
-
-$(TARGET_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)
-	cp -dpf $<* $(TARGET_DIR)/$(LIBGPG_ERROR_DESTDIR)
-
-libgpg-error: $(TARGET_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)
-
-libgpg-error-source: $(DL_DIR)/$(LIBGPG_ERROR_SOURCE)
-
-libgpg-error-clean:
-	rm -f $(TARGET_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)*
-	-$(MAKE) -C $(LIBGPG_ERROR_DIR) clean
-	rm -f $(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)\*
-
-libgpg-error-dirclean:
-	rm -rf $(LIBGPG_ERROR_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBGPG_ERROR),y)
-TARGETS+=libgpg-error
-endif
+$(eval $(call AUTOTARGETS,package,libgpg-error))
-- 
1.7.0.4
