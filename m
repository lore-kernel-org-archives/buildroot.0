From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:53:03 +0200
Subject: [Buildroot] [git commit] fs/cpio: make cpio rootfs reproducible
Message-ID: <20190717065217.EABFA83DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd544aaebbaad9d8d3631d58f988227fada0a3db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/cpio/cpio.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 1f0cafe62f..8b133f3875 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,8 +29,15 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+# --repoducible option was introduced in cpio v2.12, which may not be
+# available in some old distributions, so we build host-cpio
+ifeq ($(BR2_REPRODUCIBLE),y)
+ROOTFS_CPIO_DEPENDENCIES += host-cpio
+ROOTFS_CPIO_OPTS += --reproducible
+endif
+
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && find . | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
