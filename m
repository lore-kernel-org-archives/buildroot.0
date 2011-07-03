From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  3 Jul 2011 12:47:58 +0200
Subject: [Buildroot] [PATCH 1/1] Fix boot with mdev
In-Reply-To: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
References: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1309690078-9197-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 726b15f64a10b, buildroot supports automatic creation of /dev entries
via mdev or udev. This can result in an incorrect boot sequence with
the default inittab, which uses /dev/null before mdev is started.

This is fixed adding a new device_table that creates the minimal /dev
entries that need to exist before starting mdev, and use it by default
when mdev or udev is used.

This list only contains /dev/null.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 target/generic/Config.in                    |    2 +-
 target/generic/device_table_dynamic_dev.txt |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletions(-)
 create mode 100644 target/generic/device_table_dynamic_dev.txt

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 4969fcd..cab6938 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -36,7 +36,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the device tables"
 	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
 		if BR2_ROOTFS_DEVICE_CREATION_STATIC
-	default "target/generic/device_table.txt" \
+	default "target/generic/device_table.txt target/generic/device_table_dynamic_dev.txt" \
 		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
 		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
 		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
diff --git a/target/generic/device_table_dynamic_dev.txt b/target/generic/device_table_dynamic_dev.txt
new file mode 100644
index 0000000..ea25a94
--- /dev/null
+++ b/target/generic/device_table_dynamic_dev.txt
@@ -0,0 +1,10 @@
+# See package/makedevs/README for details
+#
+# This device table is used only when mdev or udev are in use, to create
+# device files that need to be present before dynamic creation of devices
+# is started.
+#
+# <name>	<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+
+# Normal system devices
+/dev/null	c	666	0	0	1	3	0	0	-
-- 
1.7.4.1
