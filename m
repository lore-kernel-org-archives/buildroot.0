From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:29 +0200
Subject: [Buildroot] [PATCH 12/28] at91dataflashboot: convert to GENTARGETS
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ba2d8db1b41fca447e6534f99b2e025b4ce27f97.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit converts the at91dataflashboot bootloader build process to
GENTARGETS. It also does the following changes :

 * As the package directory name is at91dataflashboot, the
   configuration options and make variables are renamed to
   AT91DATAFLASHBOOT instead of DATAFLASHBOOT.

 * Since the board selection in Kconfig wasn't used anywhere, get rid
   of it. at91dataflashboot is only for AT91RM9200 apparently anyway.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/Config.in            |   24 +--------------
 boot/at91dataflashboot/at91dataflashboot.mk |   44 ++++++++------------------
 2 files changed, 15 insertions(+), 53 deletions(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 25b9723..88cd058 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,25 +1,3 @@
-menuconfig BR2_TARGET_DATAFLASHBOOT
+menuconfig BR2_TARGET_AT91DATAFLASHBOOT
        depends on BR2_arm
        bool "AT91 DataFlashBoot"
-
-if BR2_TARGET_DATAFLASHBOOT
-
-choice
-	prompt "Target Architecture"
-	default BR2_TARGET_DATAFLASHBOOT_AT91RM9200
-	help
-	  Select Chip for which Dataflash boot should be built
-	  Currently only AT91RM9200 Supported
-
-config BR2_TARGET_DATAFLASHBOOT_AT91RM9200
-	bool "AT91RM9200"
-
-config BR2_TARGET_DATAFLASHBOOT_AT91SAM9261
-	bool "AT91SAM9261"
-
-config BR2_TARGET_DATAFLASHBOOT_AT91SAM9261S
-	bool "AT91SAM9261S"
-
-endchoice
-
-endif # BR2_TARGET_DATAFLASHBOOT
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index f6e9b67..d27e9f3 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -3,44 +3,28 @@
 # DataFlashBoot
 #
 #############################################################
-DATAFLASHBOOT_VERSION = 1.05
-DATAFLASHBOOT_NAME    = DataflashBoot-$(DATAFLASHBOOT_VERSION)
-DATAFLASHBOOT_SITE    = ftp://www.at91.com/pub/buildroot/
-DATAFLASHBOOT_SOURCE  = $(DATAFLASHBOOT_NAME).tar.bz2
-DATAFLASHBOOT_DIR     = $(BUILD_DIR)/at91dataflashboot-$(DATAFLASHBOOT_VERSION)
-DATAFLASHBOOT_BINARY  = $(DATAFLASHBOOT_NAME).bin
+AT91DATAFLASHBOOT_VERSION = 1.05
+AT91DATAFLASHBOOT_SOURCE  = DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).tar.bz2
+AT91DATAFLASHBOOT_SITE    = ftp://www.at91.com/pub/buildroot/
 
-$(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
-	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
+AT91DATAFLASHBOOT_INSTALL_TARGET = NO
+AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
 
-$(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
-	mkdir -p $(@D)
-	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
+define AT91DATAFLASHBOOT_BUILD_CMDS
+	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS)
+endef
 
-$(DATAFLASHBOOT_DIR)/.patched: $(DATAFLASHBOOT_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(@D) boot/at91dataflashboot \
-		at91dataflashboot-$(DATAFLASHBOOT_VERSION)-\*.patch
-	touch $@
+define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
+	cp $(@D)/DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).bin $(BINARIES_DIR)
+endef
 
-$(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.patched
-	ls $(DATAFLASHBOOT_DIR)/.unpacked
-	make -C $(DATAFLASHBOOT_DIR) CROSS_COMPILE=$(TARGET_CROSS)
-
-dataflashboot-clean:
-	make -C $(DATAFLASHBOOT_DIR) clean
-
-dataflashboot-dirclean:
-	rm -rf $(DATAFLASHBOOT_DIR)
-
-dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY) $(BINARIES_DIR)
+$(eval $(call GENTARGETS,boot,at91dataflashboot))
 
 #############################################################
 #
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
-TARGETS+=dataflash
+ifeq ($(BR2_TARGET_AT91DATAFLASHBOOT),y)
+TARGETS+=at91dataflashboot
 endif
-- 
1.7.4.1
