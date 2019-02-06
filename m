From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:11:02 +0100
Subject: [Buildroot] [git commit] Makefile: allow rootfs overlays to
 override symbolic links
Message-ID: <20190206161331.9DB918376B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c96bda11eb26ada660dcd31843fbc9523be6062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0db34529f48 we use rsync with the --keep-dirlinks option to
prevent overlays from accidentally overwriding /{usr,bin,sbin,lib} links
when BR2_ROOTFS_MERGED_USR option is enabled. Unfortunately this also
prevents replacing a symlink by a directory on purpose (e.g. /var/log,
to persist system logs).

Steps to reproduce:

- enable BR2_ROOTFS_MERGED_USR and BR2_PACKAGE_SKELETON_INIT_SYSV
- mkdir some_path/rootfs-overlay/var/log
- enable BR2_ROOTFS_OVERLAY="some_path/rootfs-overlay"
- run 'make'
- 'target/var/log' is still a symlink to '../tmp', not a directory

The --keep-dirlinks option can be dropped, since we run sanity checks
on overlays. Now the rsync invocation is identical to the SYSTEM_RSYNC
logic we have in system/system.mk, so use that variable.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 752a850753..0d2659c46e 100644
--- a/Makefile
+++ b/Makefile
@@ -800,9 +800,7 @@ endif # merged /usr
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
-			$(d)/ $(TARGET_DIR)$(sep))
+		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
