From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Wed, 14 Oct 2015 16:51:26 -0300
Subject: [Buildroot] [PATCH v3 2/2] axfs: add new filesystem type
In-Reply-To: <1444852286-12219-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444852286-12219-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1444852286-12219-3-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Advanced XIP File System is a Linux kernel filesystem driver that
enables files to be executed directly from flash or ROM memory rather
than being copied into RAM. It has the ability to store individual
*pages* in a file uncompressed/XIP or compressed/Demand Paged.

This commit only adds support for 'XIP all' mode, so all the files that
have the execute attribute set will be XIP'ed.

At the moment, the FS is not supported in Linux mainline (v4.3-rc5), so
the kernel has to be built with the axfs patches to be able to read it.
Patches can be found here: https://github.com/jaredeh/axfs

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 fs/Config.in      |  1 +
 fs/axfs/Config.in | 16 ++++++++++++++++
 fs/axfs/axfs.mk   | 13 +++++++++++++
 3 files changed, 30 insertions(+)
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
index 0000000..2c97715
--- /dev/null
+++ b/fs/axfs/Config.in
@@ -0,0 +1,16 @@
+config BR2_TARGET_ROOTFS_AXFS
+	bool "axfs root filesystem"
+	help
+	  The Advanced XIP File System is a Linux kernel filesystem driver
+	  that enables files to be executed directly from flash or ROM
+	  memory rather than being copied into RAM. It has the ability to
+	  store individual *pages* in a file uncompressed/XIP or
+	  compressed/Demand Paged.
+
+	  So far, the only supported mode is 'XIP all', so all the files
+	  that have the execute attribute set will be XIP'ed.
+
+	  At the moment, the FS is not supported in Linux mainline
+	  (v4.3-rc5), so the kernel has to be built with the axfs patches
+	  to be able to read it. Patches can be found here:
+	    https://github.com/jaredeh/axfs
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
2.6.1
