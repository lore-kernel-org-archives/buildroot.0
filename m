From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 08 Sep 2013 11:33:18 +0200
Subject: [Buildroot] [PATCH] ubifs filesystem image: line up and improve
	Config.in options
Message-ID: <7569d4f06765d241b20a.1378632798@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Triggered by the 'some comment required here', this patch updates the Config.in
comments for the ubifs filesystem image options. This includes:
- 'erase block' --> 'eraseblock' (following mtd online documentation)
- remove 'UBI' prefix to make options uniform. Sometimes the option is not a
  property of UBI but rather of the flash. Also, line up the name of the option
  with the help of mkfs.ubifs.
- add help text on all options, referring to the mkfs.ubifs/ubinize options

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 fs/ubifs/Config.in |  31 ++++++++++++++++++++-----------
 1 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -6,27 +6,33 @@ config BR2_TARGET_ROOTFS_UBIFS
 if BR2_TARGET_ROOTFS_UBIFS
 
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
-	hex "UBI logical erase block size"
+	hex "logical eraseblock size"
 	default 0x1f800
+	help
+	  Logical eraseblock (LEB) size. The value provided here is
+	  passed to the -e/--leb-size option of mkfs.ubifs.
 
 config BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE
-	hex "UBI minimum I/O size"
+	hex "minimum I/O unit size"
 	default 0x800
 	help
-	  Some comment required here
+	  Minimum I/O unit size. The value provided here is passed
+	  to the -m/--min-io-size option of mkfs.ubifs/ubinize.
 
 config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
-	int "Maximum LEB count"
+	int "maximum logical eraseblock count"
 	default 2048
 	help
-	  Some comment required here
+	  Maximum logical eraseblock (LEB) count. The value provided
+	  here is passed to the -c/--max-leb-cnt option of mkfs.ubifs.
 
 choice
 	prompt "ubifs runtime compression"
 	default BR2_TARGET_ROOTFS_UBIFS_RT_LZO
 	help
 	  Select which compression format to use at run-time within
-	  the ubifs file system.
+	  the ubifs file system. The choice made here is passed to
+	  the -x/--compr option of mkfs.ubifs
 
 config BR2_TARGET_ROOTFS_UBIFS_RT_NONE
 	bool "no compression"
@@ -97,18 +103,21 @@ config BR2_TARGET_ROOTFS_UBI
 if BR2_TARGET_ROOTFS_UBI
 
 config BR2_TARGET_ROOTFS_UBI_PEBSIZE
-	hex "UBI physical erase block size"
+	hex "physical eraseblock size"
 	default 0x20000
 	help
-	  Tells ubinize the physical eraseblock size of the flash chip
-	  the ubi image is created for.
+	  Tells ubinize the physical eraseblock (PEB) size of the
+	  flash chip the ubi image is created for. The value provided
+	  here is passed to the -p/--peb-size option of ubinize.
 
 config BR2_TARGET_ROOTFS_UBI_SUBSIZE
-	int "UBI sub-page size"
+	int "sub-page size"
 	default 512
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
-	  size. Use 0 if subpages are not supported on flash chip.
+	  size. Use 0 if sub-pages are not supported on flash chip.
+	  The value provided here is passed to the -s/--sub-page-size
+	  option of ubinize.
 
 config BR2_TARGET_ROOTFS_UBI_OPTS
 	string "Additional ubinize options"
