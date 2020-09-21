From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Mon, 21 Sep 2020 23:12:43 +0500
Subject: [Buildroot] [PATCH 0/3] Buildroot support for Chromebook Elm
Message-ID: <20200921181246.88781-1-bilalwasim676@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds supports for generating Buildroot kernel + rootfs
images for the Arm Elm Chromebook
(https://www.acer.com/ac/en/US/content/series/acerchromebookr13).

A board is added under boards/chromebook which provides infrastructure
necessary to generate images. For example, the kernel.its file helps to
generate FIT image while the kernel.args file lists all the necessary
kernel command line params. Both of these files are used to generate a
signed kernel image by the sign.sh file. This folder also contains a
patch which must be applied to the linux kernel to get the HDMI working.
This patch is lying in "drm-misc-next" and should make it to the mainline
by 5.10, at which point it should be removed from buildroot and kernel
up-reved to 5.10 assuming nothing else fails. We also add a configuration
necessary to build the kernel.

In addition, a defconfig for Elm chromebook is added to make life easy for
the user. To generate kernel+rootfs, the user only needs to do
  make chromebook_elm_defconfig
  make menuconfig # If changes are required
  make -j ${nproc}

All of this is briefly mentioned in the readme file under the elm board file.

Bilal Wasim (3):
  configs: Add default configuration for Chromebook Elm.
  boards: chromebook: Move "mksd.sh" out of chromebook snow folder.
  boards: chromebook: Add support of Chromebook Elm

 board/chromebook/elm/kernel.args              |   1 +
 board/chromebook/elm/kernel.its               |  38 ++
 board/chromebook/elm/linux-5.9-elm-hdmi.patch | 404 ++++++++++++++++
 board/chromebook/elm/linux.config             | 453 ++++++++++++++++++
 board/chromebook/elm/readme.txt               |  56 +++
 board/chromebook/elm/sign.sh                  |  41 ++
 board/chromebook/{snow => }/mksd.sh           |   0
 configs/chromebook_elm_defconfig              |  35 ++
 configs/chromebook_snow_defconfig             |   2 +-
 9 files changed, 1029 insertions(+), 1 deletion(-)
 create mode 100644 board/chromebook/elm/kernel.args
 create mode 100644 board/chromebook/elm/kernel.its
 create mode 100644 board/chromebook/elm/linux-5.9-elm-hdmi.patch
 create mode 100644 board/chromebook/elm/linux.config
 create mode 100644 board/chromebook/elm/readme.txt
 create mode 100644 board/chromebook/elm/sign.sh
 rename board/chromebook/{snow => }/mksd.sh (100%)
 create mode 100644 configs/chromebook_elm_defconfig

-- 
2.25.1
