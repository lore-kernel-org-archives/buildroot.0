From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:57:04 +0200
Subject: [Buildroot] [git commit] package/netifrc: add support for
 BR2_SYSTEM_DHCP
Message-ID: <20190923210219.3A2F38F193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33de483931faf77cb6cd4a82040d47f6db0e7709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes openrc-netifrc package aware of BR2_SYSTEM_DHCP
config, and if set, will start dhcp daemon on configured interface.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - simplify condition for BR2_SYSTEM_DHCP
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netifrc/netifrc.mk | 12 ++++++++++++
 system/Config.in           |  8 +++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/netifrc/netifrc.mk b/package/netifrc/netifrc.mk
index 5dc262230b..d13dc356f3 100644
--- a/package/netifrc/netifrc.mk
+++ b/package/netifrc/netifrc.mk
@@ -32,8 +32,19 @@ define NETIFRC_REMOVE_UDEV
 endef
 endif # BR2_PACKAGE_HAS_UDEV
 
+NETIFRC_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+ifneq ($(NETIFRC_DHCP_IFACE),)
+NETIFRC_DHCP_CFG = config_$(NETIFRC_DHCP_IFACE)="dhcp"
+define NETIFRC_DHCP_SERVICE
+	ln -sf net.lo $(TARGET_DIR)/etc/init.d/net.$(NETIFRC_DHCP_IFACE)
+	ln -sf /etc/init.d/net.$(NETIFRC_DHCP_IFACE) \
+		$(TARGET_DIR)/etc/runlevels/default/net.$(NETIFRC_DHCP_IFACE)
+endef
+endif # BR2_SYSTEM_DHCP != ""
+
 define NETIFRC_NET_CFG
 	config_lo="127.0.0.1/8"
+	$(NETIFRC_DHCP_CFG)
 endef
 
 define NETIFRC_INSTALL_TARGET_CMDS
@@ -41,6 +52,7 @@ define NETIFRC_INSTALL_TARGET_CMDS
 	$(NETIFRC_REMOVE_UDEV)
 	$(call PRINTF,$(NETIFRC_NET_CFG)) > $(TARGET_DIR)/etc/conf.d/net
 	ln -sf /etc/init.d/net.lo $(TARGET_DIR)/etc/runlevels/default/net.lo
+	$(NETIFRC_DHCP_SERVICE)
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 1bfe069b2e..c87266f431 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -377,7 +377,8 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
-	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
+		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC
 	help
 	  Enter here the name of the network interface (E.G. eth0) to
 	  automatically configure through DHCP at bootup.
@@ -388,8 +389,9 @@ config BR2_SYSTEM_DHCP
 	  overwrite /etc/network/interfaces or add a networkd
 	  configuration file.
 
-comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
-	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
+comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd or netifrc"
+	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
+		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
