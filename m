From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] setserial: convert to the autotools
	infrastructure
Message-ID: <20100413195154.8F9BC20F94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61fc526a16e5e204e1f4a8e4294725fe30f762e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setserial/setserial.mk |   73 ++++------------------------------------
 1 files changed, 7 insertions(+), 66 deletions(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9667637..1c222a2 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -8,73 +8,14 @@ SETSERIAL_PATCH_VERSION:=.orig
 SETSERIAL_PATCH_FILE:=setserial_2.17-45.diff.gz
 SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
 SETSERIAL_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
-SETSERIAL_DIR:=$(BUILD_DIR)/setserial-$(SETSERIAL_VERSION)
-SETSERIAL_BINARY:=setserial
-SETSERIAL_TARGET_BINARY:=usr/bin/setserial
+SETSERIAL_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
-$(DL_DIR)/$(SETSERIAL_SOURCE):
-	$(call DOWNLOAD,$(SETSERIAL_SITE),$(SETSERIAL_SOURCE))
-
-ifneq ($(SETSERIAL_PATCH_FILE),)
-SETSERIAL_PATCH:=$(DL_DIR)/$(SETSERIAL_PATCH_FILE)
-$(SETSERIAL_PATCH):
-	$(call DOWNLOAD,$(SETSERIAL_SITE),$(SETSERIAL_PATCH_FILE))
-else
-SETSERIAL_PATCH:=
-endif
-
-$(SETSERIAL_DIR)/.unpacked: $(DL_DIR)/$(SETSERIAL_SOURCE) $(SETSERIAL_PATCH)
-	$(ZCAT) $(DL_DIR)/$(SETSERIAL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SETSERIAL_DIR)
-	toolchain/patch-kernel.sh $(SETSERIAL_DIR) package/setserial setserial\*.patch
-ifneq ($(SETSERIAL_PATCH_FILE),)
-	toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(DL_DIR) $(SETSERIAL_PATCH_FILE)
-	if [ -d $(SETSERIAL_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(SETSERIAL_DIR)/debian/patches \*.patch; \
+define SETSERIAL_APPLY_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
-endif
-	touch $(SETSERIAL_DIR)/gorhack.h
-	touch $@
-
-$(SETSERIAL_DIR)/.configured: $(SETSERIAL_DIR)/.unpacked
-	(cd $(SETSERIAL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) $(SETSERIAL_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(SETSERIAL_DIR)/$(SETSERIAL_BINARY): $(SETSERIAL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(SETSERIAL_DIR)
-
-$(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY): $(SETSERIAL_DIR)/$(SETSERIAL_BINARY)
-	install -c $(SETSERIAL_DIR)/$(SETSERIAL_BINARY) $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
-
-setserial: $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
-
-setserial-source: $(DL_DIR)/$(SETSERIAL_SOURCE) $(SETSERIAL_PATCH)
+endef
 
-setserial-unpacked: $(SETSERIAL_DIR)/.unpacked
+SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
 
-setserial-clean:
-	rm -f $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
-	-$(MAKE) -C $(SETSERIAL_DIR) clean
-
-setserial-dirclean:
-	rm -rf $(SETSERIAL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SETSERIAL),y)
-TARGETS+=setserial
-endif
+$(eval $(call AUTOTARGETS,package,setserial))
-- 
1.6.3.3
