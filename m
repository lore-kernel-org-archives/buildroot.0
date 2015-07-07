From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Jul 2015 13:01:26 +0300
Subject: [Buildroot] [PATCH] fs/cpio: drop static random-seed
Message-ID: <b00f4e7c142fdff8a1f311de5816008b08b13e67.1436263286.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initializing the kernel entropy pool in initramfs from a seed file that never
changes doesn't make much sense. Not initializing the entropy pool at all is
better than initializing it from a known seed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 fs/cpio/cpio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e82167e512dc..fa3cde64838e 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -28,7 +28,8 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && find . \! -path ./etc/random-seed \
+		| cpio --quiet -o -H newc > $@
 endef
 
 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
-- 
2.1.4
