From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:24:28 +0200
Subject: [Buildroot] [git commit] hostapd: bump to version 2.2
Message-ID: <20140605201506.B04F59CEE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b912fff5500653856697cf8d339ebeb59be8d05b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.
CONFIG_IEEE80211W is now enabled by default.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-Beacon-RX-before-AP-setup-completion.patch |   35 --------------------
 package/hostapd/hostapd.mk                         |    3 +-
 2 files changed, 1 insertions(+), 37 deletions(-)

diff --git a/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch b/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch
deleted file mode 100644
index d5ac55a..0000000
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
index 5b7dd77..8c5db41 100644
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
