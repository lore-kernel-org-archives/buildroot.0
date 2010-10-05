From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 13:04:37 -0700
Subject: [Buildroot] [PATCH 2/2] mii-diag: convert to gentargets and bump to
	2.11.3
In-Reply-To: <1286309077-26567-1-git-send-email-Martin.Banky@gmail.com>
References: <1286309077-26567-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286309077-26567-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/mii-diag/mii-diag.mk |   79 ++++++++++++++++--------------------------
 1 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index ba01c0e..8d946ae 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -3,59 +3,40 @@
 # mii-diag
 #
 #############################################################
-MIIDIAG_VERSION:=2.11
-MIIDIAG_DEBIAN_PATCH_LEVEL:=2
-MIIDIAG_SOURCE:=mii-diag_$(MIIDIAG_VERSION).orig.tar.gz
-MIIDIAG_PATCH_FILE=mii-diag_$(MIIDIAG_VERSION)-$(MIIDIAG_DEBIAN_PATCH_LEVEL).diff.gz
-MIIDIAG_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
-MIIDIAG_DIR:=$(BUILD_DIR)/mii-diag-$(MIIDIAG_VERSION)
-MIIDIAG_CAT:=$(ZCAT)
-MIIDIAG_BINARY:=usr/sbin/mii-diag
-
-ifneq ($(MIIDIAG_PATCH_FILE),)
-MIIDIAG_PATCH=$(DL_DIR)/$(MIIDIAG_PATCH_FILE)
-$(MIIDIAG_PATCH):
-	$(call DOWNLOAD,$(MIIDIAG_SITE),$(MIIDIAG_PATCH_FILE))
-endif
-
-$(DL_DIR)/$(MIIDIAG_SOURCE):
-	$(call DOWNLOAD,$(MIIDIAG_SITE),$(MIIDIAG_SOURCE))
-
-$(MIIDIAG_DIR)/.unpacked: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
-	mkdir -p $(MIIDIAG_DIR)
-	$(MIIDIAG_CAT) $(DL_DIR)/$(MIIDIAG_SOURCE) | tar --strip 1 -C $(MIIDIAG_DIR) $(TAR_OPTIONS) -
-ifneq ($(MIIDIAG_PATCH_FILE),)
-	(cd $(MIIDIAG_DIR) && $(MIIDIAG_CAT) $(MIIDIAG_PATCH) | patch -p1)
+MII_DIAG_VERSION = 2.11
+MII_DIAG_SOURCE = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
+MII_DIAG_PATCH = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
+MII_DIAG_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+
+ifneq ($(MII_DIAG_PATCH),)
+define MII_DIAG_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
+		 do $(SED) 's,^\+\+\+ .*mii-diag-$(MII_DIAG_VERSION)/,+++ mii-diag-$(MII_DIAG_VERSION)/,' $$i; \
+		 done; \
+		); \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
 endif
-	toolchain/patch-kernel.sh $(MIIDIAG_DIR) package/mii-diag/ mii-diag-\*.patch*
-	touch $@
-
-$(MIIDIAG_DIR)/.configured: $(MIIDIAG_DIR)/.unpacked
-	touch $@
-
-$(MIIDIAG_DIR)/mii-diag: $(MIIDIAG_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR)
 
-$(TARGET_DIR)/$(MIIDIAG_BINARY): $(MIIDIAG_DIR)/mii-diag
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR) DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $@
-	touch $@
+MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
-mii-diag: $(TARGET_DIR)/$(MIIDIAG_BINARY)
+define MII_DIAG_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-mii-diag-source: $(DL_DIR)/$(MIIDIAG_SOURCE) $(MIIDIAG_PATCH)
+define MII_DIAG_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
 
-mii-diag-clean:
-	-$(MAKE) -C $(MIIDIAG_DIR) clean
+define MII_DIAG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/mii-diag
+endef
 
-mii-diag-dirclean:
-	rm -rf $(MIIDIAG_DIR)
+define MII_DIAG_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MIIDIAG),y)
-TARGETS+=mii-diag
-endif
+$(eval $(call GENTARGETS,package,mii-diag))
-- 
1.7.3.1
