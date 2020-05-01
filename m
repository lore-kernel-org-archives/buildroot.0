From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/xtables-addons: bear the kernel
 options munging
Message-ID: <20200501133531.3052D90D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d8e61e827ecf4276e787941fb4d35ccdefcaaee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                           | 5 -----
 package/xtables-addons/xtables-addons.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 14dc78fc9e..e10e2a466b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,11 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
-	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT))
 	$(if $(BR2_PACKAGE_WIREGUARD_LINUX_COMPAT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 1a74b80f46..dab57d980e 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -30,4 +30,11 @@ define XTABLES_ADDONS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
 endef
 
+define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+endef
+
 $(eval $(autotools-package))
