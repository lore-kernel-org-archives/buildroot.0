From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:01 +0000
Subject: [Buildroot] [PATCH 0/8] board/raspberrypi: post-image
 customisations.
Message-ID: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I wanted to do use u-boot and mainline kernel sources with my raspies
but in trying to do so, found that doing it required a lot of changes
to the genimage cfg files.
All the files were basically the same, and I found that they, and the
post-image script define constants which are no longer correct if the
corresponding options are changed in buildroot.
(eg. BR2_LINUX_KERNEL_INTREE_DTS_NAME)

I've improved the situation by first removing the replication in the
cfg files (consolidating them into a single generic file). And then
parsing the .config file for the board specific pieces; like the
device tree files, and the kernel target (zimage vs image).

Then I added some new options;
- Adding files to the boot partition,
  Allowing me to include uboot.bin.
- Changing the kernel in the config.txt file,
  Allowing me to boot uboot.bin.
- Specifying a different rootfs file,
  Since i would like to use btrfs instead of ext4.
- An option to skip creating the full sdimg.
  As I'm using btrfs, in some cases I only need the vfat boot blob
  from genimage.


There are a couple of aspects you might find questionable that I would
welcome comments on;

The script now modifies the generic genimage.cfg file and creates a
temporary cfg file to be used with genimage. I've chosen to place
the file at; ${BUILD_DIR}/genimage.cfg
This might not be the best choice.

I'm using a conbination of grep and eval to pull specific values out
of the .config file and get them into the script. That might not be
best practice.
Maybe theres a cleaner way of accessing those variables?

Kind regards,
~rob.

Robert J. Heywood (8):
  board/raspberrypi: Unify the genimage config files
  board/raspberrypi: post-image --overlays option.
  board/raspberrypi: post-image, include .config dfs files.
  board/raspberrypi: post-image, include .config kernel target.
  board/raspberrypi: post-image --file option
  board/raspberrypi: post-image --rootfs option
  board/raspberrypi: post-image --skip-sdimg option
  board/raspberrypi: post-image --kernel option

 DEVELOPERS                                         |  3 ++
 ...rrypi2.cfg => genimage-raspberrypi-generic.cfg} |  7 +--
 board/raspberrypi/genimage-raspberrypi.cfg         | 32 ------------
 board/raspberrypi/genimage-raspberrypi0.cfg        | 30 ------------
 board/raspberrypi/genimage-raspberrypi0w.cfg       | 31 ------------
 board/raspberrypi/genimage-raspberrypi3-64.cfg     | 32 ------------
 board/raspberrypi/genimage-raspberrypi3.cfg        | 33 -------------
 board/raspberrypi/post-image.sh                    | 57 +++++++++++++++++++++-
 8 files changed, 62 insertions(+), 163 deletions(-)
 rename board/raspberrypi/{genimage-raspberrypi2.cfg => genimage-raspberrypi-generic.cfg} (85%)
 delete mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg

-- 
2.11.0
