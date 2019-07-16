From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 16 Jul 2019 23:05:18 +0530
Subject: [Buildroot] [PATCH v2 2/2] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <20190716173518.11081-1-itsatharva@gmail.com>
References: <20190716173518.11081-1-itsatharva@gmail.com>
Message-ID: <20190716173518.11081-2-itsatharva@gmail.com>
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
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - Added comment
  - Build host-cpio if we are reproducible, reason is --reproducible
    option does not exist prior to cpio 2.12. (suggested by Yann, Arnout)
  - Changed pure assignment to append-assignment
  - CPIO_OPTS -> ROOTFS_CPIO_OPTS to prevent clash with cpio package's options
    if added in future
---
 fs/cpio/cpio.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 1f0cafe62f..275064d9cb 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,8 +29,16 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+# --repoducible option was not introduced until cpio v2.12. Some distros
+# like Ubuntu 16.04 or Debian oldstable which package v2.11. Hence build
+# host-cpio.
+ifeq ($(BR2_REPRODUCIBLE), y)
+ROOTFS_CPIO_DEPENDENCIES += host-cpio
+ROOTFS_CPIO_OPTS += --reproducible
+endif
+
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && find . | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
-- 
2.22.0
