From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:32 +0200
Subject: [Buildroot] [PATCH 20/22] package/wireguard-linux-compat: bear the
 kernel options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <6265250d1096ce11aa6a90bd0c6933d24fa72dab.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                                           | 6 ------
 package/wireguard-linux-compat/wireguard-linux-compat.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eb2bfbfa3f..b9e2058e29 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,12 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_WIREGUARD_LINUX_COMPAT),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_FOU)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MANAGER))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB))
 	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 747cef3e50..8c8743bb4b 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -11,5 +11,13 @@ WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
 WIREGUARD_LINUX_COMPAT_LICENSE_FILES = COPYING
 WIREGUARD_LINUX_COMPAT_MODULE_SUBDIRS = src
 
+define WIREGUARD_LINUX_COMPAT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_FOU)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MANAGER)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.20.1
