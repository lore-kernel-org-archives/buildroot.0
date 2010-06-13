From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:08 +0200
Subject: [Buildroot] [PATCH 04/10] module-init-tools: remove support for
	cross-depmod
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7f4da0ef07505a56a286e261c166ccabf7fcb8bb.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new infrastructure to build the Linux kernel doesn't use a
cross-depmod. This isn't needed with modern module-init-tools that
most distros include perfectly handle this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/module-init-tools/module-init-tools.mk |   44 ------------------------
 1 files changed, 0 insertions(+), 44 deletions(-)

diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 129770e..8adb684 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -70,50 +70,6 @@ module-init-tools-dirclean:
 	rm -rf $(MODULE_INIT_TOOLS_DIR)
 
 #############################################################
-
-
-$(MODULE_INIT_TOOLS_DIR2)/.source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
-	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(TOOLCHAIN_DIR) -xvf -
-	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR2) package/module-init-tools \*.patch
-	$(CONFIG_UPDATE) $(MODULE_INIT_TOOLS_DIR2)
-	touch $(MODULE_INIT_TOOLS_DIR2)/.source
-
-$(MODULE_INIT_TOOLS_DIR2)/.configured: $(MODULE_INIT_TOOLS_DIR2)/.source
-	(cd $(MODULE_INIT_TOOLS_DIR2); \
-		CC="$(HOSTCC)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--sysconfdir=/etc \
-		--program-transform-name='' \
-	)
-	touch $(MODULE_INIT_TOOLS_DIR2)/.configured
-
-$(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY): $(MODULE_INIT_TOOLS_DIR2)/.configured
-	$(MAKE) -C $(MODULE_INIT_TOOLS_DIR2)
-	touch -c $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY)
-
-
-$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26: $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY)
-	$(INSTALL) -D $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
-
-cross-depmod26: $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
-
-module-init-tools-source cross-depmod26-source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
-
-cross-depmod26-clean:
-	rm -f $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
-	-$(MAKE) -C $(MODULE_INIT_TOOLS_DIR2) clean
-
-cross-depmod26-dirclean:
-	rm -rf $(MODULE_INIT_TOOLS_DIR2)
-
-ifeq ($(BR2_PACKAGE_LINUX),y)
-HOST_SOURCE+=module-init-tools-source
-endif
-
-#############################################################
 #
 ## Toplevel Makefile options
 #
-- 
1.7.0.4
