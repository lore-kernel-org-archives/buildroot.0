From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon,  1 Feb 2016 10:36:59 +0100
Subject: [Buildroot] [PATCH 0/4] Update Freescale graphics packages
Message-ID: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is the series that updates the graphics for Freescale/NXP platforms.

It has been separated from the other updates since there is no dependency
between both series and I expect the new module package to be somehow
problematic.
http://lists.busybox.net/pipermail/buildroot/2016-January/150904.html

Indeed, Yocto has a do_configure_append which allows to modify the kernel
configuration and remove the built-in Vivante driver option.
https://github.com/Freescale/meta-fsl-arm/blob/master/classes/fsl-vivante-kernel-driver-handler.bbclass#L52

Details of the implementation are described in the patch.

This series has been tested on a SabreLite with the following configuration:
BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/f4c8395/linux-imx6-f4c8395.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="boundary"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabrelite"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_APITRACE=y
BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES=y
BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO=y
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y

Regards,
Gary

Gary Bisson (4):
  imx-gpu-viv: bump version to 5.0.11 p7.1
  xdriver_xf86-video-imx-viv: bump to version 5.0.11 p7.1
  kernel-module-imx-gpu-viv: add new package
  configs/nitrogen6*: bump kernel version

 configs/nitrogen6sx_defconfig                      |  2 +-
 configs/nitrogen6x_defconfig                       |  2 +-
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 11 +--------
 .../kernel-module-imx-gpu-viv/Config.in            | 12 ++++++++++
 .../kernel-module-imx-gpu-viv.mk                   | 28 ++++++++++++++++++++++
 .../xdriver_xf86-video-imx-viv.hash                |  2 +-
 .../xdriver_xf86-video-imx-viv.mk                  |  3 ++-
 9 files changed, 49 insertions(+), 16 deletions(-)
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk

-- 
2.7.0
