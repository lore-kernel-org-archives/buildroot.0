From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Sep 2016 13:58:38 +0200
Subject: [Buildroot] [RFC: PATCH 2/3] system: allow auto net configuration
	with networkd
In-Reply-To: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1474113519-24713-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow automatic network configuration via systemd-networkd if selected.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 system/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 77c665b..4f27d4f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -365,7 +365,7 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
-	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && (BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
+	depends on (BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
 	help
 	  Enter here the name of the network interface (E.G. eth0) to
 	  automatically configure through DHCP at bootup.
@@ -375,11 +375,8 @@ config BR2_SYSTEM_DHCP
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
 
-- 
2.4.11
