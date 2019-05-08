From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:32 +0200
Subject: [Buildroot] [PATCH 08/13] package/openrc-netifrc/openrc-netifrc.mk:
 add support for BR2_SYSTEM_DHCP
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-8-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes openrc-netifrc package aware of BR2_SYSTEM_DHCP
config, and if set, will start dhcp daemon on configured interface.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 package/openrc-netifrc/openrc-netifrc.mk | 10 ++++++++++
 system/Config.in                         | 10 +++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/openrc-netifrc/openrc-netifrc.mk b/package/openrc-netifrc/openrc-netifrc.mk
index 6f2985cada..498bdfafe4 100644
--- a/package/openrc-netifrc/openrc-netifrc.mk
+++ b/package/openrc-netifrc/openrc-netifrc.mk
@@ -56,4 +56,14 @@ endef
 OPENRC_NETIFRC_TARGET_FINALIZE_HOOKS += OPENRC_NETIFRC_INSTALL
 endif # BR2_PACKAGE_OPENRC_NETIFRC
 
+OPENRC_NETIFRC_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+ifneq ($(OPENRC_NETIFRC_DHCP_IFACE),)
+define OPENRC_NETIFRC_SYSTEM_DHCP
+	echo "config_$(OPENRC_NETIFRC_DHCP_IFACE)=\"dhcp\"" >> $(TARGET_DIR)/etc/conf.d/net
+	ln -sf net.lo $(TARGET_DIR)/etc/init.d/net.$(OPENRC_NETIFRC_DHCP_IFACE)
+	ln -sf /etc/init.d/net.$(OPENRC_NETIFRC_DHCP_IFACE) $(TARGET_DIR)/etc/runlevels/default/net.$(OPENRC_NETIFRC_DHCP_IFACE)
+endef
+OPENRC_NETIFRC_TARGET_FINALIZE_HOOKS += OPENRC_NETIFRC_SYSTEM_DHCP
+endif # BR2_SYSTEM_DHCP
+
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 90aa0e52b9..32c502e310 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -372,7 +372,9 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
-	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD
+	depends on ((BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
+		BR2_PACKAGE_SYSTEMD_NETWORKD) && !BR2_PACKAGE_OPENRC) || \
+		BR2_PACKAGE_OPENRC_NETIFRC
 	help
 	  Enter here the name of the network interface (E.G. eth0) to
 	  automatically configure through DHCP at bootup.
@@ -383,8 +385,10 @@ config BR2_SYSTEM_DHCP
 	  overwrite /etc/network/interfaces or add a networkd
 	  configuration file.
 
-comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
-	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
+comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd or openrc-netifrc"
+	depends on !(((BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
+		BR2_PACKAGE_SYSTEMD_NETWORKD) && !BR2_PACKAGE_OPENRC) || \
+		BR2_PACKAGE_OPENRC_NETIFRC)
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
-- 
2.18.1
