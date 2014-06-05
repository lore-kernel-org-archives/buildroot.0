From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jun 2014 13:22:29 +0300
Subject: [Buildroot] [PATCH] hostapd: bump to version 2.2
Message-ID: <a2d2ff5ac6c66d5ee3369224d818db5b5869c475.1401963749.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-Fix-Beacon-RX-before-AP-setup-completion.patch | 35 ----------------------
 package/hostapd/hostapd.mk                         |  2 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
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
index 5b7dd77483ad..744d9b0d4fc6 100644
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
-- 
2.0.0.rc2
