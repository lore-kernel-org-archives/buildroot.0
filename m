From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:23:01 +0200
Subject: [Buildroot] [PATCH 10/26] at91bootstrap: convert to GENTARGETS
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0d2f12caf4b742d2e28202091ff67b04b8eaddba.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |   53 ++++++++++++-----------------------
 1 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 052d1bd..48fa4e0 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -4,49 +4,32 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_NAME    = AT91Bootstrap$(AT91BOOTSTRAP_VERSION)
 AT91BOOTSTRAP_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-AT91BOOTSTRAP_SOURCE  = $(AT91BOOTSTRAP_NAME).zip
-AT91BOOTSTRAP_DIR     = $(BUILD_DIR)/at91bootstrap-$(AT91BOOTSTRAP_VERSION)
+AT91BOOTSTRAP_SOURCE  = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
-AT91BOOTSTRAP_BOARD     = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-AT91BOOTSTRAP_MEMORY    = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-AT91BOOTSTRAP_BINARY    = $(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
-AT91BOOTSTRAP_BUILD_DIR = $(AT91BOOTSTRAP_DIR)/board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
-AT91BOOTSTRAP_TARGET    = $(AT91BOOTSTRAP_BUILD_DIR)/$(AT91BOOTSTRAP_BINARY)
+AT91BOOTSTRAP_BOARD       = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
+AT91BOOTSTRAP_MEMORY      = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
+AT91BOOTSTRAP_MAKE_SUBDIR = board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
+AT91BOOTSTRAP_BINARY      = $(AT91BOOTSTRAP_MAKE_SUBDIR)/$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
 
-$(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
-	 $(call DOWNLOAD,$(AT91BOOTSTRAP_SITE),$(AT91BOOTSTRAP_SOURCE))
+AT91BOOTSTRAP_INSTALL_IMAGES = YES
+AT91BOOTSTRAP_INSTALL_TARGET = NO
 
-$(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
-	mkdir -p $(BUILD_DIR)
+define AT91BOOTSTRAP_EXTRACT_CMDS
 	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
-	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION) $(AT91BOOTSTRAP_DIR)
-	touch $@
+	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
+	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
+endef
 
-$(AT91BOOTSTRAP_DIR)/.patched: $(AT91BOOTSTRAP_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) boot/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
-	touch $@
+define AT91BOOTSTRAP_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
+endef
 
-$(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.patched
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-		-C $(AT91BOOTSTRAP_BUILD_DIR)
+define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
+	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
+endef
 
-$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
-	mkdir -p $(dir $@)
-	cp $^ $@
-
-at91bootstrap: $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-
-at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
-
-at91bootstrap-unpacked: $(AT91BOOTSTRAP_DIR)/.unpacked
-
-at91bootstrap-clean:
-	make -C $(AT91BOOTSTRAP_BUILD_DIR) clean
-
-at91bootstrap-dirclean:
-	rm -rf $(AT91BOOTSTRAP_DIR)
+$(eval $(call GENTARGETS,boot,at91bootstrap))
 
 #############################################################
 #
-- 
1.7.1
