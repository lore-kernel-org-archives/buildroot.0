From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:09:11 +0200
Subject: [Buildroot] [git commit] grub2: fix a few minor issues in help text
Message-ID: <20140715180925.2853B9D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3ac2a6f58ce9f83ec23d3fd8fcc74f894ea7ea4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help text of grub2 explains the detailed steps to create a disk
image with grub2 installed on it. However, the steps for the
BIOS-based systems have a few minor issues fixed by this patch:

 - When calling partx to get the partitions detected, we should do it
   on the /dev/loop0 block device, and not on the underlying disk.img
   image file.
 - The grub-bios-setup utility must be called as root to work properly
   on /dev/loop0.
 - The steps to cleanup the partx and loop device were missing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 5e7ccd2..a27c07a 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -24,17 +24,20 @@ config BR2_TARGET_GRUB2
 		store Grub2. Leaving 1 MB of free space is safe.
 	  3. Setup loop device and loop partitions
 	     sudo losetup -f disk.img
-	     sudo partx -a disk.img
+	     sudo partx -a /dev/loop0
 	  4. Prepare the root partition
 	     sudo mkfs.ext3 -L root /dev/loop0p1
 	     sudo mount /dev/loop0p1 /mnt
 	     sudo tar -C /mnt -xf output/images/rootfs.tar
 	     sudo umount /mnt
 	  5. Install Grub2
-	     ./output/host/usr/sbin/grub-bios-setup \
+	     sudo ./output/host/usr/sbin/grub-bios-setup \
 			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
 			-c ./output/images/grub.img -d . /dev/loop0
-	  6. Your disk.img is ready!
+	  6. Cleanup loop device
+	     sudo partx -d /dev/loop0
+	     sudo losetup -d /dev/loop0
+	  7. Your disk.img is ready!
 
 	  To test your BIOS image in Qemu:
 
