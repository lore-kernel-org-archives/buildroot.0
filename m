Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE501C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 23:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A379D400A4;
	Wed, 31 Jul 2024 23:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkUlZ3vo-oMl; Wed, 31 Jul 2024 23:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393CE40124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 393CE40124;
	Wed, 31 Jul 2024 23:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB79D1BF592
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 23:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C89BE40124
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 23:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaUaMCv8nw68 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 23:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1162; helo=mail-yw1-x1162.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EC7A400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC7A400A4
Received: from mail-yw1-x1162.google.com (mail-yw1-x1162.google.com
 [IPv6:2607:f8b0:4864:20::1162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EC7A400A4
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 23:55:52 +0000 (UTC)
Received: by mail-yw1-x1162.google.com with SMTP id
 00721157ae682-66599ca3470so50918667b3.2
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722470151; x=1723074951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbuCDaRcNXbEyhcbC/EIyWL113MRRpYU6tLksfTU+tQ=;
 b=XJh3z6jAiQvcWF0gj3DNCfzGMC/oGmANnQwa/fcX7fDAltHI61+egPTzOdN+e2cNzO
 NQYAsPVoiY8FGZ6Bmt1IELkql3SrU/NqwJT6NZuHRMKjhlJ49BmlVvrMXh0KGkLSyyfV
 5TuSnDIAJrKuDAZsMWj8LsiSyuVsbWa8yopdc8rMonXOTcNUQBmqV338a9zVbcsfyMEv
 nxZzG4YNC7HzeYiYTYFWN6UXaW889Esx3pttWNGlktnuuZMqC4LBTh9BXDrhb/UaYuuv
 2/+GxJCVTouikAQH11yHsw1lp2mRWoEMJLcsEdEMaZ73Yk5taKv1SSPgIQ7AWA5xKxx+
 25vg==
X-Gm-Message-State: AOJu0YzjhfskKrb0HO98r6SHSkZpkjLreGgIuQv5aLkP7FHMRp0Rbjxp
 k+4r7FQMQJJonYW9xQGzqTobVRAONaQYvcA3HSFIo5WvfTWN05+OZcB34znu0Njqn1CbTYvVlq3
 QxSNu4NQIqajiMskCaSY5qwWZ4bK2b9HIXWA6U4Pt
X-Google-Smtp-Source: AGHT+IFknq9z4nz7nsHbenIcpzDBMMN+pv+ofuexYPMEYQCdaY2Yz/dtptgxXehaeEp6Yx+A35DTXb+5X40T
X-Received: by 2002:a81:77c4:0:b0:668:b320:b4a9 with SMTP id
 00721157ae682-687501961c3mr7191717b3.45.1722470151523; 
 Wed, 31 Jul 2024 16:55:51 -0700 (PDT)
Received: from tornado.. (wsip-98-191-220-15.ph.ph.cox.net. [98.191.220.15])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-675685dd157sm9479067b3.33.2024.07.31.16.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 16:55:51 -0700 (PDT)
X-Relaying-Domain: embeddedts.com
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 23:55:48 +0000
Message-Id: <20240731235548.1792330-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1722470151; x=1723074951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TbuCDaRcNXbEyhcbC/EIyWL113MRRpYU6tLksfTU+tQ=;
 b=PUdzALOsiViOsfbbydN0z4o0t1kONgrccCJ0DFyFDKGA0WsdCAYx/bJpP2kJr/WlRM
 7EhF9rdtkFeZxakLUYqEKHdIBVWm599G77VgQbxY2XtbYe1REUUl54fschgd3z7rWOBX
 a8bmvIQ+ha/IztNirkAWVbkhpNK9xyXzxB8xE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=embeddedTS.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=PUdzALOs
Subject: [Buildroot] [PATCH 1/1] package/wilc-driver: bump to
 linux4microchip-2024.04
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest update from Microchip's kernel.

Removes Buildroot patches and instead incorporates these directly
to a community branch of the repo. Also adds a check in wilc-driver.mk
to use the new linux4microchip-2024.04-community tag when
BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4 is true.

See help for BR2_PACKAGE_WILC_DRIVER as well as the project's
README for more information.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---

We investigated the potential to use backports to make maintenance
easier as I mentioned, however it did not work out as we had expected.
Instead, we've decided to keep the main branch of the repo we maintain
matching the Microchip driver as it exists in the matching tag in their
kernel repo; and then split off branches from those points in time to
host community changes. These include things like Giulio Benetti's work
to support kernel versions outside of what the Microchip driver would
directly support.

This change uses the linux4microchip-2024.04 base tag, and a patch we've
supplied on top of it to support building against kernel 6.4~6.10. And
moving forward, we will continue to add patches as needed to the
community branch.

I'm not sure if I did the kernel dependency check in the most elegant
way. If there is a preferred way to handle that, please let me know and
I'll happily make a revision.

 ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 ---
 ...fix-build-failure-on-remove-callback.patch |  44 ----
 ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 --------
 ...on_parameters-Linux-6.1-build-failur.patch | 216 ------------------
 .../wilc-driver/0005-Fix-cast-warnings.patch  |  43 ----
 .../wilc-driver/0006-Support-Linux-6.3.patch  |  43 ----
 .../wilc-driver/0007-Support-Linux-6.4.patch  |  36 ---
 package/wilc-driver/Config.in                 |  11 +-
 package/wilc-driver/wilc-driver.hash          |   3 +-
 package/wilc-driver/wilc-driver.mk            |   9 +-
 10 files changed, 18 insertions(+), 519 deletions(-)
 delete mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
 delete mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
 delete mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
 delete mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
 delete mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch
 delete mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 delete mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch

diff --git a/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch b/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
deleted file mode 100644
index 2f10627301..0000000000
--- a/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f80e4343fa0a4d8b22933d1704c85a771fe234a4 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 19:56:46 +0100
-Subject: [PATCH] cfg80211.c: fix missing prandom_u32() with Linux >= 6.1.0
-
-prandom_u32() previously was only calling get_random_u32() so it's been
-dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
-version >= 6.1.0.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 016aa06..41edd02 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1422,7 +1422,11 @@ static int mgmt_tx(struct wiphy *wiphy,
- 	const u8 *vendor_ie;
- 	int ret = 0;
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	*cookie = get_random_u32();
-+#else
- 	*cookie = prandom_u32();
-+#endif
- 	priv->tx_cookie = *cookie;
- 	mgmt = (const struct ieee80211_mgmt *)buf;
- 
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch b/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
deleted file mode 100644
index 87306dfa12..0000000000
--- a/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a88819bd63f977b5a33d72a2b9e264ce104726bd Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:02:12 +0100
-Subject: [PATCH] spi.c: fix build failure on remove callback
-
-Starting from Linux 5.18 remove callback returns void, so let's deal with
-it depending on Linux version >= 5.18.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- spi.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/spi.c b/spi.c
-index 96c51fe..f7b43e2 100644
---- a/spi.c
-+++ b/spi.c
-@@ -211,7 +211,11 @@ free:
- 	return ret;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,18,0))
-+static void wilc_bus_remove(struct spi_device *spi)
-+#else
- static int wilc_bus_remove(struct spi_device *spi)
-+#endif
- {
- 	struct wilc *wilc = spi_get_drvdata(spi);
- 
-@@ -220,7 +224,10 @@ static int wilc_bus_remove(struct spi_device *spi)
- 
- 	wilc_netdev_cleanup(wilc);
- 	wilc_bt_deinit();
-+
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,18,0))
- 	return 0;
-+#endif
- }
- 
- static int wilc_spi_suspend(struct device *dev)
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch b/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
deleted file mode 100644
index 785b8904b2..0000000000
--- a/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From a608cdd7903505217529317c04b5b58cb7e25081 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:06:43 +0100
-Subject: [PATCH] cfg80211.c: fix build failure with Linux 5.19 and 6.1
-
-Starting from Linux 5.19 stop_ap() requires unsigned int link_id as
-parameter. Then from Linux 6.1 on lot of other cfg80211 APIs require
-int link_id to deal with MLO, so let's add that parameter too.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 35 +++++++++++++++++++++++++++++------
- 1 file changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 41edd02..57c777d 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -674,8 +674,12 @@ static int wilc_wfi_cfg_copy_wpa_info(struct wilc_wfi_key *key_info,
- 	return 0;
- }
- 
--static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
--		   bool pairwise, const u8 *mac_addr, struct key_params *params)
-+static int add_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
-+		   u8 key_index,  bool pairwise, const u8 *mac_addr,
-+		   struct key_params *params)
- 
- {
- 	int ret = 0, keylen = params->key_len, seqlen = params->seq_len;
-@@ -792,6 +796,9 @@ static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
- }
- 
- static int del_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
- 		   u8 key_index,
- 		   bool pairwise,
- 		   const u8 *mac_addr)
-@@ -833,9 +840,13 @@ static int del_key(struct wiphy *wiphy, struct net_device *netdev,
- 	return ret;
- }
- 
--static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
--		   bool pairwise, const u8 *mac_addr, void *cookie,
--		   void (*callback)(void *cookie, struct key_params *))
-+static int get_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
-+		   u8 key_index, bool pairwise, const u8 *mac_addr,
-+		   void *cookie, void (*callback)(void *cookie,
-+		   struct key_params *))
- {
- 	struct wilc_vif *vif = netdev_priv(netdev);
- 	struct wilc_priv *priv = &vif->priv;
-@@ -877,12 +888,18 @@ static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
- 
- /* wiphy_new() will WARN if not present*/
- static int set_default_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+			   int link_id,
-+#endif
- 			   u8 key_index, bool unicast, bool multicast)
- {
- 	return 0;
- }
- 
- static int set_default_mgmt_key (struct wiphy *wiphy,struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+				 int link_id,
-+#endif
- 				 u8 key_index)
- {
-     return 0;
-@@ -1814,7 +1831,13 @@ static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
- 	return wilc_add_beacon(vif, 0, 0, beacon);
- }
- 
--static int stop_ap(struct wiphy *wiphy, struct net_device *dev)
-+static int stop_ap(struct wiphy *wiphy, struct net_device *dev
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,19,0))
-+		   , unsigned int link_id
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   , int link_id
-+#endif
-+		  )
- {
- 	int ret;
- 	struct wilc_vif *vif = netdev_priv(dev);
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch b/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
deleted file mode 100644
index faee805b5a..0000000000
--- a/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From 5f022c4d3be32493d500be82f51032ef4fb3cdc0 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:08:45 +0100
-Subject: [PATCH] Fix struct station_parameters Linux 6.1 build failure
-
-Starting from Linux 6.1 struct station_parameters has changed by moving
-some member to its child struct link_station_parameters. Let's extract the
-values of the needed members into local values at the beginning of
-functions and substitute the member access with the local variables.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 48 ++++++++++++++++++++++++++++++++----------------
- hif.c      | 44 ++++++++++++++++++++++++++++++++------------
- 2 files changed, 64 insertions(+), 28 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 57c777d..bdd480c 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1866,6 +1866,14 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
- 	struct wilc_vif *vif = netdev_priv(dev);
- 	struct wilc_priv *priv = &vif->priv;
- 	u8 *assoc_bss = priv->assoc_stainfo.sta_associated_bss[params->aid];
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+#endif
- 
- 	if (vif->iftype == WILC_AP_MODE || vif->iftype == WILC_GO_MODE) {
- 		memcpy(assoc_bss, mac, ETH_ALEN);
-@@ -1879,27 +1887,27 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
- 			   params->aid);
- 		PRINT_INFO(vif->ndev, HOSTAPD_DBG,
- 			   "Number of supported rates = %d\n",
--			   params->supported_rates_len);
-+			   supported_rates_len);
- 
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
--			   (!params->ht_capa) ? false : true);
-+			   (!ht_capa) ? false : true);
- 
--		if (params->ht_capa) {
-+		if (ht_capa) {
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Capability Info = %d\n",
--				   params->ht_capa->cap_info);
-+				   ht_capa->cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "AMPDU Params = %d\n",
--				   params->ht_capa->ampdu_params_info);
-+				   ht_capa->ampdu_params_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "HT Extended params= %d\n",
--				   params->ht_capa->extended_ht_cap_info);
-+				   ht_capa->extended_ht_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Tx Beamforming Cap= %d\n",
--				   params->ht_capa->tx_BF_cap_info);
-+				   ht_capa->tx_BF_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Antenna selection info = %d\n",
--				   params->ht_capa->antenna_selection_info);
-+				   ht_capa->antenna_selection_info);
- 		}
- 
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
-@@ -1966,6 +1974,14 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
- {
- 	int ret = 0;
- 	struct wilc_vif *vif = netdev_priv(dev);
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+#endif
- 
- 	PRINT_D(vif->ndev, CFG80211_DBG, "Change station parameters\n");
- 
-@@ -1976,25 +1992,25 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
- 			   params->aid);
- 		PRINT_INFO(vif->ndev, CFG80211_DBG,
- 			   "Number of supported rates = %d\n",
--			   params->supported_rates_len);
-+			   supported_rates_len);
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
--			   (!params->ht_capa) ? false : true);
--		if (params->ht_capa) {
-+			   (!ht_capa) ? false : true);
-+		if (ht_capa) {
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Capability Info = %d\n",
--				   params->ht_capa->cap_info);
-+				   ht_capa->cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "AMPDU Params = %d\n",
--				   params->ht_capa->ampdu_params_info);
-+				   ht_capa->ampdu_params_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "HT Extended params= %d\n",
--				   params->ht_capa->extended_ht_cap_info);
-+				   ht_capa->extended_ht_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Tx Beamforming Cap= %d\n",
--				   params->ht_capa->tx_BF_cap_info);
-+				   ht_capa->tx_BF_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Antenna selection info = %d\n",
--				   params->ht_capa->antenna_selection_info);
-+				   ht_capa->antenna_selection_info);
- 		}
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
- 			   params->sta_flags_mask);
-diff --git a/hif.c b/hif.c
-index 3f672a0..1a7365b 100644
---- a/hif.c
-+++ b/hif.c
-@@ -2249,6 +2249,16 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
- 	int result;
- 	struct host_if_msg *msg;
- 	struct add_sta_param *sta_params;
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+	const u8 *supported_rates = link_sta_params->supported_rates;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+	const u8 *supported_rates = params->supported_rates;
-+#endif
- 
- 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
- 		   "Setting adding station message queue params\n");
-@@ -2260,20 +2270,20 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
- 	sta_params = &msg->body.add_sta_info;
- 	memcpy(sta_params->bssid, mac, ETH_ALEN);
- 	sta_params->aid = params->aid;
--	if (!params->ht_capa) {
-+	if (!ht_capa) {
- 		sta_params->ht_supported = false;
- 	} else {
- 		sta_params->ht_supported = true;
--		memcpy(&sta_params->ht_capa, params->ht_capa,
-+		memcpy(&sta_params->ht_capa, ht_capa,
- 		       sizeof(struct ieee80211_ht_cap));
- 	}
- 	sta_params->flags_mask = params->sta_flags_mask;
- 	sta_params->flags_set = params->sta_flags_set;
- 
--	sta_params->supported_rates_len = params->supported_rates_len;
--	if (params->supported_rates_len > 0) {
--		sta_params->supported_rates = kmemdup(params->supported_rates,
--					    params->supported_rates_len,
-+	sta_params->supported_rates_len = supported_rates_len;
-+	if (supported_rates_len > 0) {
-+		sta_params->supported_rates = kmemdup(supported_rates,
-+					    supported_rates_len,
- 					    GFP_KERNEL);
- 		if (!sta_params->supported_rates) {
- 			kfree(msg);
-@@ -2397,6 +2407,16 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
- 	int result;
- 	struct host_if_msg *msg;
- 	struct add_sta_param *sta_params;
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+	const u8 *supported_rates = link_sta_params->supported_rates;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+	const u8 *supported_rates = params->supported_rates;
-+#endif
- 
- 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
- 		   "Setting editing station message queue params\n");
-@@ -2408,20 +2428,20 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
- 	sta_params = &msg->body.edit_sta_info;
- 	memcpy(sta_params->bssid, mac, ETH_ALEN);
- 	sta_params->aid = params->aid;
--	if (!params->ht_capa) {
-+	if (!ht_capa) {
- 		sta_params->ht_supported = false;
- 	} else {
- 		sta_params->ht_supported = true;
--		memcpy(&sta_params->ht_capa, params->ht_capa,
-+		memcpy(&sta_params->ht_capa, ht_capa,
- 		       sizeof(struct ieee80211_ht_cap));
- 	}
- 	sta_params->flags_mask = params->sta_flags_mask;
- 	sta_params->flags_set = params->sta_flags_set;
- 
--	sta_params->supported_rates_len = params->supported_rates_len;
--	if (params->supported_rates_len > 0) {
--		sta_params->supported_rates = kmemdup(params->supported_rates,
--					    params->supported_rates_len,
-+	sta_params->supported_rates_len = supported_rates_len;
-+	if (supported_rates_len > 0) {
-+		sta_params->supported_rates = kmemdup(supported_rates,
-+					    supported_rates_len,
- 					    GFP_KERNEL);
- 		if (!sta_params->supported_rates) {
- 			kfree(msg);
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0005-Fix-cast-warnings.patch b/package/wilc-driver/0005-Fix-cast-warnings.patch
deleted file mode 100644
index 713a15e667..0000000000
--- a/package/wilc-driver/0005-Fix-cast-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ebd083223883d479b2dd6f8a0da272797f90d236 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 31 Dec 2022 18:38:33 +0100
-Subject: [PATCH] Fix cast warnings
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 2 +-
- netdev.c   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 016aa06..2f40c9d 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1794,7 +1794,7 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
- 	if (ret != 0)
- 		netdev_err(dev, "Error in setting channel\n");
- 
--	wilc_wlan_set_bssid(dev, dev->dev_addr, WILC_AP_MODE);
-+	wilc_wlan_set_bssid(dev, (u8 *)dev->dev_addr, WILC_AP_MODE);
- 
- 	return wilc_add_beacon(vif, settings->beacon_interval,
- 				   settings->dtim_period, &settings->beacon);
-diff --git a/netdev.c b/netdev.c
-index 824afea..5a1a51d 100644
---- a/netdev.c
-+++ b/netdev.c
-@@ -899,9 +899,9 @@ static int wilc_mac_open(struct net_device *ndev)
- 				vif->idx);
- 
- 	if (is_valid_ether_addr(ndev->dev_addr))
--		wilc_set_mac_address(vif, ndev->dev_addr);
-+		wilc_set_mac_address(vif, (u8 *)ndev->dev_addr);
- 	else
--		wilc_get_mac_address(vif, ndev->dev_addr);
-+		wilc_get_mac_address(vif, (u8 *)ndev->dev_addr);
- 	netdev_dbg(ndev, "Mac address: %pM\n", ndev->dev_addr);
- 
- 	if (!is_valid_ether_addr(ndev->dev_addr)) {
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
deleted file mode 100644
index f5a92027da..0000000000
--- a/package/wilc-driver/0006-Support-Linux-6.3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 14b5eccf4145e7a5afc8bc65a15f26ac691f98d8 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 27 Sep 2023 10:54:18 +0200
-Subject: [PATCH] Support Linux 6.3
-
-With Linux 6.3 commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
-function of_get_named_gpio_flags() has been dropped but it was only a
-wrapper to call of_get_named_gpio() if the flags passed was NULL and this
-is the case. So let's use of_get_named_gpio() in place of
-of_get_named_gpio_flags() since of_get_named_gpio() never changed
-after its adding in Linux version 3.1.
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- power.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/power.c b/power.c
-index 6c59e0b..6ab8d63 100644
---- a/power.c
-+++ b/power.c
-@@ -25,13 +25,11 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
- 	const struct wilc_power_gpios *gpios = &default_gpios[0];
- 	int ret;
- 
--	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
--						     NULL);
-+	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
- 	if (!gpio_is_valid(power->gpios.reset))
- 		power->gpios.reset = gpios->reset;
- 
--	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
--						       NULL);
-+	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
- 	if (!gpio_is_valid(power->gpios.chip_en))
- 		power->gpios.chip_en = gpios->chip_en;
- 
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0007-Support-Linux-6.4.patch b/package/wilc-driver/0007-Support-Linux-6.4.patch
deleted file mode 100644
index 8339cc3cb6..0000000000
--- a/package/wilc-driver/0007-Support-Linux-6.4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 94fc4594659494b8c5cbdf1a719aea4d66d3398d Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 27 Sep 2023 11:20:50 +0200
-Subject: [PATCH] Support Linux 6.4
-
-With Linux 6.4 commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1aaba11da9aa7d7d6b52a74d45b31cac118295a1
-class_create() doesn't require first argument THIS_MODULE anymore so let's
-drop first argument if Linux version >= 6.4
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/5
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/bt.c b/bt.c
-index 48a5302..a752457 100644
---- a/bt.c
-+++ b/bt.c
-@@ -135,7 +135,11 @@ static void wilc_bt_create_device(void)
- 	ret = alloc_chrdev_region(&chc_dev_no, 0, 1, "atmel");
- 	if (ret < 0)
- 		return;
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 4, 0)
-+	chc_dev_class = class_create("atmel");
-+#else
- 	chc_dev_class = class_create(THIS_MODULE, "atmel");
-+#endif
- 	if (IS_ERR(chc_dev_class)) {
- 		unregister_chrdev_region(chc_dev_no, 1);
- 		return;
--- 
-2.34.1
-
diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index 7f970bd38b..3bccad20cf 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -10,12 +10,17 @@ config BR2_PACKAGE_WILC_DRIVER
 	  external module.
 
 	  The wilc1000 driver currently maintained in Linux kernel does
-	  not support BLE of the WILC3000 hardware. This package is
-	  meant to bridge that gap until Microchip can get WILC3000
-	  support upstream.
+	  not support the WILC3000 hardware. This package is meant to
+	  bridge that gap until Microchip can get WILC3000 support
+	  upstream.
 
 	  Supports both SDIO and SPI modes.
 
+	  Note that the version of this driver that is compiled is
+	  automatically chosen based on
+	  BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4 being set. See the
+	  project README linked below for more information.
+
 	  https://github.com/embeddedTS/wilc3000-external-module
 
 if BR2_PACKAGE_WILC_DRIVER
diff --git a/package/wilc-driver/wilc-driver.hash b/package/wilc-driver/wilc-driver.hash
index 4ada813ed8..a7c4f0fd1f 100644
--- a/package/wilc-driver/wilc-driver.hash
+++ b/package/wilc-driver/wilc-driver.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  4796b1a53781f8702a335b0146d488a9422b71dab39f6f154f955b0ad1711199  wilc-driver-linux4microchip-2021.10-1.tar.gz
+sha256  fbec43ca432a58a924c1d40ca4b7a37aeb117b2654135c225c85d6c5258de5be  wilc-driver-linux4microchip-2021.10-1-upto-linux-6.6.tar.gz
+sha256  a87188d7cfc7718231e8b6033139ee645f4ed543d8eaba384c30f9a7d25d89e4  wilc-driver-linux4microchip-2024.04-community.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSE
diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a7a902b6db..d4b9b135e8 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -4,7 +4,14 @@
 #
 ################################################################################
 
-WILC_DRIVER_VERSION = linux4microchip-2021.10-1
+# Set up driver version based on kernel headers
+# See the project's README for more information on this
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4),y)
+WILC_DRIVER_VERSION = linux4microchip-2024.04-community
+else
+WILC_DRIVER_VERSION = linux4microchip-2021.10-1-upto-linux-6.6
+endif
+
 WILC_DRIVER_SITE = $(call github,embeddedTS,wilc3000-external-module,$(WILC_DRIVER_VERSION))
 
 WILC_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
