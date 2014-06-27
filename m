From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:43 -0700
Subject: [Buildroot] [PATCH v2 00/11] freescale: update userspace packages
In-Reply-To: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

Here is the rework which I hope covers all the previous remarks. This time I tried to be more talkative in every patch but here is a summary:
 1- first libfslvpuwrap gets independent as suggested
 2- simply bump FREESCALE_IMX_VERSION to 3.10.17-1.0.0
 3- update imx-lib: using idirafter just for uapi folder + remove unnecessary EULA
 4- make the platform choice as a common option: made BR2_PACKAGE_FREESCALE_IMX a menuconfig not to get BR2_PACKAGE_FREESCALE_IMX_PLATFORM set in every config.
 5- just adding the imx-vpu package from Freescale with no modification but using idirafter for uapi folder only
 6- bump libfslvpuwrap: now depends on imx-vpu
 7- bump libfslcodec: nothing special
 8- bump libfslparser: same
 9- gst-fsl-plugins: now depends on imx-vpu as well
 10/11- fix imx-vpu for the IOGetVirtMem in case of a 3G/1G split: I finally decided not to go with the MAP_FAILED as the return value is an int. I think using -1 is as clear and avoids useless cast. That function could have been written in a simpler way but I didn't want to change the code too much.

Same as last time, testing has been done on a Nitrogen6x using the kernel patch committed previously.

GPU test (gpu-viv-bin-mx6q):
# cd /usr/share/examples/viv_samples/vdk/
# ./tutorial7

VPU test (libfslvpuwrap, libfslcodec, gst-fsl-plugins, imx-vpu):
# VSALPHA=1 gst-launch-0.10 filesrc location=trailer_1080p_h264_mp3.avi ! avidemux ! vpudec ! mfw_isink

Thanks,
Gary

Gary Bisson (11):
  libfslvpuwrap: change version to be independent
  freescale-imx: bump to version 3.10.17-1.0.0
  freescale-imx: update imx-lib package
  freescale-imx: change platform choice to be common
  freescale-imx: add imx-vpu package
  libfslvpuwrap: bump to version 1.0.46
  libfslcodec: bump to version 3.0.11
  libfslparser: bump to version 3.0.11
  gst-fsl-plugins: bump to version 3.0.11
  imx-vpu: fix IOSystemInit failure
  imx-vpu: fix IOGetVirtMem return value checks

 package/freescale-imx/Config.in                    | 39 ++++++++++++++++
 package/freescale-imx/freescale-imx.mk             |  2 +-
 package/freescale-imx/imx-lib/Config.in            | 37 ---------------
 package/freescale-imx/imx-lib/imx-lib.mk           | 25 ++--------
 package/freescale-imx/imx-vpu/Config.in            | 16 +++++++
 ...-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch | 24 ++++++++++
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch | 51 +++++++++++++++++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk           | 53 ++++++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in        |  1 +
 ...gins-0002-Fix-bashism-in-configure-script.patch | 25 ++--------
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |  6 +--
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |  2 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   | 10 ++--
 package/libfslcodec/libfslcodec.mk                 |  2 +-
 package/libfslparser/libfslparser.mk               |  2 +-
 package/libfslvpuwrap/Config.in                    |  2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk             |  4 +-
 17 files changed, 209 insertions(+), 92 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu/Config.in
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk

-- 
2.0.0
