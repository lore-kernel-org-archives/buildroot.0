From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Thu, 24 Jan 2019 16:27:33 +0800
Subject: [Buildroot] [PATCH v2 1/1] fs/common.mk: enable multithreaded xz
 compression
Message-ID: <1548318453-25435-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

xz help indicates only 1 thread is used unless we set threads:
-T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                    to use as many threads as there are processor cores

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v1 -> v2:
  - use PARALLEL_JOBS to determine how many threads to compress with
  - disable multithreaded compression for reproducible builds
---
 fs/common.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index a560417..76da6d8 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,7 +106,11 @@ endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
+ifeq ($(BR2_REPRODUCIBLE),y)
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
+else
+ROOTFS_$(2)_COMPRESS_CMD = xz -T $(PARALLEL_JOBS) -9 -C crc32 -c
+endif
 endif
 
 $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
-- 
2.7.4
