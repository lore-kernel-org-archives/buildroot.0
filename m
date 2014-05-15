From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 May 2014 18:31:36 -0300
Subject: [Buildroot] [PATCH 3/3] fs/squashfs: add lz4 compression support
In-Reply-To: <1400189496-29633-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400189496-29633-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400189496-29633-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/squashfs/Config.in   | 3 +++
 fs/squashfs/squashfs.mk | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 817909d..ca9ddb2 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -15,6 +15,9 @@ choice
 config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
 	bool "gzip"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
+	bool "lz4"
+
 config BR2_TARGET_ROOTFS_SQUASHFS4_LZMA
 	bool "lzma"
 
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index eb5fc3e..446906f 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,6 +6,9 @@
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
+ROOTFS_SQUASHFS_ARGS += -comp lz4
+else
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else
@@ -19,6 +22,7 @@ ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 endif
 endif
+endif
 
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
-- 
1.8.5.5
