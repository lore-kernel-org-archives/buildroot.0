From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 11:40:31 +0100
Subject: [Buildroot] [PATCH 1/2 v2] fs/ubifs: spin-off ubi to be its own
 filesystem
In-Reply-To: <cover.1514457621.git.yann.morin.1998@free.fr>
References: <cover.1514457621.git.yann.morin.1998@free.fr>
Message-ID: <4374156970b5d0885cbe71a9bb5db8493508550c.1514457621.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the ubifs-in-ubi-image ("UBI image" thereafter) filesystem is
half an option of the ubifs filesystem, half a filesystem on its own:
the configoptions are options of the ubifs filesystem, but the .mk code
is in a separate .mk and registers a real filesystem.

Make it a full filesystem on its own, in its own directory tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - don't make it an option of the ubifs anymore, make it a separate fs
    (Thomas)
---
 fs/Config.in                  |  1 +
 fs/ubi/Config.in              | 51 +++++++++++++++++++++++++++++++++++++++++++
 fs/{ubifs => ubi}/ubi.mk      |  2 +-
 fs/{ubifs => ubi}/ubinize.cfg |  0
 fs/ubifs/Config.in            | 51 -------------------------------------------
 5 files changed, 53 insertions(+), 52 deletions(-)
 create mode 100644 fs/ubi/Config.in
 rename fs/{ubifs => ubi}/ubi.mk (95%)
 rename fs/{ubifs => ubi}/ubinize.cfg (100%)

diff --git a/fs/Config.in b/fs/Config.in
index 51ccf28169..c25b01c3de 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,6 +11,7 @@ source "fs/jffs2/Config.in"
 source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
+source "fs/ubi/Config.in"
 source "fs/ubifs/Config.in"
 source "fs/yaffs2/Config.in"
 
diff --git a/fs/ubi/Config.in b/fs/ubi/Config.in
new file mode 100644
index 0000000000..5fa2f1f61d
--- /dev/null
+++ b/fs/ubi/Config.in
@@ -0,0 +1,51 @@
+config BR2_TARGET_ROOTFS_UBI
+	bool "ubi image containing an ubifs root filesystem"
+	select BR2_TARGET_ROOTFS_UBIFS
+	help
+	  Build an ubi image from the ubifs one (with ubinize).
+
+if BR2_TARGET_ROOTFS_UBI
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+	hex "physical eraseblock size"
+	default 0x20000
+	help
+	  Tells ubinize the physical eraseblock (PEB) size of the
+	  flash chip the ubi image is created for. The value provided
+	  here is passed to the -p/--peb-size option of ubinize.
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+	int "sub-page size"
+	default 512
+	help
+	  Tells ubinize that the flash supports sub-pages and the sub-page
+	  size. Use 0 if sub-pages are not supported on flash chip.
+	  The value provided here is passed to the -s/--sub-page-size
+	  option of ubinize.
+
+config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	bool "Use custom config file"
+	help
+	  Select this option to use a custom ubinize configuration file,
+	  rather than the default configuration used by Buildroot (which
+	  defines a single dynamic volume marked as auto-resize).  Passing
+	  a custom ubinize configuration file allows you to create several
+	  volumes, specify volume types, etc.
+
+	  As a convenience, buildroot replaces the string
+	  "BR2_ROOTFS_UBIFS_PATH" with the path to the built ubifs file.
+	  So the volume defined for the root filesystem can specify the
+	  image path as:  image=BR2_ROOTFS_UBIFS_PATH
+
+config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
+	help
+	  Path to the ubinize configuration file.
+
+config BR2_TARGET_ROOTFS_UBI_OPTS
+	string "Additional ubinize options"
+	help
+	  Any additional ubinize options you may want to include.
+
+endif # BR2_TARGET_ROOTFS_UBI
diff --git a/fs/ubifs/ubi.mk b/fs/ubi/ubi.mk
similarity index 95%
rename from fs/ubifs/ubi.mk
rename to fs/ubi/ubi.mk
index 2baece5fb0..b71a555efb 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -17,7 +17,7 @@ ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
 UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
 else
-UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
+UBINIZE_CONFIG_FILE_PATH = fs/ubi/ubinize.cfg
 endif
 
 # don't use sed -i as it misbehaves on systems with SELinux enabled when this is
diff --git a/fs/ubifs/ubinize.cfg b/fs/ubi/ubinize.cfg
similarity index 100%
rename from fs/ubifs/ubinize.cfg
rename to fs/ubi/ubinize.cfg
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index ff604c5c38..e79ab9a17e 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -95,55 +95,4 @@ config BR2_TARGET_ROOTFS_UBIFS_OPTS
 	help
 	  Any additional mkfs.ubifs options you may want to include.
 
-config BR2_TARGET_ROOTFS_UBI
-	bool "Embed into an UBI image"
-	help
-	  Build an ubi image from the ubifs one (with ubinize).
-
-if BR2_TARGET_ROOTFS_UBI
-
-config BR2_TARGET_ROOTFS_UBI_PEBSIZE
-	hex "physical eraseblock size"
-	default 0x20000
-	help
-	  Tells ubinize the physical eraseblock (PEB) size of the
-	  flash chip the ubi image is created for. The value provided
-	  here is passed to the -p/--peb-size option of ubinize.
-
-config BR2_TARGET_ROOTFS_UBI_SUBSIZE
-	int "sub-page size"
-	default 512
-	help
-	  Tells ubinize that the flash supports sub-pages and the sub-page
-	  size. Use 0 if sub-pages are not supported on flash chip.
-	  The value provided here is passed to the -s/--sub-page-size
-	  option of ubinize.
-
-config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
-	bool "Use custom config file"
-	help
-	  Select this option to use a custom ubinize configuration file,
-	  rather than the default configuration used by Buildroot (which
-	  defines a single dynamic volume marked as auto-resize).  Passing
-	  a custom ubinize configuration file allows you to create several
-	  volumes, specify volume types, etc.
-
-	  As a convenience, buildroot replaces the string
-	  "BR2_ROOTFS_UBIFS_PATH" with the path to the built ubifs file.
-	  So the volume defined for the root filesystem can specify the
-	  image path as:  image=BR2_ROOTFS_UBIFS_PATH
-
-config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
-	string "Configuration file path"
-	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
-	help
-	  Path to the ubinize configuration file.
-
-config BR2_TARGET_ROOTFS_UBI_OPTS
-	string "Additional ubinize options"
-	help
-	  Any additional ubinize options you may want to include.
-
-endif # BR2_TARGET_ROOTFS_UBI
-
 endif # BR2_TARGET_ROOTFS_UBIFS
-- 
2.11.0
