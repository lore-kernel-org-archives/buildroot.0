From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  5 May 2018 20:12:23 -0300
Subject: [Buildroot] [PATCH 2/3] configs/freescale_imx31_3stack: Remove
 target
In-Reply-To: <1525561944-1511-1-git-send-email-festevam@gmail.com>
References: <1525561944-1511-1-git-send-email-festevam@gmail.com>
Message-ID: <1525561944-1511-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently this target fails to build:

arch/arm/mach-imx/built-in.o: In function `init_mmdc_lpddr2_settings':
platform-spi_imx.c:(.text+0x8f18): undefined reference to `imx6sll_lpddr2_freq_change'
arch/arm/mach-imx/built-in.o: In function `imx6ul_cpuidle_init':
platform-spi_imx.c:(.init.text+0x195c): undefined reference to `mx6ull_lpm_wfi_end'
platform-spi_imx.c:(.init.text+0x1960): undefined reference to `mx6ull_lpm_wfi_start'
platform-spi_imx.c:(.init.text+0x1964): undefined reference to `imx6ull_low_power_idle'
arch/arm/mach-imx/built-in.o: In function `imx6sl_init_late':
platform-spi_imx.c:(.init.text+0x56f0): undefined reference to `imx6sll_cpuidle_init'
Makefile:969: recipe for target 'vmlinux' failed

NXP 4.9 kernel does not properly support mx31, so better remove this target.

mx31_3stack board is currently supported in U-Boot and kernel mainline,
so if someone is interested on this board, then a target can be introduced
later which uses these mainline components.

Currently I do not have access to this board, so remove it its defconfig
for now.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/66561688
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx31_3stack/linux.fragment |  1 -
 board/freescale/imx31_3stack/readme.txt     | 92 -----------------------------
 configs/freescale_imx31_3stack_defconfig    | 20 -------
 3 files changed, 113 deletions(-)
 delete mode 100644 board/freescale/imx31_3stack/linux.fragment
 delete mode 100644 board/freescale/imx31_3stack/readme.txt
 delete mode 100644 configs/freescale_imx31_3stack_defconfig

diff --git a/board/freescale/imx31_3stack/linux.fragment b/board/freescale/imx31_3stack/linux.fragment
deleted file mode 100644
index beb6b46..0000000
--- a/board/freescale/imx31_3stack/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_FB_MXS is not set
diff --git a/board/freescale/imx31_3stack/readme.txt b/board/freescale/imx31_3stack/readme.txt
deleted file mode 100644
index 4f8f393..0000000
--- a/board/freescale/imx31_3stack/readme.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-**************************************
-Freescale i.MX31 PDK development board
-**************************************
-
-This file documents the Buildroot support for the Freescale i.MX31 PDK in "3
-stack" configuration.
-
-The i.MX31 Product Development Kit (or PDK) is Freescale development board [1]
-based on the i.MX31 application processor [2].
-
-For more details on the i.MX31 PDK board, refer to the User's Guide [3].
-
-Build
-=====
-
-First, configure Buildroot for your i.MX31 PDK board:
-
-  make freescale_imx31_3stack_defconfig
-
-Build all components:
-
-  make
-
-You will find in ./output/images/ the following files:
-  - rootfs.cpio
-  - rootfs.cpio.gz
-  - rootfs.tar
-  - zImage
-
-The generated zImage does include the rootfs.
-
-Boot the PDK board
-==================
-
-The i.MX31 PDK contains a RedBoot bootloader in flash, which can be used to
-boot the newly created Buildroot images from the network.
-
-This necessitates to setup a TFTP server first. This setup is explained for
-example in Freescale i.MX31 PDK 1.5 Linux User's Guide [4].
-
-Here is a sample RedBoot configuration, for proper network boot of Buildroot on
-the i.MX31 PDK:
-
-    RedBoot> fconfig -l
-    Run script at boot: true
-    Boot script:
-    .. load -r -b 0x100000 zImage
-    .. exec -c "console=ttymxc0,115200"
-
-    Boot script timeout (1000ms resolution): 2
-    Use BOOTP for network configuration: false
-    Gateway IP address: <your gateway IP address>
-    Local IP address: <your PDK IP address>
-    Local IP address mask: 255.255.255.0
-    Default server IP address: <your TFTP server IP address>
-    Board specifics: 0
-    Console baud rate: 115200
-    Set eth0 network hardware address [MAC]: false
-    GDB connection port: 9000
-    Force console for special debug messages: false
-    Network debug at boot time: false
-
-Adapt those settings to your network configuration by replacing the appropriate
-network addresses where necessary.
-
-You might want to verify that your i.MX31 PDK switches settings are the correct
-ones for UART, power, boot mode, etc. Here is a reference switches
-configuration:
-
-    SW4
-    1   2   3   4   5   6   7  8
-    ON off off off off off off ON
-
-    SW5 SW6 SW7 SW8 SW9 SW10
-     0   1   0   0   0    0
-
-See the i.MX31 PDK Linux Quick Start Guide [5] for more details on the switches
-settings.
-
-Connect a serial terminal set to 115200n8 and power on the i.MX31 PDK board.
-Buildroot will present a login prompt on the serial port.
-
-Enjoy!
-
-References
-==========
-
-[1] http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=i.MX31PDK
-[2] http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=i.MX31
-[3] http://cache.freescale.com/files/32bit/doc/user_guide/pdk15_imx31_Hardware_UG.pdf
-[4] http://cache.freescale.com/files/32bit/doc/support_info/IMX31_PDK15_LINUXDOCS_BUNDLE.zip, pdk15_imx31__Linux_UG.pdf
-[5] http://www.freescale.com/files/32bit/doc/quick_ref_guide/PDK14LINUXQUICKSTART.pdf
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
deleted file mode 100644
index 025f93f..0000000
--- a/configs/freescale_imx31_3stack_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_arm1136jf_s=y
-BR2_ARM_EABIHF=y
-
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-
-# system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx31_3stack/linux.fragment"
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.7.4
