From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:33 +0200
Subject: [Buildroot] [PATCH 21/22] package/libselinux: bear the kernel
 options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <2e26e65ead8f1fa43ada0c792b54b04d67606f18.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 linux/linux.mk                   |  8 --------
 package/libselinux/libselinux.mk | 10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9e2058e29..3762e718c6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -363,14 +363,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
-	$(if $(BR2_PACKAGE_LIBSELINUX),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX))
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 1461e34539..5f07236791 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -116,5 +116,15 @@ define HOST_LIBSELINUX_INSTALL_CMDS
 		$(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
 endef
 
+define LIBSELINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX)
+endef
+
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.20.1
