From: Xavier Roumegue <xroumegue@gmail.com>
Date: Mon,  9 Nov 2020 15:23:01 +0100
Subject: [Buildroot] [PATCH v3 0/8] Add imx8mm platform using only upstream
 components
In-Reply-To: <20201107135909.1265116-1-xroumegue@gmail.com>
References: <20201107135909.1265116-1-xroumegue@gmail.com>
Message-ID: <20201109142309.1135596-1-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set aims to add support for booting imx8m platforms with upstream
BSP components, avoiding the use of proprietary imx-mkimage tool.

Uboot is using its embedded mkimage tool and a per platform configuration file
to generate the boot medium thanks to additional imx specific makefile targets.

Delegating the bootable image generation to uboot requires proprietary SoC
firmwares either involved in the boot flow or eventually requiring
authentication to be copied in the uboot build directory.

As per Thomas proposal, this patch set mainly adds an option to copy a files
list, from binaries folder to uboot build directory as dependency of uboot
build step.

This was inspired from SolidRun patch below:
https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572
but this was adapted to prevent uboot patches and generalize the approach to
any platforms.

Changes v1 -> v2:
    - Initial patch set proposal was using a dedicated board script to
      generate the boot image as buildroot step, templatizing the configuration
      file used to define the boot image and reusing the firmwares from the
      binaries folder.
    - imx8mq platform does not boot with hdmi fw embedded in the boot image and
      recent arm trusted firmware, so imx8mq config file is removed since a
      change to uboot mkimage configuration file is required.
Changes v2 -> v3:
    - Use custom version for kernel, uboot (Suggested by Fabio Estevam)

Xavier Roumegue (8):
  package/freescale-imx/firmware-imx: Add option to install all ddr fw
    files
  boot/uboot: Add option to install fw files list to uboot build
    directory
  freescale-imx/firmware-imx: Copy of all DDR files if uboot needs fw.
  boot/uboot/imx8: Add new target needed for mainline u-boot
  board/freescale/common/imx: Add Support for uboot 'flash.bin' image
  board/freescale/common/imx8: Use post build generated uboot image if
    present
  board/freescale/common/imx8: Templatize uboot image name
  configs/imx8mmevk: new defconfig

 DEVELOPERS                                    |  3 ++
 .../common/imx/genimage.cfg.template_imx8     |  2 +-
 board/freescale/common/imx/post-image.sh      |  6 ++-
 board/freescale/imx8mmevk/readme.txt          | 29 +++++++++++++-
 boot/uboot/Config.in                          | 19 +++++++++
 boot/uboot/uboot.mk                           | 15 +++++++
 configs/imx8mmevk_defconfig                   | 40 +++++++++++++++++++
 package/freescale-imx/firmware-imx/Config.in  |  4 ++
 .../firmware-imx/firmware-imx.mk              | 12 ++++++
 9 files changed, 126 insertions(+), 4 deletions(-)
 create mode 100644 configs/imx8mmevk_defconfig

--
2.28.0
