From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:17:02 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add option to define list of cold
 file extensions
Message-ID: <20181103143121.EE8968354A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0446f34d97c1098a95bcb90eb6167033932ec831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: split from the initial patch from Grzegorz]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 7 +++++++
 fs/f2fs/f2fs.mk   | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index e62bc652ef..ca838096d9 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -18,4 +18,11 @@ config BR2_TARGET_ROOTFS_F2FS_SIZE
 	  Suffix with K, M, G or T for power-of-two kilo-, mega-, giga-
 	  or terabytes.
 
+config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
+	string "extension list for cold files"
+	help
+	  Specify a file extension list in order f2fs to treat them as
+	  cold files. The default list includes most of multimedia
+	  file extensions such as jpg, gif, mpeg, mkv, and so on.
+
 endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index c954386b05..6025aad4bb 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -13,10 +13,12 @@ endif
 # variable is not qstrip-ed to preserve the integrity of the string value.
 F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
 # ")
+F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
 
 F2FS_OPTS = \
 	-f \
-	-l "$(F2FS_LABEL)"
+	-l "$(F2FS_LABEL)" \
+	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)")
 
 ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
 
