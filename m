From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  3 Oct 2016 01:30:08 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: bump to version 1.4.2
Message-ID: <20161002233008.15982-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches:
* 0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch:
no longer relevant (tested on 3.9 for raspberrypi)
* 0002-accept-auto-mode-interfaces.patch: accepted upstream

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ..._user_ipv6ll_enabled-to-nm-platform-linux.patch | 87 ----------------------
 .../0002-accept-auto-mode-interfaces.patch         | 26 -------
 package/network-manager/network-manager.hash       |  4 +-
 package/network-manager/network-manager.mk         |  4 +-
 4 files changed, 4 insertions(+), 117 deletions(-)
 delete mode 100644 package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
 delete mode 100644 package/network-manager/0002-accept-auto-mode-interfaces.patch

diff --git a/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch b/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
deleted file mode 100644
index 4aebaef..0000000
--- a/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From: Lubomir Rintel <lkundrak@v3.sk>
-Date: Mon, 20 Jul 2015 11:01:04 +0200
-Subject: [PATCH] platform: move link_get_user_ipv6ll_enabled() to	nm-platform-linux
-Source: https://mail.gnome.org/archives/networkmanager-list/2015-July/msg00028.html
-
-This fixes build error kernels headers < 3.17.
-
-Reported-by: Petr Vorel <petr.vorel@gmail.com>
-Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- src/platform/nm-linux-platform.c | 16 ++++++++++++++++
- src/platform/nm-platform.c       | 11 ++---------
- src/platform/nm-platform.h       |  1 +
- 3 files changed, 19 insertions(+), 9 deletions(-)
-
-diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
-index f3a9254..b6b8e33 100644
---- a/src/platform/nm-linux-platform.c
-+++ b/src/platform/nm-linux-platform.c
-@@ -2987,6 +2987,21 @@ link_set_user_ipv6ll_enabled (NMPlatform *platform, int ifindex, gboolean enable
- }
-
- static gboolean
-+link_get_user_ipv6ll_enabled (NMPlatform *platform, int ifindex)
-+{
-+#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
-+       {
-+               const NMPlatformLink *pllink;
-+
-+               pllink = nm_platform_link_get (platform, ifindex);
-+               if (pllink && pllink->inet6_addr_gen_mode_inv)
-+                       return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
-+       }
-+#endif
-+       return FALSE;
-+}
-+
-+static gboolean
- link_supports_carrier_detect (NMPlatform *platform, int ifindex)
- {
-        const char *name = nm_platform_link_get_name (platform, ifindex);
-@@ -4968,6 +4968,7 @@
-	platform_class->link_get_udev_device = link_get_udev_device;
-
-	platform_class->link_set_user_ipv6ll_enabled = link_set_user_ipv6ll_enabled;
-+	platform_class->link_get_user_ipv6ll_enabled = link_get_user_ipv6ll_enabled;
-
-	platform_class->link_set_address = link_set_address;
-	platform_class->link_get_permanent_address = link_get_permanent_address;
-
-diff --git a/src/platform/nm-platform.c b/src/platform/nm-platform.c
-index 8803377..ee4b1a1 100644
---- a/src/platform/nm-platform.c
-+++ b/src/platform/nm-platform.c
-@@ -965,15 +965,8 @@
-
-	g_return_val_if_fail (ifindex >= 0, FALSE);
-
--#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
--	{
--		const NMPlatformLink *pllink;
--
--		pllink = nm_platform_link_get (self, ifindex);
--		if (pllink && pllink->inet6_addr_gen_mode_inv)
--			return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
--	}
--#endif
-+	if (klass->link_get_user_ipv6ll_enabled)
-+		return klass->link_get_user_ipv6ll_enabled (self, ifindex);
-	return FALSE;
- }
-
-diff --git a/src/platform/nm-platform.h b/src/platform/nm-platform.h
-index 16eb351..9ef4080 100644
---- a/src/platform/nm-platform.h
-+++ b/src/platform/nm-platform.h
-@@ -446,6 +446,7 @@
-	GObject *(*link_get_udev_device) (NMPlatform *self, int ifindex);
-
-	gboolean (*link_set_user_ipv6ll_enabled) (NMPlatform *, int ifindex, gboolean enabled);
-+	gboolean (*link_get_user_ipv6ll_enabled) (NMPlatform *, int ifindex);
-
-	gboolean (*link_get_permanent_address) (NMPlatform *,
-	                                        int ifindex,
---
-2.4.3
diff --git a/package/network-manager/0002-accept-auto-mode-interfaces.patch b/package/network-manager/0002-accept-auto-mode-interfaces.patch
deleted file mode 100644
index d7ef348..0000000
--- a/package/network-manager/0002-accept-auto-mode-interfaces.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0f6febc6fbeafde62e6e0a8c12f57204d94166fb Mon Sep 17 00:00:00 2001
-From: Francesco Giudici <fgiudici@redhat.com>
-Date: Fri, 11 Mar 2016 09:55:39 +0100
-Subject: wifi: hack for wext devices reporting IW_MODE_AUTO configuration
- mode.
-
-Backport from upstream commit
-https://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=0f6febc6fbeafde62e6e0a8c12f57204d94166f.
-
-Signed-off-by: Ilya A. Volynets-Evenbakh <ilya@total-knowledge.com>
-
-diff --git a/src/platform/wifi/wifi-utils-wext.c b/src/platform/wifi/wifi-utils-wext.c
-index 26f4ce4..af285b4 100644
---- a/src/platform/wifi/wifi-utils-wext.c
-+++ b/src/platform/wifi/wifi-utils-wext.c
-@@ -118,6 +118,7 @@ wifi_wext_get_mode (WifiData *data)
- 	case IW_MODE_MASTER:
- 		return NM_802_11_MODE_AP;
- 	case IW_MODE_INFRA:
-+	case IW_MODE_AUTO: /* hack for WEXT devices reporting IW_MODE_AUTO */
- 		return NM_802_11_MODE_INFRA;
- 	default:
- 		break;
--- 
-cgit v0.10.2
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index ab601bc..94f3e26 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.12.sha256sum
-sha256 3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e  NetworkManager-1.0.12.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.4/NetworkManager-1.4.2.sha256sum
+sha256 a864e347ddf6da8dabd40e0185b8c10a655d4a94b45cbaa2b3bb4b5e8360d204  NetworkManager-1.4.2.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 12b8f3c..663348a 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.0
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
+NETWORK_MANAGER_VERSION_MAJOR = 1.4
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
1.8.0
