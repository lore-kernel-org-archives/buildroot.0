Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4424AC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5F4818BE;
	Fri,  2 May 2025 10:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weUl95-KXfWo; Fri,  2 May 2025 10:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF1CD8109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF1CD8109F;
	Fri,  2 May 2025 10:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12349EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC63540B1F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id za7H5CN00FwO for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3A4840B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A4840B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3A4840B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CCE191C1112; Fri,  2 May 2025 12:36:53 +0200 (CEST)
Message-ID: <fb2be257-47ee-46eb-a7ea-c56200d8a237@rnout.be>
Date: Fri, 2 May 2025 12:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250416195636.3131473-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250416195636.3131473-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hTfuuQIbW4A3DUQzMWTNdtdEWi1n8zVXvQz1riHobfY=;
 b=g0uJ4JV/C9Ev8VVdbK3jgoEGGZJQyw36/MyTMl5LZ6djAGRzHEToxV/82q2YNq/ixWLSeI
 soTJyOFKRZY8VmTWp3oaacxJKX/0nI0ZFaIDrhFJhEG/7noZVhaqYMSP5V0EQLoniNTpmI
 AIHE23ur0x/5i/ye1EXjStbJHUUvmiKV8Dcdhp8/VFBsZa6uN1HWPbKwfAuFcgPZXT2T/0
 TvLNQtViie3Dw68E7L3cQmt9fu213IHKO/hi6mAkKX35K9rbpMIWT4nJfAiV2QWWeyE3OI
 tS3GkDV+SmX++3h4dZ8o+mw6lzqK4ain7q+YaeEBby5f5ZFWa42OG0oJB0RIxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g0uJ4JV/
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with
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



On 16/04/2025 21:56, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux 6.13
> 
> Fixes:
> https://autobuild.buildroot.org/results/4a0ebbcd62a2bfc59a7f6183f100f0e111cee750
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Fix-build-with-Linux-6.13.patch      | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
> 
> diff --git a/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
> new file mode 100644
> index 0000000000..3594283ff1
> --- /dev/null
> +++ b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
> @@ -0,0 +1,35 @@
> +From 408ac4abdd1e187624ebef9f6a45ecc437525de5 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 16 Apr 2025 17:34:54 +0200
> +Subject: [PATCH] Fix build with Linux 6.13
> +
> +Commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
> +adds struct net_device *dev as argument to set_monitor_channel(), so let's
> +add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
> +
> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/463
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + ioctl_cfg80211.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
> +index c6ae5aa..270cfce 100644
> +--- a/ioctl_cfg80211.c
> ++++ b/ioctl_cfg80211.c
> +@@ -4404,7 +4404,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
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
