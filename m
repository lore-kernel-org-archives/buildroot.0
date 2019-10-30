From: Fabrice Goucem <fabrice.goucem@nxp.com>
Date: Wed, 30 Oct 2019 13:40:15 +0000
Subject: [Buildroot] [PATCH v2 3/3] package/freescale-imx/imx-m4-firmware:
 add support for i.MX7ULP
In-Reply-To: <20191030133955.30611-1-fabrice.goucem@nxp.com>
References: <20191029170102.13482-1-fabrice.goucem@nxp.com>
 <20191030133955.30611-1-fabrice.goucem@nxp.com>
Message-ID: <20191030133955.30611-3-fabrice.goucem@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create new flag BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP to
differentiate i.MX7ULP from i.MX7D which has different Cortex-M4
firmware.

Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>

---
Changes v1 -> v2:
  - Split i.MX7ULP support into two commits:
	new defconfig and m4 support (suggested by Fabio Estevam)

Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 board/freescale/imx7ulpevk/readme.txt            | 16 ++++++++++++++++
 configs/freescale_imx7ulpevk_defconfig           |  1 +
 package/freescale-imx/Config.in                  |  8 +++++++-
 .../imx-m4-firmware/imx-m4-firmware.hash         |  1 +
 .../imx-m4-firmware/imx-m4-firmware.mk           | 13 ++++++++++++-
 5 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx7ulpevk/readme.txt b/board/freescale/imx7ulpevk/readme.txt
index c7a2120f13..a2aa68b46f 100644
--- a/board/freescale/imx7ulpevk/readme.txt
+++ b/board/freescale/imx7ulpevk/readme.txt
@@ -18,6 +18,11 @@ Build all components:
 You will find in output/images/ the following files:
   - boot.vfat
   - imx7ulp-evkb.dtb
+  - m4_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
+  - m4_imx7ulp_m4_demo.img
+  - m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
+  - m4_imx7ulp_rpmsg_lite_str_echo_rtos.img
+  - m4_imx7ulp_wireless_uart_bridge.img
   - rootfs.ext2
   - rootfs.ext4
   - rootfs.tar
@@ -44,6 +49,17 @@ command as root:
 For details about the medium image layout, see the definition in
 board/freescale/common/imx/genimage.cfg.template.
 
+Flash QSPI with Cortex-M4 firmware
+==================================
+
+Cortex-M4 firmware can be flashed onto QSPI NOR memory.
+To do so, stop at u-boot prompt and run the following commands:
+
+  sf probe
+  sf erase 0 30000
+  fatload mmc 0 62000000 m4_imx7ulp_m4_demo.img
+  sf write 62000000 0 30000
+
 Boot the i.MX7ULP EVK board
 ===========================
 
diff --git a/configs/freescale_imx7ulpevk_defconfig b/configs/freescale_imx7ulpevk_defconfig
index 441ececa47..243a5c66f1 100644
--- a/configs/freescale_imx7ulpevk_defconfig
+++ b/configs/freescale_imx7ulpevk_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evkb"
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP=y
+BR2_PACKAGE_IMX_M4_FIRMWARE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 76694bc788..c4a22a2765 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -38,7 +38,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	bool "imx6ul/imx6ull"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
-	bool "imx7d/imx7ulp"
+	bool "imx7d"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
+	bool "imx7ulp"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
@@ -62,6 +65,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default "IMX7ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
 	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
@@ -80,12 +84,14 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_M4
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
diff --git a/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.hash b/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.hash
index fdc2c23c9f..fdbf1ab608 100644
--- a/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.hash
+++ b/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.hash
@@ -1,5 +1,6 @@
 # locally computed
 sha256  cc00d3b936d49b2794a2a99e10129437e70caba3fd26b8379b8c50dd22f73254  imx7d-sabresd-m4-freertos-1.0.1.bin
+sha256  e4efb9646b66df867f618bd8121e14afe17ebadea4a405a4df951d45d841e681  imx7ulp-m4-demo-2.6.0.bin
 sha256  4e41e270506870e0fd2d53e3d69afdcf6d613d099b0da5c516a512944c5c12c3  imx8mm-m4-demo-2.5.0.bin
 sha256  fd441e75395b0c6f90626c883ee8a93406b14e7d55adc7925116254394bb7ad8  imx8mq-m4-demo-2.3.0.bin
 sha256  4e83d60e27cd8ad67d4174ad3082a5f4a06b7df93571cfd2274615cbdf66eb6c  imx8qx-m4-demo-2.5.0.bin
diff --git a/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.mk b/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.mk
index 435592afc0..3726d5c436 100644
--- a/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.mk
+++ b/package/freescale-imx/imx-m4-firmware/imx-m4-firmware.mk
@@ -16,7 +16,18 @@ endef
 
 # Note: firmware names are copied to binaries directory with an "m4_" prefix, for easier post image scripting
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP),y)
+IMX_M4_FIRMWARE_VERSION = 2.6.0
+IMX_M4_FIRMWARE_SOURCE = imx7ulp-m4-demo-$(IMX_M4_FIRMWARE_VERSION).bin
+IMX_M4_FIRMWARE_INSTALL_IMAGES = YES
+define IMX_M4_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp $(@D)/imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img $(BINARIES_DIR)/m4_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
+	cp $(@D)/imx7ulp_m4_demo.img $(BINARIES_DIR)/m4_imx7ulp_m4_demo.img
+	cp $(@D)/imx7ulp_rpmsg_lite_pingpong_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
+	cp $(@D)/imx7ulp_rpmsg_lite_str_echo_rtos.img $(BINARIES_DIR)/m4_imx7ulp_rpmsg_lite_str_echo_rtos.img
+	cp $(@D)/imx7ulp_wireless_uart_bridge.img $(BINARIES_DIR)/m4_imx7ulp_wireless_uart_bridge.img
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
 IMX_M4_FIRMWARE_VERSION = 1.0.1
 IMX_M4_FIRMWARE_SOURCE = imx7d-sabresd-m4-freertos-$(IMX_M4_FIRMWARE_VERSION).bin
 IMX_M4_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.23.0
