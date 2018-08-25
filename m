From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 23:59:23 +0200
Subject: [Buildroot] [git commit] fs/btrfs: remove destination file before
 generation
Message-ID: <20180907111604.5C1117FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f023810f04ea0cf4633465e838cb2f7eae2b1727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

btrfs will happily use an existing destination file if it
already exists, increasing its size if needed. Hoever, it
will never decrease the size, even if the requested size
is smaller than the existing file.

So, remove any previously existing destination file before
generating the new filesystem.

Note: the original submission by Robert did that, but as
this case was not obvious, the removal was dropped by a
refactoring when the patch was initially applied.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Robert J. Heywood <robert.heywood@codethink.co.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: use $@ instead of $(@), use $(RM) instead of rm.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/btrfs/btrfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
index ad00153c26..388516389b 100644
--- a/fs/btrfs/btrfs.mk
+++ b/fs/btrfs/btrfs.mk
@@ -29,6 +29,7 @@ BTRFS_OPTS = \
 ROOTFS_BTRFS_DEPENDENCIES = host-btrfs-progs
 
 define ROOTFS_BTRFS_CMD
+	$(RM) -f $@
 	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@
 endef
 
