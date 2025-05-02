Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4429AC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C5280BF8;
	Fri,  2 May 2025 10:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8oy5t6N7lug; Fri,  2 May 2025 10:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED21E8198A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED21E8198A;
	Fri,  2 May 2025 10:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3374EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43168198A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jacpCVZ5zvoT for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88C8B80BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C8B80BF8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88C8B80BF8
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8583D1C1113; Fri,  2 May 2025 12:36:30 +0200 (CEST)
Message-ID: <39e6bf66-8836-4375-9baf-86f38e949a55@rnout.be>
Date: Fri, 2 May 2025 12:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Kris Bahnsen <kris@embeddedTS.com>
References: <20250417171339.3718898-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417171339.3718898-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AuV097IzN096NyUX6YNSqdhQK+cLYGYg4DMRlnhE0U0=;
 b=KQqhgdl/4BBQPwKwKB9+1x27P+y8kalLO7ILdhH2vDvkL2WjehSHpbGloKNTEf1duw0udQ
 2Vq5JyLCL7348YQwl/14/YWAiVd4BGN69dCJJQbiAxN6VoYooaU+EV8zgf1wRC7V3EFB1I
 DDQfHfjQJIlCHKe0uXs6urSzK1d9YcQYQyklrOq7kfJ2vfzDKPtPqTVdSI3VlyWFX4lcQq
 8q/l3SloO1Gvn0sOs1Z6nDq2Gti20Jyt+33PA+mUjlhXuidvpedX14+3qMqCGYGKQlwh3j
 pLBqVhzNXJ0dgSJqiUhBznZJ8t/oa/WFbZJVtT/HUb+ZRok8+MuMbk6YpWU6iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KQqhgdl/
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/04/2025 19:13, Giulio Benetti wrote:
> Add local patches pending upstream to fix 3 different API changes
> throughout Linux 6.7, 6.8, 6.10.
> 
> Fixes:
> https://autobuild.buildroot.org/results/e001f70dab4c9cebdbde0443f4f8bb6b42ae5561/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../0008-Fix-build-with-Linux-6.7.patch       | 46 ++++++++++++++++
>   .../0009-Fix-build-with-Linux-6.8.patch       | 34 ++++++++++++
>   .../0010-Fix-build-with-Linux-6.10.patch      | 55 +++++++++++++++++++
>   3 files changed, 135 insertions(+)
>   create mode 100644 package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
>   create mode 100644 package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
>   create mode 100644 package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
> 
> diff --git a/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch b/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
> new file mode 100644
> index 0000000000..9714a828eb
> --- /dev/null
> +++ b/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
> @@ -0,0 +1,46 @@
> +From c2024eb93f6d7ec605226d5d8a29ea17fbc71b5d Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 17 Apr 2025 19:06:48 +0200
> +Subject: [PATCH] Fix build with Linux 6.7
> +
> +During commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb55441c57ccc5cc2eab44e1a97698b9d708871d
> +struct cfg80211_ap_settings has been split into multiple structs including
> +beacon. So is Linux version is 6.7+ let's use &info->beacon in place of
> +beacon.
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + cfg80211.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/cfg80211.c b/cfg80211.c
> +index 5c92062..25da3a1 100644
> +--- a/cfg80211.c
> ++++ b/cfg80211.c
> +@@ -1822,13 +1822,21 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
> + }
> +
> + static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
> ++			 struct cfg80211_ap_update *info)
> ++#else
> + 			 struct cfg80211_beacon_data *beacon)
> ++#endif
> + {
> + 	struct wilc_vif *vif = netdev_priv(dev);
> +
> + 	PRINT_INFO(vif->ndev, HOSTAPD_DBG, "Setting beacon\n");
> +
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
> ++	return wilc_add_beacon(vif, 0, 0, &info->beacon);
> ++#else
> + 	return wilc_add_beacon(vif, 0, 0, beacon);
> ++#endif
> + }
> +
> + static int stop_ap(struct wiphy *wiphy, struct net_device *dev
> +--
> +2.39.5
> +
> diff --git a/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch b/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
> new file mode 100644
> index 0000000000..2bafd53a9a
> --- /dev/null
> +++ b/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
> @@ -0,0 +1,34 @@
> +From 90e679f1b7caad02e68fa8672be6569eb1b2b76f Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 17 Apr 2025 18:56:55 +0200
> +Subject: [PATCH] Fix build with Linux 6.8
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d26270061ae66b915138af7cd73ca6f8b85e6b44
> +strlcpy() has been superseded in favor of strscpy() so let's #define
> +strlcpy as strscpy if Linux version 6.8+
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + mon.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/mon.c b/mon.c
> +index 2c9c2d9..20b7e20 100644
> +--- a/mon.c
> ++++ b/mon.c
> +@@ -6,6 +6,10 @@
> +
> + #include "cfg80211.h"
> +
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
> ++#define strlcpy strscpy
> ++#endif
> ++
> + struct wilc_wfi_radiotap_hdr {
> + 	struct ieee80211_radiotap_header hdr;
> + 	u8 rate;
> +--
> +2.39.5
> +
> diff --git a/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch b/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
> new file mode 100644
> index 0000000000..08444b06e2
> --- /dev/null
> +++ b/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
> @@ -0,0 +1,55 @@
> +From 684eb3e40c88ee7a2cd4417a12b9b27a35e86655 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 17 Apr 2025 18:41:07 +0200
> +Subject: [PATCH] Fix build with Linux 6.10
> +
> +During commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d
> +is_dma_mapped member has been dropped since it was not used anymore. The
> +DMA mapping is done directly in single spi drivers in case it's supported
> +so having is_dma_mapped set to 1 lead to code breakage. So we can consider
> +it always as 0 and basically guard it if Linux version is 6.10+
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + spi.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/spi.c b/spi.c
> +index f7b43e2..be616f4 100644
> +--- a/spi.c
> ++++ b/spi.c
> +@@ -338,7 +338,9 @@ static int wilc_spi_tx(struct wilc *wilc, u8 *b, u32 len)
> + 		memset(&msg, 0, sizeof(msg));
> + 		spi_message_init(&msg);
> + 		msg.spi = spi;
> ++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
> + 		msg.is_dma_mapped = USE_SPI_DMA;
> ++#endif
> + 		spi_message_add_tail(&tr, &msg);
> +
> + 		ret = spi_sync(spi, &msg);
> +@@ -385,7 +387,9 @@ static int wilc_spi_rx(struct wilc *wilc, u8 *rb, u32 rlen)
> + 		memset(&msg, 0, sizeof(msg));
> + 		spi_message_init(&msg);
> + 		msg.spi = spi;
> ++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
> + 		msg.is_dma_mapped = USE_SPI_DMA;
> ++#endif
> + 		spi_message_add_tail(&tr, &msg);
> +
> + 		ret = spi_sync(spi, &msg);
> +@@ -427,7 +431,9 @@ static int wilc_spi_tx_rx(struct wilc *wilc, u8 *wb, u8 *rb, u32 rlen)
> + 		memset(&msg, 0, sizeof(msg));
> + 		spi_message_init(&msg);
> + 		msg.spi = spi;
> ++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
> + 		msg.is_dma_mapped = USE_SPI_DMA;
> ++#endif
> +
> + 		spi_message_add_tail(&tr, &msg);
> + 		ret = spi_sync(spi, &msg);
> +--
> +2.39.5
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
