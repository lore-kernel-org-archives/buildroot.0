From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jun 2014 17:24:18 +0300
Subject: [Buildroot] [PATCH v2 1/2] hostapd: bump to version 2.2
Message-ID: <beac89df1d15b9b192b30dbd1e1363d5a11c7833.1401978259.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.
CONFIG_IEEE80211W is now enabled by default.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
	Remove CONFIG_IEEE80211W (Gustavo Zacarias)
---
 ...-Fix-Beacon-RX-before-AP-setup-completion.patch | 35 ----------------------
 package/hostapd/hostapd.mk                         |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch

diff --git a/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch b/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch
deleted file mode 100644
index d5ac55a67ee1..000000000000
--- a/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 334ec001bbd31c5bc83d6593e58dfbbf6b8785a2 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Thu, 6 Feb 2014 15:22:06 +0200
-Subject: [PATCH] Fix Beacon RX before AP setup completion
-
-It is possible for the driver to report Beacon RX prior to hostapd
-having completed AP mode setup, e.g., when changing country code. Beacon
-frame processing for OLBC was not prepared for this and could trigger
-segfault due to NULL pointer dereference. Fix this by ignoring the
-Beacon frames received prior to completing interface setup when
-determining OLBC updates.
-
-Signed-hostap: Jouni Malinen <j@w1.fi>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ap/ap_list.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/ap/ap_list.c b/src/ap/ap_list.c
-index f9b1540..287d520 100644
---- a/src/ap/ap_list.c
-+++ b/src/ap/ap_list.c
-@@ -32,7 +32,8 @@ static int ap_list_beacon_olbc(struct hostapd_iface *iface, struct ap_info *ap)
- {
- 	int i;
- 
--	if (iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G ||
-+	if (iface->current_mode == NULL ||
-+	    iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G ||
- 	    iface->conf->channel != ap->channel)
- 		return 0;
- 
--- 
-2.0.0.rc2
-
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 5b7dd77483ad..8c5db418e24e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.1
+HOSTAPD_VERSION = 2.2
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
@@ -21,7 +21,6 @@ HOSTAPD_CONFIG_ENABLE = \
 	CONFIG_IEEE80211AC \
 	CONFIG_IEEE80211N \
 	CONFIG_IEEE80211R \
-	CONFIG_IEEE80211W \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_INTERWORKING \
 	CONFIG_LIBNL32 \
-- 
2.0.0.rc2
