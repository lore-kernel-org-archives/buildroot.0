Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E581ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C197184307;
	Fri, 16 Sep 2022 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C197184307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzAsJPU-gNxo; Fri, 16 Sep 2022 21:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B702B842F3;
	Fri, 16 Sep 2022 21:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B702B842F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE5B41BF29F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9704F6FADD
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9704F6FADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_5sMhJT43FI for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD6561047
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DD6561047
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:01:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j16so10413395lfg.1
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CY2ted/Pss1alXZzznScjyqx7jXePc5IeIKPluv0l6E=;
 b=8LM3Q994CIEcm7lymZHgEaAhXmIpPJ6QLapT0Kg/2NRN63n+Mi7+DN67X4FM3x9IAd
 au8vGfwNTuzTw+0VM67IwehDaDrl5w9RCo5ziJ0FgXhf8AR4NtF/wAINKoF7bpc3PnNF
 qY3NmkI1yru8XyWjmZVJ55YNakJ6ypTLqrrko+o5aKGof/Muf8YLEbB/1+3F7M9dX+f3
 BQE7oJECLOukpICWzzOj5Ti+e01vT0nFoJK4qMFgs9FG6vKeojPJVWZ05yUsfeSCYMZR
 dpO0wCqA9HL3Pe8t4QBOU3/rGLm5Ei0KyJ2TGgu05AzYi2QBxn88HDHWGQ/NKTwV+rox
 L7cg==
X-Gm-Message-State: ACrzQf2vZ0M2Ts3A/EfKcpfZd1pb5vSHykdFxlzMYIx+IS97XVZS2h9g
 eVECwyu598/ujfY92mpy1sWupinTizTYIw==
X-Google-Smtp-Source: AMsMyM77jOMDh3FlBGgFTjm62tQWbfz0vjl25LJ+zU2q0SQngnKFn8vs84XEPniXgHC6MHtKSjpCSQ==
X-Received: by 2002:a19:654d:0:b0:49f:5309:1cb6 with SMTP id
 c13-20020a19654d000000b0049f53091cb6mr1559952lfj.522.1663362063000; 
 Fri, 16 Sep 2022 14:01:03 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z18-20020a056512371200b0049a0832ffc9sm3341243lfr.211.2022.09.16.14.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 14:01:02 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 00:00:58 +0300
Message-Id: <20220916210059.2395129-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220916210059.2395129-1-geomatsi@gmail.com>
References: <20220916210059.2395129-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CY2ted/Pss1alXZzznScjyqx7jXePc5IeIKPluv0l6E=;
 b=bnTAkn4OPqgI/qCHG8/bbyzfYAM79UBHv5mnGPgdaQjkPQuN9kfBcdV7Xgo2i/5ISh
 h21KBhnrUH9jX8q87EVQAVehAbE3i00azC5x0cz54ou8fIlBUqBbwmvxsScfpTSYAyGb
 2Y08KKi0epcTSEYhcDRifk473quVe7v6uQf8ofFKrtHc6BoUfAZvmqxmySOLf1E1o47r
 pFFtJeBSP3RZuFGfW4wATHvCliTl5yvfxebTl3cLtEQjObXNLATt2SPuewphaot8WSds
 /pXYnqJ1Ubz5MVCIHwOHUmPuf5Fx4RO2R81Uexl43//ORGTfXO7Pw7BuNF4o/K/dlX6S
 3BNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bnTAkn4O
Subject: [Buildroot] [PATCH v2 1/2] package/hostapd: fix static build issue
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hostapd uses 'crc32' name for IEEE802.11 CRC-32 routine. This name is
too generic. Buildroot autobuilder detected configurations that failed
to build due to the naming conflict with zlib-ng.

Add hostapd part of the upstream patch that renames 'crc32' function
to a less generic 'ieee80211_crc32' name.

Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...ic-name-for-IEEE802.11-CRC-32-routin.patch | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch

diff --git a/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch b/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
new file mode 100644
index 0000000000..e1c923880c
--- /dev/null
+++ b/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
@@ -0,0 +1,101 @@
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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
