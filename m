From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:11 +0200
Subject: [Buildroot] [PATCH 05/13] target/generic: get default paths from
	BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231411.17317.64602.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk             |    7 +++++--
 target/generic/Config.in |    3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 0f0eae9..bec0921 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -33,8 +33,11 @@
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
-	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+# The default device tables in $(PROJECT_DIR) may not exist, so
+# verify that.
+ROOTFS_DEVICE_TABLES = \
+	$(wildcard $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
+	           $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE)))
 
 define ROOTFS_TARGET_INTERNAL
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index b8472f4..76137b7 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -71,6 +71,7 @@ endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
+	default "$(PROJECT_DIR)/device_table.txt target/generic/device_table.txt" if BR2_PROJECT_DIR != ""
 	default "target/generic/device_table.txt"
 	help
 	  Specify a space-separated list of permission table locations,
@@ -83,6 +84,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 
 config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
+	default "$(PROJECT_DIR)/device_table_dev.txt target/generic/device_table_dev.txt" if BR2_PROJECT_DIR != ""
 	default "target/generic/device_table_dev.txt"
 	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 	help
@@ -168,6 +170,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom script to run before creating filesystem images"
+	default "$(PROJECT_DIR)/post-build.sh" if BR2_PROJECT_DIR != ""
 	default ""
 	help
 	  Specify a script to be run after the build has finished and before
