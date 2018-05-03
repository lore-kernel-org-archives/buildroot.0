From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  3 May 2018 09:19:58 -0300
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
Message-ID: <20180503121958.9462-1-casantos@datacom.ind.br>
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

Fix the problem by adding a step in target-finalize that checks each
overlay, using the same criteria used in skeleton-custom.mk.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 Makefile | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 957ba6634a..1b306f8556 100644
--- a/Makefile
+++ b/Makefile
@@ -751,9 +751,40 @@ endif
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
 	$(TOPDIR)/support/scripts/fix-rpath target
 
+# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
+# counterparts are appropriately setup as symlinks ones to the others.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		$(call MESSAGE,"Sanity check in overlay $(d)"); \
+		lib_inode=$$(stat -c '%i' $(d)/lib/. 2>/dev/null || true); \
+		bin_inode=$$(stat -c '%i' $(d)/bin/. 2>/dev/null || true); \
+		sbin_inode=$$(stat -c '%i' $(d)/sbin/. 2>/dev/null || true); \
+		usr_lib_inode=$$(stat -c '%i' $(d)/usr/lib/. 2>/dev/null || true); \
+		usr_bin_inode=$$(stat -c '%i' $(d)/usr/bin/. 2>/dev/null || true); \
+		usr_sbin_inode=$$(stat -c '%i' $(d)/usr/sbin/. 2>/dev/null || true); \
+		not_merged_dirs=""; \
+		test -z "$$lib_inode" || \
+			test "$$lib_inode" = "$$usr_lib_inode" || \
+				not_merged_dirs="$$not_merged_dirs /lib"; \
+		test -z "$$bin_inode" || \
+			test "$$bin_inode" = "$$usr_bin_inode" || \
+				not_merged_dirs="$$not_merged_dirs /bin"; \
+		test -z "$$sbin_inode" || \
+			test "$$sbin_inode" = "$$usr_sbin_inode" || \
+				not_merged_dirs="$$not_merged_dirs /sbin"; \
+		test -n "$$not_merged_dirs" && { \
+			echo "ERROR: The custom skeleton in $(d) is not" \
+				"using a merged /usr for the following directories:" \
+				$$not_merged_dirs; \
+			exit 1; \
+		} || true)
+
+endif # merged /usr
+
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
+		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
-- 
2.14.3
