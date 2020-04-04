From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:31 +0200
Subject: [Buildroot] [PATCH 19/22] package/xtables-addons: bear the kernel
 options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <9ddef22e530b82e92f5438c6f766b8f6d32de72c.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk                           | 5 -----
 package/xtables-addons/xtables-addons.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 36cb49b84a..eb2bfbfa3f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,11 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
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
-- 
2.20.1
