Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29D4C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 05:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D11B60F36
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 05:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D11B60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0389740269;
	Sat, 14 Aug 2021 05:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doGx_CgYOB9f; Sat, 14 Aug 2021 05:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D98340294;
	Sat, 14 Aug 2021 05:50:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 601E61BF2B1
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 05:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E9FD401FA
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 05:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HudXt1Lk757t for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 05:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B065C400AE
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 05:50:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w5so22212130ejq.2
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F3lsW6wBE7AbJllI8Tb7CxbWQ6JwYqRNCggHVS51HnY=;
 b=BQ0W3mSJNRylst/DXiOlcWmG90wuBWCbtRJLlX+ORcAu0BmcD2ws/fIR0ZhDcgSLue
 wgqFshllhEc7seMKgtbHmq2Dfal0m0mUJ2FeDNnVRw4mRe+z0ERLIrgPDp6LH+y++qAz
 kmZtH6plAoKDQBjdZS2Fslmd1iyGNFNgIcuFvM3W5CfDpJb/nfbO+B4WZYC1e75R8RWL
 A+1rd2p9yWzaNZAmraydqZc42Jqiezm2qYcN4aclCMEN1Uhu+RT0AwOVkpDRjzLVwdOR
 F5KBWkV9Xr8U8rliijfBYgiIu0u42EnGZqiOtipBy38PVALBTmsRIp38Fj1xLM2qS/rN
 Sstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F3lsW6wBE7AbJllI8Tb7CxbWQ6JwYqRNCggHVS51HnY=;
 b=ig1sU949QawTD4iokAXziFwiLd/6s6bVacq4EP7mOy82YA3d+HK32TEBZ/VNU5S5zV
 DxfnYXGstTq+o2WSCAJ2GfrHYKIRqcK6B9H34/hMz94MZuCqZisnWGVtBCZkiJNNjw0O
 YsHEEW/Pl0IcbRiVBzIlbImgsn7pw4ORKYt9kEwHhN/yFe433Q3dkrzDIAy/4bP7JUeB
 aKufAcX51aqAvI8nQKkG/0TYVsRhm09PCaXQUwTTJjBbdx0+sBNuoeKFwUSOjFXm2gch
 3u0gErAzv778kp6IvqCW8VtOLE6lAR9xs92sXOOhs3Qa6+bZC14IoQsm9eLSBFLmsV/x
 UjaQ==
X-Gm-Message-State: AOAM531TpALotGVb5gCOTc+sdmJu21bBSLrK5JgeitNgIl4SFHcVjAFf
 fQ9BqZReTLLdWfDxHW2J9Lgv3V13ON459lvPUnk=
X-Google-Smtp-Source: ABdhPJx56m5dIbcjJjtLwB4prDbC+Q5LB52FE3e8RS9M8U0bDA4uQQqQryKB3hvMYx8ByIA0vIbvcpxhCnBCrQO/xYY=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr6015785ejy.407.1628920249752; 
 Fri, 13 Aug 2021 22:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210813212813.4931-1-buildroot@heine.tech>
In-Reply-To: <20210813212813.4931-1-buildroot@heine.tech>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 14 Aug 2021 08:50:38 +0300
Message-ID: <CALFsTFV9cMZHPHfD-73-z3JuNNEs87=_DPNKXvayjKXLbtj7oQ@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump version to 1.9.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Sat, Aug 14, 2021 at 12:28 AM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/spdlog/spdlog.hash | 2 +-
>  package/spdlog/spdlog.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
> index 5d1ff2f520..02756fc98c 100644
> --- a/package/spdlog/spdlog.hash
> +++ b/package/spdlog/spdlog.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  944d0bd7c763ac721398dca2bb0f3b5ed16f67cef36810ede5061f35a543b4b8  spdlog-1.8.5.tar.gz
> +sha256  6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38  spdlog-1.9.2.tar.gz
>  sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index ee875ae560..b5dfc0c7b4 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -SPDLOG_VERSION = 1.8.5
> +SPDLOG_VERSION = 1.9.2
>  SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>  SPDLOG_LICENSE = MIT
>  SPDLOG_LICENSE_FILES = LICENSE
> --
> 2.32.0
>

This patch seems fine, but it's not really independent because the
compilation fails until a newer version of fmt is used.
So ideally there should be a small series with both patches.

Asaf.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
