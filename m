From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:33:32 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] fs/cpio: generate
 reproducible archives
Message-ID: <20200716163651.887AF7F8DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57f27de423cfbbddb415bdf2cb83745bbd78057f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit 4728fdd4c06be07883e59eeb148c86cb74e10d73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
