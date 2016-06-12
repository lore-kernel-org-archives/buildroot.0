From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:26 +0200
Subject: [Buildroot] [PATCH 21/24] system/systemd: needs timezone
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <21fe14a436de3234cf84093076116caa64033da9.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd does not like being booted without any timezone info (especially
on a R/O filesystem), so we forcibly enable that. If there is no default
timezone set, we fallback to UTC (which is basically what no TZ means
anyway).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton-systemd/skeleton-systemd.mk | 7 +++++++
 system/Config.in                             | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
index e781ce9..b45bbde 100644
--- a/package/skeleton-systemd/skeleton-systemd.mk
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -31,12 +31,19 @@ SKELETON_SYSTEMD_TARGET_FINALIZE_HOOKS += SKELETON_SYSTEMD_SET_NETWORK
 
 endif # BR2_PACKAGE_SYSTEMD_NETWORKD not set
 
+SKELETON_SYSTEM_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+ifeq ($(SKELETON_SYSTEM_LOCALTIME),)
+SKELETON_SYSTEM_LOCALTIME = Etc/UTC
+endif
+
 define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
 	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	ln -sf ../usr/share/zoneinfo/$(SKELETON_SYSTEMD_LOCALTIME) \
+		$(TARGET_DIR)/etc/localtime
 	$(SKELETON_SYSTEMD_RSYNC_NETWORK)
 endef
 
diff --git a/system/Config.in b/system/Config.in
index 17ce832..07af2e0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -130,6 +130,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	select BR2_TARGET_TZ_INFO
 
 comment "systemd needs (e)glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-- 
2.7.4
