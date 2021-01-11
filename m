From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Jan 2021 17:01:10 +0800
Subject: [Buildroot] [PATCH 0/2] board/sifive: Update defconfig and genimage
 config files
Message-ID: <1610355672-3008-1-git-send-email-bmeng.cn@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At present an out-of-tree Linux kernel is being used for SiFive
HiFive Unleashed Buildroot configuration. As the upstream Linux
kernel evolves it is time to switch to the official Linux kernel
tree for this board.

We also switch to use the upstream U-Boot as the bootloader, that
provides the ZSBL => U-Boot SPL => OpenSBI dynamic + U-Boot proper
boot flow. As the upstream U-Boot supports booting from both SD
card and SPI flash, two genimage configuration files are provided
to generate corresponding image, as well as a boot cript.

A new config option BR2_TARGET_UBOOT_NEEDS_OPENSBI is introduced
to build RISC-V U-Boot that requires OpenSBI.


Bin Meng (2):
  boot/uboot: Introduce BR2_TARGET_UBOOT_NEEDS_OPENSBI
  board/sifive: Update hifive_unleashed_defconfig and genimage.cfg

 board/sifive/hifive-unleashed/boot.cmd             |  4 ++
 .../{genimage.cfg => genimage_sdcard.cfg}          | 14 +++--
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 25 ++++++++
 .../sifive/hifive-unleashed/linux.config.fragment  | 14 ++---
 board/sifive/hifive-unleashed/post-build.sh        |  2 +
 board/sifive/hifive-unleashed/readme.txt           | 68 +++++++++++++++++-----
 boot/uboot/Config.in                               | 10 ++++
 boot/uboot/uboot.mk                                |  5 ++
 configs/hifive_unleashed_defconfig                 | 32 +++++++---
 9 files changed, 138 insertions(+), 36 deletions(-)
 create mode 100644 board/sifive/hifive-unleashed/boot.cmd
 rename board/sifive/hifive-unleashed/{genimage.cfg => genimage_sdcard.cfg} (51%)
 create mode 100644 board/sifive/hifive-unleashed/genimage_spi-nor.cfg
 create mode 100755 board/sifive/hifive-unleashed/post-build.sh

-- 
2.7.4
