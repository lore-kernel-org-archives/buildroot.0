From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: bear the
 kernel options munging
Message-ID: <20200501133531.39C3590D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b294165e01f9982b39405a9e00753883088d2c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                                           | 6 ------
 package/wireguard-linux-compat/wireguard-linux-compat.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e10e2a466b..71495de143 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,12 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
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
index 27f5981ae3..6d90245bd2 100644
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
