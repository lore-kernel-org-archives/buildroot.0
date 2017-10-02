From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  2 Oct 2017 13:17:42 -0300
Subject: [Buildroot] [PATCH] configs/imx6slevk: Add new defconfig
Message-ID: <1506961062-4468-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for imx6slevk_defconfig that allows booting a mainline
kernel and mainline U-Boot.

The two U-Boot fixes have been already submitted to the U-Boot list.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .gitlab-ci.yml                                     |   1 +
 DEVELOPERS                                         |   1 +
 .../patches/uboot/0001-mx6slevksplbootfix.patch    | 170 +++++++++++++++++++++
 .../imx6slevk/patches/uboot/0002-uuid.patch        |  72 +++++++++
 board/freescale/imx6slevk/readme.txt               |  14 ++
 configs/imx6slevk_defconfig                        |  29 ++++
 6 files changed, 287 insertions(+)
 create mode 100644 board/freescale/imx6slevk/patches/uboot/0001-mx6slevksplbootfix.patch
 create mode 100644 board/freescale/imx6slevk/patches/uboot/0002-uuid.patch
 create mode 100644 board/freescale/imx6slevk/readme.txt
 create mode 100644 configs/imx6slevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0e0773f..5991b03 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -122,6 +122,7 @@ grinn_liteboard_defconfig: *defconfig
 imx23evk_defconfig: *defconfig
 imx6-sabresd_defconfig: *defconfig
 imx6-sabresd_qt5_defconfig: *defconfig
+imx6slevk_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index cedf5a6..9d4b95b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -554,6 +554,7 @@ N:	Fabio Estevam <festevam@gmail.com>
 F:	board/warp7/
 F:	configs/freescale_imx*
 F:	configs/imx6-sabresd*
+F:	configs/imx6slevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
diff --git a/board/freescale/imx6slevk/patches/uboot/0001-mx6slevksplbootfix.patch b/board/freescale/imx6slevk/patches/uboot/0001-mx6slevksplbootfix.patch
new file mode 100644
index 0000000..d1a75ab
--- /dev/null
+++ b/board/freescale/imx6slevk/patches/uboot/0001-mx6slevksplbootfix.patch
@@ -0,0 +1,170 @@
+From f7dcd824f170dee29a7e099ea89f77d7fc8ac44e Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Sun, 1 Oct 2017 16:14:30 -0300
+Subject: [PATCH] mx6slevk: Fix MMC breakage for the SPL target
+
+Commit 001cdbbb32ef1f6 ("imx: mx6slevk: enable more DM drivers") breaks
+MMC support in U-Boot proper on the mx6slevk_spl_defconfig target:
+
+U-Boot SPL 2017.09-00396-g6ca43a5 (Oct 01 2017 - 16:20:18)                      
+Trying to boot from MMC1                                                        
+
+U-Boot 2017.09-00396-g6ca43a5 (Oct 01 2017 - 16:20:18 -0300)                    
+                                                                                
+CPU:   Freescale i.MX6SL rev1.0 792 MHz (running at 396 MHz)                    
+CPU:   Commercial temperature grade (0C to 95C) at 33C                          
+Reset cause: POR                                                                
+Board: MX6SLEVK                                                                 
+I2C:   ready                                                                    
+DRAM:  1 GiB                                                                    
+MMC:   FSL_SDHC: 0                                                              
+MMC Device 1 not found                                                          
+*** Warning - No MMC card found, using default environment 
+
+Fix this by re-introducing the U-Boot proper mmc init code inside
+board_mmc_init().
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ board/freescale/mx6slevk/mx6slevk.c | 81 ++++++++++++++++++++++++++++---------
+ 1 file changed, 63 insertions(+), 18 deletions(-)
+
+diff --git a/board/freescale/mx6slevk/mx6slevk.c b/board/freescale/mx6slevk/mx6slevk.c
+index 8afd5da..e9a9bbf 100644
+--- a/board/freescale/mx6slevk/mx6slevk.c
++++ b/board/freescale/mx6slevk/mx6slevk.c
+@@ -66,7 +66,6 @@ static iomux_v3_cfg_t const uart1_pads[] = {
+ 	MX6_PAD_UART1_RXD__UART1_RXD | MUX_PAD_CTRL(UART_PAD_CTRL),
+ };
+ 
+-#ifdef CONFIG_SPL_BUILD
+ static iomux_v3_cfg_t const usdhc1_pads[] = {
+ 	/* 8 bit SD */
+ 	MX6_PAD_SD1_CLK__USDHC1_CLK | MUX_PAD_CTRL(USDHC_PAD_CTRL),
+@@ -107,7 +106,6 @@ static iomux_v3_cfg_t const usdhc3_pads[] = {
+ 	/*CD pin*/
+ 	MX6_PAD_REF_CLK_32K__GPIO_3_22 | MUX_PAD_CTRL(NO_PAD_CTRL),
+ };
+-#endif
+ 
+ static iomux_v3_cfg_t const fec_pads[] = {
+ 	MX6_PAD_FEC_MDC__FEC_MDC | MUX_PAD_CTRL(ENET_PAD_CTRL),
+@@ -157,11 +155,6 @@ static void setup_iomux_fec(void)
+ 	udelay(15000);
+ }
+ 
+-int board_mmc_get_env_dev(int devno)
+-{
+-	return devno;
+-}
+-
+ #ifdef CONFIG_DM_PMIC_PFUZE100
+ int power_init_board(void)
+ {
+@@ -294,17 +287,6 @@ int board_init(void)
+ 	return 0;
+ }
+ 
+-int checkboard(void)
+-{
+-	puts("Board: MX6SLEVK\n");
+-
+-	return 0;
+-}
+-
+-#ifdef CONFIG_SPL_BUILD
+-#include <spl.h>
+-#include <libfdt.h>
+-
+ #define USDHC1_CD_GPIO	IMX_GPIO_NR(4, 7)
+ #define USDHC2_CD_GPIO	IMX_GPIO_NR(5, 0)
+ #define USDHC3_CD_GPIO	IMX_GPIO_NR(3, 22)
+@@ -315,6 +297,11 @@ static struct fsl_esdhc_cfg usdhc_cfg[3] = {
+ 	{USDHC3_BASE_ADDR, 0, 4},
+ };
+ 
++int board_mmc_get_env_dev(int devno)
++{
++	return devno;
++}
++
+ int board_mmc_getcd(struct mmc *mmc)
+ {
+ 	struct fsl_esdhc_cfg *cfg = (struct fsl_esdhc_cfg *)mmc->priv;
+@@ -337,6 +324,52 @@ int board_mmc_getcd(struct mmc *mmc)
+ 
+ int board_mmc_init(bd_t *bis)
+ {
++#ifndef CONFIG_SPL_BUILD
++	int i, ret;
++
++	/*
++	 * According to the board_mmc_init() the following map is done:
++	 * (U-Boot device node)    (Physical Port)
++	 * mmc0                    USDHC1
++	 * mmc1                    USDHC2
++	 * mmc2                    USDHC3
++	 */
++	for (i = 0; i < CONFIG_SYS_FSL_USDHC_NUM; i++) {
++		switch (i) {
++		case 0:
++			imx_iomux_v3_setup_multiple_pads(
++				usdhc1_pads, ARRAY_SIZE(usdhc1_pads));
++			gpio_direction_input(USDHC1_CD_GPIO);
++			usdhc_cfg[0].sdhc_clk = mxc_get_clock(MXC_ESDHC_CLK);
++			break;
++		case 1:
++			imx_iomux_v3_setup_multiple_pads(
++				usdhc2_pads, ARRAY_SIZE(usdhc2_pads));
++			gpio_direction_input(USDHC2_CD_GPIO);
++			usdhc_cfg[1].sdhc_clk = mxc_get_clock(MXC_ESDHC2_CLK);
++			break;
++		case 2:
++			imx_iomux_v3_setup_multiple_pads(
++				usdhc3_pads, ARRAY_SIZE(usdhc3_pads));
++			gpio_direction_input(USDHC3_CD_GPIO);
++			usdhc_cfg[2].sdhc_clk = mxc_get_clock(MXC_ESDHC3_CLK);
++			break;
++		default:
++			printf("Warning: you configured more USDHC controllers"
++				"(%d) than supported by the board\n", i + 1);
++			return -EINVAL;
++		}
++
++		ret = fsl_esdhc_initialize(bis, &usdhc_cfg[i]);
++		if (ret) {
++			printf("Warning: failed to initialize "
++				"mmc dev %d\n", i);
++			return ret;
++		}
++	}
++
++	return 0;
++#else
+ 	struct src *src_regs = (struct src *)SRC_BASE_ADDR;
+ 	u32 val;
+ 	u32 port;
+@@ -373,8 +406,20 @@ int board_mmc_init(bd_t *bis)
+ 
+ 	gd->arch.sdhc_clk = usdhc_cfg[0].sdhc_clk;
+ 	return fsl_esdhc_initialize(bis, &usdhc_cfg[0]);
++#endif
+ }
+ 
++int checkboard(void)
++{
++	puts("Board: MX6SLEVK\n");
++
++	return 0;
++}
++
++#ifdef CONFIG_SPL_BUILD
++#include <spl.h>
++#include <libfdt.h>
++
+ const struct mx6sl_iomux_ddr_regs mx6_ddr_ioregs = {
+ 	.dram_sdqs0 = 0x00003030,
+ 	.dram_sdqs1 = 0x00003030,
+-- 
+2.7.4
+
diff --git a/board/freescale/imx6slevk/patches/uboot/0002-uuid.patch b/board/freescale/imx6slevk/patches/uboot/0002-uuid.patch
new file mode 100644
index 0000000..be1f468
--- /dev/null
+++ b/board/freescale/imx6slevk/patches/uboot/0002-uuid.patch
@@ -0,0 +1,72 @@
+From e974d1bca5d2c96437c2a8b4a9a3d80d5a1dd71d Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Mon, 2 Oct 2017 10:04:35 -0300
+Subject: [PATCH] mx6slevk: Use PARTUUID to specify the rootfs location
+
+mx6slevk can run different kernel versions, such as NXP 4.1 or mainline.
+    
+Currently the rootfs location is passed via mmcblk number and the
+problem with this approach is that the mmcblk number for the eMMC
+changes depending on the kernel version.
+    
+In order to avoid such issue, use the UUID method to specify the
+rootfs location.
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ configs/mx6slevk_defconfig     | 1 +
+ configs/mx6slevk_spl_defconfig | 1 +
+ include/configs/mx6slevk.h     | 5 +++--
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configs/mx6slevk_defconfig b/configs/mx6slevk_defconfig
+index 1c28942..641fa85 100644
+--- a/configs/mx6slevk_defconfig
++++ b/configs/mx6slevk_defconfig
+@@ -13,6 +13,7 @@ CONFIG_CMD_BOOTZ=y
+ CONFIG_CMD_GPIO=y
+ CONFIG_CMD_I2C=y
+ CONFIG_CMD_MMC=y
++CONFIG_CMD_PART=y
+ CONFIG_CMD_SF=y
+ CONFIG_CMD_USB=y
+ # CONFIG_CMD_SETEXPR is not set
+diff --git a/configs/mx6slevk_spl_defconfig b/configs/mx6slevk_spl_defconfig
+index 4d4f273..8fadbcc 100644
+--- a/configs/mx6slevk_spl_defconfig
++++ b/configs/mx6slevk_spl_defconfig
+@@ -21,6 +21,7 @@ CONFIG_CMD_BOOTZ=y
+ CONFIG_CMD_GPIO=y
+ CONFIG_CMD_I2C=y
+ CONFIG_CMD_MMC=y
++CONFIG_CMD_PART=y
+ CONFIG_CMD_SF=y
+ CONFIG_CMD_USB=y
+ CONFIG_CMD_DHCP=y
+diff --git a/include/configs/mx6slevk.h b/include/configs/mx6slevk.h
+index 25c83e8..9ddb143 100644
+--- a/include/configs/mx6slevk.h
++++ b/include/configs/mx6slevk.h
+@@ -53,9 +53,9 @@
+ 	"ip_dyn=yes\0" \
+ 	"mmcdev=1\0" \
+ 	"mmcpart=1\0" \
+-	"mmcroot=/dev/mmcblk0p2 rootwait rw\0" \
++	"finduuid=part uuid mmc 1:2 uuid\0" \
+ 	"mmcargs=setenv bootargs console=${console},${baudrate} " \
+-		"root=${mmcroot}\0" \
++		"root=PARTUUID=${uuid} rootwait rw\0" \
+ 	"loadbootscript=" \
+ 		"fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};\0" \
+ 	"bootscript=echo Running bootscript from mmc ...; " \
+@@ -63,6 +63,7 @@
+ 	"loadimage=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}\0" \
+ 	"loadfdt=fatload mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}\0" \
+ 	"mmcboot=echo Booting from mmc ...; " \
++		"run finduuid; " \
+ 		"run mmcargs; " \
+ 		"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
+ 			"if run loadfdt; then " \
+-- 
+2.7.4
+
diff --git a/board/freescale/imx6slevk/readme.txt b/board/freescale/imx6slevk/readme.txt
new file mode 100644
index 0000000..424380e
--- /dev/null
+++ b/board/freescale/imx6slevk/readme.txt
@@ -0,0 +1,14 @@
+NXP i.MX6SL EVK board
+---------------------
+
+To build a minimal support for this board:
+
+$ make imx6slevk_defconfig
+$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be flashed into the SD card:
+
+$ sudo dd if=output/images/sdcard.img of=/dev/<sd-card-device>; sync
+
+Then insert the SD card into the SD2 slot and boot the board.
diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
new file mode 100644
index 0000000..295023e
--- /dev/null
+++ b/configs/imx6slevk_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6slevk/patches"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6slevk_spl"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.4"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
