Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F548C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620C060F9B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 620C060F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C3F440109;
	Sun, 26 Sep 2021 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQyqtwE3Dyvg; Sun, 26 Sep 2021 19:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC7440198;
	Sun, 26 Sep 2021 19:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 266CB1BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22B2B81A73
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LGgTFc-i6kh for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:51:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBE3181A5F
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:51:46 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id dm26so25856259edb.12
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YgIyrvWLFERKxX1XEPaKo/rqrczFiHM9bGMf/cydHIc=;
 b=ZgV+CfcTkDL9R8EDa2Ep5BZeWoKuIa48NAr2XVQ5cEVLn8kwykE2X+0XUA3RyRnpyw
 v0zCH7IR0SsaarnaDV6fr9pSqNeYWgo2I2UUSLilHtCAJ5Uvs/U1TmpkXSt0CmXc5AlX
 dRsFccBwBkjLOZwjiSoORz7Pka2Q3S2wZg3P4jOg0wRq3RZB7M6p283R0EeOlqXIRPAx
 Cj+S1Z2mC2QIkmA19/uuJkz4s2oUCbreHRudaAdeM1JF831Duub0xwfjSq5FIBZhH5OJ
 vbuGOWLZ0Og9Qo0xUnRUOESWFTMZSk58UGVny/61GJW1Pke8CUXTMP1Jnw1q3/BG+Dp+
 gmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YgIyrvWLFERKxX1XEPaKo/rqrczFiHM9bGMf/cydHIc=;
 b=S+shGhsCuIpDDyhSghXo2qFAtZ/wQZ3sTNctRyObt3glbFNoQ1uhz4NHI6VWzwIFm5
 DieCplO2/O9Q1cdD7Qc7SQsT5kGIjp2zg3lZR893uDdi3GDbbohzchTrYfduQAjMoJsd
 15xZMBhjvYKhAAQskK4dvTV1lxpRV2zM1WETYuwk2/Q1SKgqwaEh/d/me8zCKXKh+v75
 4K+TGXAjrNH1NtvkYvXmCCkt/I0bwU7ZNcFvY4HHh2HnQgegrl84AQQynq1o2jzUE25u
 Pp5yo0BZYHCcC4hMV0QsTDXYhR1qXaSIwVu9J5cHh29Hn5LYuuap2d6MtmUEazXWI8jN
 PIWA==
X-Gm-Message-State: AOAM530tUMsLbqGqqt30VR/DqPLeyWuE2mrFZtzipkuXQQhrAdQGC+uA
 idxbbbEC7idTbc+eciZb9RsbqA==
X-Google-Smtp-Source: ABdhPJw3qBFOwWtHfl/+CWnMPlAhpocSGEcJQ5PSuHL4WLLJbua65obqHPWQK+OsC7XARye7uuhyBA==
X-Received: by 2002:aa7:ccd3:: with SMTP id y19mr6695090edt.176.1632685905123; 
 Sun, 26 Sep 2021 12:51:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bt24sm7679461ejb.77.2021.09.26.12.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:51:44 -0700 (PDT)
Message-ID: <0738a1a5-581b-990c-bd2b-63a9c55ac365@mind.be>
Date: Sun, 26 Sep 2021 21:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210926133916.2689805-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926133916.2689805-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-visualisation-fishbmc: add
 dependency to glm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 15:39, Bernd Kuhls wrote:
> The glm dependency was added upstream in 2019:
> https://github.com/xbmc/visualization.fishbmc/commit/31eda216bc9f2f3883217471cfd01afde153c3eb
> 
> and was not added when this package was bumped to version 6.3.0:
> https://git.buildroot.net/buildroot/commit/?id=7ad1e18bfb93cce3d397b3a2afc3ad418b828e01
> 
> This bug was found while testing per-package directories.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-visualisation-fishbmc/Config.in                    | 1 +
>   .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
> index 66c1565bd7..4d86d8234b 100644
> --- a/package/kodi-visualisation-fishbmc/Config.in
> +++ b/package/kodi-visualisation-fishbmc/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
>   	bool "kodi-visualisation-fishbmc"
> +	select BR2_PACKAGE_GLM
>   	help
>   	  Fische visualiser for Kodi
>   
> diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> index 1008e6f6f1..8e0fcabff9 100644
> --- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> +++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> @@ -8,6 +8,6 @@ KODI_VISUALISATION_FISHBMC_VERSION = 19.0.0-Matrix
>   KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
>   KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
>   KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
> -KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
> +KODI_VISUALISATION_FISHBMC_DEPENDENCIES = glm kodi
>   
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
