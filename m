From: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Date: Tue, 28 Jul 2020 18:00:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/imx-m4-demos: new
 package
Message-ID: <20200728160041.520201-1-fabrice.goucem@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package to download and install i.MX Cortex-M4 demos
for following SoCs:
* i.MX7D
* i.MX7ULP
* i.MX8M
* i.MX8MM
* i.MX8MN
* i.MX8QM
* i.MX8QXP

Yocto recipes from where the demos location has been extracted:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-sdk/recipes-fsl/m4-demos?h=imx-morty&id=bfb1e26798775f161b14218ac6f1d50069bea8ed

Signed-off-by: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Tested-by: Julien Olivain <julien.olivain@nxp.com>
Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 DEVELOPERS                                    |  1 +
 board/freescale/common/imx/post-image.sh      | 14 ++-
 package/freescale-imx/Config.in               | 10 ++
 package/freescale-imx/imx-m4-demos/Config.in  | 11 +++
 .../imx-m4-demos/imx-m4-demos.hash            | 10 ++
 .../imx-m4-demos/imx-m4-demos.mk              | 95 +++++++++++++++++++
 6 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-m4-demos/Config.in
 create mode 100644 package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
 create mode 100644 package/freescale-imx/imx-m4-demos/imx-m4-demos.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..5e24b55167 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -908,6 +908,7 @@ F:	package/whois/
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
 F:	configs/freescale_imx6ullevk_defconfig
+F:	package/freescale-imx/imx-m4-demos/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 06ccaac3a4..4ac7ae09f8 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -30,6 +30,18 @@ linux_image()
 	fi
 }
 
+#
+# m4_image prints all available M4 demo file names for the genimage
+# configuration file
+#
+m4_image()
+{
+	if grep -Eq "^BR2_PACKAGE_IMX_M4_DEMOS=y$" ${BR2_CONFIG}; then
+		echo -n ", "
+		for f in $(ls ${BINARIES_DIR}/m4_*); do echo -n "$(basename $f), "; done
+	fi
+}
+
 genimage_type()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
@@ -79,7 +91,7 @@ uboot_image()
 
 main()
 {
-	local FILES="$(dtb_list) $(linux_image)"
+	local FILES="$(dtb_list) $(linux_image) $(m4_image)"
 	local IMXOFFSET="$(imx_offset)"
 	local UBOOTBIN="$(uboot_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8436..b95de54f4c 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -96,10 +96,20 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_M4
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-m4-demos/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
diff --git a/package/freescale-imx/imx-m4-demos/Config.in b/package/freescale-imx/imx-m4-demos/Config.in
new file mode 100644
index 0000000000..b1cbebb74f
--- /dev/null
+++ b/package/freescale-imx/imx-m4-demos/Config.in
@@ -0,0 +1,11 @@
+comment "imx-m4-demos needs an i.MX platform with Cortex-M4"
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_M4
+
+config BR2_PACKAGE_IMX_M4_DEMOS
+	bool "imx-m4-demos"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_M4
+	help
+	  Cortex-M4 demo blobs for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash b/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
new file mode 100644
index 0000000000..feda867952
--- /dev/null
+++ b/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
@@ -0,0 +1,10 @@
+# locally computed
+sha256  cc00d3b936d49b2794a2a99e10129437e70caba3fd26b8379b8c50dd22f73254  imx7d-sabresd-m4-freertos-1.0.1.bin
+sha256  a8fbe1180b3d20e933a410cd76e60baac7a9f54e8b2bae8b6b8a3e1af550eca6  imx7ulp-m4-demo-2.8.0.bin
+sha256  4e41e270506870e0fd2d53e3d69afdcf6d613d099b0da5c516a512944c5c12c3  imx8mm-m4-demo-2.5.0.bin
+sha256  e877c7462b6ea87c498563842f42352d204eb28a65f35f7dc1fec643f84abb66  imx8mn-m7-demo-2.8.0.bin
+sha256  fd441e75395b0c6f90626c883ee8a93406b14e7d55adc7925116254394bb7ad8  imx8mq-m4-demo-2.3.0.bin
+sha256  d06a636b84cd559483091cbdb07b5ce9e15a534bca31d4cb756b33b696c2160b  imx8qm-m4-demo-2.8.0.bin
+sha256  7800cdbebe07f426cdac50b0e295d64215164a767e79ca58bd917445c50e345f  imx8qx-m4-demo-2.8.0.bin
+
+# no hash for license file as it is different for each package listed above
diff --git a/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk b/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk
new file mode 100644
index 0000000000..d331ef9b69
--- /dev/null
+++ b/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# imx-m4-demos
+#
+################################################################################
+
+IMX_M4_DEMOS_SITE = $(FREESCALE_IMX_SITE)
+
+IMX_M4_DEMOS_LICENSE = NXP Semiconductor Software License Agreement
+IMX_M4_DEMOS_LICENSE_FILES = COPYING
+IMX_M4_DEMOS_REDISTRIBUTE = NO
+
+define IMX_M4_DEMOS_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_M4_DEMOS_DL_DIR)/$(IMX_M4_DEMOS_SOURCE))
+endef
+
+# Note: firmware names are copied to binaries directory with an "m4_" prefix, for easier post image scripting
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
+IMX_M4_DEMOS_VERSION = 1.0.1
+IMX_M4_DEMOS_SOURCE = imx7d-sabresd-m4-freertos-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx7d_sabresd_m4_TCM_helloworld.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_helloworld.bin
+	cp $(@D)/imx7d_sabresd_m4_TCM_mcctty.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_mcctty.bin
+	cp $(@D)/imx7d_sabresd_m4_TCM_Pingpang.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_Pingpang.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP),y)
+IMX_M4_DEMOS_VERSION = 2.8.0
+IMX_M4_DEMOS_SOURCE = imx7ulp-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img $(BINARIES_DIR)/m4_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
+	cp $(@D)/imx7ulp_m4_demo.img $(BINARIES_DIR)/m4_imx7ulp_m4_demo.img
+	cp $(@D)/imx7ulp_rpmsg_lite_pingpong_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
+	cp $(@D)/imx7ulp_rpmsg_lite_str_echo_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_str_echo_rtos.img
+	cp $(@D)/imx7ulp_wireless_uart_bridge.img $(BINARIES_DIR)/m4_imx7ulp_wireless_uart_bridge.img
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+IMX_M4_DEMOS_VERSION = 2.8.0
+IMX_M4_DEMOS_SOURCE = imx8qm-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8qm_m4_0_TCM_hello_world_m40.bin $(BINARIES_DIR)/m4_imx8qm_m4_0_TCM_hello_world_m40.bin
+	cp $(@D)/imx8qm_m4_0_TCM_power_mode_switch_m40.bin $(BINARIES_DIR)/m4_imx8qm_m4_0_TCM_power_mode_switch_m40.bin
+	cp $(@D)/imx8qm_m4_0_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m40.bin $(BINARIES_DIR)/m4_imx8qm_m4_0_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m40.bin
+	cp $(@D)/imx8qm_m4_0_TCM_rpmsg_lite_str_echo_rtos_m40.bin $(BINARIES_DIR)/m4_imx8qm_m4_0_TCM_rpmsg_lite_str_echo_rtos_m40.bin
+	cp $(@D)/imx8qm_m4_1_TCM_hello_world_m41.bin $(BINARIES_DIR)/m4_imx8qm_m4_1_TCM_hello_world_m41.bin
+	cp $(@D)/imx8qm_m4_1_TCM_power_mode_switch_m41.bin $(BINARIES_DIR)/m4_imx8qm_m4_1_TCM_power_mode_switch_m41.bin
+	cp $(@D)/imx8qm_m4_1_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m41.bin $(BINARIES_DIR)/m4_imx8qm_m4_1_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m41.bin
+	cp $(@D)/imx8qm_m4_1_TCM_rpmsg_lite_str_echo_rtos_m41.bin $(BINARIES_DIR)/m4_imx8qm_m4_1_TCM_rpmsg_lite_str_echo_rtos_m41.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
+IMX_M4_DEMOS_VERSION = 2.3.0
+IMX_M4_DEMOS_SOURCE = imx8mq-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8mq_m4_TCM_hello_world.bin $(BINARIES_DIR)/m4_imx8mq_m4_TCM_hello_world.bin
+	cp $(@D)/imx8mq_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin $(BINARIES_DIR)/m4_imx8mq_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin
+	cp $(@D)/imx8mq_m4_TCM_rpmsg_lite_str_echo_rtos.bin $(BINARIES_DIR)/m4_imx8mq_m4_TCM_rpmsg_lite_str_echo_rtos.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM),y)
+IMX_M4_DEMOS_VERSION = 2.5.0
+IMX_M4_DEMOS_SOURCE = imx8mm-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8mm_m4_TCM_hello_world.bin $(BINARIES_DIR)/m4_imx8mm_m4_TCM_hello_world.bin
+	cp $(@D)/imx8mm_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin $(BINARIES_DIR)/m4_imx8mm_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin
+	cp $(@D)/imx8mm_m4_TCM_rpmsg_lite_str_echo_rtos.bin $(BINARIES_DIR)/m4_imx8mm_m4_TCM_rpmsg_lite_str_echo_rtos.bin
+	cp $(@D)/imx8mm_m4_TCM_sai_low_power_audio.bin $(BINARIES_DIR)/m4_imx8mm_m4_TCM_sai_low_power_audio.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+IMX_M4_DEMOS_VERSION = 2.8.0
+IMX_M4_DEMOS_SOURCE = imx8mn-m7-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.bin $(BINARIES_DIR)/m4_imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.bin
+	cp $(@D)/imx8mn_m7_TCM_hello_world.bin $(BINARIES_DIR)/m4_imx8mn_m7_TCM_hello_world.bin
+	cp $(@D)/imx8mn_m7_TCM_sai_low_power_audio.bin $(BINARIES_DIR)/m4_imx8mn_m7_TCM_sai_low_power_audio.bin
+	cp $(@D)/imx8mn_m7_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin $(BINARIES_DIR)/m4_imx8mn_m7_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+IMX_M4_DEMOS_VERSION = 2.8.0
+IMX_M4_DEMOS_SOURCE = imx8qx-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8qx_m4_TCM_hello_world.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_hello_world.bin
+	cp $(@D)/imx8qx_m4_TCM_power_mode_switch.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_power_mode_switch.bin
+	cp $(@D)/imx8qx_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin
+	cp $(@D)/imx8qx_m4_TCM_rpmsg_lite_str_echo_rtos.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_rpmsg_lite_str_echo_rtos.bin
+	cp $(@D)/imx8qx_m4_TCM_srtm_demo.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_srtm_demo.bin
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.27.0
