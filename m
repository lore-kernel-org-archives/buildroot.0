From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:28:09 +0100
Subject: [Buildroot] [PATCH v3 0/4] libfsl*: fix install path + update conf
	opts
Message-ID: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is an update of that (not so famous) series. While preparing/testing
the next Freescale packages update I realized the way symbolic links were
generated wasn't correct since it was pointing to host machine path.

Although I still wait for an answer on that symbolic link approach, I think
the two "add missing configure options" patches could be merged first.

This series is the answer to that request:
http://patchwork.ozlabs.org/patch/409684/

Changelog:
v1->v2:
- add staging for libfslparser although not required so far
  -> suggested by Jerome for consistency between libfsl packages
- use symlinks for both staging and install dir
  -> suggested by Jerome for consistency between both folders
v2->v3:
- update symbolic links generation to work on target
  -> although build was ok with v2, runtime wasn't working since
  libraries were pointing to host machine path...
- tested with latest Linaro 2015.11 toolchain
- rebased to master

Here is the defconfig that has been used to test those patches:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="boundary"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
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
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_APITRACE=y
BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES=y
BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO=y
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_IPERF3=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_RSYNC=y
BR2_PACKAGE_HOST_MKE2IMG=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Regards,
Gary

Gary Bisson (4):
  libfslcodec: add install hooks to fix libraries path
  libfslcodec: add missing configure options
  libfslparser: add install hooks to fix libraries path
  libfslparser: add missing configure options

 package/libfslcodec/libfslcodec.mk   | 23 +++++++++++++++++++++++
 package/libfslparser/libfslparser.mk | 19 +++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.7.0
