From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 10:30:15 +0200
Subject: [Buildroot] [git commit] board/pc: drop unused grub-efi.cfg file
Message-ID: <20190510084547.7BE6D88FA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79b8540d624ac4846ba341b1b9691eccacf0bc05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit fee29b05bb7db25e37c8a5175ce00dc712554edf
("configs/pc_x86_64_efi: use a GPT partition table"),
board/pc/grub-efi.cfg is no longer used anywhere: the
post-image-efi-gpt.sh script generates the grub configuration.

Also, since post-image-efi-gpt.sh generates a grub configuration file
that uses the root filesystem partition UUID as the root= kernel
argument, the instructions in the readme.txt file to tweak root= from
/dev/sda2 to /dev/vda2 is no longer relevant. This was noted in the
commit log of fee29b05bb7db25e37c8a5175ce00dc712554edf:

    The root filesystem location is passed to the kernel by a partition
    UUID, so it is possible to boot on QEMU, directly from the disk image,
    or dump the image to a physical device.

Fixes: #11841
Cc: Pete Morici <pmorici@dev295.com>
Cc: Carlos A. M. dos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/grub-efi.cfg | 6 ------
 board/pc/readme.txt   | 8 +-------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
deleted file mode 100644
index 222301a4e0..0000000000
--- a/board/pc/grub-efi.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-set default="0"
-set timeout="5"
-
-menuentry "Buildroot" {
-	linux /bzImage root=/dev/sda2 rootwait console=tty1
-}
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 895331b0af..41aec50d36 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -57,13 +57,7 @@ qemu-system-x86_64 \
 Emulation in qemu (UEFI)
 ========================
 
-1. Edit grub-efi.cfg
-
-  Since the driver will show up in the virtual machine as /dev/vda,
-  change board/pc/grub-efi.cfg to use root=/dev/vda2 instead of
-  root=/dev/sda2. Then rebuild grub2 and the image.
-
-2. Run the emulation with:
+Run the emulation with:
 
 qemu-system-x86_64 \
 	-M pc \
