From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 08:20:11 +0200
Subject: [Buildroot] [git commit] linux: Force CONFIG_NET=y when using
 mdev+devtempfs for /dev management
Message-ID: <20190731062114.86BE588589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78e596719f43df6ffcb2a84f5160589c2a8d59a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since mdev was switched to the daemon mode introduced in Busybox 1.31.0,
it requires CONFIG_NET to be enabled in the kernel such that the mdev
daemon can listen to netlink events.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index a1378345c3..29d2f0ee69 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -335,6 +335,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config))
 	$(if $(BR2_PACKAGE_AUDIT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
