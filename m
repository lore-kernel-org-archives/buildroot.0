From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 22:44:02 +0100
Subject: [Buildroot] [git commit] board/pc/genimage-efi.cfg: align the
 rootfs to start at 16MB offset from start of the image
Message-ID: <20201103213137.983E286CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e89862706dd355dcba499a7e47b30737ce28a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For grub-efi we can align the rootfs to start at exactly 16MB from the
beginning of the disk.  This can be done by reducing the vfat partition to
be 32 KB smaller than its 16MB size, just like the offset of the vfat
partition.

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
[Peter: drop redundant offset/size settings, add comment]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/genimage-efi.cfg | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index ea15ae5cfb..ec7e85b06c 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -10,7 +10,8 @@ image efi-part.vfat {
       image = "bzImage"
     }
   }
-  size = 16777216
+  # 16MB - 32KB
+  size = 16744448
 }
 
 image disk.img {
@@ -22,7 +23,6 @@ image disk.img {
     image = "efi-part.vfat"
     partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
     offset = 32768
-    size = 16777216
     bootable = true
   }
 
@@ -30,6 +30,5 @@ image disk.img {
     partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
     partition-uuid = UUID_TMP
     image = "rootfs.ext2"
-    offset = 16809984
   }
 }
