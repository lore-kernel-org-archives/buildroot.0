From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 20 Jun 2019 18:59:44 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Force CONFIG_NET=y when using
 mdev+devtempfs for /dev management
Message-ID: <20190620165944.71127-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since mdev was switched to the daemon mode introduced in Busybox 1.31.0,
it requires CONFIG_NET to be enabled in the kernel such that the mdev
daemon can listen to netlink events.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index dd182d06b2..7468f1be60 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -333,6 +333,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config))
 	$(if $(BR2_PACKAGE_AUDIT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
-- 
2.21.0
