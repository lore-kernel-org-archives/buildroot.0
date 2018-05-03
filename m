From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  3 May 2018 18:23:36 +0200
Subject: [Buildroot] [PATCH v3 4/5] uboot: zynqmp: generate SPL image with
 PMUFW binary
In-Reply-To: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1525364617-23633-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to boot on the Xilinx ZynqMP SoCs, U-Boot SPL requires a
recent PMU firmware loaded. Instruct U-Boot to add pmufw.bin to the
boot.bin file together with U-Boot SPL, and the boot ROM will load
both.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v2 -> v3:
 - don't use a "zynqmp-pmufw-binaries" package, just download a file
 - define kconfig fixups in a variable, then define
   UBOOT_KCONFIG_FIXUP_CMDS unconditionally at global scope (Thomas)
 - use $(INSTALL), not cp (Thomas)
 - $(...) instead of ${...} to reference make variables (Thomas)

Changes v1 -> v2:
 - split from a larger patch doing 2 things.
---
 boot/uboot/Config.in | 13 +++++++++++++
 boot/uboot/uboot.mk  | 19 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index adde4040e55b..948d09a65f42 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -373,6 +373,19 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	string "PMU firmware location"
+	help
+	  Location of a PMU firmware binary.
+
+	  If set to an URL or a file path, instructs the U-Boot build
+	  process to generate a boot.bin (to be loaded by the ZynqMP
+	  boot ROM) containing both the U-Boot SPL and the PMU
+	  firmware in the Xilinx-specific boot format.
+
+	  If empty, the generated boot.bin will not contain a PMU
+	  firmware.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR
 	string "Custom psu_init_gpl files"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbb899515181..266e42698d1b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -276,6 +276,21 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+
+ifneq ($(UBOOT_ZYNQMP_PMUFW),)
+UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
+BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
+define UBOOT_ZYNQMP_KCONFIG_FIXUP
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"board/xilinx/zynqmp/pmufw.bin",$(@D)/.config)
+endef
+define UBOOT_ZYNQMP_COPY_PMUFW
+	$(INSTALL) -D -m 0644 $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW)) \
+		$(@D)/board/xilinx/zynqmp/pmufw.bin
+endef
+UBOOT_PRE_CONFIGURE_HOOKS += UBOOT_ZYNQMP_COPY_PMUFW
+endif # UBOOT_ZYNQMP_PMUFW
+
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR)),)
 define UBOOT_ZYNQMP_COPY_PSU_INIT
 # In U-Boot's board/xilinx/zynqmp/Makefile the bundled psu_init_gpl.c
@@ -339,6 +354,10 @@ UBOOT_DEPENDENCIES += host-mkpimage
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
 endif
 
+define UBOOT_KCONFIG_FIXUP_CMDS
+	$(UBOOT_ZYNQMP_KCONFIG_FIXUP)
+endef
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
-- 
2.7.4
