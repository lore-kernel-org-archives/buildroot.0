From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:31:17 +0200
Subject: [Buildroot] [git commit] boards/raspberrypi: update instructions
Message-ID: <20150630123122.D295D81796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f999784b8b6ccb564a5670b950b8bc6ea7c5730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a sanitised set of defconfig files, and we no longer
support non-DT setups, update and simplify the board readme file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt |   48 +++++++++++++++++++----------------------
 1 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 4ead046..cf95879 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -22,17 +22,14 @@ How to build it
 Configure Buildroot
 -------------------
 
-The raspberrypi_defconfig configuration is a minimal configuration with
-all that is required to bring the Raspberry Pi up. You should base your
-work on this defconfig:
+There are two RaspberryPi defconfig files in Buildroot, one for each
+major variant, which you should base your work on:
 
-  $ make raspberrypi_defconfig
-
-Alternatively, if you want to test support for the Device Tree:
+For models A, B, A+ or B+:
 
-  $ make raspberrypi_dt_defconfig
+  $ make raspberrypi_defconfig
 
-For Raspberry Pi 2 use a different defconfig:
+And for model 2 B:
 
   $ make raspberrypi2_defconfig
 
@@ -64,20 +61,23 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
-    +-- rootfs.tar                              [0]
+    +-- rootfs.tar                  [0]
     +-- rpi-firmware/
-    |   +-- bcm2708-rpi-b.dtb
-    |   +-- bcm2708-rpi-b-plus.dtb
-    |   +-- bcm2709-rpi-2-b.dtb
     |   +-- bootcode.bin
     |   +-- config.txt
     |   +-- fixup.dat
     |   `-- start.elf
+    +-- bcm2708-rpi-b.dtb           [1]
+    +-- bcm2708-rpi-b-plus.dtb      [1]
+    +-- bcm2709-rpi-2-b.dtb         [1]
     `-- zImage
 
 [0] Note for Volatile: rootfs.tar will only be there if you kept
     "tar the root filesystem" option selected in "Filesystem images".
 
+[1] Not all of them will be present, depending on the RaspberryPi
+    model you are using.
+
 Prepare you SDCard
 ==================
 
@@ -105,30 +105,26 @@ Install the binaries to the SDCard
 At the root of the boot partition, the Raspberry Pi must find the following
 files:
 
-    * bcm2708-rpi-b.dtb         [1]
-    * bcm2708-rpi-b-plus.dtb    [2]
-    * bcm2709-rpi-2-b.dtb       [3]
+    * bcm2708-rpi-b.dtb         [2]
+    * bcm2708-rpi-b-plus.dtb    [3]
+    * bcm2709-rpi-2-b.dtb       [4]
     * bootcode.bin
     * config.txt
     * fixup.dat
     * start.elf
     * zImage
 
-[1] For models A and B
-[2] For models A+ and B+
-[3] For model 2
+[2] For models A and B
+[3] For models A+ and B+
+[4] For model 2
 
 For example:
 
- $ cp output/images/rpi-firmware/* /mnt/mountpointboot
-
-If your kernel does *not* have support for the Device Tree, then install
-it with:
-
- $ cp output/images/zImage /mnt/mountpointboot
+  $ cp output/images/rpi-firmware/* /mnt/mountpointboot
+  $ cp output/images/*.dtb /mnt/mountpointboot
 
-If your kernel *does* have support for the Device Tree, then install it
-with:
+The kernel image must be marked with a special header so that the
+bootloader of the RaspberryPi knows it supports Device Tree:
 
   $ ./output/host/usr/bin/mkknlimg output/images/zImage /mnt/mountpointboot/zImage
 
