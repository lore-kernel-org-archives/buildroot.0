From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 06:02:54 +0200
Subject: [Buildroot] [PATCH 2/6] fs: change the way the device table is
	configured
In-Reply-To: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
Message-ID: <64ec20e6c019e329bf6923fbf330b86b3cfad524.1271476803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the location of the device table was specified by a
variable in board Makefiles. Unfortunately, this variable is not
accessible from fs/common.mk, since the target/ code is included
*after* fs/common.mk.

Anyway, the general idea is to move away from these boards Makefile,
and provide configuration option for things like the device table
location.

Therefore, this patch adds a BR2_ROOTFS_DEVICE_TABLE option which
allows to specify which device table should be used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/Config.in |    8 ++++++++
 fs/common.mk |    5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index f885c52..6865eea 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -15,6 +15,14 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	  only argument. Make sure the exit code of that script is 0,
 	  otherwise make will stop after calling it.
 
+config BR2_ROOTFS_DEVICE_TABLE
+       string "Path to the device table"
+       default "target/generic/device_table.txt"
+       help
+         Specify the location of a device table, that will be passed
+         to the makedevs utility to create all the special device
+         files in the target filesystem.
+
 source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/ext2/Config.in"
diff --git a/fs/common.mk b/fs/common.mk
index fa6afd9..cc94eb4 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,6 +28,7 @@
 # macro will automatically generate a compressed filesystem image.
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
+ROOTFS_DEVICE_TABLE = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -38,8 +39,8 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot makedevs
 	touch $(BUILD_DIR)/.fakeroot.00000
 	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-ifneq ($(TARGET_DEVICE_TABLE),)
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_DEVICE_TABLE),)
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(ROOTFS_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
-- 
1.6.3.3
