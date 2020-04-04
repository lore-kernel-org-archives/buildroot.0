From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:28 +0200
Subject: [Buildroot] [PATCH 16/22] package/smack: bear the kernel options
 munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <dc697400fa3e5096ac8754cc588cd29e4a56d20c.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 linux/linux.mk         | 4 ----
 package/smack/smack.mk | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0a504dc615..6ce984b22b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,10 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_SMACK),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK))
 	$(if $(BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA))
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index d2ac005ab9..b7b656e644 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -14,4 +14,10 @@ SMACK_DEPENDENCIES = host-pkgconf
 # Sources from GitHub, no configure script included.
 SMACK_AUTORECONF = YES
 
+define SMAKE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
