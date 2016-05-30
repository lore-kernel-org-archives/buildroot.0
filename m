From: Ilya A. Volynets-Evenbakh <iluxave@gmail.com>
Date: Mon, 30 May 2016 19:33:15 +0300
Subject: [Buildroot] [PATCH] package/network-manager: support WEXT drivers
	which report mode AUTO
Message-ID: <1464625995-566-1-git-send-email-iluxave@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Ilya A. Volynets-Evenbakh" <ilya@total-knowledge.com>

Some wireless drivers report IW_MODE_AUTO instead of IW_MODE_MANAGED.
NetworkManager 1.0.12 introduced a change, which makes it skip such
interfaces.

This patch is a backport of a workaround for this problem from the
NetworkManager upstream.

Signed-off-by: Ilya A. Volynets-Evenbakh <ilya@total-knowledge.com>
---
 .../0002-accept-auto-mode-interfaces.patch         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/network-manager/0002-accept-auto-mode-interfaces.patch

diff --git a/package/network-manager/0002-accept-auto-mode-interfaces.patch b/package/network-manager/0002-accept-auto-mode-interfaces.patch
new file mode 100644
index 0000000..3ea1de6
--- /dev/null
+++ b/package/network-manager/0002-accept-auto-mode-interfaces.patch
@@ -0,0 +1,23 @@
+From 0f6febc6fbeafde62e6e0a8c12f57204d94166fb Mon Sep 17 00:00:00 2001
+From: Francesco Giudici <fgiudici@redhat.com>
+Date: Fri, 11 Mar 2016 09:55:39 +0100
+Subject: wifi: hack for wext devices reporting IW_MODE_AUTO configuration
+ mode.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=763388
+
+diff --git a/src/platform/wifi/wifi-utils-wext.c b/src/platform/wifi/wifi-utils-wext.c
+index 26f4ce4..af285b4 100644
+--- a/src/platform/wifi/wifi-utils-wext.c
++++ b/src/platform/wifi/wifi-utils-wext.c
+@@ -118,6 +118,7 @@ wifi_wext_get_mode (WifiData *data)
+ 	case IW_MODE_MASTER:
+ 		return NM_802_11_MODE_AP;
+ 	case IW_MODE_INFRA:
++	case IW_MODE_AUTO: /* hack for WEXT devices reporting IW_MODE_AUTO */
+ 		return NM_802_11_MODE_INFRA;
+ 	default:
+ 		break;
+-- 
+cgit v0.10.2
+
-- 
2.7.3
