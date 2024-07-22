Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5E4C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DD0880E41;
	Mon, 22 Jul 2024 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2kFp8FsJdiz; Mon, 22 Jul 2024 21:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9F1A80E88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F1A80E88;
	Mon, 22 Jul 2024 21:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31BB41BF3BB
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C06080E41
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 21:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB0RGQWHseGo for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 21:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5233F80E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5233F80E38
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5233F80E38
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 21:23:30 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-810f75a632dso192053139f.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 14:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721683409; x=1722288209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+kReo/d8zTsQ5GBGkyKKmTuORiE7nta5cOCiMDqc2E=;
 b=AbbZY4d6OxG6GMcphsYne0+KJ79AjoBcerbIURZfIZkfKpaA6Nwm/zSmjnXBg3JNeg
 L1yUSmyMs6gNacJvBcSSqaSpmhHnKwhlDKVoQQQDQF+yWRlo2Mm3xDhjJspZIWgUMG0b
 AI16RCV6F9nb2GSsJ2YaJcIr0BAHjMlM7jbPDf8TToTXZ1yHKKxzPhRNVRNBADxitJD3
 3avXZYUMaekXIGs7s+J8O4gMdffQdDTIFEK9M9ajhg3vcsQq8AHy3Qx4Oh6AmRKzWTu8
 tga1mR3Q4Q2EHomizyy9sVgAXMXq5j7k14ys11XIMRGhPIGm5eyXBcVwgE0oeh61vNrd
 ZP1Q==
X-Gm-Message-State: AOJu0YzN/hrAQkSBVw4R07VjVZUngZhWaJkuOEOk28UmDTZsL/hGdupF
 gUiI3T3csBZ9iYiOexcJeKHeBRUBqXam4KtYGJapEZwSN1ACzi2va9unSQ==
X-Google-Smtp-Source: AGHT+IEhkqupyy6bz9iLck6KiqffdblKdDcce6QB1/COt4cWXJxBXxtr8r33iLf0eOWWf6IBghEGKA==
X-Received: by 2002:a05:6602:160d:b0:804:f2be:ee21 with SMTP id
 ca18e2360f4ac-81ea30a27famr149783639f.3.1721683408803; 
 Mon, 22 Jul 2024 14:23:28 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c279872127sm26881173.58.2024.07.22.14.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:23:28 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 15:23:05 -0600
Message-Id: <20240722212305.692404-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721683409; x=1722288209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v+kReo/d8zTsQ5GBGkyKKmTuORiE7nta5cOCiMDqc2E=;
 b=PdCJZ0+I3GMkZOidAbhHz9Om/QMvnpilMOR1I3ffQAQsT/l2o8U04lh0e0TB9OLgxl
 UrWnTJLxFF9paPXfyKvKwnaRnPPYTTSoXQdblq4ZZMhqXnWzOFbrRWC0xW2h+BjRk2nq
 GP4b4oRdyqenhRv9Pl3hKtB4HQgh3gOjsZxHvBtm11SzUD3GQHDjpNIkoQUqcchymnOy
 iAd1i+3fzOQ8xSOFMi4BFbex+V91NByrgAPhIcOXF48sSpFCg0tOEiMQRrvP7b7wGulW
 w+cMKq2oxma1hlYklSdXHH3CR7uylToXKPv30TS1WT4gi0KrnDnHS9yoPOXeT+BJVb8Z
 uqBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PdCJZ0+I
Subject: [Buildroot] [PATCH 1/1] package/hostapd: bump version to 2.11
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Update hostapd to the latest release v2.11.
Enable 802.11be support.
Drop patch as it has been upstreamed.

README's copyright year was updated.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 ...ic-name-for-IEEE802.11-CRC-32-routin.patch | 102 ------------------
 package/hostapd/hostapd.hash                  |   4 +-
 package/hostapd/hostapd.mk                    |   3 +-
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch

diff --git a/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch b/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
deleted file mode 100644
index bf85e97f21..0000000000
--- a/package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 9896d8c116f054cebc49928404018a75c9b892cb Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Fri, 16 Sep 2022 23:18:50 +0300
-Subject: [PATCH] hostapd: use a less generic name for IEEE802.11 CRC-32 routine
-
-Hostapd uses 'crc32' name for IEEE802.11 CRC-32 routine. This name is
-too generic. Buildroot autobuilder detected build configuration that
-failed to build due to the naming conflict: static linking with openssl
-using zlib-ng as a zlib provider, e.g. see:
-- http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/
-- http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332/
-
-Use a less generic name ieee80211_crc32 for IEEE802.11 CRC-32 routine
-to avoid such naming conflicts.
-
-Upstream: https://w1.fi/cgit/hostap/commit/?id=0c7b3814ca6070a8e930dea09fde08b4058a4ca6
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- hostapd/config_file.c | 4 ++--
- src/ap/hostapd.c      | 3 ++-
- src/ap/neighbor_db.c  | 2 +-
- src/utils/crc32.c     | 2 +-
- src/utils/crc32.h     | 2 +-
- 5 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/hostapd/config_file.c b/hostapd/config_file.c
-index b14728d1b..b38a84647 100644
---- a/hostapd/config_file.c
-+++ b/hostapd/config_file.c
-@@ -2407,7 +2407,7 @@ static int hostapd_config_fill(struct hostapd_config *conf,
- 		}
- 		os_memcpy(ssid->ssid, pos, ssid->ssid_len);
- 		ssid->ssid_set = 1;
--		ssid->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
-+		ssid->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
- 	} else if (os_strcmp(buf, "ssid2") == 0) {
- 		struct hostapd_ssid *ssid = &bss->ssid;
- 		size_t slen;
-@@ -2421,7 +2421,7 @@ static int hostapd_config_fill(struct hostapd_config *conf,
- 		os_memcpy(ssid->ssid, str, slen);
- 		ssid->ssid_len = slen;
- 		ssid->ssid_set = 1;
--		ssid->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
-+		ssid->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
- 		os_free(str);
- 	} else if (os_strcmp(buf, "utf8_ssid") == 0) {
- 		bss->ssid.utf8_ssid = atoi(pos) > 0;
-diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
-index 4b88641a2..56c8fb90e 100644
---- a/src/ap/hostapd.c
-+++ b/src/ap/hostapd.c
-@@ -1230,7 +1230,8 @@ static int hostapd_setup_bss(struct hostapd_data *hapd, int first)
- 	 * Short SSID calculation is identical to FCS and it is defined in
- 	 * IEEE P802.11-REVmd/D3.0, 9.4.2.170.3 (Calculating the Short-SSID).
- 	 */
--	conf->ssid.short_ssid = crc32(conf->ssid.ssid, conf->ssid.ssid_len);
-+	conf->ssid.short_ssid = ieee80211_crc32(conf->ssid.ssid,
-+						conf->ssid.ssid_len);
- 
- 	if (!hostapd_drv_none(hapd)) {
- 		wpa_printf(MSG_DEBUG, "Using interface %s with hwaddr " MACSTR
-diff --git a/src/ap/neighbor_db.c b/src/ap/neighbor_db.c
-index 229edd2a9..ef17634c3 100644
---- a/src/ap/neighbor_db.c
-+++ b/src/ap/neighbor_db.c
-@@ -136,7 +136,7 @@ int hostapd_neighbor_set(struct hostapd_data *hapd, const u8 *bssid,
- 
- 	os_memcpy(entry->bssid, bssid, ETH_ALEN);
- 	os_memcpy(&entry->ssid, ssid, sizeof(entry->ssid));
--	entry->short_ssid = crc32(ssid->ssid, ssid->ssid_len);
-+	entry->short_ssid = ieee80211_crc32(ssid->ssid, ssid->ssid_len);
- 
- 	entry->nr = wpabuf_dup(nr);
- 	if (!entry->nr)
-diff --git a/src/utils/crc32.c b/src/utils/crc32.c
-index 12d9e2a70..371254994 100644
---- a/src/utils/crc32.c
-+++ b/src/utils/crc32.c
-@@ -72,7 +72,7 @@ static const u32 crc32_table[256] = {
- };
- 
- 
--u32 crc32(const u8 *frame, size_t frame_len)
-+u32 ieee80211_crc32(const u8 *frame, size_t frame_len)
- {
- 	size_t i;
- 	u32 crc;
-diff --git a/src/utils/crc32.h b/src/utils/crc32.h
-index dc31399be..71a19dc5f 100644
---- a/src/utils/crc32.h
-+++ b/src/utils/crc32.h
-@@ -9,6 +9,6 @@
- #ifndef CRC32_H
- #define CRC32_H
- 
--u32 crc32(const u8 *frame, size_t frame_len);
-+u32 ieee80211_crc32(const u8 *frame, size_t frame_len);
- 
- #endif /* CRC32_H */
--- 
-2.37.1
-
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 4e130d01ca..7921586172 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d  hostapd-2.10.tar.gz
-sha256  af01e1d1ee065a1054d20ebe8a78a016f1fb1133b73e6a9d50801b165bb280c7  README
+sha256  2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a  hostapd-2.11.tar.gz
+sha256  f1b5992bbdd015c3ccb7faaadd62ef58ed821e15b9329bf2ceb27511ccc3f562  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 5756510e1d..3eda1c7e83 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.10
+HOSTAPD_VERSION = 2.11
 HOSTAPD_SITE = http://w1.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
@@ -53,6 +53,7 @@ endif
 ifeq ($(BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_HS20 \
+	CONFIG_IEEE80211BE \
 	CONFIG_IEEE80211AX \
 	CONFIG_IEEE80211AC \
 	CONFIG_IEEE80211N \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
