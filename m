From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:42:28 +0200
Subject: [Buildroot] [git commit] grub2: add a tip to create disk image w/o
	root permission
Message-ID: <20140723214249.6615E9D2D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fe134f08280f0019403c41ac9573a233c94e3b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: minor fixes/improvements.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |   28 ++++++++++++++++++++++++++--
 1 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index a27c07a..4e0d1d6 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -39,7 +39,30 @@ config BR2_TARGET_GRUB2
 	     sudo losetup -d /dev/loop0
 	  7. Your disk.img is ready!
 
-	  To test your BIOS image in Qemu:
+	  Using genimage
+	  --------------
+
+	  If you use genimage to generate your complete image,
+	  installing Grub can be tricky. Here is how to achieve Grub's
+	  installation with genimage:
+
+	  partition boot {
+	      in-partition-table = "no"
+	      image = "path_to_boot.img"
+	      offset = 0
+	      size = 512
+	  }
+	  partition grub {
+	      in-partition-table = "no"
+	      image = "path_to_grub.img"
+	      offset = 512
+	  }
+
+	  The result is not byte to byte identical to what
+	  grub-bios-setup does but it works anyway.
+
+	  To test your BIOS image in Qemu
+	  -------------------------------
 
 	  qemu-system-{i386,x86-64} -hda disk.img
 
@@ -73,7 +96,8 @@ config BR2_TARGET_GRUB2
 	     sudo losetup -d /dev/loop0
 	  7. Your disk.img is ready!
 
-	  To test your EFI image in Qemu:
+	  To test your EFI image in Qemu
+	  ------------------------------
 
 	  1. Download the EFI BIOS for Qemu
 	     Version IA32 or X64 depending on the chosen Grub2
