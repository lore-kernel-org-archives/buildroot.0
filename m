From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 26 Jul 2017 00:53:05 +0200
Subject: [Buildroot] [git commit] fs/ext2: hint about setting the filesystem
	size on error
Message-ID: <20170725225137.1A3D681E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a67f4c3e29349bcb4cc2ac16d23603d4528b50fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we now request that the user sets the exact size of the ext2/3/4
filesystem, we've had quite a few users wondering what was going on when
they enable too much and the default 60M are no longer enough.

When mkfs.ext2 fails, print a hint that the user should check the size
setting.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: Add *** and redirect to stderr]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/ext2.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 902e663..5439e2b 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -29,7 +29,11 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 define ROOTFS_EXT2_CMD
 	rm -f $@
 	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
-		"$(EXT2_SIZE)"
+		"$(EXT2_SIZE)" \
+	|| { ret=$$?; \
+	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; \
+	     exit $$ret; \
+	}
 endef
 
 rootfs-ext2-symlink:
