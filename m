From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 May 2014 23:48:28 +0200
Subject: [Buildroot] [git commit] fs/squashfs: add lz4 compression support
Message-ID: <20140601083244.C563E9C779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=996dc12eff64a5dd3d329280380acfcf1f41eb11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/squashfs/Config.in   |    3 +++
 fs/squashfs/squashfs.mk |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

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
