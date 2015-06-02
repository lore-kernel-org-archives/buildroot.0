From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 14:52:12 -0300
Subject: [Buildroot] [PATCH 1/3] boot/uboot: remove deprecated network
	settings option
Message-ID: <1433267534-12710-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated since the 2014.05 release, so a year has passed.
Add legacy info as well to raise a warning when it's used.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy     |  9 +++++++++
 boot/uboot/Config.in | 46 ----------------------------------------------
 boot/uboot/uboot.mk  |  6 ------
 3 files changed, 9 insertions(+), 52 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 44de941..9b9fff0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -105,6 +105,15 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2015.08"
+
+config BR2_TARGET_UBOOT_NETWORK
+	bool "U-Boot custom network settings removed"
+	select BR2_LEGACY
+	help
+	  U-Boot's custom network settings options have been removed.
+
+###############################################################################
 comment "Legacy options removed in 2015.05"
 
 config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4f01499..e884cc0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -192,52 +192,6 @@ config BR2_TARGET_UBOOT_OMAP_IFT_CONFIG
 
 endif
 
-menuconfig BR2_TARGET_UBOOT_NETWORK
-	bool "Custom Network Settings"
-	depends on BR2_DEPRECATED_SINCE_2014_05
-	help
-	  Custom network settings for U-boot
-
-if BR2_TARGET_UBOOT_NETWORK
-
-config BR2_TARGET_UBOOT_SERVERIP
-	string "server ip"
-	default "10.175.196.221"
-	help
-	  TFTP server ip address
-
-config BR2_TARGET_UBOOT_IPADDR
-	string "ip address"
-	default "10.175.196.18"
-	help
-	  Target ip address
-
-config BR2_TARGET_UBOOT_GATEWAY
-	string "gateway ip"
-	default "10.175.196.1"
-	help
-	  Gateway ip address
-
-config BR2_TARGET_UBOOT_NETMASK
-	string "netmask"
-	default "255.255.255.0"
-	help
-	  Network Mask
-
-config BR2_TARGET_UBOOT_ETHADDR
-	string "ethernet address"
-	default "04:25:fe:ed:00:18"
-	help
-	  Target MAC address for the ethernet interface.
-	  This should be changed for production units
-
-config BR2_TARGET_UBOOT_ETH1ADDR
-	string "ethernet 2 address"
-	help
-	  Target MAC address for the second ethernet interface.
-
-endif # BR2_TARGET_UBOOT_NETWORK
-
 config BR2_TARGET_UBOOT_SPL
 	bool "Install U-Boot SPL binary image"
 	depends on !BR2_TARGET_XLOADER
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 410d8d8..14a696a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -131,12 +131,6 @@ define UBOOT_CONFIGURE_CMDS
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
 	$(call insert_define,DATE,$(DATE))
 	$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
-	$(call insert_define,CONFIG_IPADDR,$(BR2_TARGET_UBOOT_IPADDR))
-	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_TARGET_UBOOT_GATEWAY))
-	$(call insert_define,CONFIG_NETMASK,$(BR2_TARGET_UBOOT_NETMASK))
-	$(call insert_define,CONFIG_SERVERIP,$(BR2_TARGET_UBOOT_SERVERIP))
-	$(call insert_define,CONFIG_ETHADDR,$(BR2_TARGET_UBOOT_ETHADDR))
-	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_TARGET_UBOOT_ETH1ADDR))
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(@D)/include/config.h
 endef
 
-- 
2.3.6
