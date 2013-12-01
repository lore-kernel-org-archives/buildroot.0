From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:45:07 +0100
Subject: [Buildroot] [git commit] grub: improve help text with detailed
	instructions to install grub
Message-ID: <20131201225017.4BE7C9BE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62a84ded2fd779b1be0e917aa6845114b4272b11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These instructions should probaby go in the Buildroot manual, but at
this point, it's not clear in which section they should go. So in
order to not loose those notes, add them to the Grub help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/Config.in |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index 65b95e1..c90770f 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -5,6 +5,36 @@ config BR2_TARGET_GRUB
 	help
 	  The GRand Unified Bootloader for x86 systems.
 
+	  Some notes on creating a disk image with Grub installed:
+	    1. Create an empty disk image
+	       dd if=/dev/zero of=disk.img bs=1M count=32
+	    2. Create one primary partition
+	       cfdisk -h 16 -s 63 disk.img
+	    3. Set up a loop device
+	       sudo losetup -f disk.img
+	    4. Set up loop devices per partitions
+	       sudo partx -a /dev/loop0
+	    5. Create the ext2 filesystem
+	       sudo mkfs.ext2 -L root /dev/loop0p1
+	    6. Mount the filesystem
+	       mount /dev/loop0p1 /mnt
+	    7. Extract the root filesystem
+	       sudo tar -C /mnt -xf output/images/rootfs.tar
+	    8. Unmount the filesystem, clean up loop device
+	       sudo umount /mnt
+	       sudo partx -d /dev/loop0
+	       sudo losetup -d /dev/loop0
+	    9. Install grub
+	       output/host/sbin/grub --device-map=/dev/null
+	       and in the grub shell, enter:
+		device (hd0) disk.img
+		geometry (hd0) <cylinders> 16 63
+		root (hd0,0)
+		setup (hd0)
+	    10. Image is ready
+		Can be tested in Qemu, with:
+		  qemu-system-{i386,x86-64} -hda disk.img
+
 if BR2_TARGET_GRUB
 
 config BR2_TARGET_GRUB_SPLASH
