From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 13:43:01 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/hostapd: fix
 CVE-2019-16275
Message-ID: <20200408113318.F2F0E8DB46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4526a5a2494966d19a9d48b0c3ddc8fc4631018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

hostapd before 2.10 and wpa_supplicant before 2.10 allow an incorrect
indication of disconnection in certain situations because source address
validation is mishandled. This is a denial of service that should have
been prevented by PMF (aka management frame protection). The attacker
must send a crafted 802.11 frame from a location that is within the
802.11 communications range.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 749fbab0bb4bad3748d164f8c25485618f0ed1ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-ignore-management-frame-from-unexpected-.patch | 77 ++++++++++++++++++++++
 package/hostapd/hostapd.mk                         |  4 ++
 2 files changed, 81 insertions(+)

diff --git a/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
new file mode 100644
index 0000000000..959788c2e9
--- /dev/null
+++ b/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
@@ -0,0 +1,77 @@
+From 8c07fa9eda13e835f3f968b2e1c9a8be3a851ff9 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 29 Aug 2019 11:52:04 +0300
+Subject: [PATCH] AP: Silently ignore management frame from unexpected source
+ address
+
+Do not process any received Management frames with unexpected/invalid SA
+so that we do not add any state for unexpected STA addresses or end up
+sending out frames to unexpected destination. This prevents unexpected
+sequences where an unprotected frame might end up causing the AP to send
+out a response to another device and that other device processing the
+unexpected response.
+
+In particular, this prevents some potential denial of service cases
+where the unexpected response frame from the AP might result in a
+connected station dropping its association.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://w1.fi/security/2019-7/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch]
+---
+ src/ap/drv_callbacks.c | 13 +++++++++++++
+ src/ap/ieee802_11.c    | 12 ++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
+index 31587685fe3b..34ca379edc3d 100644
+--- a/src/ap/drv_callbacks.c
++++ b/src/ap/drv_callbacks.c
+@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
+ 			   "hostapd_notif_assoc: Skip event with no address");
+ 		return -1;
+ 	}
++
++	if (is_multicast_ether_addr(addr) ||
++	    is_zero_ether_addr(addr) ||
++	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
++			   " in received indication - ignore this indication silently",
++			   __func__, MAC2STR(addr));
++		return 0;
++	}
++
+ 	random_add_randomness(addr, ETH_ALEN);
+ 
+ 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index c85a28db44b7..e7065372e158 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
+ 	fc = le_to_host16(mgmt->frame_control);
+ 	stype = WLAN_FC_GET_STYPE(fc);
+ 
++	if (is_multicast_ether_addr(mgmt->sa) ||
++	    is_zero_ether_addr(mgmt->sa) ||
++	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
++			   " in received frame - ignore this frame silently",
++			   MAC2STR(mgmt->sa));
++		return 0;
++	}
++
+ 	if (stype == WLAN_FC_STYPE_BEACON) {
+ 		handle_beacon(hapd, mgmt, len, fi);
+ 		return 1;
+-- 
+2.20.1
+
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index f8c144c236..b94a0e4578 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -12,6 +12,10 @@ HOSTAPD_DEPENDENCIES = host-pkgconf
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
 HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
+
+# 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
+HOSTAPD_IGNORE_CVES += CVE-2019-16275
+
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
