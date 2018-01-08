From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:43:58 +0100
Subject: [Buildroot] [git commit] fs/common.mk: support lz4 compression
Message-ID: <20180108224423.588E483C34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51fa8d8e2892d10981fb4f70e24789aea3b4385c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the other compressors.  Notice that we use the -l (legacy format)
for Linux kernel initrd compatibility.

Lz4 decompression is supported by the Linux kernel since 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 98232f0..9715eb1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -56,6 +56,11 @@ ROOTFS_$(2)_DEPENDENCIES += host-lzma
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
