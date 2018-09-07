From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:42 -0000
Subject: [Buildroot] [git commit] btrfs-progs: drop dependency on e2fsprogs
 by not building btrfs-convert
Message-ID: <20180907111550.A8C3C7FCA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72bc28e0ddfb97a327a2bb5a2f98959abc88a612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The btrfs-convert tool is used to convert an existing ext2 or reiserfs
filesystem into a btrfs filesystem. On the host, this is not really
useful, so let's disable building this tool, which allows to drop the
host-e2fsprogs dependency.

The host-util-linux dependency becomes necessary: it was previously
brought as a second-order dependency of host-e2fsprogs, but since we
no longer depend on host-e2fsprogs, we now need to explicitly depend
on host-util-linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/btrfs-progs.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 3129ecc714..2f9f4127b6 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -21,8 +21,12 @@ BTRFS_PROGS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 endif
 
-HOST_BTRFS_PROGS_DEPENDENCIES = host-e2fsprogs host-lzo host-zlib
-HOST_BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
+HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
+HOST_BTRFS_PROGS_CONF_OPTS = \
+	--disable-backtrace \
+	--disable-zstd \
+	--disable-python \
+	--disable-convert
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
