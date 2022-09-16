Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F9ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A798843CC;
	Fri, 16 Sep 2022 21:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A798843CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNRs7rpYKW4R; Fri, 16 Sep 2022 21:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315D784334;
	Fri, 16 Sep 2022 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315D784334
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084991BF29F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D761F61047
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D761F61047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZQWo2eh4yhT for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8763E61088
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8763E61088
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:01:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so37445767lfo.8
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uM8E1MUvDhrOAGigeyX9qmKkRrm0bVPHsmHeFJfy8ys=;
 b=t03CTtdUl5WoAhf9cgS5XOlCVJgODa7LUUDP7pX0V01HFlb1I6aaqtRCwgM2sGWWet
 mR6glgVQJIWix8vw/tQ831lW52/yE4FmpSdGb3rpHduGAtjJ1UfFIqwpJUIZIx4JKxS4
 cRtVYFNwqHvGCB6tIAznaTfT70W1DohJi8TpkEeawHn8LgiX5xhIvR18bNwO+T1hIJ/Q
 r/bxN0YZ9s02C2zpPjnhM6I6QfZEwF7GBBMTnTHMF33m1xeOpxTEpv6o4fYUVylms/Ky
 3WIOCBJ1u0BOH+u609TbqBTjPfwhZPo8f669KiEuV/bE4EiPoqBEfzGoJAYhPeduL0wS
 VrAA==
X-Gm-Message-State: ACrzQf3WIrdwH+NR3oUusItn28wpkghRebFebJKDxiqL+fvTOU6a0lJA
 SrEmQd2BIKeueuJ2+bMV4h2a0D2ehg/APg==
X-Google-Smtp-Source: AMsMyM7C13jh8QN4FwGiJx/qti2h+TseWmg9O0RlOIXYhZZepAQRivkU8XpPJIqr3ccThcMAH7m7Ig==
X-Received: by 2002:a05:6512:ba1:b0:498:9890:1bb4 with SMTP id
 b33-20020a0565120ba100b0049898901bb4mr2093350lfv.122.1663362064010; 
 Fri, 16 Sep 2022 14:01:04 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z18-20020a056512371200b0049a0832ffc9sm3341243lfr.211.2022.09.16.14.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 14:01:03 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 00:00:59 +0300
Message-Id: <20220916210059.2395129-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220916210059.2395129-1-geomatsi@gmail.com>
References: <20220916210059.2395129-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uM8E1MUvDhrOAGigeyX9qmKkRrm0bVPHsmHeFJfy8ys=;
 b=D8atJ32FA5MZZ8jJWQUMf5DqyX4T8MeLb6IoywykooC/BYvZXoOR33T93seSE1u5Wi
 Ui00TJ/D9t2dyEJQqbtMCU0GayWhEIAWN+cqu9RrOUsRSGZ1tkgme/eaFkmId+m6XyMG
 AE4+JMG9B9vg9nnOwomO+R0TSNzMQ3ew3mtJTxCclKU3fkClzIbcykRnzLsPLddyGhAW
 pL6S9LuE4ig247FgV4B3qaqf+ulB8EA865m4Zxnr9UzB09HbZy3azxXzaP+/9/LOmfyx
 oMZ2GkY3GSphuTAByfD6gRb1F9TmqNI0GBZBJ1S3/fGkuXjyD+JKqmZm5xAr2HsEnJS5
 6r8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D8atJ32F
Subject: [Buildroot] [PATCH v2 2/2] package/wpa_supplicant: fix static build
 issue with zlib-ng
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hostapd/wpa_s uses 'crc32' name for IEEE802.11 CRC-32 routine. This name
is too generic. Buildroot autobuilder detected configurations that failed
to build due to the naming conflict with zlib-ng.

Add wpa_supplicant part of the upstream patch that renames 'crc32'
function to a less generic 'ieee80211_crc32' name.

Fixes: http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...se-a-less-generic-name-for-IEEE802.1.patch | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch

diff --git a/package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch b/package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch
new file mode 100644
index 0000000000..f1583e2080
--- /dev/null
+++ b/package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch
@@ -0,0 +1,78 @@
+From c8af2e431b47d7d900e0c7359705aaa1096d302a Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 16 Sep 2022 23:18:50 +0300
+Subject: [PATCH] wpa_supplicant: use a less generic name for IEEE802.11 CRC-32 routine
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
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ src/ap/hostapd.c     | 3 ++-
+ src/ap/neighbor_db.c | 2 +-
+ src/utils/crc32.c    | 2 +-
+ src/utils/crc32.h    | 2 +-
+ 4 files changed, 5 insertions(+), 4 deletions(-)
+
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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
