From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 00:09:33 +0200
Subject: [Buildroot] [git commit] System config: split static-dev device
	table setting into seperate option
Message-ID: <20110724221256.61A7C8B487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9dc7b73f3bf70740e954a80417b47c4458e7608b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed here:

http://lists.busybox.net/pipermail/buildroot/2011-May/043251.html

Add BR2_ROOTFS_STATIC_DEVICE_TABLE for the extra device table file(s)
to create device nodes in /dev, rather than complicated logic in
BR2_ROOTFS_DEVICE_TABLE, making it complicated to move between static
and dynamic modes.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/common.mk             |    3 ++-
 target/generic/Config.in |   23 +++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 4d50514..f793ff9 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -33,7 +33,8 @@
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
+ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
+	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 7961bec..a91de32 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -33,18 +33,25 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
+	string "Path to the permission tables"
+	default "target/generic/device_table.txt"
+	help
+	  Specify a space-separated list of permission table locations,
+	  that will be passed to the makedevs utility to assign
+	  correct owners and permissions on various files in the
+	  target filesystem.
+
+	  See package/makedevs/README for details on the usage and
+	  syntax of these files.
+
+config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
-	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
-		if BR2_ROOTFS_DEVICE_CREATION_STATIC
-	default "target/generic/device_table.txt" \
-		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
-		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
-		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
+	default "target/generic/device_table_dev.txt"
+	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 	help
 	  Specify a space-separated list of device table locations,
 	  that will be passed to the makedevs utility to create all
-	  the special device files and assign correct owners and
-	  permissions on various files in the target filesystem.
+	  the special device files under /dev.
 
 	  See package/makedevs/README for details on the usage and
 	  syntax of these files.
-- 
1.7.3.4
