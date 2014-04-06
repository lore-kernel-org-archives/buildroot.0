From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  6 Apr 2014 17:06:04 +0300
Subject: [Buildroot] [PATCH] Don't build host-xz needlessly
Message-ID: <2ba6488613955537b19028cc7284548620aef745.1396793164.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit d1f325f554cab (xzcat: treat as host prerequisite and build if
needed) host-xz is always built when the host does not have xz installed.
Removed all other host-xz dependencies.

Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 fs/common.mk                 | 1 -
 package/squashfs/squashfs.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d95c26ba5c43..080b8c687efb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -59,7 +59,6 @@ ROOTFS_$(2)_COMPRESS_EXT = .lzo
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
-ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
 endif
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index bff308c2fd57..8c6350ab4a91 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -40,7 +40,7 @@ SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
 endif
 
 
-HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo host-xz
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lzo
 
 # no libattr/xz in BR
 HOST_SQUASHFS_MAKE_ARGS = \
-- 
1.9.1
