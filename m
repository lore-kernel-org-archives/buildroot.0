From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:32:51 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch yem/genimages
Message-ID: <cover.1387578655.git.yann.morin.1998@free.fr>
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
silence) by re-inventing such a script over and over again, for each device
that need such a setup, I came up with the 'genimages' idea: a description
of the layout of the storage devices, partitioning schemes, and partitions
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

Finally, those device images can be flashed directly on the raw device of
the storage, without manually fiddling with  fdisk, mount, tar and so
on...


How does 'genimages' work internally?

The partition layout is decribed in a .ini-like file.

genimages is a relatively simple shell script that parses that .ini file.
Based on each device/partition description, it calls to 'handlers' (or
hooks), for each kind of content we support.

For example, we have two types of partitioning scheme supported for
device: mbr and gpt. Each is implemented in its own shell-fragment.
Ditto for partitions: we support different filesystems, ext, squashfs,
and vfat; they are each implemented in their own shell-fragment.

Each handler has to define the 'do_image' shell function. That functions
should expect two arguments: the base dir of the filesystem, and the
filename of the image to generate, and it has access to the configuration
from the .ini file.


How to use 'genimages'?

It's all explained in the manual. A pre-rendered version is available for
reading, and easy review on-line there:
    http://ymorin.is-a-geek.org/download/tmp/buildroot/manual/manual.html

The new section is "3.3.6 Customizing the generated filesystem images"
and there is a detailed description of the partition table layout in
appendix "12.3. Partition table layout description syntax".


Changes v2 -> v3:
  - misc typoes in the manual

Changes v1 -> v2:
  - drop rpi-firmware install into /boot  (Thomas, Ryan)
  - drop move of rpi-firmware in bootloader sub-menu  (Thomas)
  - add possibility to generate an unmounted filesystem  (Thomas, Ryan)
  - add ability to specify files to add in a filesystem instead of a
    sub-dir of target/  (Ryan, during a hacking session)
  - properly depend on the host-tools if they are selected
  - add GPT support
  - add a third filesystem, squashfs (in its own patch, as an example
    of how easy it is to add one)


Regards,
Yann E. MORIN.


The following changes since commit 2746158497cdaf80a5b85584e3972857ac2e7e82:

  util-linux: Add config switches for some more binaries (2013-12-20 22:45:31 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/genimages

for you to fetch changes up to 81062cef5d4d51b6f196fb7c3d9c171c7c362555:

  fs/custom: add support for squashfs (2013-12-20 23:12:22 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      fs/custom: generate complete, partition-based device images
      board/raspberrypi: provide partition description for the new genimages
      package/squashfs: add selection for the host variant
      fs/custom: add support for squashfs

 board/raspberrypi/partitions          |  36 ++++
 configs/raspberrypi_defconfig         |   8 +
 docs/manual/appendix.txt              |   1 +
 docs/manual/customize-filesystems.txt |  35 ++++
 docs/manual/customize.txt             |   2 +
 docs/manual/partition-layout.txt      | 323 ++++++++++++++++++++++++++++++++++
 fs/Config.in                          |   1 +
 fs/custom/Config.in                   |  16 ++
 fs/custom/boot/gpt                    | 126 +++++++++++++
 fs/custom/boot/mbr                    |  57 ++++++
 fs/custom/boot/pre-post               |   8 +
 fs/custom/custom.mk                   |  41 +++++
 fs/custom/fs/ext                      |  22 +++
 fs/custom/fs/pre-post                 |  67 +++++++
 fs/custom/fs/squashfs                 |  15 ++
 fs/custom/fs/vfat                     |  17 ++
 fs/custom/functions                   |  47 +++++
 fs/custom/genimages                   | 242 +++++++++++++++++++++++++
 package/Config.in.host                |   1 +
 package/squashfs/Config.in.host       |   6 +
 20 files changed, 1071 insertions(+)
 create mode 100644 board/raspberrypi/partitions
 create mode 100644 docs/manual/customize-filesystems.txt
 create mode 100644 docs/manual/partition-layout.txt
 create mode 100644 fs/custom/Config.in
 create mode 100644 fs/custom/boot/gpt
 create mode 100644 fs/custom/boot/mbr
 create mode 100644 fs/custom/boot/pre-post
 create mode 100644 fs/custom/custom.mk
 create mode 100644 fs/custom/fs/ext
 create mode 100644 fs/custom/fs/pre-post
 create mode 100644 fs/custom/fs/squashfs
 create mode 100644 fs/custom/fs/vfat
 create mode 100644 fs/custom/functions
 create mode 100755 fs/custom/genimages
 create mode 100644 package/squashfs/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
