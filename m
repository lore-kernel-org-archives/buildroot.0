From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 12 May 2019 21:55:43 +0200
Subject: [Buildroot] [PATCH v2 06/13] package/skeleton-init-openrc: add
 support to remount rootfs as rw
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190512195550.24457-6-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support to openrc skeleton to monitor
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW and remount rootfs as rw when
options is set.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2
  None
---
 .../skeleton-init-openrc/skeleton-init-sysv.mk    | 15 +++++++++++++++
 package/skeleton-init-openrc/skeleton/etc/fstab   |  1 +
 2 files changed, 16 insertions(+)

diff --git a/package/skeleton-init-openrc/skeleton-init-sysv.mk b/package/skeleton-init-openrc/skeleton-init-sysv.mk
index 5ee2192093..bbe80071ae 100644
--- a/package/skeleton-init-openrc/skeleton-init-sysv.mk
+++ b/package/skeleton-init-openrc/skeleton-init-sysv.mk
@@ -15,8 +15,23 @@ SKELETON_INIT_OPENRC_DEPENDENCIES = skeleton-init-common
 
 SKELETON_INIT_OPENRC_PROVIDES = skeleton
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+# Comment /dev/root entry in fstab. When openrc does not find fstab entry for
+# "/", it will try to remount "/" as "rw".
+define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
+	$(SED) '/^ *\/dev\/root.*$$/s~^~#~' $(TARGET_DIR)/etc/fstab
+endef
+else
+# Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
+# it and doesn't remount root to rw.
+define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
+	$(SED) '/^# *\/dev\/root.*$$/s~^#\+~~' $(TARGET_DIR)/etc/fstab
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
2.18.1
