From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:45:46 +0200
Subject: [Buildroot] [git commit] fs/ubifs: factorize all the "depends on"
	into "if...endif" blocks
Message-ID: <20130425205441.014279B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3e3909bce549beacddee2b3fcb69a16e7cbb55f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Factorize all the "depends on" into "if...endif" blocks

All the UBIFS options use "depends on BR2_TARGET_ROOTFS_UBIFS" but
we can simplify the config file by enclosing them in an "if..endif"
block.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ubifs/Config.in |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index d716fc0..4cf5d13 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -3,21 +3,20 @@ config BR2_TARGET_ROOTFS_UBIFS
 	help
 	  Build a ubifs root filesystem
 
+if BR2_TARGET_ROOTFS_UBIFS
+
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
 	hex "UBI logical erase block size"
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 0x1f800
 
 config BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE
 	hex "UBI minimum I/O size"
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 0x800
 	help
 	  Some comment required here
 
 config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 	int "Maximum LEB count"
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 2048
 	help
 	  Some comment required here
@@ -25,7 +24,6 @@ config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 choice
 	prompt "ubifs runtime compression"
 	default BR2_TARGET_ROOTFS_UBIFS_RT_LZO
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
 	  Select which compression format to use at run-time within
 	  the ubifs file system.
@@ -50,7 +48,6 @@ endchoice
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_UBIFS_NONE
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
 	  Select which compression format to compress the final image
 	  into.
@@ -89,19 +86,18 @@ endchoice
 
 config BR2_TARGET_ROOTFS_UBIFS_OPTS
 	string "Additional mkfs.ubifs options"
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
 	  Any additional mkfs.ubifs options you may want to include.
 
 config BR2_TARGET_ROOTFS_UBI
-	depends on BR2_TARGET_ROOTFS_UBIFS
 	bool "Embed into an UBI image"
 	help
 	  Build an ubi image from the ubifs one (with ubinize).
 
+if BR2_TARGET_ROOTFS_UBI
+
 config BR2_TARGET_ROOTFS_UBI_PEBSIZE
 	hex "UBI physical erase block size"
-	depends on BR2_TARGET_ROOTFS_UBI
 	default 0x20000
 	help
 	  Tells ubinize the physical eraseblock size of the flash chip
@@ -109,7 +105,6 @@ config BR2_TARGET_ROOTFS_UBI_PEBSIZE
 
 config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	int "UBI sub-page size"
-	depends on BR2_TARGET_ROOTFS_UBI
 	default 512
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
@@ -117,6 +112,9 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 
 config BR2_TARGET_ROOTFS_UBI_OPTS
 	string "Additional ubinize options"
-	depends on BR2_TARGET_ROOTFS_UBI
 	help
 	  Any additional ubinize options you may want to include.
+
+endif # BR2_TARGET_ROOTFS_UBI
+
+endif # BR2_TARGET_ROOTFS_UBIFS
