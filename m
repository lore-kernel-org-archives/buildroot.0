From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:43 -0000
Subject: [Buildroot] [git commit] fs/squashfs: honour the number of parallel
	jobs
Message-ID: <20170902130615.E37C280332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62e626b2ab9f60b21b8c8c392b0dc4ccd509f69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, mksquashfs uses all the CPUs available, like us with
BR2_JLEVEL=0.

However, by setting BR21_JLEVEL to non-zero, a user volutarily limits
the number of jobbs allowed to run concurrently (for various reasons,
like this is not a priority task on the machine; or like the
autobuilders, to spread the load accross multiple runs without
overloading the machine).

So, propagate tthe parallelisn settings down to mksquashfs, to repect
the user's will.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Tested-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/squashfs/squashfs.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 342c7a8..7de7f51 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,6 +6,8 @@
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
+ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
+
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
 ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
@@ -19,8 +21,7 @@ ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
 define ROOTFS_SQUASHFS_CMD
-	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
-		$(ROOTFS_SQUASHFS_ARGS)
+	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
