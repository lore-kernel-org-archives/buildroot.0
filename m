From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:52 +0200
Subject: [Buildroot] [RFC 4/6] system: strip the initial /dev for mdev-only
	/dev management
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1441747734-18730-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using mdev-only /dev management a static device table is needed before
mdev is activated. This is used only for a very short time and then
replaced by the dymanic table managen by mdev, so it should be very
minimalistic.

But the current default, system/device_table_dev.txt, contains way too many
devices that are useless in this contex.

Replace it with a very minimal table.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 system/Config.in                      |  1 +
 system/device_table_dev_mdev_only.txt | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 system/device_table_dev_mdev_only.txt

diff --git a/system/Config.in b/system/Config.in
index a10de1e..48558b1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -147,6 +147,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 
 config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
+	default "system/device_table_dev_mdev_only.txt" if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
 	default "system/device_table_dev.txt"
 	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC || BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
 	help
diff --git a/system/device_table_dev_mdev_only.txt b/system/device_table_dev_mdev_only.txt
new file mode 100644
index 0000000..477aaea
--- /dev/null
+++ b/system/device_table_dev_mdev_only.txt
@@ -0,0 +1,10 @@
+# See package/makedevs/README for details
+#
+# This device table is used only to create device files when a static
+# device configuration is used (entries in /dev are static).
+#
+# <name>	<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+
+# Normal system devices
+/dev/null	c	666	0	0	1	3	0	0	-
+/dev/console	c	666	0	0	5	1	-	-	-
-- 
1.9.1
