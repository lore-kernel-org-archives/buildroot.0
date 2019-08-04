From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Aug 2019 14:14:16 +0200
Subject: [Buildroot] [PATCH 2/5 v3] package/skeleton-init-openrc: add
 support to remount rootfs as rw
In-Reply-To: <cover.1564920849.git.yann.morin.1998@free.fr>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
Message-ID: <e6c55e92a569154807e2c0f5ff88fb12fb1aad09.1564920849.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Add a pseudo entry for /dev/root in fstab, to tell openrc to prperly
remount or not remount / read-write.

For consistency with systemd (which is the only other init system to
tweak an fstab basd on / being rw or not), we do this change in the
openrc skeleton rahter than in the openrc package.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - tweak the sed expressions
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../skeleton-init-openrc/skeleton-init-openrc.mk  | 15 +++++++++++++++
 package/skeleton-init-openrc/skeleton/etc/fstab   |  1 +
 2 files changed, 16 insertions(+)

diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
index 5ee2192093..656fc531d7 100644
--- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -15,8 +15,23 @@ SKELETON_INIT_OPENRC_DEPENDENCIES = skeleton-init-common
 
 SKELETON_INIT_OPENRC_PROVIDES = skeleton
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+# Comment /dev/root entry in fstab. When openrc does not find fstab entry for
+# "/", it will try to remount "/" as "rw".
+define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
+	$(SED) '\:^/dev/root :s/^/# /' $(TARGET_DIR)/etc/fstab
+endef
+else
+# Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
+# it and doesn't remount root to rw.
+define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
+	$(SED) '\:^# /dev/root:s/^# //' $(TARGET_DIR)/etc/fstab
+endef
+endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+
 define SKELETON_INIT_OPENRC_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_OPENRC_PKGDIR)/skeleton,$(TARGET_DIR))
+	$(SKELETON_INIT_OPENRC_ROOT_RO_OR_RW)
 endef
 
 $(eval $(generic-package))
diff --git a/package/skeleton-init-openrc/skeleton/etc/fstab b/package/skeleton-init-openrc/skeleton/etc/fstab
index 3ec96cf634..21cf49ba5a 100644
--- a/package/skeleton-init-openrc/skeleton/etc/fstab
+++ b/package/skeleton-init-openrc/skeleton/etc/fstab
@@ -1,3 +1,4 @@
 # <file system>	<mount pt>	<type>	<options>	<dump>	<pass>
+/dev/root	/		ext2	ro,noauto	0	0
 tmpfs		/tmp		tmpfs	mode=1777	0	0
 tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
-- 
2.20.1
