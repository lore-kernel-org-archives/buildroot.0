From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Thu, 24 Sep 2020 04:52:12 +0500
Subject: [Buildroot] [PATCH v2 0/2] Buildroot support for Chromebook Elm
Message-ID: <20200923235214.437005-1-bilalwasim676@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds supports for generating Buildroot kernel + rootfs
images for the Arm Elm Chromebook
(https://www.acer.com/ac/en/US/content/series/acerchromebookr13).

A board is added under board/chromebook which provides infrastructure
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

The following changes have been made specifically in v2,
  -> Added myself in the DEVELOPERS file for chromebook elm
  -> Created seperate patches instead of a single consolidated patch.
  -> Moved these patches to a seperate folder to keep top-level clean.
  -> Made sign.sh executable.
  -> Fixed other misc issues reported in v1.

Bilal Wasim (2):
  board/chromebook: Add support of Chromebook Elm
  DEVELOPERS: add myself as contact for chromebook elm

 DEVELOPERS                                    |   4 +
 board/chromebook/elm/kernel.args              |   1 +
 board/chromebook/elm/kernel.its               |  38 ++
 board/chromebook/elm/linux.config             | 453 ++++++++++++++++++
 ...ctor-Set-default-status-connected-fo.patch |  35 ++
 ...ps8640-Get-the-EDID-from-eDP-control.patch |  50 ++
 ...0-Return-an-error-for-incorrect-atta.patch |  35 ++
 ...0-Print-an-error-if-VDO-control-fail.patch |  58 +++
 ...e-ps8640-Rework-power-state-handling.patch | 162 +++++++
 board/chromebook/elm/readme.txt               |  56 +++
 board/chromebook/elm/sign.sh                  |  41 ++
 configs/chromebook_elm_defconfig              |  35 ++
 12 files changed, 968 insertions(+)
 create mode 100644 board/chromebook/elm/kernel.args
 create mode 100644 board/chromebook/elm/kernel.its
 create mode 100644 board/chromebook/elm/linux.config
 create mode 100644 board/chromebook/elm/patches/0001-drm-bridge_connector-Set-default-status-connected-fo.patch
 create mode 100644 board/chromebook/elm/patches/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch
 create mode 100644 board/chromebook/elm/patches/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch
 create mode 100644 board/chromebook/elm/patches/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch
 create mode 100644 board/chromebook/elm/patches/0005-drm-bridge-ps8640-Rework-power-state-handling.patch
 create mode 100644 board/chromebook/elm/readme.txt
 create mode 100755 board/chromebook/elm/sign.sh
 create mode 100644 configs/chromebook_elm_defconfig

-- 
2.25.1
