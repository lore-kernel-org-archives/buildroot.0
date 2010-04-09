From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:19 +0200
Subject: [Buildroot] [PATCH 41/44] Move all filesystem generation code to fs/
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0585241505cfaddc9db6ae92739bdfb5ce5f9794.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                      |    2 +
 Makefile                                       |    2 +
 fs/Config.in                                   |   30 +++++++++++++++++++++
 {target => fs}/cloop/Config.in                 |    0
 {target => fs}/cloop/cloop.mk                  |    0
 {target => fs}/common.mk                       |    2 +
 {target => fs}/cpio/Config.in                  |    0
 {target => fs}/cpio/cpioroot.mk                |    0
 {target => fs}/cramfs/Config.in                |    0
 {target => fs}/cramfs/cramfs.mk                |    0
 {target => fs}/ext2/Config.in                  |    0
 {target => fs}/ext2/ext2root.mk                |    0
 {target => fs}/initramfs/Config.in             |    0
 {target => fs}/initramfs/gen_initramfs_list.sh |    0
 {target => fs}/initramfs/initramfs.mk          |    0
 {target => fs}/iso9660/Config.in               |    0
 {target => fs}/iso9660/iso9660.mk              |    0
 {target => fs}/iso9660/menu.lst                |    0
 {target => fs}/jffs2/Config.in                 |    0
 {target => fs}/jffs2/jffs2root.mk              |    0
 {target => fs}/romfs/Config.in                 |    0
 {target => fs}/romfs/romfs.mk                  |    0
 {target => fs}/squashfs/Config.in              |    0
 {target => fs}/squashfs/squashfsroot.mk        |    0
 {target => fs}/tar/Config.in                   |    0
 {target => fs}/tar/tarroot.mk                  |    0
 {target => fs}/ubifs/Config.in                 |    0
 {target => fs}/ubifs/ubifsroot.mk              |    0
 target/Config.in                               |   33 +-----------------------
 target/Makefile.in                             |    2 -
 30 files changed, 37 insertions(+), 34 deletions(-)
 create mode 100644 fs/Config.in
 rename {target => fs}/cloop/Config.in (100%)
 rename {target => fs}/cloop/cloop.mk (100%)
 rename {target => fs}/common.mk (99%)
 rename {target => fs}/cpio/Config.in (100%)
 rename {target => fs}/cpio/cpioroot.mk (100%)
 rename {target => fs}/cramfs/Config.in (100%)
 rename {target => fs}/cramfs/cramfs.mk (100%)
 rename {target => fs}/ext2/Config.in (100%)
 rename {target => fs}/ext2/ext2root.mk (100%)
 rename {target => fs}/initramfs/Config.in (100%)
 rename {target => fs}/initramfs/gen_initramfs_list.sh (100%)
 rename {target => fs}/initramfs/initramfs.mk (100%)
 rename {target => fs}/iso9660/Config.in (100%)
 rename {target => fs}/iso9660/iso9660.mk (100%)
 rename {target => fs}/iso9660/menu.lst (100%)
 rename {target => fs}/jffs2/Config.in (100%)
 rename {target => fs}/jffs2/jffs2root.mk (100%)
 rename {target => fs}/romfs/Config.in (100%)
 rename {target => fs}/romfs/romfs.mk (100%)
 rename {target => fs}/squashfs/Config.in (100%)
 rename {target => fs}/squashfs/squashfsroot.mk (100%)
 rename {target => fs}/tar/Config.in (100%)
 rename {target => fs}/tar/tarroot.mk (100%)
 rename {target => fs}/ubifs/Config.in (100%)
 rename {target => fs}/ubifs/ubifsroot.mk (100%)

diff --git a/Config.in b/Config.in
index 4f567d0..224a44a 100644
--- a/Config.in
+++ b/Config.in
@@ -346,4 +346,6 @@ source "toolchain/Config.in"
 
 source "package/Config.in"
 
+source "fs/Config.in"
+
 source "target/Config.in"
diff --git a/Makefile b/Makefile
index b47c0b0..ce6bf3d 100644
--- a/Makefile
+++ b/Makefile
@@ -323,6 +323,8 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
+include fs/common.mk
+
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
diff --git a/fs/Config.in b/fs/Config.in
new file mode 100644
index 0000000..f885c52
--- /dev/null
+++ b/fs/Config.in
@@ -0,0 +1,30 @@
+menu "Target filesystem options"
+
+config BR2_ROOTFS_POST_BUILD_SCRIPT
+	string "Custom script to run before packing files"
+	default ""
+	help
+	  Specify a script to be run after the build has finished and before
+	  the BR2 starts packing the files into selected packages.
+
+	  This gives users the oportunity to do board-specific cleanups,
+	  add-ons and the like, so the generated files can be used directly
+	  without further processing.
+
+	  The script is called with the target directory name as first and
+	  only argument. Make sure the exit code of that script is 0,
+	  otherwise make will stop after calling it.
+
+source "fs/cramfs/Config.in"
+source "fs/cloop/Config.in"
+source "fs/ext2/Config.in"
+source "fs/jffs2/Config.in"
+source "fs/ubifs/Config.in"
+source "fs/squashfs/Config.in"
+source "fs/tar/Config.in"
+source "fs/cpio/Config.in"
+source "fs/iso9660/Config.in"
+source "fs/initramfs/Config.in"
+source "fs/romfs/Config.in"
+
+endmenu
diff --git a/target/cloop/Config.in b/fs/cloop/Config.in
similarity index 100%
rename from target/cloop/Config.in
rename to fs/cloop/Config.in
diff --git a/target/cloop/cloop.mk b/fs/cloop/cloop.mk
similarity index 100%
rename from target/cloop/cloop.mk
rename to fs/cloop/cloop.mk
diff --git a/target/common.mk b/fs/common.mk
similarity index 99%
rename from target/common.mk
rename to fs/common.mk
index cebe8c3..fa6afd9 100644
--- a/target/common.mk
+++ b/fs/common.mk
@@ -66,3 +66,5 @@ endef
 define ROOTFS_TARGET
 $(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
 endef
+
+include fs/*/*.mk
diff --git a/target/cpio/Config.in b/fs/cpio/Config.in
similarity index 100%
rename from target/cpio/Config.in
rename to fs/cpio/Config.in
diff --git a/target/cpio/cpioroot.mk b/fs/cpio/cpioroot.mk
similarity index 100%
rename from target/cpio/cpioroot.mk
rename to fs/cpio/cpioroot.mk
diff --git a/target/cramfs/Config.in b/fs/cramfs/Config.in
similarity index 100%
rename from target/cramfs/Config.in
rename to fs/cramfs/Config.in
diff --git a/target/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
similarity index 100%
rename from target/cramfs/cramfs.mk
rename to fs/cramfs/cramfs.mk
diff --git a/target/ext2/Config.in b/fs/ext2/Config.in
similarity index 100%
rename from target/ext2/Config.in
rename to fs/ext2/Config.in
diff --git a/target/ext2/ext2root.mk b/fs/ext2/ext2root.mk
similarity index 100%
rename from target/ext2/ext2root.mk
rename to fs/ext2/ext2root.mk
diff --git a/target/initramfs/Config.in b/fs/initramfs/Config.in
similarity index 100%
rename from target/initramfs/Config.in
rename to fs/initramfs/Config.in
diff --git a/target/initramfs/gen_initramfs_list.sh b/fs/initramfs/gen_initramfs_list.sh
similarity index 100%
rename from target/initramfs/gen_initramfs_list.sh
rename to fs/initramfs/gen_initramfs_list.sh
diff --git a/target/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
similarity index 100%
rename from target/initramfs/initramfs.mk
rename to fs/initramfs/initramfs.mk
diff --git a/target/iso9660/Config.in b/fs/iso9660/Config.in
similarity index 100%
rename from target/iso9660/Config.in
rename to fs/iso9660/Config.in
diff --git a/target/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
similarity index 100%
rename from target/iso9660/iso9660.mk
rename to fs/iso9660/iso9660.mk
diff --git a/target/iso9660/menu.lst b/fs/iso9660/menu.lst
similarity index 100%
rename from target/iso9660/menu.lst
rename to fs/iso9660/menu.lst
diff --git a/target/jffs2/Config.in b/fs/jffs2/Config.in
similarity index 100%
rename from target/jffs2/Config.in
rename to fs/jffs2/Config.in
diff --git a/target/jffs2/jffs2root.mk b/fs/jffs2/jffs2root.mk
similarity index 100%
rename from target/jffs2/jffs2root.mk
rename to fs/jffs2/jffs2root.mk
diff --git a/target/romfs/Config.in b/fs/romfs/Config.in
similarity index 100%
rename from target/romfs/Config.in
rename to fs/romfs/Config.in
diff --git a/target/romfs/romfs.mk b/fs/romfs/romfs.mk
similarity index 100%
rename from target/romfs/romfs.mk
rename to fs/romfs/romfs.mk
diff --git a/target/squashfs/Config.in b/fs/squashfs/Config.in
similarity index 100%
rename from target/squashfs/Config.in
rename to fs/squashfs/Config.in
diff --git a/target/squashfs/squashfsroot.mk b/fs/squashfs/squashfsroot.mk
similarity index 100%
rename from target/squashfs/squashfsroot.mk
rename to fs/squashfs/squashfsroot.mk
diff --git a/target/tar/Config.in b/fs/tar/Config.in
similarity index 100%
rename from target/tar/Config.in
rename to fs/tar/Config.in
diff --git a/target/tar/tarroot.mk b/fs/tar/tarroot.mk
similarity index 100%
rename from target/tar/tarroot.mk
rename to fs/tar/tarroot.mk
diff --git a/target/ubifs/Config.in b/fs/ubifs/Config.in
similarity index 100%
rename from target/ubifs/Config.in
rename to fs/ubifs/Config.in
diff --git a/target/ubifs/ubifsroot.mk b/fs/ubifs/ubifsroot.mk
similarity index 100%
rename from target/ubifs/ubifsroot.mk
rename to fs/ubifs/ubifsroot.mk
diff --git a/target/Config.in b/target/Config.in
index 5d634ca..5d53635 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -1,35 +1,4 @@
-menu "Target filesystem options"
-
-config BR2_ROOTFS_POST_BUILD_SCRIPT
-	string "Custom script to run before packing files"
-	default ""
-	help
-	  Specify a script to be run after the build has finished and before
-	  the BR2 starts packing the files into selected packages.
-
-	  This gives users the oportunity to do board-specific cleanups,
-	  add-ons and the like, so the generated files can be used directly
-	  without further processing.
-
-	  The script is called with the target directory name as first and
-	  only argument. Make sure the exit code of that script is 0,
-	  otherwise make will stop after calling it.
-
-comment "filesystem for target device"
-
-source "target/cramfs/Config.in"
-source "target/cloop/Config.in"
-source "target/ext2/Config.in"
-source "target/jffs2/Config.in"
-source "target/ubifs/Config.in"
-source "target/squashfs/Config.in"
-source "target/tar/Config.in"
-source "target/cpio/Config.in"
-source "target/iso9660/Config.in"
-source "target/initramfs/Config.in"
-source "target/romfs/Config.in"
-
-comment "bootloader for target device"
+menu "Bootloaders"
 
 source "target/x86/grub/Config.in"
 #source "target/x86/grub2/Config.in"
diff --git a/target/Makefile.in b/target/Makefile.in
index 38993e5..48396d5 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -62,8 +62,6 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
 
-# and finally build the filesystems/tarballs
-include target/common.mk
 include target/*/*.mk
 
 # kernel rules
-- 
1.6.3.3
