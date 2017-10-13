From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 21:16:52 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
Message-ID: <20171013191655.30427-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to the other compressors.  Notice that we use the -l (legacy format)
for Linux kernel initrd compatibility.

Lz4 decompression is supported by the Linux kernel since 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 9a7758ff49..0fc151b294 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -59,6 +59,11 @@ ROOTFS_$(2)_DEPENDENCIES += host-lzma
 ROOTFS_$(2)_COMPRESS_EXT = .lzma
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZMA) -9 -c
 endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZ4),y)
+ROOTFS_$(2)_DEPENDENCIES += host-lz4
+ROOTFS_$(2)_COMPRESS_EXT = .lz4
+ROOTFS_$(2)_COMPRESS_CMD = lz4 -l -9 -c
+endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
 ROOTFS_$(2)_DEPENDENCIES += host-lzop
 ROOTFS_$(2)_COMPRESS_EXT = .lzo
-- 
2.11.0
