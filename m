From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Mar 2015 18:51:54 -0400
Subject: [Buildroot] [PATCH 0/5] media image generation
Message-ID: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds a minimal support to generate final images for a medium
(such as SD card or flash), by providing paths to some genimage config files in
a board directory.

The rationale behind using genimage as the first medium image generation tool,
is that while its configuration syntax is simple, it requires a small overhead
to use, like temporary directories, host dependencies, and images path, that
Buildroot is all aware of.

The first patch explains the convenience of this host tool, and adds the
mechanism to wrap and call genimage against optional config file(s) specified
in the board configuration, as well as the appropriate documentation.

The subsequent patches adds genimage config files for the following platforms:
all Raspberry Pi models, BeagleBone Black, and the Wandboard.

They give good examples to show how Buildroot can be used to create a fully
functional SD card image with a bootloader, some firmware files and a
persistent rootfs, without the need to mount any partition.

Finally, this support simplifies the user experience by providing ready-to-use
boot medium images, and lightening board documentation with self documented
configuration files.

Note: if we happen to include other media image generation tools, the
BR2_TARGET_MEDIA_GENIMAGE_CFG and future options can then simply be moved to a
"Media image generation --->" top-level menu.

Vivien Didelot (5):
  Makefile: add media image generation
  board/raspberrypi: install Device Tree
  board/raspberrypi: add a genimage config
  board/beaglebone: add a genimage config
  board/wandboard: add a genimage config

 Makefile                              |  9 +++++++--
 board/beaglebone/genimage.cfg         | 30 +++++++++++++++++++++++++++++
 board/beaglebone/readme.txt           |  4 ++++
 board/raspberrypi/genimage.cfg        | 32 +++++++++++++++++++++++++++++++
 board/raspberrypi/post-image.sh       |  7 +++++++
 board/raspberrypi/readme.txt          |  9 +++++++--
 board/wandboard/genimage.cfg          | 22 +++++++++++++++++++++
 board/wandboard/readme.txt            |  3 ++-
 configs/beaglebone_defconfig          |  3 +++
 configs/raspberrypi2_defconfig        |  6 ++++++
 configs/raspberrypi_defconfig         |  5 +++++
 configs/raspberrypi_dt_defconfig      |  6 ++++++
 configs/wandboard_defconfig           |  1 +
 docs/manual/customize-media-image.txt | 36 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt             |  4 ++++
 support/media/genimage                | 23 ++++++++++++++++++++++
 system/Config.in                      | 26 +++++++++++++++++++++++++
 17 files changed, 221 insertions(+), 5 deletions(-)
 create mode 100644 board/beaglebone/genimage.cfg
 create mode 100644 board/raspberrypi/genimage.cfg
 create mode 100755 board/raspberrypi/post-image.sh
 create mode 100644 board/wandboard/genimage.cfg
 create mode 100644 docs/manual/customize-media-image.txt
 create mode 100755 support/media/genimage

-- 
2.3.3
