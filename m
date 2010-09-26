From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:02 -0700
Subject: [Buildroot] [PATCH 11/18] gadgets-test: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-11-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/gadgetfs-test/gadgetfs-test.mk |   46 +++++++++-----------------------
 1 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index e3ab95e..c72588d 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -5,47 +5,27 @@
 #############################################################
 GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
 GADGETFS_TEST_SITE=http://avr32linux.org/twiki/pub/Main/GadgetFsTest/
-GADGETFS_TEST_DIR=$(BUILD_DIR)/gadgetfs-test
-
-GADGETFS_TEST_MAKEOPTS:=CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
-GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
+GADGETFS_DEPENDENCIES = libaio
 endif
 
-$(DL_DIR)/$(GADGETFS_TEST_SOURCE):
-	$(call DOWNLOAD,$(GADGETFS_TEST_SITE),$(GADGETFS_TEST_SOURCE))
-
-$(GADGETFS_TEST_DIR)/.unpacked: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(GADGETFS_TEST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GADGETFS_TEST_DIR) package/gadgetfs-test gadgetfs-test\*.patch
-	touch $@
-
-$(GADGETFS_TEST_DIR)/gadgetfs-test: $(GADGETFS_TEST_DIR)/.unpacked
-	$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS)
-
-$(TARGET_DIR)/usr/bin/gadgetfs-test: $(GADGETFS_TEST_DIR)/gadgetfs-test
-	$(MAKE) -C $(GADGETFS_TEST_DIR) DESTDIR=$(TARGET_DIR) prefix=/usr install
+GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
-gadgetfs-test: libaio $(TARGET_DIR)/usr/bin/gadgetfs-test
-else
-gadgetfs-test: $(TARGET_DIR)/usr/bin/gadgetfs-test
+GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
 endif
 
-gadgetfs-test-source: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
+define GADGETFS_TEST_BUILD_CMDS
+	$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
+endef
 
-gadgetfs-test-clean:
-	-$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS) clean
+define GADGETFS_TEST_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
 
-gadgetfs-test-dirclean:
-	rm -rf $(GADGETFS_TEST_DIR)
+define GADGETFS_TEST_CLEAN_CMDS
+	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GADGETFS_TEST),y)
-TARGETS+=gadgetfs-test
-endif
+$(eval $(call GENTARGETS,package,gadgetfs-test))
-- 
1.7.3
