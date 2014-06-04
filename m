From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 23:08:52 +0200
Subject: [Buildroot] [git commit] hostapd: backport rt5370 fix from upstream
Message-ID: <20140604210907.312A89CE97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a12bc334d4673df1c2abf6311f6f85f93d53cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #7166

hostapd crashes with segfault when using RT5370. This is because the driver
reports Beacon RX prior to hostapd having completed the AP mode setup.

This upstream commit fixes it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-Beacon-RX-before-AP-setup-completion.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch b/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch
new file mode 100644
index 0000000..d5ac55a
--- /dev/null
+++ b/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch
@@ -0,0 +1,35 @@
+From 334ec001bbd31c5bc83d6593e58dfbbf6b8785a2 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 6 Feb 2014 15:22:06 +0200
+Subject: [PATCH] Fix Beacon RX before AP setup completion
+
+It is possible for the driver to report Beacon RX prior to hostapd
+having completed AP mode setup, e.g., when changing country code. Beacon
+frame processing for OLBC was not prepared for this and could trigger
+segfault due to NULL pointer dereference. Fix this by ignoring the
+Beacon frames received prior to completing interface setup when
+determining OLBC updates.
+
+Signed-hostap: Jouni Malinen <j@w1.fi>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ap/ap_list.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/ap/ap_list.c b/src/ap/ap_list.c
+index f9b1540..287d520 100644
+--- a/src/ap/ap_list.c
++++ b/src/ap/ap_list.c
+@@ -32,7 +32,8 @@ static int ap_list_beacon_olbc(struct hostapd_iface *iface, struct ap_info *ap)
+ {
+ 	int i;
+ 
+-	if (iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G ||
++	if (iface->current_mode == NULL ||
++	    iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G ||
+ 	    iface->conf->channel != ap->channel)
+ 		return 0;
+ 
+-- 
+2.0.0.rc2
+
