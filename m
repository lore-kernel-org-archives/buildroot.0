From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 17:57:12 +0200
Subject: [Buildroot] [git commit] fs/cpio: generate reproducible archives
Message-ID: <20200629160110.4F4E086164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4728fdd4c06be07883e59eeb148c86cb74e10d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output of 'find' depends on the directory entries, and is not
ordered. As a consequence, the cpio archive is not reproducible.

Fix that by sorting the output of find. Use the 'C' locale to enforce
reproducibility that does not depend on the locale.

The command line is now pretty long, so we wrap it.

Signed-off-by: Yurii Monakov <monakov.y@gmail.com>
[yann.morin.1998 at free.fr:
  - use LC_ALL=C when sorting
  - wrap long line
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/cpio/cpio.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 28a435dd5e..81f8c393d1 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -37,7 +37,11 @@ ROOTFS_CPIO_OPTS += --reproducible
 endif
 
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc > $@
+	cd $(TARGET_DIR) && \
+	find . \
+	| LC_ALL=C sort \
+	| cpio $(ROOTFS_CPIO_OPTS) --quiet -o -H newc \
+	> $@
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
