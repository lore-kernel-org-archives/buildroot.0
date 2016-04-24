From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 23:15:22 +0200
Subject: [Buildroot] [PATCH v6 0/5] Support building barebox with an
	auxiliary config
Message-ID: <cover.1461531859.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-set adds support for building barebox with an auxiliary config.
It can be used to build the barebox x-loader or MLO (also called Secondary
Program Loader) in addition to the standard barebox build (Tertiary Program
Loader). This implements the design proposed in
http://elinux.org/Buildroot#Todo_list, with minor adjustments:
1. Have boot/barebox contain the common stuff.
2. Move the non-shared parts to boot/barebox/barebox and duplicate it in
   boot/barebox/barebox-aux.
3. There is only one version selection, but each package allows to
   define the configuration to be used.
4. Design is a little bit like package/gcc, where we have multiple gcc builds,
   but share a lot of common definitions between the packages.

To demonstrate that it works as advertized, the last patch adds a defconfig for
the beaglebone that makes use of the added functionality.

Revision history:
v6: Review rework based on feedback from Thomas Pettazoni:
    - Second config build renamed to auxiliary build.
    - Primary package build moved to boot/barebox/barebox to keep things symmetric.
    - Dropped already merged parts of series.
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

Pieter Smith (3):
  barebox: prepare for auxiliarry build
  barebox: support auxiliary config build
  beaglebone: adds barebox bootloader defconfig

 board/beaglebone/barebox/barebox.env/boot/sd      | 11 ++++
 board/beaglebone/barebox/barebox.env/config-board |  4 ++
 board/beaglebone/barebox/genimage.cfg             | 32 +++++++++++
 board/beaglebone/barebox/post-image.sh            | 17 ++++++
 boot/barebox/Config.in                            | 70 ++++-------------------
 boot/barebox/barebox-aux/Config.in                | 60 +++++++++++++++++++
 boot/barebox/barebox-aux/barebox-aux.hash         |  1 +
 boot/barebox/barebox-aux/barebox-aux.mk           |  8 +++
 boot/barebox/barebox.mk                           |  4 +-
 boot/barebox/barebox/Config.in                    | 65 +++++++++++++++++++++
 boot/barebox/barebox/barebox.hash                 |  1 +
 boot/barebox/barebox/barebox.mk                   |  8 +++
 configs/beaglebone_barebox_defconfig              | 43 ++++++++++++++
 13 files changed, 262 insertions(+), 62 deletions(-)
 create mode 100644 board/beaglebone/barebox/barebox.env/boot/sd
 create mode 100644 board/beaglebone/barebox/barebox.env/config-board
 create mode 100644 board/beaglebone/barebox/genimage.cfg
 create mode 100755 board/beaglebone/barebox/post-image.sh
 create mode 100644 boot/barebox/barebox-aux/Config.in
 create mode 120000 boot/barebox/barebox-aux/barebox-aux.hash
 create mode 100644 boot/barebox/barebox-aux/barebox-aux.mk
 create mode 100644 boot/barebox/barebox/Config.in
 create mode 120000 boot/barebox/barebox/barebox.hash
 create mode 100644 boot/barebox/barebox/barebox.mk
 create mode 100644 configs/beaglebone_barebox_defconfig

-- 
2.5.0
