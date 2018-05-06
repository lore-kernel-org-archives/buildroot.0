From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun,  6 May 2018 18:31:14 -0300
Subject: [Buildroot] [PATCH 2/4] skeleton-custom: install /bin, /lib,
 and /sbin
In-Reply-To: <20180506213116.25084-1-casantos@datacom.ind.br>
References: <20180506213116.25084-1-casantos@datacom.ind.br>
Message-ID: <20180506213116.25084-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

skeleton-custom does not install the required /bin, /lib and /sbin
directories (or symlinks), which may result in an imcomplete tree, The
user could add the required directories/symlinks to the skeleton but
they maye be invalid, depending on the state of BR2_ROOTFS_MERGED_USR.

Steps to reproduce:

- Enable BR2_ROOTFS_MERGED_USR and BR2_INIT_SYSTEMD
- Set BR2_ROOTFS_SKELETON_CUSTOM_PATH to "system/skeleton"
- Run "make skeleton"
- target/{bin.lib,sbin} will not exist

Add calls to SYSTEM_USR_SYMLINKS_OR_DIRS to INSTALL_TARGET_CMDS and
INSTALL_STAGING_CMDS, so the required directories or symlinks are
created.

Add a paragraph to the documentation clarifying that custom skeletons
should not contain /bin, /lib or /sbin.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 docs/manual/customize-rootfs.txt           | 5 +++++
 package/skeleton-custom/skeleton-custom.mk | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 44fc460670..8982e03498 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -100,6 +100,11 @@ To enable this feature, enable config option
   +System configuration+ menu. If you specify a relative path, it will
   be relative to the root of the Buildroot tree.
 +
+Custom skeletons should not contain the '/bin', '/lib' or '/sbin' paths,
+  since they are created during the build, either as directories or as
+  symbolic links to their counterparts under 'usr', depending on the
+  system configuration.
++
 This method is not recommended because it duplicates the entire
   skeleton, which prevents taking advantage of the fixes or improvements
   brought to the default skeleton in later Buildroot releases.
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index b1cddd9146..01cd62794d 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -43,6 +43,7 @@ endif
 # things we customise in the custom skeleton.
 define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
@@ -54,6 +55,7 @@ endef
 # skeleton to staging.
 define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
 endef
 
-- 
2.17.0
