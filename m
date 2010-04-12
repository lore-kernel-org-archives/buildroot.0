From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:23 +0200
Subject: [Buildroot] [PATCH 11/21] libcgi: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <515708c94a7c5ce8eb5bd1432f1fc00c4fcb3a25.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgi/libcgi.mk |   68 ++-------------------------------------------
 1 files changed, 3 insertions(+), 65 deletions(-)

diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 23c5fdd..cd23b0c 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -6,69 +6,7 @@
 LIBCGI_VERSION:=1.0
 LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
-LIBCGI_DIR:=$(BUILD_DIR)/libcgi-$(LIBCGI_VERSION)
-LIBCGI_LIBRARY:=src/libcgi.so
-LIBCGI_DESTDIR:=usr/lib
-LIBCGI_TARGET_LIBRARY=$(LIBCGI_DESTDIR)/libcgi.so
+LIBCGI_INSTALL_STAGING=YES
+LIBCGI_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
-$(DL_DIR)/$(LIBCGI_SOURCE):
-	$(call DOWNLOAD,$(LIBCGI_SITE),$(LIBCGI_SOURCE))
-
-$(LIBCGI_DIR)/.source: $(DL_DIR)/$(LIBCGI_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LIBCGI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBCGI_DIR) package/libcgi/ libcgi\*.patch
-	touch $(LIBCGI_DIR)/.source
-
-$(LIBCGI_DIR)/.configured: $(LIBCGI_DIR)/.source
-	(cd $(LIBCGI_DIR); rm -f config.cache; \
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
-		--libexecdir=/$(LIBCGI_DESTDIR) \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $(LIBCGI_DIR)/.configured
-
-$(LIBCGI_DIR)/$(LIBCGI_LIBRARY): $(LIBCGI_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBCGI_DIR)
-
-$(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY): $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGI_DIR) install
-	touch -c $@
-
-$(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY)
-	cp -dpf $<* $(TARGET_DIR)/$(LIBCGI_DESTDIR)
-
-libcgi: $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)
-
-libcgi-source: $(DL_DIR)/$(LIBCGI_SOURCE)
-
-libcgi-clean:
-	rm -f $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)*
-	-$(MAKE) -C $(LIBCGI_DIR) clean
-
-libcgi-dirclean:
-	rm -rf $(LIBCGI_DIR)
-
-.PHONY: libcgi
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBCGI),y)
-TARGETS+=libcgi
-endif
+$(eval $(call AUTOTARGETS,package,libcgi))
\ No newline@end of file
-- 
1.6.3.3
