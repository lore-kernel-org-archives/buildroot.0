From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Jul 2017 00:05:28 +0200
Subject: [Buildroot] [PATCH] fs/ext2: hint about setting the filesystem size
	on error
Message-ID: <20170725220528.314-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we now request that the user sets the exact size of the ext2/3/4
filesystem, we've had quite a few users wondering what was going on when
they enable too much and the default 60M are no longer enough.

When mkfs.ext2 fails, print a hint that the user should check the size
setting.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/ext2/ext2.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 902e6639ee..6a992747c6 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -29,7 +29,11 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 define ROOTFS_EXT2_CMD
 	rm -f $@
 	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
-		"$(EXT2_SIZE)"
+		"$(EXT2_SIZE)" \
+	|| { ret=$$?; \
+	     echo "Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)"; \
+	     exit $$ret; \
+	}
 endef
 
 rootfs-ext2-symlink:
-- 
2.11.0
