From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 11:18:42 +0200
Subject: [Buildroot] [PATCH v5 0/5] Support building a 2nd Barebox config
Message-ID: <cover.1461489060.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-set adds support for building barebox with up to 2 configurations.
It can be used to build the barebox x-loader or MLO (also called Secondary
Program Loader) in addition to the standard barebox build (Tertiary Program
Loader). This implements the design proposed in
http://elinux.org/Buildroot#Todo_list, with minor adjustments:
1. Have boot/barebox/barebox.mk contain the common stuff.
2. Add a second package boot/barebox/barebox-2.
3. There is only one version selection, but each package allows to
   define the configuration to be used.
4. Design is a little bit like package/gcc, where we have multiple gcc builds,
   but share a lot of common definitions between the packages.

To demonstrate that it works as advertized, the last patch adds a defconfig for
the beaglebone that makes use of the added functionality.

Revision history:
v5: Review rework based on feedback from Arnout Vandecappelle, Yegor Yefremov
    and Thomas Petazzoni:
    - Dropped support to rename output/images (same can be achieved with
      genimage)
    - Simplified barebox INSTALL_IMAGE_CMDS
    - Simplified KConfig option naming
    - Appends test defconfig to last commit message
    Improvements to the BBB barebox test config:
    - Latest kernel and headers
    - Tunes barebox.env to boot from eMMC/SD
    - Use genimage to generate a full sdcard.img
v4: Introduces barebox-package function to reduce duplication and maintenance
    Simplifies built image selection
    Ease review with smaller patches
    Review re-work: Special thanks to Arnout Vandecappelle and Yegor Yefremov
v3: Updated for master at 544e2c5871f223facd1ab3c2853cd07ad70dd9d1
v2: Dropped x-loader build specialization in favor of 2 generic barebox builds
v1: Initial posting

Pieter Smith (5):
  barebox: support multi-image-build image selection
  barebox: introduce barebox-package function
  barebox: extract package name argument
  barebox: support 2nd config build
  beaglebone: adds barebox bootloader defconfig

 board/beaglebone/barebox/barebox.env/boot/sd      |  11 ++
 board/beaglebone/barebox/barebox.env/config-board |   4 +
 board/beaglebone/barebox/genimage.cfg             |  32 ++++
 board/beaglebone/barebox/post-image.sh            |  17 +++
 boot/barebox/Config.in                            |  12 ++
 boot/barebox/barebox-2/Config.in                  |  72 +++++++++
 boot/barebox/barebox-2/barebox-2.hash             |   1 +
 boot/barebox/barebox-2/barebox-2.mk               |   9 ++
 boot/barebox/barebox.mk                           | 169 +++++++++++++---------
 configs/beaglebone_barebox_defconfig              |  43 ++++++
 10 files changed, 300 insertions(+), 70 deletions(-)
 create mode 100644 board/beaglebone/barebox/barebox.env/boot/sd
 create mode 100644 board/beaglebone/barebox/barebox.env/config-board
 create mode 100644 board/beaglebone/barebox/genimage.cfg
 create mode 100755 board/beaglebone/barebox/post-image.sh
 create mode 100644 boot/barebox/barebox-2/Config.in
 create mode 120000 boot/barebox/barebox-2/barebox-2.hash
 create mode 100644 boot/barebox/barebox-2/barebox-2.mk
 create mode 100644 configs/beaglebone_barebox_defconfig

-- 
2.5.0
