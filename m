From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 19 Sep 2011 16:53:27 +0200
Subject: [Buildroot] [PATCH v2 2/2] u-boot: build signed image for OMAP
	processors
In-Reply-To: <1316444007-10968-1-git-send-email-luca@lucaceresoli.net>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
 <1316444007-10968-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1316444007-10968-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

New in v2: add depends on BR2_arm || BR2_armeb.

---
 boot/uboot/Config.in |   16 ++++++++++++++++
 boot/uboot/uboot.mk  |   24 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index daccd8b..ade6330 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -91,6 +91,22 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 
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
index 202995a..71397f8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -29,6 +29,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else
 UBOOT_BIN          = u-boot.bin
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+UBOOT_BIN_IFT      = ${UBOOT_BIN}.ift
+endif
 endif
 
 UBOOT_ARCH=$(KERNEL_ARCH)
@@ -84,10 +87,31 @@ define UBOOT_BUILD_CMDS
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
 $(eval $(call GENTARGETS,boot,uboot))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-- 
1.7.4.1
