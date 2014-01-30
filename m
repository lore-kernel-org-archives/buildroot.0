From: Jeroen De Wachter <jeroen.de.wachter@telenet.be>
Date: Thu, 30 Jan 2014 14:52:23 +0100 (CET)
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host tools
	separately
Message-ID: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before, the squashfs tools for host were only built when a squashfs
root filesystem image was generated.

If the squashfs image is selected, it automatically selects the
squahsfs host tools as well. Consequently, I've removed
host-squashfs from ROOTFS_SQUASHFS_DEPENDENCIES.
---
 fs/squashfs/Config.in           |    1 +
 fs/squashfs/squashfs.mk         |    2 --
 package/Config.in.host          |    1 +
 package/squashfs/Config.in.host |    6 ++++++
 4 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 package/squashfs/Config.in.host

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 817909d..e788e61 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_SQUASHFS
        bool "squashfs root filesystem"
+       select BR2_PACKAGE_HOST_SQUASHFS
        help
          Build a squashfs root filesystem

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index eb5fc3e..b5ece9d 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################

-ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
-
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else
diff --git a/package/Config.in.host b/package/Config.in.host
index 34e84bf..71597bf 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/squashfs/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"

diff --git a/package/squashfs/Config.in.host b/package/squashfs/Config.in.host
new file mode 100644
index 0000000..b353374
--- /dev/null
+++ b/package/squashfs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_SQUASHFS
+       bool "host squashfs"
+       help
+         Tools to generate SquashFS filesystems.
+
+         http://squashfs.sourceforge.net/
--
1.7.1
