From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 30 Jan 2016 12:45:47 +0100
Subject: [Buildroot] [PATCH 00/10] Update most Freescale packages
Message-ID: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is yet another series to update most of Freescale packages. I've skipped
the graphics update for now since not all the manufacturers have a kernel
ready for it. Plus it can be easily updated separately.

Actually, NXP/Vivante now releases a kernel module which allows to have a
matching driver for the latest binaries. However this implies some defconfig
modification as follows:
https://github.com/Freescale/meta-fsl-arm/blob/master/classes/fsl-vivante-kernel-driver-handler.bbclass#L52

Not sure how to do that in Buildroot, maybe adding a linux post configure hook.

Anyway, all the other components (GStreamer plugins, codecs & firmwares) are
updated. The big change of this series is the update of the gst1-imx plugin.
Since the i.MX7 SoC is coming and does not include VPU nor GPU, the plugin
dependencies have been modified to it can be built without graphics nor video
codecs selected. Also, the plugin now relies on libimxvpuapi which is a
community-driven alternative of libfslvpuwrap.

The testing has been done on a SabreLite with the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/d7a412b/linux-imx6-d7a412b.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="boundary"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabrelite"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_AMIDI=y
BR2_PACKAGE_ALSA_UTILS_AMIXER=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_APLAYMIDI=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA=y
BR2_PACKAGE_GST_PLUGINS_GOOD=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2=y
BR2_PACKAGE_GST_FSL_PLUGINS=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLV=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST1_IMX=y
BR2_PACKAGE_GST1_IMX_V4L2_PLUGIN=y
BR2_PACKAGE_GST1_IMX_VPU_PLUGIN=y
BR2_PACKAGE_GST1_IMX_EGL_PLUGIN=y
BR2_PACKAGE_GST1_IMX_G2D_PLUGIN=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_APITRACE=y
BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES=y
BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_HOST_MKE2IMG=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Regards,
Gary

Gary Bisson (10):
  firmware-imx: bump to version 5.2
  imx-kobs: bump to version 5.1
  imx-lib: bump to version 5.1
  freescale-imx: remove FREESCALE_IMX_VERSION
  libfslcodec: bump to version 4.0.7
  libfslparser: bump to version 4.0.7
  libfslvpuwrap: bump to version 1.0.61
  libimxvpuapi: add new package
  gst1-plugins-bad: add install to staging directory
  gst1-imx: bump to version 0.12.0

 package/Config.in                                  |  1 +
 .../freescale-imx/firmware-imx/firmware-imx.hash   |  2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |  9 ++--
 package/freescale-imx/freescale-imx.mk             |  1 -
 package/freescale-imx/imx-kobs/imx-kobs.hash       |  2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |  4 +-
 package/gstreamer1/gst1-imx/Config.in              | 58 ++++++++++++++++++----
 package/gstreamer1/gst1-imx/gst1-imx.mk            | 15 +++++-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  1 +
 package/libfslcodec/libfslcodec.hash               |  2 +-
 package/libfslcodec/libfslcodec.mk                 |  2 +-
 package/libfslparser/libfslparser.hash             |  2 +-
 package/libfslparser/libfslparser.mk               |  2 +-
 package/libfslvpuwrap/libfslvpuwrap.hash           |  2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk             |  2 +-
 package/libimxvpuapi/Config.in                     | 10 ++++
 package/libimxvpuapi/libimxvpuapi.mk               | 35 +++++++++++++
 19 files changed, 127 insertions(+), 27 deletions(-)
 create mode 100644 package/libimxvpuapi/Config.in
 create mode 100644 package/libimxvpuapi/libimxvpuapi.mk

-- 
2.6.4
