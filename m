From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 19:29:47 +0200
Subject: [Buildroot] [git commit] fs/common.mk: enable multithreaded xz
 compression
Message-ID: <20190803172719.6040E816C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36fb6d174d5230e666a19e331901ff88d4700b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xz help indicates only 1 thread is used unless we set threads:
-T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                    to use as many threads as there are processor cores

Since this splits the file into blocks, the result will be not
bit-for-bit identical to single-threaded compression. Therefore, don't
enable this in BR2_REPRODUCIBLE builds.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: append the option instead of repeating the entire command]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index ca46a331d6..842ea924a5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -140,6 +140,9 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
+ifeq ($(BR2_REPRODUCIBLE),)
+ROOTFS_$(2)_COMPRESS_CMD += -T $(PARALLEL_JOBS)
+endif
 endif
 
 $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
