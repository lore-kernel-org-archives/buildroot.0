From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu,  8 Mar 2012 05:47:02 -0800
Subject: [Buildroot] [PATCH 1/2] uboot: Add support for copying MLO to the
	images directory for U-boot builds that include it.
Message-ID: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 boot/uboot/Config.in |    6 ++++++
 boot/uboot/uboot.mk  |    6 +++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..0b8db1f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,4 +137,10 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
+config BR2_TARGET_UBOOT_MLO
+	bool "MLO"
+	help
+	  Copy the X-Loader binary (MLO) to the images directory for 
+	  U-boot builds that generate it.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..ac4d4fe 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -33,6 +33,10 @@ else
 UBOOT_BIN          = u-boot.bin
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_MLO),y)
+UBOOT_EXTRA_BIN	   = $(@D)/MLO
+endif
+
 UBOOT_ARCH=$(KERNEL_ARCH)
 
 UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
@@ -87,7 +91,7 @@ define UBOOT_BUILD_CMDS
 endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
-	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	cp -dpf $(@D)/$(UBOOT_BIN) $(UBOOT_EXTRA_BIN) $(BINARIES_DIR)/
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.4.1
