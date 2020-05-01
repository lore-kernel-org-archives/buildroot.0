From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/libselinux: bear the kernel
 options munging
Message-ID: <20200501133531.44C2E90D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49bf417618a5c9699ebcdfde82f8cb9ccbd5a00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                   |  8 --------
 package/libselinux/libselinux.mk | 10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 71495de143..6e2006836e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -370,14 +370,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_APPARMOR)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_APPARMOR))
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
index 258065b79d..d0e7b66241 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -103,5 +103,15 @@ define HOST_LIBSELINUX_INSTALL_CMDS
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
