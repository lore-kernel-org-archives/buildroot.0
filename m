From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:50:55 +0100
Subject: [Buildroot] [RFC] Introduce the 'genimages' infrastructure
Message-ID: <cover.1385157864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

During the last developpers' day in Edimburgh, we discussed my Buildroot.config
project, and especially the 'genimages' infrastructure I've done in there.

I've came up with 'genimages' after I came to the conclusion that the current
images generation in Buildroot is limited to generating a single filesystem
images, but most device do require a more complex setup.

For example. the Rapsberry Pi needs an SDcard (mmcblk0) formatted as thus:

    mmcblk0
    |- mmcblk0p1  (FAT32)
    |  |- bootcode.bin
    |  |- fixup.dat
    |  |- start.elf
    |  |- config.txt
    |  |- cmdline.txt
    |  `- kernel.bin
    `- mmcblk0p2  (whatever, eg. ext3, btrfs...)
       `- all of /

With the current output of Buildroot, that requires a lot of fiddling with
the partitioning of the SDcard (may require root), formatting the filesystems
(may require root), extract rootfs.tar (may require root to mount, requires
root to extract), copy select files from output/images/rpi-firmware/ to the
first partition (may require root to mount).

Each user would either have to manually perform those actions (error prone),
or write a small shell script to automate this (not trivial).

Also, some other devices require special, but different formatting as well.

Rather than have every users all suffer in silence (and sometimes not in
silence) by re-inventing such a script over and over, for each device that
need such a setup, I came up with the 'genimages' idea: a description of
the layout of the storage devices, partitioning schemes, and partitions
content.

So, here is the 'genimages' from Buildroot.config, that I updated (in fact,
trimmed) to include in Buildroot itself.

The basis is that we bundle some trivial partition description for the
boards we have in board/ and reference it in the corresponding defconfigs.


How does 'genimages' work?

First, genimages extract the generated rootfs.tar. Hence, rootfs.tar is
always generated if a partition description is configured.

Second, genimages generates one filesystem image for each partition listed
in the description. Once the filesystem is generated, its mountpoint is
emptied, so it does not appear in the upper filesystem.

Third, genimages aggregates all the partition of a device into a single
image file

Finall, those device images can be flashed directly on the raw device of
the storage, without manually fiddling with  fdisk, mount, tar and so
on...


Regards,
Yann E. MORIN.


The following changes since commit a98442f2b514d296c8639d9fa66e6a64b54dd6b4:

  legal info: update documentation with split target/host output (2013-11-17 09:15:17 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/rpi-bootloader-in-fs

for you to fetch changes up to 932a7029e1685747fff04ec40650ffc69b76f53e:

  board/raspberrypi: provide partition description for the new genimanges (2013-11-22 22:58:31 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/rpi-firmware: only install one firmware file
      package/rpi-firmware: add option to install firmware files in target/boot/
      package/rpi-firmware: move to bootloaders menu
      fs/custom: generate complete, partition-based device images
      board/raspberrypi: provide partition description for the new genimanges

 board/raspberrypi/partitions               |  31 ++++
 boot/Config.in                             |   1 +
 boot/rpi-firmware/Config.in                |  57 +++++++
 {package => boot}/rpi-firmware/cmdline.txt |   0
 {package => boot}/rpi-firmware/config.txt  |   0
 boot/rpi-firmware/rpi-firmware.mk          |  26 +++
 configs/raspberrypi_defconfig              |  11 +-
 docs/manual/appendix.txt                   |   1 +
 docs/manual/customize-filesystems.txt      |  35 ++++
 docs/manual/customize.txt                  |   2 +
 docs/manual/partition-layout.txt           | 258 +++++++++++++++++++++++++++++
 fs/Config.in                               |   1 +
 fs/custom/Config.in                        |  18 ++
 fs/custom/boot/mbr                         |  57 +++++++
 fs/custom/boot/pre-post                    |   8 +
 fs/custom/custom.mk                        |  14 ++
 fs/custom/fs/ext                           |  22 +++
 fs/custom/fs/pre-post                      |  40 +++++
 fs/custom/fs/vfat                          |  17 ++
 fs/custom/functions                        |  47 ++++++
 fs/custom/genimages                        | 214 ++++++++++++++++++++++++
 package/Config.in                          |   1 -
 package/rpi-firmware/Config.in             |   9 -
 package/rpi-firmware/rpi-firmware.mk       |  24 ---
 24 files changed, 859 insertions(+), 35 deletions(-)
 create mode 100644 board/raspberrypi/partitions
 create mode 100644 boot/rpi-firmware/Config.in
 rename {package => boot}/rpi-firmware/cmdline.txt (100%)
 rename {package => boot}/rpi-firmware/config.txt (100%)
 create mode 100644 boot/rpi-firmware/rpi-firmware.mk
 create mode 100644 docs/manual/customize-filesystems.txt
 create mode 100644 docs/manual/partition-layout.txt
 create mode 100644 fs/custom/Config.in
 create mode 100644 fs/custom/boot/mbr
 create mode 100644 fs/custom/boot/pre-post
 create mode 100644 fs/custom/custom.mk
 create mode 100644 fs/custom/fs/ext
 create mode 100644 fs/custom/fs/pre-post
 create mode 100644 fs/custom/fs/vfat
 create mode 100644 fs/custom/functions
 create mode 100755 fs/custom/genimages
 delete mode 100644 package/rpi-firmware/Config.in
 delete mode 100644 package/rpi-firmware/rpi-firmware.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
