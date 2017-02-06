From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 17:56:14 +0100
Subject: [Buildroot] [git commit] system(d): allow auto net configuration
	with networkd
Message-ID: <20170206174814.32BF581F79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d997d6890f1d045c4d6084148fd9b2d674a6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow automatic network configuration via systemd-networkd if selected.

If systemd-networkd is enabled and $BR2_SYSTEM_DHCP is set, then create
a .network file to configure the selected network interface via DHCP.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Thomas:
 - merge the two patches from Eric into just one
 - instead of generating the dhcp.network file completely from the .mk
   file, use a template file, and "sed" it with the right network
   interface]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 9 +++++++++
 system/Config.in           | 9 +++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 278c8e9..fce5d84 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -281,6 +281,14 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
+SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
+define SYSTEMD_INSTALL_NETWORK_CONFS
+	sed s/SYSTEMD_NETWORKD_DHCP_IFACE/$(SYSTEMD_NETWORKD_DHCP_IFACE)/ \
+		package/systemd/dhcp.network > \
+		$(TARGET_DIR)/etc/systemd/network/dhcp.network
+endef
+endif
 else
 SYSTEMD_CONF_OPTS += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
@@ -383,6 +391,7 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
 	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
 	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
+	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
 $(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index 875ed37..3ddf843 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -372,7 +372,7 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
-	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && (BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD
 	help
 	  Enter here the name of the network interface (E.G. eth0) to
 	  automatically configure through DHCP at bootup.
@@ -382,11 +382,8 @@ config BR2_SYSTEM_DHCP
 	  For more complicated network setups use an overlay to overwrite
 	  /etc/network/interfaces or add a networkd configuration file.
 
-comment "automatic network configuration via DHCP is not compatible with networkd"
-	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
-
-comment "automatic network configuration via DHCP needs ifupdown or busybox"
-	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
+comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
+	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
