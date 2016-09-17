From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Sep 2016 13:58:39 +0200
Subject: [Buildroot] [RFC: PATCH 3/3] system: enable predictable net
	interface names
In-Reply-To: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since v197, udev and eudev automatically assign predictable, stable
network interface names for all local Ethernet, WLAN and WWAN
interfaces.

This is a departure from the traditional interface naming scheme
(eth0, eth1, etc).

Add a configuration option to enable or disable this feature, which is
disabled by default to be coherent with the behavior set when udev is
not used.

See https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
for details.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/skeleton/skeleton.mk | 11 +++++++++++
 system/Config.in             | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..74b0636 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -242,6 +242,17 @@ endif
 TARGET_FINALIZE_HOOKS += SKELETON_REMOUNT_RW
 endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 
+ifeq ($(BR2_SYSTEM_PREDICTABLE_NETIF_NAMES),y)
+define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
+	rm -f $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules
+endef
+else
+define SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
+	touch $(TARGET_DIR)/etc/udev/rules.d/80-net-setup-links.rules
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_MANAGE_PREDITABLE_NETIF_NAMES
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 4f27d4f..59af77e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -172,6 +172,17 @@ endchoice
 comment "/dev management using udev (from systemd)"
 	depends on BR2_INIT_SYSTEMD
 
+config BR2_SYSTEM_PREDICTABLE_NETIF_NAMES
+	bool "Predictable network interface names"
+	depends on BR2_PACKAGE_HAS_UDEV
+	default n
+	help
+	  udev can assign predictable, stable network interface names for all
+	  local Ethernet, WLAN and WWAN interfaces. This is a departure from
+	  the traditional interface naming scheme (eth0, eth1, etc).
+
+	  Say yes to active this naming scheme.
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "system/device_table.txt"
-- 
2.4.11
