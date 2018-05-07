From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  7 May 2018 11:44:30 -0300
Subject: [Buildroot] [PATCH v3 4/5] Makefile: allow rootfs overlays to
 override symbolic links
In-Reply-To: <20180507144431.14488-1-casantos@datacom.ind.br>
References: <20180507144431.14488-1-casantos@datacom.ind.br>
Message-ID: <20180507144431.14488-5-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1->v2:

- Rebase series to HEAD of master branch
- Rework commit message and documentation, as suggested by Thomas
  Petazzoni

Changes v2-v3:

- Move the removal of --keep-dirlinks in the call to rsync to a separate
  patch.
---
 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 64c97ce6e2..dc51269143 100644
--- a/Makefile
+++ b/Makefile
@@ -764,9 +764,7 @@ endif # merged /usr
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
-			$(d)/ $(TARGET_DIR)$(sep))
+		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-- 
2.14.3
