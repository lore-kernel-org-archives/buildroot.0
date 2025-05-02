Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE2CC3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8C9415A2;
	Fri,  2 May 2025 10:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9_l_PrEtYED; Fri,  2 May 2025 10:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38CBD41575
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38CBD41575;
	Fri,  2 May 2025 10:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2197A229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 077714156F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNp4ztZkSVzf for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:37:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A98641575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A98641575
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A98641575
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FDF41C111C; Fri,  2 May 2025 12:37:05 +0200 (CEST)
Message-ID: <210f3dfc-5b13-4e73-8a53-4949e7005fb0@rnout.be>
Date: Fri, 2 May 2025 12:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20250416200539.3277268-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250416200539.3277268-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ryX2TepOdR0tFnPPstMUITIU/6ijjrIxWRi/q9T8hJw=;
 b=b7QrWHDGKc/MmpgdZDNJk+Og5+0UAJ1d/zg9VjyEaNits6LUexyT+P6MyizFDxLmv5TQ1S
 VLsCh6dSwHYTCJ01DNTtB9wllyhTL3LE0+v/xGQAe1yJh3fD+F0xJ5hixkwyermPn/Gdz5
 mCFwm+2tNQMqt2C8sx6NqnNyHmro02YeaNxG++S91KCsDvUuf1gnn+006KetFnDgr0ZkRl
 9noXDBpyb3TqrdIj15Fj91NP1091XvzxJisWoAv71cAd0TBtWCfqTlF6zV6CJr2N8fSJOm
 84TBDvpFqlqs44VGQCcPPmQtS1oc9NSL5vTGIJuk+QPtYt120TmVtMsK2h+RNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=b7QrWHDG
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with
 Linux 6.13
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



On 16/04/2025 22:05, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux 6.13
> 
> Fixes:
> https://autobuild.buildroot.org/results/940e7f95fff017b8c7cffb778911ae0386980fa3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Fix-build-with-Linux-6.13.patch      | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
> 
> diff --git a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
> new file mode 100644
> index 0000000000..2350dc2e5e
> --- /dev/null
> +++ b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
> @@ -0,0 +1,35 @@
> +From d71ab09447d9c3043203b5c3b5868e99bc4e0ca8 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 16 Apr 2025 22:00:59 +0200
> +Subject: [PATCH] Fix build with Linux 6.13
> +
> +Commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
> +adds struct net_device *dev as argument to set_monitor_channel(), so let's
> +add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
> +
> +Upstream: https://github.com/lwfinger/rtl8723ds/pull/51
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + os_dep/linux/ioctl_cfg80211.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
> +index 53ccef4..75391e7 100644
> +--- a/os_dep/linux/ioctl_cfg80211.c
> ++++ b/os_dep/linux/ioctl_cfg80211.c
> +@@ -4520,7 +4520,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
> + }
> +
> + static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
> ++	, struct net_device *dev
> ++	, struct cfg80211_chan_def *chandef
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
> + 	, struct cfg80211_chan_def *chandef
> + #else
> + 	, struct ieee80211_channel *chan
> +--
> +2.39.5
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
