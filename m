From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 15 Mar 2012 21:54:12 +0100
Subject: [Buildroot] [PATCH v3 2/2] u-boot: build signed image for OMAP
	processors
In-Reply-To: <1331844852-4609-1-git-send-email-luca@lucaceresoli.net>
References: <1331844852-4609-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331844852-4609-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
New in v3: rebase on current master.

New in v2: add depends on BR2_arm || BR2_armeb.
---
 boot/uboot/Config.in |   16 ++++++++++++++++
 boot/uboot/uboot.mk  |   24 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..73e560f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,6 +92,22 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 
 endchoice
 
+config BR2_TARGET_UBOOT_OMAP_IFT
+	depends on BR2_TARGET_UBOOT_FORMAT_BIN
+	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
+	bool "produce a .ift signed image (OMAP)"
+	help
+	  Use gpsign to produce an image of u-boot.bin signed with
+	  a Configuration Header for booting on OMAP processors.
+
+if BR2_TARGET_UBOOT_OMAP_IFT
+
+config BR2_TARGET_UBOOT_OMAP_IFT_CONFIG
+	string "gpsign Configuration Header config file"
+
+endif
+
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Custom Network Settings"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..074cbd0 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -31,6 +31,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
 else
 UBOOT_BIN          = u-boot.bin
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+UBOOT_BIN_IFT      = ${UBOOT_BIN}.ift
+endif
 endif
 
 UBOOT_ARCH=$(KERNEL_ARCH)
@@ -86,10 +89,31 @@ define UBOOT_BUILD_CMDS
 		$(UBOOT_MAKE_TARGET)
 endef
 
+define UBOOT_BUILD_OMAP_IFT
+	${HOST_DIR}/usr/bin/gpsign -f $(@D)/u-boot.bin \
+		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
+endef
+
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 endef
 
+define UBOOT_INSTALL_OMAP_IFT_IMAGE
+	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
+endef
+
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+# we NEED a config file unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG)),)
+$(error No gpsign config file. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
+endif
+endif
+UBOOT_DEPENDENCIES += host-omap-u-boot-utils
+UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
+endif
+
 $(eval $(call GENTARGETS))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-- 
1.7.5.4
