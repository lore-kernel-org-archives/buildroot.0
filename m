From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 12 Jul 2019 22:53:20 +0530
Subject: [Buildroot] [PATCH] fs/cpio: make cpio rootfs reproducible
Message-ID: <20190712172320.23108-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass the recommended argument in the CPIO manual to make cpio archives
reproducible.

Reference: https://www.gnu.org/software/cpio/manual/cpio.html#Copy_002dpass-mode

Pre-patch diffoscope output: https://gitlab.com/snippets/1874745
Post-patch: https://gitlab.com/snippets/1874746

We can see that post-patch, the archive related differences are removed.
The differences are arising from utils/bin/getconf. This will have to
be investigated further. However, that is unrelated to cpio.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 fs/cpio/cpio.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 1f0cafe62f..4847f56d53 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,8 +29,12 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifeq ($(BR2_REPRODUCIBLE), y)
+CPIO_OPTS = --reproducible
+endif
+
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && find . | cpio $(CPIO_OPTS) --quiet -o -H newc > $@
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
-- 
2.22.0
