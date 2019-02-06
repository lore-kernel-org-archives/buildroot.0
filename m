From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:09:28 +0100
Subject: [Buildroot] [git commit] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
Message-ID: <20190206160819.82044821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7c6487cff0a418a6605060670571ea9111050a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a step to target-finalize that checks each rootfs overlay, following
the criteria established for custom skeletons and using the same script
uesd by skeleton-custom.mk.

Add a paragraph to the documentation clarifying that rootfs overlays
don't need to contain /bin, /lib or /sbin and must not contain them when
BR2_ROOTFS_MERGED_USR is enabled.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                         | 16 ++++++++++++++++
 docs/manual/customize-rootfs.txt |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/Makefile b/Makefile
index bba7d650ab..752a850753 100644
--- a/Makefile
+++ b/Makefile
@@ -782,6 +782,22 @@ endif
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
 	$(TOPDIR)/support/scripts/fix-rpath target
 
+# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
+# counterparts are appropriately setup as symlinks ones to the others.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+
+	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		$(call MESSAGE,"Sanity check in overlay $(d)"); \
+		not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
+		test -n "$$not_merged_dirs" && { \
+			echo "ERROR: The overlay in $(d) is not" \
+				"using a merged /usr for the following directories:" \
+				$$not_merged_dirs; \
+			exit 1; \
+		} || true$(sep))
+
+endif # merged /usr
+
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 9d3a62ddaf..6b72a37b32 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -22,6 +22,12 @@ A filesystem overlay is a tree of files that is copied directly
   etc., files called +.empty+ and files ending in +~+ are excluded from
   the copy.
 +
+When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
+  contain the '/bin', '/lib' or '/sbin' directories, as Buildroot will
+  create them as symbolic links to the relevant folders in '/usr'.  In
+  such a situation, should the overlay have any programs or libraries,
+  they should be placed in '/usr/bin', '/usr/sbin' and '/usr/lib'.
++
 As shown in xref:customize-dir-structure[], the recommended path for
   this overlay is +board/<company>/<boardname>/rootfs-overlay+.
 
