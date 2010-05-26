From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:00:18 +0200
Subject: [Buildroot] [git commit master] fs/squashfs: squashfs3 needs to set
	big/little endian
Message-ID: <20100526210240.6ECED12E244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e74bcb6f9a69e55e57d8c677567c86fa76abc5a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/squashfs/squashfs.mk |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index f11ba20..a904182 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -8,10 +8,18 @@ ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4),y)
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 else
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
+
+ifeq ($(BR2_ENDIAN),"BIG")
+ROOTFS_SQUASHF_ARGS=-be
+else
+ROOTFS_SQUASHFS_ARGS=-le
+endif
+
 endif
 
 define ROOTFS_SQUASHFS_CMD
-	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend
+	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend \
+		$(ROOTFS_SQUASHFS_ARGS)
 endef
 
-$(eval $(call ROOTFS_TARGET,squashfs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,squashfs))
-- 
1.6.3.3
