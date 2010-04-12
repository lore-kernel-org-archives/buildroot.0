From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:27 +0200
Subject: [Buildroot] [PATCH 15/21] argus: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b81f54c2cd47ec6165b1b287b328b3bfa3959012.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/argus.mk |   64 ++++++------------------------------------------
 1 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 57d0789..2e9d312 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -7,63 +7,15 @@ ARGUS_VERSION:=3.0.0.rc.34
 ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
 ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
-ARGUS_DIR:=$(BUILD_DIR)/argus-$(ARGUS_VERSION)
-ARGUS_CAT:=$(ZCAT)
-ARGUS_BINARY:=bin/argus
-ARGUS_TARGET_BINARY:=usr/sbin/argus
+ARGUS_DEPENDENCIES=libpcap
+ARGUS_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
-$(DL_DIR)/$(ARGUS_SOURCE):
-	$(call DOWNLOAD,$(ARGUS_SITE),$(ARGUS_SOURCE))
-
-$(DL_DIR)/$(ARGUS_PATCH):
-	$(call DOWNLOAD,$(ARGUS_SITE),$(ARGUS_PATCH))
-
-argus-source: $(DL_DIR)/$(ARGUS_SOURCE) $(DL_DIR)/$(ARGUS_PATCH)
-
-$(ARGUS_DIR)/.unpacked: $(DL_DIR)/$(ARGUS_SOURCE) $(DL_DIR)/$(ARGUS_PATCH)
-	$(ARGUS_CAT) $(DL_DIR)/$(ARGUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ARGUS_DIR) package/argus/ argus\*.patch
-ifneq ($(ARGUS_PATCH),)
-	(cd $(ARGUS_DIR) && $(ARGUS_CAT) $(DL_DIR)/$(ARGUS_PATCH) | patch -p1)
-	if [ -d $(ARGUS_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(ARGUS_DIR) $(ARGUS_DIR)/debian/patches \*.patch; \
+define ARGUS_DEBIAN_PATCH_APPLY
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
-endif
-	touch $@
-
-$(ARGUS_DIR)/.configured: $(ARGUS_DIR)/.unpacked
-	(cd $(ARGUS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(ARGUS_DIR)/$(ARGUS_BINARY): $(ARGUS_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(ARGUS_DIR)
-
-$(TARGET_DIR)/$(ARGUS_TARGET_BINARY): $(ARGUS_DIR)/$(ARGUS_BINARY)
-	cp -dpf $(ARGUS_DIR)/$(ARGUS_BINARY) $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+endef
 
-argus: libpcap $(TARGET_DIR)/$(ARGUS_TARGET_BINARY)
+ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
 
-argus-clean:
-	-$(MAKE) -C $(ARGUS_DIR) clean
-	rm -f $(TARGET_DIR)/$(ARGUS_TARGET_BINARY)
-
-argus-dirclean:
-	rm -rf $(ARGUS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ARGUS),y)
-TARGETS+=argus
-endif
+$(eval $(call AUTOTARGETS,package,argus))
\ No newline at end of file
-- 
1.6.3.3
