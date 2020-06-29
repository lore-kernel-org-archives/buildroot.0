From: Yurii Monakov <monakov.y@gmail.com>
Date: Mon, 29 Jun 2020 15:37:01 +0300
Subject: [Buildroot] [1/1] fs/cpio: sort 'find' utility output (reproducible
 builds)
Message-ID: <20200629153701.7c2c5ca4@monakov-y.xu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Order of find utility results are not sorted and depend on items
attributes, so cpio produces different results across machines.

This patch sorts find output before piping to cpio to make
builds reproducible.

Signed-off-by: Yurii Monakov <monakov.y@gmail.com>
---
 fs/cpio/cpio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 28a435dd5e..73837ddecb 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -37,7 +37,7 @@ ROOTFS_CPIO_OPTS += --reproducible
 endif
 
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && find . | sort | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
-- 
2.17.1
