Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB4C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155D860687;
	Sun, 13 Nov 2022 16:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155D860687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwdURFfVmzzC; Sun, 13 Nov 2022 16:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6B0605BE;
	Sun, 13 Nov 2022 16:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D6B0605BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E67651BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C328175F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C328175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oU-Vgbyk4XRn for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA17D81749
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA17D81749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1FDE8373F; Sun, 13 Nov 2022 16:48:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:42:42 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ddf37bca501b9e182e95384a8dd694ef835c927c
X-Git-Newrev: f55f66f59a11c68d71cabc6a20e3c808f739e2a3
X-Patchwork-Hint: ignore
Message-Id: <20221113164817.B1FDE8373F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/hostapd: fix
 static build issue with zlib-ng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f55f66f59a11c68d71cabc6a20e3c808f739e2a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Hostapd uses 'crc32' name for IEEE802.11 CRC-32 routine. This name is
too generic. Buildroot autobuilder detected configurations that failed
to build due to the naming conflict with zlib-ng.

Add hostapd part of the upstream patch that renames 'crc32' function
to a less generic 'ieee80211_crc32' name.

Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d920f9d4060d7603da2074c3db167c39e4881fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...generic-name-for-IEEE802.11-CRC-32-routin.patch | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch b/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
new file mode 100644
index 0000000000..bf85e97f21
--- /dev/null
+++ b/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
@@ -0,0 +1,102 @@
+From 9896d8c116f054cebc49928404018a75c9b892cb Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 16 Sep 2022 23:18:50 +0300
+Subject: [PATCH] hostapd: use a less generic name for IEEE802.11 CRC-32 routine
+
+Hostapd uses 'crc32' name for IEEE802.11 CRC-32 routine. This name is
+too generic. Buildroot autobuilder detected build configuration that
+failed to build due to the naming conflict: static linking with openssl
+using zlib-ng as a zlib provider, e.g. see:
+- http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/
+- http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332/
+
+Use a less generic name ieee80211_crc32 for IEEE802.11 CRC-32 routine
+to avoid such naming conflicts.
+
+Upstream: https://w1.fi/cgit/hostap/commit/?id=0c7b3814ca6070a8e930dea09fde08b4058a4ca6
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ hostapd/config_file.c | 4 ++--
+ src/ap/hostapd.c      | 3 ++-
+ src/ap/neighbor_db.c  | 2 +-
+ src/utils/crc32.c     | 2 +-
+ src/utils/crc32.h     | 2 +-
+ 5 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/hostapd/config_file.c b/hostapd/config_file.c
+index b14728d1b..b38a84647 100644
+--- a/hostapd/config_file.c
++++ b/hostapd/config_file.c
+@@ -2407,7 +2407,7 @@ static int hostapd_config_fill(struct hostapd_config *conf,
+ 		}
+ 		os_memcpy(ssid->ssid, pos, ssid->ssid_len);
+ 		ssid->ssid_set = 1;
+-		ssid->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
++		ssid->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
+ 	} else if (os_strcmp(buf, "ssid2") == 0) {
+ 		struct hostapd_ssid *ssid = &bss->ssid;
+ 		size_t slen;
+@@ -2421,7 +2421,7 @@ static int hostapd_config_fill(struct hostapd_config *conf,
+ 		os_memcpy(ssid->ssid, str, slen);
+ 		ssid->ssid_len = slen;
+ 		ssid->ssid_set = 1;
+-		ssid->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
++		ssid->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
+ 		os_free(str);
+ 	} else if (os_strcmp(buf, "utf8_ssid") == 0) {
+ 		bss->ssid.utf8_ssid = atoi(pos) > 0;
+diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
+index 4b88641a2..56c8fb90e 100644
+--- a/src/ap/hostapd.c
++++ b/src/ap/hostapd.c
+@@ -1230,7 +1230,8 @@ static int hostapd_setup_bss(struct hostapd_data *hapd, int first)
+ 	 * Short SSID calculation is identical to FCS and it is defined in
+ 	 * IEEE P802.11-REVmd/D3.0, 9.4.2.170.3 (Calculating the Short-SSID).
+ 	 */
+-	conf->ssid.short_ssid = crc32(conf->ssid.ssid, conf->ssid.ssid_len);
++	conf->ssid.short_ssid = ieee80211_crc32(conf->ssid.ssid,
++						conf->ssid.ssid_len);
+ 
+ 	if (!hostapd_drv_none(hapd)) {
+ 		wpa_printf(MSG_DEBUG, "Using interface %s with hwaddr " MACSTR
+diff --git a/src/ap/neighbor_db.c b/src/ap/neighbor_db.c
+index 229edd2a9..ef17634c3 100644
+--- a/src/ap/neighbor_db.c
++++ b/src/ap/neighbor_db.c
+@@ -136,7 +136,7 @@ int hostapd_neighbor_set(struct hostapd_data *hapd, const u8 *bssid,
+ 
+ 	os_memcpy(entry->bssid, bssid, ETH_ALEN);
+ 	os_memcpy(&entry->ssid, ssid, sizeof(entry->ssid));
+-	entry->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
++	entry->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
+ 
+ 	entry->nr = wpabuf_dup(nr);
+ 	if (!entry->nr)
+diff --git a/src/utils/crc32.c b/src/utils/crc32.c
+index 12d9e2a70..371254994 100644
+--- a/src/utils/crc32.c
++++ b/src/utils/crc32.c
+@@ -72,7 +72,7 @@ static const u32 crc32_table[256] = {
+ };
+ 
+ 
+-u32 crc32(const u8 *frame, size_t frame_len)
++u32 ieee80211_crc32(const u8 *frame, size_t frame_len)
+ {
+ 	size_t i;
+ 	u32 crc;
+diff --git a/src/utils/crc32.h b/src/utils/crc32.h
+index dc31399be..71a19dc5f 100644
+--- a/src/utils/crc32.h
++++ b/src/utils/crc32.h
+@@ -9,6 +9,6 @@
+ #ifndef CRC32_H
+ #define CRC32_H
+ 
+-u32 crc32(const u8 *frame, size_t frame_len);
++u32 ieee80211_crc32(const u8 *frame, size_t frame_len);
+ 
+ #endif /* CRC32_H */
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
