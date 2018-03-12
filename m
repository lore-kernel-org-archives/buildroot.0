From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Mar 2018 18:44:47 +0100
Subject: [Buildroot] [PATCH v2 4/6] uboot: zynqmp: generate SPL image with
 PMUFW binary
In-Reply-To: <1520876689-2975-1-git-send-email-luca@lucaceresoli.net>
References: <1520876689-2975-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1520876689-2975-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to boot on the Xilinx ZynqMP SoCs, U-Boot SPL requires a
recent PMU firmware loaded. Instruct U-Boot to add pmufw.bin to the
boot.bin file together with U-Boot SPL, to the boot ROM will load
both.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
 - split from a larger patch doing 2 things.
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 264f34376749..a45b4202fe2e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -367,6 +367,17 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	  for u-boot-dtb.img file so this U-Boot format is required
 	  to be set.
 
+config BR2_TARGET_UBOOT_ZYNQMP
+	bool "Boot on the Xilinx ZynqMP SoCs"
+	depends on BR2_aarch64
+	select BR2_TARGET_ZYNQMP_PMUFW_BINARIES
+	help
+	  Instruct the U-Boot build process to generate a file named
+	  boot.bin, which is the file loaded by the ZynqMP boot ROM.
+	  boot.bin contains both the U-Boot SPL and the PMU firmware
+	  (downloaded by the zynqmp-pmufw-binaries package) formatted
+	  with the Xilinx-specific format.
+
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 58dd906a274a..1890bbfa4405 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -274,6 +274,19 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			$(BINARIES_DIR)/boot.scr)
 endef
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
+
+UBOOT_DEPENDENCIES += zynqmp-pmufw-binaries
+define UBOOT_KCONFIG_FIXUP_CMDS
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"board/xilinx/zynqmp/pmufw.bin",$(@D)/.config)
+endef
+define UBOOT_ZYNQMP_COPY_PMUFW
+	cp ${BINARIES_DIR}/pmufw.bin $(@D)/board/xilinx/zynqmp/
+endef
+UBOOT_PRE_CONFIGURE_HOOKS += UBOOT_ZYNQMP_COPY_PMUFW
+
+endif # BR2_TARGET_UBOOT_ZYNQMP
+
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
 	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
 endef
-- 
2.7.4
