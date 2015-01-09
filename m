From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 23:46:22 +0100
Subject: [Buildroot] [PATCH 4/5 v2] boards/raspberrypi: update readme with
	Device Tree instructions
In-Reply-To: <cover.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <405121088bf2a2c390694ef9637730965ab36a40.1420843412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index a6d3dd4..725ad9d 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -23,6 +23,10 @@ work on this defconfig:
 
   $ make raspberrypi_defconfig
 
+Alternatively, if you want to test support for the Device Tree:
+
+  $ make raspberrypi_dt_defconfig
+
 If you want to use a persistent rootfs, skip to "Build the rootfs", below.
 
 For a volatile rootfs, you have to slightly adjust the configuration:
@@ -51,16 +55,22 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
-    +-- rootfs.tar
-    +-- rpi-firmware
+    +-- rootfs.tar                              [0]
+    +-- rpi-firmware/
+    |   +-- bcm2708-rpi-b.dtb                   [1]
+    |   +-- bcm2708-rpi-b-plus.dtb              [1]
     |   +-- bootcode.bin
     |   +-- config.txt
     |   +-- fixup.dat
     |   `-- start.elf
     `-- zImage
 
-Note for Volatile: rootfs.tar will only be there if you kept
-"tar the root filesystem" option selected in "Filesystem images".
+[0] Note for Volatile: rootfs.tar will only be there if you kept
+    "tar the root filesystem" option selected in "Filesystem images".
+
+[1] The DTBs (Device Tree Blobs) will only be present if you setup
+    Buildroot to install the DTBs from the rpi-firmware package, and
+    will only be used if your kernel has support for the Device Tree.
 
 Prepare you SDCard
 ==================
@@ -89,17 +99,30 @@ Install the binaries to the SDCard
 At the root of the boot partition, the RaspberryPi must find the following
 files:
 
+    * bcm2708-rpi-b.dtb         [2]
+    * bcm2708-rpi-b-plus.dtb    [2]
     * bootcode.bin
     * config.txt
     * fixup.dat
     * start.elf
     * zImage
 
+[2] Only needed if your kernel has support for the Device Tree.
+
 For example:
 
  $ cp output/images/rpi-firmware/* /mnt/mountpointboot
+
+If your kernel does *not* have support for the Device Tree, then install
+it with:
+
  $ cp output/images/zImage /mnt/mountpointboot
 
+If your kernel *does* have support for the Device Tree, then install it
+with:
+
+  $ ./output/host/usr/bin/mkknlimg output/images/zImage /mnt/mountpointboot/zImage
+
 Note: The kernel image file name is defined in config.txt like this:
 kernel=zImage
 
-- 
1.9.1
