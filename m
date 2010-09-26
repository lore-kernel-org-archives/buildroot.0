From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:58 -0700
Subject: [Buildroot] [PATCH 07/18] dosfstools: convert to gentargets and
	bump to 3.0.10
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-7-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/dosfstools/dosfstools.mk |  104 +++++++++++--------------------------
 1 files changed, 31 insertions(+), 73 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a7f59f0..d7ebc94 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,76 +3,34 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION:=3.0.3
-DOSFSTOOLS_SOURCE:=dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
-DOSFSTOOLS_SITE:=http://www.daniel-baumann.ch/software/dosfstools
-DOSFSTOOLS_DIR:=$(BUILD_DIR)/dosfstools-$(DOSFSTOOLS_VERSION)
-DOSFSTOOLS_CAT:=$(ZCAT)
-MKDOSFS_BINARY:=mkdosfs
-MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
-DOSFSCK_BINARY:=dosfsck
-DOSFSCK_TARGET_BINARY:=sbin/dosfsck
-DOSFSLABEL_BINARY:=dosfslabel
-DOSFSLABEL_TARGET_BINARY:=sbin/dosfslabel
-
-$(DL_DIR)/$(DOSFSTOOLS_SOURCE):
-	 $(call DOWNLOAD,$(DOSFSTOOLS_SITE),$(DOSFSTOOLS_SOURCE))
-
-dosfstools-source: $(DL_DIR)/$(DOSFSTOOLS_SOURCE)
-
-$(DOSFSTOOLS_DIR)/.unpacked: $(DL_DIR)/$(DOSFSTOOLS_SOURCE) $(wildcard local/dosfstools/dosfstools*.patch)
-	$(DOSFSTOOLS_CAT) $(DL_DIR)/$(DOSFSTOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DOSFSTOOLS_DIR) package/dosfstools/ dosfstools\*.patch
-	touch $(DOSFSTOOLS_DIR)/.unpacked
-
-$(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(DOSFSTOOLS_DIR)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
-	touch $@
-
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
-	touch -c $@
-
-$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY) $@
-	touch -c $@
-
-$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY) $@
-	touch -c $@
-
-DOSFSTOOLS=
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
-endif
-
-dosfstools: $(DOSFSTOOLS)
-
-dosfstools-clean:
-	rm -f $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
-	-$(MAKE) -C $(DOSFSTOOLS_DIR) clean
-
-dosfstools-dirclean:
-	rm -rf $(DOSFSTOOLS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS),y)
-TARGETS+=dosfstools
-endif
\ No newline at end of file
+DOSFSTOOLS_VERSION = 3.0.10
+DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
+DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
+MKDOSFS_BINARY = mkdosfs
+DOSFSCK_BINARY = dosfsck
+DOSFSLABEL_BINARY = dosfslabel
+
+define DOSFSTOOLS_BUILD_CMDS
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(@D)
+	$(STRIPCMD) $(@D)/$(MKDOSFS_BINARY)
+	$(STRIPCMD) $(@D)/$(DOSFSCK_BINARY)
+	$(STRIPCMD) $(@D)/$(DOSFSLABEL_BINARY)
+endef
+
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK)+=$(DOSFSCK_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL)+=$(DOSFSLABEL_BINARY)
+
+define DOSFSTOOLS_INSTALL_TARGET_CMDS
+	test -z "$(DOSFSTOOLS_INSTALL_BIN_FILES_y)" || \
+	install -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) $(TARGET_DIR)/sbin/
+endef
+
+define DOSFSTOOLS_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/sbin/$(MKDOSFS_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(DOSFSCK_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(DOSFSLABEL_BINARY)
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,dosfstools))
-- 
1.7.3
