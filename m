From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  2 Jul 2014 17:56:50 +0200
Subject: [Buildroot] [PATCH] grub2: Add a tip to create disk image w/o root
	permission
Message-ID: <1404316610-14603-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 boot/grub2/Config.in | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 5e7ccd2..c4cc0e5 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -36,7 +36,30 @@ config BR2_TARGET_GRUB2
 			-c ./output/images/grub.img -d . /dev/loop0
 	  6. Your disk.img is ready!
 
-	  To test your BIOS image in Qemu:
+	  To automate this process
+	  ------------------------
+
+	  You can use genimage tool to automate partition creation.
+	  However, installing grub using genimage is tricky. It can be
+	  done using :
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
+	  The result is not byte to byte identical to result using
+	  grub-bios-setup but it seems it does not matter.
+
+	  To test your BIOS image in Qemu
+	  -------------------------------
 
 	  qemu-system-{i386,x86-64} -hda disk.img
 
@@ -70,7 +93,13 @@ config BR2_TARGET_GRUB2
 	     sudo losetup -d /dev/loop0
 	  7. Your disk.img is ready!
 
-	  To test your EFI image in Qemu:
+	  To automate this process
+	  ------------------------
+
+	  You can use genimage tool to automate partition creation.
+
+	  To test your EFI image in Qemu
+	  ------------------------------
 
 	  1. Download the EFI BIOS for Qemu
 	     Version IA32 or X64 depending on the chosen Grub2
-- 
2.0.0
