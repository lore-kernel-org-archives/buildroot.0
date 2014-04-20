From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 18:07:11 +0200
Subject: [Buildroot] [git commit] yaffs2: new filesystem type
Message-ID: <20140420161457.7A0569C2AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b1ca27b1a591ba82209b9f7bcd6b39536b41885
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove BR2_TARGET_ROOTFS_YAFFS_PATH option, rename to yaffs2
instead of yaffs.]

Signed-off-by: Will Wagner <willw@carallon.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/Config.in        |    1 +
 fs/yaffs2/Config.in |    4 ++++
 fs/yaffs2/yaffs.mk  |   13 +++++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..5853113 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/yaffs2/Config.in"
 
 endmenu
diff --git a/fs/yaffs2/Config.in b/fs/yaffs2/Config.in
new file mode 100644
index 0000000..27da4ba
--- /dev/null
+++ b/fs/yaffs2/Config.in
@@ -0,0 +1,4 @@
+config BR2_TARGET_ROOTFS_YAFFS2
+	bool "yaffs2 root filesystem"
+	help
+	  Build a yaffs2 root filesystem
diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs.mk
new file mode 100644
index 0000000..19bdbe8
--- /dev/null
+++ b/fs/yaffs2/yaffs.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the yaffs2 root filesystem image
+#
+################################################################################
+
+ROOTFS_YAFFS2_DEPENDENCIES = host-yaffs2utils
+
+define ROOTFS_YAFFS2_CMD
+	$(HOST_DIR)/usr/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
+endef
+
+$(eval $(call ROOTFS_TARGET,yaffs2))
