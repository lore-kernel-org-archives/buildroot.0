From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:07:14 +0200
Subject: [Buildroot] [git commit] Makefile: fix rootfs overlay with
	BR2_ROOTFS_MERGED_USR enabled
Message-ID: <20160513200721.D4B0F81F7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0db34529f48a0ca76a4aadd08c9af57d37366d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use rsync with '--keep-dirlinks' option to prevent rootfs overlay to
overwrite /usr, /bin, /sbin and /lib links in case BR2_ROOTFS_MERGED_USR
option is enabled.

Steps to reproduce failure:

- enable BR2_ROOTFS_MERGED_USR
- mkdir some_path/rootfs-overlay/lib/firmware/some_file.txt
- enable BR2_ROOTFS_OVERLAY="some_path/rootfs-overlay"
- run 'make'
- 'target/lib' contains only the files from 'some_path/rootfs-overlay/lib' instead
  of the original symlink 'lib -> usr/lib'.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 32bbfc4..9b0ed05 100644
--- a/Makefile
+++ b/Makefile
@@ -660,7 +660,7 @@ endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
 			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
