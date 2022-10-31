Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92737FA3742
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353C760BDC;
	Mon, 31 Oct 2022 12:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 353C760BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jU3-yqxui2Yk; Mon, 31 Oct 2022 12:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283DA60BCD;
	Mon, 31 Oct 2022 12:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283DA60BCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 855001BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611F1403A7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611F1403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuG85C8pyGSN for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:18:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3269C40237
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3269C40237
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AC0F878F5; Mon, 31 Oct 2022 12:18:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:18:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27024049426483091b1d5edc73cd225307e79540
X-Git-Newrev: 7d920f9d4060d7603da2074c3db167c39e4881fb
X-Patchwork-Hint: ignore
Message-Id: <20221031121831.1AC0F878F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hostapd: fix static build issue
 with zlib-ng
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d920f9d4060d7603da2074c3db167c39e4881fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hostapd uses 'crc32' name for IEEE802.11 CRC-32 routine. This name is
too generic. Buildroot autobuilder detected configurations that failed
to build due to the naming conflict with zlib-ng.

Add hostapd part of the upstream patch that renames 'crc32' function
to a less generic 'ieee80211_crc32' name.

Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
