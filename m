From: thln <th.ln@ap3.fr>
Date: Tue, 07 Apr 2015 14:23:25 +0200
Subject: [Buildroot] Network configuration form buildroot menu (dhcp +
	static ip)
Message-ID: <5523CC3D.1080002@ap3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I use the version 2015-02 of buildroot.
I want to configure the network interface as static ip.
In the old version of buildroot, I modified the "interfaces" file
located in output/target/etc/network/.
But now my settings are systematically re-written.
So I modified Config.in and system.mk to select the configuration
directly in the menu of buildroot.

I hope it will be usefull for others users. so see below the diff file.

diff -u ../original/Config.in system/Config.in
--- ../original/Config.in	2015-03-01 22:26:12.000000000 +0100
+++ system/Config.in	2015-04-07 12:00:54.022641402 +0200
@@ -326,7 +326,57 @@

 endif # BR2_ROOTFS_SKELETON_DEFAULT

+config BR2_SYSTEM_NETWORK
+menu "Network interface setting"
+	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && (BR2_PACKAGE_BUSYBOX ||
BR2_PACKAGE_IFUPDOWN)
+
+config BR2_SYSTEM_NETWORK_CONFIG
+choice
+	prompt "Network configuration"
+	default BR2_SYSTEM_NETWORK_NO_CONFIG
+	help
+	  Select a configuration.
+
+config BR2_SYSTEM_NETWORK_NO_CONFIG
+	bool "no configuration"
+config BR2_SYSTEM_NETWORK_CONFIG_STATIC
+	bool "static ip"
+config BR2_SYSTEM_NETWORK_CONFIG_DHCP
+	bool "dhcp"
+endchoice
+
+if BR2_SYSTEM_NETWORK_CONFIG_STATIC
+config BR2_SYSTEM_NETWORK_CONFIG_STATIC_NAME
+	string "Network interface nane"
+	default "eth0"
+	help
+      Enter here the name of the network interface (E.G. eth0) to
+	  automatically configure at bootup.

+config BR2_SYSTEM_NETWORK_CONFIG_STATIC_IP
+	string "Network static ip address"
+	default ""
+	help
+      Enter here the ip address of the network interface (E.G. 192.168.0.1)
+	  to automatically configure at bootup.
+
+config BR2_SYSTEM_NETWORK_CONFIG_STATIC_MASK
+	string "Network static netmask"
+	default "255.255.255.0"
+	help
+      Enter here the netmask of the network interface (E.G. 255.255.255.0)
+	  to automatically configure at bootup.
+
+config BR2_SYSTEM_NETWORK_CONFIG_STATIC_GW
+	string "Network static ip gateway address"
+	default ""
+	help
+      Enter here the ip gateway address of the network interface
+	  to automatically configure at bootup.
+endif
+
+
+if BR2_SYSTEM_NETWORK_CONFIG_DHCP
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
@@ -345,6 +395,11 @@

 comment "automatic network configuration via DHCP needs ifupdown or
busybox"
 	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
+endif #BR2_SYSTEM_NETWORK_CONFIG_DHCP
+
+endmenu
+
+

 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
Seulement dans system/: Config.in~
Seulement dans system/: device_table_dev.txt
Seulement dans system/: device_table.txt
Seulement dans system/: skeleton
diff -u ../original/system.mk system/system.mk
--- ../original/system.mk	2015-03-01 22:26:12.000000000 +0100
+++ system/system.mk	2015-04-07 11:47:42.850642300 +0200
@@ -59,10 +59,28 @@
 endef
 endif

+
+NETWORK_STATIC_IFACE = $(call
qstrip,$(BR2_SYSTEM_NETWORK_CONFIG_STATIC_NAME))
+ifneq ($(NETWORK_STATIC_IFACE),)
+define SET_NETWORK_STATIC
+	( \
+		echo ;                                               \
+		echo "auto $(NETWORK_STATIC_IFACE)";                   \
+		echo "iface $(NETWORK_STATIC_IFACE) inet static";      \
+        echo "     address $(BR2_SYSTEM_NETWORK_CONFIG_STATIC_IP)"; \
+        echo "     netmask $(BR2_SYSTEM_NETWORK_CONFIG_STATIC_MASK)"; \
+        echo "     gateway $(BR2_SYSTEM_NETWORK_CONFIG_STATIC_GW)"; \
+	) >> $(TARGET_DIR)/etc/network/interfaces
+endef
+endif
+
+
+
 define SET_NETWORK
 	mkdir -p $(TARGET_DIR)/etc/network/
 	$(SET_NETWORK_LOCALHOST)
 	$(SET_NETWORK_DHCP)
+	$(SET_NETWORK_STATIC)
 endef

 TARGET_FINALIZE_HOOKS += SET_NETWORK
Seulement dans system/: system.mk~
