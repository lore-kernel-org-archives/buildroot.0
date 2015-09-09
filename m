From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:49 +0200
Subject: [Buildroot] [PATCH 00/14] Update Freescale packages to
	3.14.28-1.0.0_ga
Message-ID: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is the usual update for all Freescale packages.

Once again I didn't bump most packages to the latest versions as they
rely on 3.14.38 kernel which is still in Beta version.

Also to be noted that the GPU libraries work for both kernel 3.14.28
and 3.10.53.

Regarding the VPU, Baruch took care of the update. I've applied his
patches for my testing.
http://patchwork.ozlabs.org/patch/513580/
http://patchwork.ozlabs.org/patch/513579/

Another note on the kobs package, I decided to remove the old package
and create a new one as I'm not sure of the history of that tool. My
understanding is that kobs-ng was more or less maintained by Timesys
where imx-kobs is now provided by Freescale. But I might be wrong on
that one, let me know if you'd prefer to rename the package instead.

As Thomas suggested, I've integrated my testing commands into the git
log messages directly so everybody can benefit from it. All the testing
was done on a Nitrogen6X with the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
# Last version of branch boundary-imx_3.14.28_1.0.0_ga
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_GOOD=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST_FSL_PLUGINS=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST1_IMX=y
BR2_PACKAGE_GST1_LIBAV=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_CFFI=y
BR2_PACKAGE_PYTHON_SETUPTOOLS=y
BR2_PACKAGE_LIBSHA1=y
BR2_PACKAGE_TIFF=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_RSYNC=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/5115a9e/u-boot-5115a9e.tar.gz"
BR2_TARGET_UBOOT_FORMAT_IMX=y
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENEXT2FS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Regards,
Gary

Gary Bisson (14):
  freescale-imx: bump to 3.14.28-1.0.0_ga release
  kobs-ng: remove obsolete package
  imx-kobs: add new package
  imx-gpu-viv: bump version to 5.0.11 p4.5
  xdriver_xf86-video-imx-viv: bump to version 5.0.11 p4.5
  libfslcodec: bump version to 4.0.3
  libfslparser: bump version to 4.0.3
  libfslvpuwrap: bump version to 1.0.58
  gst-fsl-plugins: bump version to 4.0.3
  gst1-imx: bump version to 0.11.1
  freescale_imx6*_defconfig: bump version to 3.14.28-1.0.0_ga
  qmx6_defconfig: bump version to 3.14.28_1.0.0
  nitrogen6x_defconfig: bump version to 3.14.28-1.0.0
  board/boundarydevices: update u-boot script for 3.14 kernels

 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 223 ++++++++-------------
 configs/freescale_imx6dlsabreauto_defconfig        |   8 +-
 configs/freescale_imx6dlsabresd_defconfig          |   8 +-
 configs/freescale_imx6qsabreauto_defconfig         |   8 +-
 configs/freescale_imx6qsabresd_defconfig           |   8 +-
 configs/freescale_imx6sololiteevk_defconfig        |   4 +-
 configs/nitrogen6x_defconfig                       |  11 +-
 configs/qmx6_defconfig                             |  12 +-
 package/Config.in                                  |   1 -
 package/freescale-imx/Config.in                    |   1 +
 .../freescale-imx/firmware-imx/firmware-imx.hash   |   2 +
 package/freescale-imx/firmware-imx/firmware-imx.mk |   2 +-
 package/freescale-imx/freescale-imx.mk             |   2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |   3 +
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   |   2 +-
 package/freescale-imx/imx-kobs/Config.in           |  10 +
 package/freescale-imx/imx-kobs/imx-kobs.hash       |   2 +
 package/freescale-imx/imx-kobs/imx-kobs.mk         |  12 ++
 package/freescale-imx/imx-lib/imx-lib.hash         |   2 +
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash |   2 +
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |   2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |   2 +-
 package/kobs-ng/0001-fix-mtd-defines.patch         |  73 -------
 package/kobs-ng/Config.in                          |   9 -
 package/kobs-ng/kobs-ng.hash                       |   2 -
 package/kobs-ng/kobs-ng.mk                         |  13 --
 package/libfslcodec/libfslcodec.hash               |   2 +
 package/libfslcodec/libfslcodec.mk                 |   4 +-
 package/libfslparser/libfslparser.hash             |   2 +
 package/libfslparser/libfslparser.mk               |   4 +-
 package/libfslvpuwrap/libfslvpuwrap.hash           |   2 +
 package/libfslvpuwrap/libfslvpuwrap.mk             |   4 +-
 .../xdriver_xf86-video-imx-viv.hash                |   2 +
 .../xdriver_xf86-video-imx-viv.mk                  |   2 +-
 34 files changed, 168 insertions(+), 278 deletions(-)
 create mode 100644 package/freescale-imx/firmware-imx/firmware-imx.hash
 create mode 100644 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
 create mode 100644 package/freescale-imx/imx-kobs/Config.in
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.hash
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.mk
 create mode 100644 package/freescale-imx/imx-lib/imx-lib.hash
 create mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
 delete mode 100644 package/kobs-ng/0001-fix-mtd-defines.patch
 delete mode 100644 package/kobs-ng/Config.in
 delete mode 100644 package/kobs-ng/kobs-ng.hash
 delete mode 100644 package/kobs-ng/kobs-ng.mk
 create mode 100644 package/libfslcodec/libfslcodec.hash
 create mode 100644 package/libfslparser/libfslparser.hash
 create mode 100644 package/libfslvpuwrap/libfslvpuwrap.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash

-- 
2.5.1
