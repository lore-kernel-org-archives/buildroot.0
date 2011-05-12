From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 May 2011 23:40:05 +0200
Subject: [Buildroot] [git commit] Move rootfs content options under system
	configuration
Message-ID: <20110512214023.D9852834B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e23a4bc752e1f95ba6c2e504124aac8aecb0faf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of the current mix between system config and filesystem menus.

At the same time rename 'Target filesystem options' menu to
'Filesystem images' as it now only contains options about image formats.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/Config.in             |   77 +---------------------------------------------
 target/generic/Config.in |   75 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index 6f0f82b..94154ea 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,79 +1,4 @@
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
-choice
-	prompt "/dev management"
-	default BR2_ROOTFS_DEVICE_CREATION_STATIC
-
-config BR2_ROOTFS_DEVICE_CREATION_STATIC
-	bool "Static using device table"
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
-	bool "Dynamic using devtmpfs only"
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
-	bool "Dynamic using mdev"
-	select BR2_PACKAGE_BUSYBOX
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	bool "Dynamic using udev"
-	select BR2_PACKAGE_UDEV
-
-endchoice
-
-config BR2_ROOTFS_DEVICE_TABLE
-	string "Path to the device tables"
-	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
-		if BR2_ROOTFS_DEVICE_CREATION_STATIC
-	default "target/generic/device_table.txt" \
-		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
-		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
-		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
-	help
-	  Specify a space-separated list of device table locations,
-	  that will be passed to the makedevs utility to create all
-	  the special device files and assign correct owners and
-	  permissions on various files in the target filesystem.
-
-	  See package/makedevs/README for details on the usage and
-	  syntax of these files.
-
-choice
-	prompt "Root FS skeleton"
-
-config BR2_ROOTFS_SKELETON_DEFAULT
-	bool "default target skeleton"
-	help
-	  Use default target skeleton
-
-config BR2_ROOTFS_SKELETON_CUSTOM
-	bool "custom target skeleton"
-	help
-	  Use custom target skeleton.
-
-endchoice
-
-if BR2_ROOTFS_SKELETON_CUSTOM
-config BR2_ROOTFS_SKELETON_CUSTOM_PATH
-	string "custom target skeleton path"
-	default "fs/skeleton"
-	help
-	  Path custom target skeleton.
-endif
+menu "Filesystem images"
 
 source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 2d2ad44..4969fcd 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -12,6 +12,66 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
+choice
+	prompt "/dev management"
+	default BR2_ROOTFS_DEVICE_CREATION_STATIC
+
+config BR2_ROOTFS_DEVICE_CREATION_STATIC
+	bool "Static using device table"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
+	bool "Dynamic using devtmpfs only"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
+	bool "Dynamic using mdev"
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool "Dynamic using udev"
+	select BR2_PACKAGE_UDEV
+
+endchoice
+
+config BR2_ROOTFS_DEVICE_TABLE
+	string "Path to the device tables"
+	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
+		if BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default "target/generic/device_table.txt" \
+		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
+		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
+	help
+	  Specify a space-separated list of device table locations,
+	  that will be passed to the makedevs utility to create all
+	  the special device files and assign correct owners and
+	  permissions on various files in the target filesystem.
+
+	  See package/makedevs/README for details on the usage and
+	  syntax of these files.
+
+choice
+	prompt "Root FS skeleton"
+
+config BR2_ROOTFS_SKELETON_DEFAULT
+	bool "default target skeleton"
+	help
+	  Use default target skeleton
+
+config BR2_ROOTFS_SKELETON_CUSTOM
+	bool "custom target skeleton"
+	help
+	  Use custom target skeleton.
+
+endchoice
+
+if BR2_ROOTFS_SKELETON_CUSTOM
+config BR2_ROOTFS_SKELETON_CUSTOM_PATH
+	string "custom target skeleton path"
+	default "fs/skeleton"
+	help
+	  Path custom target skeleton.
+endif
+
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_GENERIC_GETTY_PORT
@@ -51,4 +111,19 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ROOTFS_POST_BUILD_SCRIPT
+	string "Custom script to run before creating filesystem images"
+	default ""
+	help
+	  Specify a script to be run after the build has finished and before
+	  Buildroot starts packing the files into selected filesystem images.
+
+	  This gives users the oportunity to do board-specific cleanups,
+	  add-ons and the like, so the generated files can be used directly
+	  without further processing.
+
+	  The script is called with the target directory name as first and
+	  only argument. Make sure the exit code of that script is 0,
+	  otherwise make will stop after calling it.
+
 endmenu
-- 
1.7.3.4
