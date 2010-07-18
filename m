From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 23:15:55 +0200
Subject: [Buildroot] [git commit master 1/1] fs: add option to define path
	to custom rootfs skeleton
Message-ID: <20100718211633.27FAF8279C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b3a43f4e336d1af90200f5f34b931d09119e1e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dmytro Milinevskyy <milinevskyy@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile     |    4 ++++
 fs/Config.in |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 59151cc..744cae4 100644
--- a/Makefile
+++ b/Makefile
@@ -367,6 +367,10 @@ $(STAGING_DIR):
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
index 6865eea..188e815 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -23,6 +23,29 @@ config BR2_ROOTFS_DEVICE_TABLE
          to the makedevs utility to create all the special device
          files in the target filesystem.
 
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
 source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/ext2/Config.in"
-- 
1.7.1
