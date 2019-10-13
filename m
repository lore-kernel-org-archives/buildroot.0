From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:23 -0300
Subject: [Buildroot] [PATCH 0/9] post-build: pass an empty rootpath to
 genimage
Message-ID: <20191013002232.1045-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

genimage makes a full copy of the given rootpath to ${GENIMAGE_TMP}/root
so passing TARGET_DIR is a waste of time and disk space. We don't rely
on genimage to build rootfs images, just to insert pre-built images in
the disk images.

The waste may be negligible for sporadic builds but becomes relevant if
we think about autobuilders that perform several builds everyday.

Patch 1 changes support/scripts/genimage.sh to pass an empty rootpath to
genimage.

Patches 2-6, 8 and 9 drop per-board scripts and use genimage.sh, passing
the corresponding configuration file via BR2_ROOTFS_POST_SCRIPT_ARGS.

Patch 7 makes the same change in board/raspberrypi/post-image.sh. This
script cannot be directly replaced by genimage.sh
because it does other things.

The board/beaglebone/post-image.sh script was not removed because it is
used by beaglebone_qt5_defconfig, which is currently broken and cannot
be tested.

Again, these changes may appear to be overkill but since Buildroot is an
open source project each piece of code becomes a potential learning tool
for other developers. We must strive to provide good examples.

Carlos Santos (9):
  support/scripts/genimage.sh: pass an empty rootpath to genimage
  configs/beagleboardx15: drop custom post-image script
  configs/beaglebone: don't use custom post-image script
  configs/minnowboard_max-graphical: don't use custom post-image script
  configs/minnowboard_max: drop custom post-image script
  configs/pandaboard: drop custom post-image script
  board/raspberrypi/post-image.sh: pass an empty rootpath to genimage
  configs/roseapplepi: drop custom post-image script
  configs/wandboard: drop custom post-image script

 board/beagleboardx15/post-image.sh          | 15 ---------------
 board/beaglebone/post-build.sh              |  4 ++++
 board/minnowboard/post-image.sh             | 13 -------------
 board/pandaboard/post-image.sh              | 16 ----------------
 board/raspberrypi/post-image.sh             | 12 ++++++++++--
 board/roseapplepi/post-build.sh             |  4 ++++
 board/roseapplepi/post-image.sh             | 18 ------------------
 board/wandboard/post-image.sh               | 15 ---------------
 configs/beagleboardx15_defconfig            |  3 ++-
 configs/beaglebone_defconfig                |  4 +++-
 configs/minnowboard_max-graphical_defconfig |  3 ++-
 configs/minnowboard_max_defconfig           |  3 ++-
 configs/pandaboard_defconfig                |  3 ++-
 configs/roseapplepi_defconfig               |  4 +++-
 configs/wandboard_defconfig                 |  3 ++-
 support/scripts/genimage.sh                 | 10 +++++++++-
 16 files changed, 43 insertions(+), 87 deletions(-)
 delete mode 100755 board/beagleboardx15/post-image.sh
 create mode 100755 board/beaglebone/post-build.sh
 delete mode 100755 board/minnowboard/post-image.sh
 delete mode 100755 board/pandaboard/post-image.sh
 create mode 100755 board/roseapplepi/post-build.sh
 delete mode 100755 board/roseapplepi/post-image.sh
 delete mode 100755 board/wandboard/post-image.sh

-- 
2.18.1
