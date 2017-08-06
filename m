From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Aug 2017 17:41:02 +0200
Subject: [Buildroot] [PATCHv2] fs/squashfs: honour the number of parallel
	jobs
Message-ID: <20170806154102.24807-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2:
  - enhance commit log  (Thomas)
---
 fs/squashfs/squashfs.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 342c7a8a37..7de7f51af1 100644
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
-- 
2.11.0
