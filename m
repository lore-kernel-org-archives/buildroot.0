From: Fabrice Goucem <fabrice.goucem@nxp.com>
Date: Sun, 10 Nov 2019 23:08:50 +0000
Subject: [Buildroot] [PATCH v4 1/2] package/freescale-imx/imx-m4-demos: new
 package
In-Reply-To: <20191105120304.19928-1-fabrice.goucem@nxp.com>
References: <20191105120304.19928-1-fabrice.goucem@nxp.com>
Message-ID: <20191110230831.11479-1-fabrice.goucem@nxp.com>
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
* i.MX8QXP

Yocto recipes from where the demos location has been extracted:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-sdk/recipes-fsl/m4-demos?h=imx-morty&id=bfb1e26798775f161b14218ac6f1d50069bea8ed

Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
Tested-by: Julien Olivain <julien.olivain@nxp.com>
---
 DEVELOPERS                                    |  3 +
 board/freescale/common/imx/post-image.sh      | 14 +++-
 package/freescale-imx/Config.in               |  8 +++
 package/freescale-imx/imx-m4-demos/Config.in  | 11 +++
 .../imx-m4-demos/imx-m4-demos.hash            |  8 +++
 .../imx-m4-demos/imx-m4-demos.mk              | 72 +++++++++++++++++++
 6 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-m4-demos/Config.in
 create mode 100644 package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
 create mode 100644 package/freescale-imx/imx-m4-demos/imx-m4-demos.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..194e5249d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -874,6 +874,9 @@ F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
 
+N:	Fabrice Goucem <fabrice.goucem@nxp.com>
+F:	package/freescale-imx/imx-m4-firmware/
+
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 19d8fffb63..f9851c2d3b 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -30,6 +30,18 @@ linux_image()
 	fi
 }
 
+#
+# m4_image prints all available M4 firmware file names for the genimage
+# configuration file
+#
+m4_image()
+{
+	if grep -Eq "^BR2_PACKAGE_IMX_M4_FIRMWARE=y$" ${BR2_CONFIG}; then
+		echo -n ", "
+		for f in $(ls ${BINARIES_DIR}/m4_*); do echo -n "$(basename $f), "; done
+	fi
+}
+
 genimage_type()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
@@ -75,7 +87,7 @@ uboot_image()
 
 main()
 {
-	local FILES="$(dtb_list) $(linux_image)"
+	local FILES="$(dtb_list) $(linux_image) $(m4_image)"
 	local IMXOFFSET="$(imx_offset)"
 	local UBOOTBIN="$(uboot_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index f010aab87b..55cd53aa37 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -83,10 +83,18 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_M4
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
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
index 0000000000..fc2312d410
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
+	  Cortex-M4 firmware blobs for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash b/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
new file mode 100644
index 0000000000..fdbf1ab608
--- /dev/null
+++ b/package/freescale-imx/imx-m4-demos/imx-m4-demos.hash
@@ -0,0 +1,8 @@
+# locally computed
+sha256  cc00d3b936d49b2794a2a99e10129437e70caba3fd26b8379b8c50dd22f73254  imx7d-sabresd-m4-freertos-1.0.1.bin
+sha256  e4efb9646b66df867f618bd8121e14afe17ebadea4a405a4df951d45d841e681  imx7ulp-m4-demo-2.6.0.bin
+sha256  4e41e270506870e0fd2d53e3d69afdcf6d613d099b0da5c516a512944c5c12c3  imx8mm-m4-demo-2.5.0.bin
+sha256  fd441e75395b0c6f90626c883ee8a93406b14e7d55adc7925116254394bb7ad8  imx8mq-m4-demo-2.3.0.bin
+sha256  4e83d60e27cd8ad67d4174ad3082a5f4a06b7df93571cfd2274615cbdf66eb6c  imx8qx-m4-demo-2.5.0.bin
+
+# no hash for license file as it is different for each package listed above
diff --git a/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk b/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk
new file mode 100644
index 0000000000..6d08dcc8f8
--- /dev/null
+++ b/package/freescale-imx/imx-m4-demos/imx-m4-demos.mk
@@ -0,0 +1,72 @@
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
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP),y)
+IMX_M4_DEMOS_VERSION = 2.6.0
+IMX_M4_DEMOS_SOURCE = imx7ulp-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img $(BINARIES_DIR)/m4_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
+	cp $(@D)/imx7ulp_m4_demo.img $(BINARIES_DIR)/m4_imx7ulp_m4_demo.img
+	cp $(@D)/imx7ulp_rpmsg_lite_pingpong_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
+	cp $(@D)/imx7ulp_rpmsg_lite_str_echo_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_str_echo_rtos.img
+	cp $(@D)/imx7ulp_wireless_uart_bridge.img $(BINARIES_DIR)/m4_imx7ulp_wireless_uart_bridge.img
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
+IMX_M4_DEMOS_VERSION = 1.0.1
+IMX_M4_DEMOS_SOURCE = imx7d-sabresd-m4-freertos-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx7d_sabresd_m4_TCM_helloworld.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_helloworld.bin
+	cp $(@D)/imx7d_sabresd_m4_TCM_mcctty.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_mcctty.bin
+	cp $(@D)/imx7d_sabresd_m4_TCM_Pingpang.bin $(BINARIES_DIR)/m4_imx7d_sabresd_m4_TCM_Pingpang.bin
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+IMX_M4_DEMOS_VERSION = 2.5.0
+IMX_M4_DEMOS_SOURCE = imx8qx-m4-demo-$(IMX_M4_DEMOS_VERSION).bin
+IMX_M4_DEMOS_INSTALL_IMAGES = YES
+define IMX_M4_DEMOS_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx8qx_m4_TCM_hello_world.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_hello_world.bin
+	cp $(@D)/imx8qx_m4_TCM_power_mode_switch.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_power_mode_switch.bin
+	cp $(@D)/imx8qx_m4_TCM_rear_view_camera.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_rear_view_camera.bin
+	cp $(@D)/imx8qx_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin
+	cp $(@D)/imx8qx_m4_TCM_rpmsg_lite_str_echo_rtos.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_rpmsg_lite_str_echo_rtos.bin
+	cp $(@D)/imx8qx_m4_TCM_srtm_demo.bin $(BINARIES_DIR)/m4_imx8qx_m4_TCM_srtm_demo.bin
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
+endif
+
+$(eval $(generic-package))
-- 
2.24.0.rc1
