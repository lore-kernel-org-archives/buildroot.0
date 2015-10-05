From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon,  5 Oct 2015 13:55:02 -0300
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Advanced XIP File System is a Linux kernel filesystem driver that enables
files to be executed directly from flash or ROM memory rather than being copied
into RAM.

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 fs/Config.in      |  1 +
 fs/axfs/Config.in |  4 ++++
 fs/axfs/axfs.mk   | 13 +++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 fs/axfs/Config.in
 create mode 100644 fs/axfs/axfs.mk

diff --git a/fs/Config.in b/fs/Config.in
index 5853113..51ccf28 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,5 +1,6 @@
 menu "Filesystem images"
 
+source "fs/axfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
new file mode 100644
index 0000000..7e25fe7
--- /dev/null
+++ b/fs/axfs/Config.in
@@ -0,0 +1,4 @@
+config BR2_TARGET_ROOTFS_AXFS
+	bool "axfs root filesystem"
+	help
+	  Build an axfs root filesystem
diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
new file mode 100644
index 0000000..05d6e5d
--- /dev/null
+++ b/fs/axfs/axfs.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the axfs root filesystem image
+#
+################################################################################
+
+ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
+
+define ROOTFS_AXFS_CMD
+	$(HOST_DIR)/usr/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
+endef
+
+$(eval $(call ROOTFS_TARGET,axfs))
-- 
1.9.1
