From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Thu, 10 Jun 2010 22:58:40 +0300
Subject: [Buildroot] [PATCH 2/2] [skeleton] option to define path to custom
	rootfs skeleton
Message-ID: <4c114472.0d01df0a.4f84.1499@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmytro Milinevskyy <milinevskyy@gmail.com>
---
 Makefile     |    4 ++++
 fs/Config.in |   24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 1b5cdd4..67110f1 100644
--- a/Makefile
+++ b/Makefile
@@ -378,6 +378,10 @@ endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
 
+ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+endif
+
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
diff --git a/fs/Config.in b/fs/Config.in
index 6865eea..2163890 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -23,6 +23,30 @@ config BR2_ROOTFS_DEVICE_TABLE
          to the makedevs utility to create all the special device
          files in the target filesystem.
 
+choice
+	prompt "Root FS skeleton"
+
+	config BR2_ROOTFS_SKELETON_DEFAULT
+		bool "default target skeleton"
+        help
+          Use default target skeleton
+
+	config BR2_ROOTFS_SKELETON_CUSTOM
+		bool "custom target skeleton"
+		help
+	  	 Use custom target skeleton.
+
+endchoice
+
+if BR2_ROOTFS_SKELETON_CUSTOM
+	config BR2_ROOTFS_SKELETON_CUSTOM_PATH
+		string "custom target skeleton path"
+        default "fs/skeleton"
+		help
+	  	 Path custom target skeleton.
+endif
+
+
 source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/ext2/Config.in"
-- 
1.7.1
