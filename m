From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:30 +0200
Subject: [Buildroot] [PATCH 18/22] package/iptables: bear the kernel options
 munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <a3b90f766e42e15c95d79401b12af127633c15b3.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk               | 5 -----
 package/iptables/iptables.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e4dfefde48..36cb49b84a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,11 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
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
-- 
2.20.1
