From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 21 Jun 2017 10:12:00 +0200
Subject: [Buildroot] [PATCH 2/3] board/atmel: provide u-boot env for
	at91sam9x5ek_mmc
In-Reply-To: <20170621081201.7717-1-ludovic.desroches@microchip.com>
References: <20170621081201.7717-1-ludovic.desroches@microchip.com>
Message-ID: <20170621081201.7717-2-ludovic.desroches@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default bootargs have changed in U-Boot for this board. Build U-Boot
environment and add it to the SD card image to update bootargs.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 board/atmel/at91sam9x5ek_mmc/genimage.cfg  | 4 ++++
 board/atmel/at91sam9x5ek_mmc/uboot-env.txt | 7 +++++++
 configs/at91sam9x5ek_mmc_defconfig         | 3 +++
 configs/at91sam9x5ek_mmc_dev_defconfig     | 3 +++
 4 files changed, 17 insertions(+)
 create mode 100644 board/atmel/at91sam9x5ek_mmc/uboot-env.txt

diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
index b2be647d8b..7a552665f3 100644
--- a/board/atmel/at91sam9x5ek_mmc/genimage.cfg
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -12,6 +12,10 @@ image boot.vfat {
 			"boot.bin",
 			"u-boot.bin"
 		}
+
+		file uboot.env {
+			image = "uboot-env.bin"
+		}
 	}
 	size = 16M
 }
diff --git a/board/atmel/at91sam9x5ek_mmc/uboot-env.txt b/board/atmel/at91sam9x5ek_mmc/uboot-env.txt
new file mode 100644
index 0000000000..568e4bc985
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_mmc/uboot-env.txt
@@ -0,0 +1,7 @@
+bootargs=console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait video=Unknown-1:800x480-16
+bootcmd=fatload mmc 0:1 0x21000000 at91sam9g35ek.dtb; fatload mmc 0:1 0x22000000 zImage; bootz 0x22000000 - 0x21000000
+bootdelay=1
+ethact=gmac0
+stderr=serial
+stdin=serial
+stdout=serial
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index c1c4d67050..ed44943811 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -33,6 +33,9 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
 
 # Host packages
 # Needed to generate the SD card image
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 09482d2295..cd266d2e90 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -95,6 +95,9 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
 
 # Host packages
 # Needed to generate the SD card image
-- 
2.12.2
