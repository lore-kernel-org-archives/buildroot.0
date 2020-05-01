From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/iptables: bear the kernel options
 munging
Message-ID: <20200501133531.278E290D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee07995ac52d8f1c17b6855cac0e530b24bd5946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk               | 5 -----
 package/iptables/iptables.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8867be44f7..14dc78fc9e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,11 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
-	$(if $(BR2_PACKAGE_IPTABLES),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES))
 	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index ae5cf4ddd3..7b964aaf41 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -47,4 +47,11 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+define IPTABLES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+endef
+
 $(eval $(autotools-package))
