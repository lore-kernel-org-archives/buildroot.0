From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] tar: convert to the autotools
	infrastructure
Message-ID: <20100413195157.1F6E420F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e300d684bcb3816be6e50f42f0b9ae47f28e8fe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar.mk |   82 ++-------------------------------------------------
 1 files changed, 4 insertions(+), 78 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 32189b5..f9ee74b 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -3,82 +3,8 @@
 # tar
 #
 #############################################################
-GNUTAR_VERSION:=1.21
-GNUTAR_SOURCE:=tar-$(GNUTAR_VERSION).tar.bz2
-GNUTAR_SITE:=$(BR2_GNU_MIRROR)/tar/
-GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VERSION)
-GNUTAR_CAT:=$(BZCAT)
-GNUTAR_BINARY:=src/tar
-GNUTAR_TARGET_BINARY:=bin/tar
+TAR_VERSION:=1.21
+TAR_SOURCE:=tar-$(TAR_VERSION).tar.bz2
+TAR_SITE:=$(BR2_GNU_MIRROR)/tar/
 
-$(DL_DIR)/$(GNUTAR_SOURCE):
-	 $(call DOWNLOAD,$(GNUTAR_SITE),$(GNUTAR_SOURCE))
-
-tar-source: $(DL_DIR)/$(GNUTAR_SOURCE)
-
-$(GNUTAR_DIR)/.unpacked: $(DL_DIR)/$(GNUTAR_SOURCE)
-	$(GNUTAR_CAT) $(DL_DIR)/$(GNUTAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GNUTAR_DIR) package/tar/ tar\*.patch
-	$(CONFIG_UPDATE) $(GNUTAR_DIR)
-	$(CONFIG_UPDATE) $(GNUTAR_DIR)/build-aux
-	touch $@
-
-$(GNUTAR_DIR)/.configured: $(GNUTAR_DIR)/.unpacked
-	(cd $(GNUTAR_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_chown_works=yes \
-		gl_cv_func_chown_follows_symlink=yes \
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
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(GNUTAR_DIR)/$(GNUTAR_BINARY): $(GNUTAR_DIR)/.configured
-	$(MAKE) -C $(GNUTAR_DIR)
-
-# This stuff is needed to work around GNU make deficiencies
-tar-target_binary: $(GNUTAR_DIR)/$(GNUTAR_BINARY)
-	@if [ -L $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
-	fi
-	@if [ ! -f $(GNUTAR_DIR)/$(GNUTAR_BINARY) -o $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY) \
-	-ot $(GNUTAR_DIR)/$(GNUTAR_BINARY) ]; then \
-		set -x; \
-		rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
-		cp -a $(GNUTAR_DIR)/$(GNUTAR_BINARY) \
-			$(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
-	fi
-
-tar: tar-target_binary
-
-tar-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUTAR_DIR) uninstall
-	-$(MAKE) -C $(GNUTAR_DIR) clean
-
-tar-dirclean:
-	rm -rf $(GNUTAR_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TAR),y)
-TARGETS+=tar
-endif
+$(eval $(call AUTOTARGETS,package,tar))
-- 
1.6.3.3
