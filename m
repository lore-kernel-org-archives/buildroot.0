Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D806AEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C32F81E60;
	Sun, 25 Jun 2023 13:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C32F81E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHjByMatJn9X; Sun, 25 Jun 2023 13:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B262C81E4A;
	Sun, 25 Jun 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B262C81E4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5071BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB95140158
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB95140158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jakevQ73woS for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75D4940102
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75D4940102
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:53:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso79075166b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701237; x=1690293237;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3LLwGzV3q/diaBDIq4ZIPFO4z3eiPne+l2Rzx8LiZk=;
 b=BE6OqaB1+P7czxxwO9GRUBFOz4fU7DHmJ+C3EMsv1Sv3d5QLGmjL4gKI+hoAkf7miB
 fyt3n2frq6P7/hh40GK16dsbQUwU/opbJpk9mboZo9yZDvVYrq3XvWT1Hl5blPxVDAFD
 G1ANH8hkBl6qWmJucsvXexWuuC/l3gcNljMTuX0ba3rOKCDqBsMrcgPd3AHpGozvKE98
 wBZ9WLqlSSAR1QxfWP8TXX5lMwuBPQCM/iHmgz7j0QM47Drw/0giygYx1onXnDDxGpuX
 iVS8+nqESGb20/jl1qKUkkuAHDR1zsD9D16Hfob3uDQOj1RyjGuNFsa/dGvmpIC4y84G
 VO8Q==
X-Gm-Message-State: AC+VfDzX5Q0liFbiO4GcrWrRI9vRCdY2nsVW6BT7Q1z2EFAUkAzYvGr2
 KrVD2OBUFx82ectsKzcuSGIdPHrsdndAQqnUpo0=
X-Google-Smtp-Source: ACHHUZ4DijSxIq9raZGy0+5U9kt1o+q6Z00l1bjqsWAVjQv+x6dC/BRBY31KMjVKcVuPPTBLsZWSJw==
X-Received: by 2002:a17:907:98c:b0:982:8c28:c50d with SMTP id
 bf12-20020a170907098c00b009828c28c50dmr18546250ejc.58.1687701237703; 
 Sun, 25 Jun 2023 06:53:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170906561500b009888eda6b0asm2134761ejq.170.2023.06.25.06.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:53:57 -0700 (PDT)
Message-ID: <3eb621a6-bca7-440f-9f41-d8bb1b6b737f@mind.be>
Date: Sun, 25 Jun 2023 15:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230624152120.2879074-1-bernd@kuhls.net>
 <20230624152120.2879074-2-bernd@kuhls.net>
In-Reply-To: <20230624152120.2879074-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701237; x=1690293237;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3LLwGzV3q/diaBDIq4ZIPFO4z3eiPne+l2Rzx8LiZk=;
 b=cfejyx5TzMPxvkjCMNYAGsBZxtExYdvDXhDNaXjfI129O4+LBkuau4DxS+x9gbh8g0
 3Ejq6jcT1FyfxEnjkeubY9irhpH/LWVvukdxxmu4DRQXAd89+GjpJRt/KguvCn6n5uiJ
 qh2uirfyoZMNDO37B/cgVxnYCguKRq464m8rpM2whDm3IRbVNdfi9hbrS+zhq15aoqFu
 o5f7qihA03IkKb1hssMRgTmHaedaA1svXdCvTE7ULmeIVIUuG3aSKOi+nv/4ofCyUXt/
 IhWAhvL1AnvnUB8R7+vLv/QBreMi2XC9BMGXXhS3r/vRV2QtQ7iwNe5kJ9Vw69KC+152
 bN+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cfejyx5T
Subject: Re: [Buildroot] [PATCH 2/2] package/iwd: bump version to 2.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2023 17:21, Bernd Kuhls wrote:
> Changelog:
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog
> 
> Depends on ell >= 0.57:
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/configure.ac?id=464f5c25db8150dc8cea21042a5bac09a8880edc
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iwd/iwd.hash | 2 +-
>   package/iwd/iwd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
> index 1647f93d9e..4eea644842 100644
> --- a/package/iwd/iwd.hash
> +++ b/package/iwd/iwd.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
> -sha256  b0506d797a8bfb88f3c3eeea5e49dcf4ee8e6cef118f57c118e587eeb377ac64  iwd-2.3.tar.xz
> +sha256  f7ac93aeef672604f5b5194ca038035ae222925be392c4345873c9742f477797  iwd-2.6.tar.xz
>   
>   # License files
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index c54031b102..f20427114b 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IWD_VERSION = 2.3
> +IWD_VERSION = 2.6
>   IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
>   IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
>   IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
