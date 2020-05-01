From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:28 +0200
Subject: [Buildroot] [git commit] package/smack: bear the kernel options
 munging
Message-ID: <20200501133531.122B590D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bac81f0cb776aca8e575459d07158a8d958737d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk         | 4 ----
 package/smack/smack.mk | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c122ab70e0..ca5dd692d7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,10 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
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
