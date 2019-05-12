From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 12 May 2019 21:55:45 +0200
Subject: [Buildroot] [PATCH v2 08/13]
 package/openrc-netifrc/openrc-netifrc.mk: add support for BR2_SYSTEM_DHCP
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190512195550.24457-8-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes openrc-netifrc package aware of BR2_SYSTEM_DHCP
config, and if set, will start dhcp daemon on configured interface.

* system/Config.in
  Changes dependency of BR2_SYSTEM_DHCP config.

  When INIT_OPENRC is not set, DHCP is available to set if any of
  BUSYBOX, IFUPDOWN or NETWORKD is enabled, OPENRC_NETIFRC is
  ignored and will always be disabled since it depends on OPENRC.

  When INIT_OPENRC is set, DHCP is available to set only when
  OPENRC_NETIFRC is enabled. Rest of the options are ignored and
  asserted to disable with "&& !BR2_PACKAGE_OPENRC"

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2
  Own initiative:
  - add short description about changes in system/Config.in
---
 package/openrc-netifrc/openrc-netifrc.mk | 10 ++++++++++
 system/Config.in                         | 10 +++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/openrc-netifrc/openrc-netifrc.mk b/package/openrc-netifrc/openrc-netifrc.mk
index 55421af72f..d9cf03eeb9 100644
--- a/package/openrc-netifrc/openrc-netifrc.mk
+++ b/package/openrc-netifrc/openrc-netifrc.mk
@@ -50,4 +50,14 @@ endef
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
