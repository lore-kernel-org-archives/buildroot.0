From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] Add version selection for the
	SquashFS root filesystem
Message-ID: <20100409142134.151C120E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8cee9fb4380a8d58a324d141dcab68a4c3aa29c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/squashfs/Config.in   |   19 +++++++++++++++++++
 fs/squashfs/squashfs.mk |    4 ++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 6cc8fca..bcc93b9 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -2,3 +2,22 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 	bool "squashfs root filesystem"
 	help
 	  Build a squashfs root filesystem
+
+if BR2_TARGET_ROOTFS_SQUASHFS
+choice
+	prompt "SquashFS version"
+	default BR2_TARGET_ROOTFS_SQUASHFS4
+	help
+	  Select the Squash filesystem version to use to generate the
+	  root filesystem.
+
+config BR2_TARGET_ROOTFS_SQUASHFS4
+       bool "4.x"
+
+config BR2_TARGET_ROOTFS_SQUASHFS3
+       depends on BR2_DEPRECATED
+       bool "3.x"
+
+endchoice
+endif
+
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index d72388e..f11ba20 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -4,7 +4,11 @@
 #
 #############################################################
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4),y)
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
+else
+ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
+endif
 
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend
-- 
1.6.3.3
