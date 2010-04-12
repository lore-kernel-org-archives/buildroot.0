From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:18 +0200
Subject: [Buildroot] [PATCH 06/21] patch: convert to the autotools
	infrastructure and bump version
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8af84ff5ffae7288b23715766d91287a8ebd614a.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping the version from 2.5.9 to 2.6 allows to avoid adding a patch
(merged upstream) to fix patch's Makefile install target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/patch/patch.mk |   69 +++--------------------------------------------
 1 files changed, 5 insertions(+), 64 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 2c1e394..3e20b6b 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -3,68 +3,9 @@
 # patch
 #
 #############################################################
-GNUPATCH_VERSION:=2.5.9
-GNUPATCH_SOURCE:=patch_$(GNUPATCH_VERSION).orig.tar.gz
-GNUPATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/patch
-GNUPATCH_CAT:=$(ZCAT)
-GNUPATCH_DIR:=$(BUILD_DIR)/patch-$(GNUPATCH_VERSION)
-GNUPATCH_BINARY:=patch
-GNUPATCH_TARGET_BINARY:=usr/bin/patch
+PATCH_VERSION:=2.6
+PATCH_SOURCE:=patch_$(PATCH_VERSION).orig.tar.gz
+PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/patch
+PATCH_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
-$(DL_DIR)/$(GNUPATCH_SOURCE):
-	 $(call DOWNLOAD,$(GNUPATCH_SITE),$(GNUPATCH_SOURCE))
-
-patch-source: $(DL_DIR)/$(GNUPATCH_SOURCE)
-
-$(GNUPATCH_DIR)/.unpacked: $(DL_DIR)/$(GNUPATCH_SOURCE)
-	$(GNUPATCH_CAT) $(DL_DIR)/$(GNUPATCH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(GNUPATCH_DIR)
-	touch $(GNUPATCH_DIR)/.unpacked
-
-$(GNUPATCH_DIR)/.configured: $(GNUPATCH_DIR)/.unpacked
-	(cd $(GNUPATCH_DIR); rm -rf config.cache; \
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
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(GNUPATCH_DIR)/.configured
-
-$(GNUPATCH_DIR)/$(GNUPATCH_BINARY): $(GNUPATCH_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GNUPATCH_DIR)
-
-$(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY): $(GNUPATCH_DIR)/$(GNUPATCH_BINARY)
-	rm -f $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
-	cp -a $(GNUPATCH_DIR)/$(GNUPATCH_BINARY) $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
-
-patch: $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
-
-patch-clean:
-	rm -f $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
-
-patch-dirclean:
-	rm -rf $(GNUPATCH_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PATCH),y)
-TARGETS+=patch
-endif
+$(eval $(call AUTOTARGETS,package,patch))
\ No newline at end of file
-- 
1.6.3.3
