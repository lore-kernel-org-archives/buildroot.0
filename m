Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353CFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE03541A1B;
	Sat, 23 Apr 2022 15:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Acw9VpkMv5A6; Sat, 23 Apr 2022 15:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B5C419E5;
	Sat, 23 Apr 2022 15:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3966C1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A0783E0C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4yg31xYzXaX for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A1F483E0B
 for <buildroot@busybox.net>; Sat, 23 Apr 2022 15:12:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e30so10173314eda.0
 for <buildroot@busybox.net>; Sat, 23 Apr 2022 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PNUIfJTCEHN0X8yAZ3efSB8Czuyut6ezrmOD3ErXYcM=;
 b=HYP5NbZGh3Qr9cCGuoQ5SdMD7BhxLYvxInTv68S/qKhMhS1vWoOXsDHRZtJ3I1DCme
 ehfR1bp0ZO/OfXzq1ADyQdp1ZIP5ndfbdn/CCJOaoXnPrFrvYdiw5fYMrMTyKIzoWfCM
 sfDVwmsgaoOsFpHMYdkzqzs3wRzspoEXhJKQvcsyo3qpWM7ACJl/POBSUvRmrjoNFIS2
 heZSTpbuQxwdbPUAtN26WNksM4O2b3lxsQhN6NixCwYG7yNW3SImh3hAWQmkCwzDde60
 QLznhqtRTCmAc5ReEFhq+2PbkHZjJIi1zpOsQfDTKg5xW5XhmgqvP5JHk08oglnPH19u
 7SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PNUIfJTCEHN0X8yAZ3efSB8Czuyut6ezrmOD3ErXYcM=;
 b=NdpbJTW0AwnWTDnxqMkcsbj5MwPS98JXUd+9WyCiDq1xmB9xrG/le1iEUg0mIWzs5Y
 DIWdKW6c5ABX1BnDdqHZZgNVCkaHLljQI9YA87D7dYjdF536v+lj3McQNrpugAu1ai0m
 Cx+HWpz6Zz93whhCtgiHPapeks4yb3EAAMwjyXhbQynVLWmdCCRQMnYSX0v+DOrBL6zp
 DY13qX2TYFKRRjyk2jrsXa+OI/XsqI6T+jRpYfXJXZ1RZ8AAJlkP7ZZ30CJudzUKPkcx
 2VN0XccQ8r4bx+3Y3uev58nt8v3eO/tKDYYCf+OM1vazGObXE0ViW02XHE/vUMsdqe1m
 XmJg==
X-Gm-Message-State: AOAM531bQWNFpMWjfbzG+fLKcvmdShpgekJAWg8YZVgDkk/7ZnHO3cUr
 z4u9SA3SoDCzw0Nxv8jYOGKKAA==
X-Google-Smtp-Source: ABdhPJzOwlR+mVlQBecMtTvnbOtLSGpW3AkAANJZ+3NeJvFItbbDEoY6LUe3q4Ixkj8yb+gI4FfdAA==
X-Received: by 2002:a50:954b:0:b0:41a:c9cb:8778 with SMTP id
 v11-20020a50954b000000b0041ac9cb8778mr10518548eda.165.1650726736974; 
 Sat, 23 Apr 2022 08:12:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a508dc5000000b004241a4abbdfsm2333284edh.45.2022.04.23.08.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:12:16 -0700 (PDT)
Message-ID: <840c347b-841d-74ef-d4ad-e38b9126bb38@mind.be>
Date: Sat, 23 Apr 2022 17:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220420072530.3422018-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420072530.3422018-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/enchant: bump to version 2.3.3
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



On 20/04/2022 09:25, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, as well as your other 5 version bumps, thanks.

  I also changed the author email on each commit to @gadz.org to match your 
signoff (I have an apply-hook that checks this). It would be nice if you could 
configure things so that your mails already have this.

  Regards,
  Arnout

> ---
>   package/enchant/enchant.hash | 2 +-
>   package/enchant/enchant.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
> index 9df5316aa..36ac4e07b 100644
> --- a/package/enchant/enchant.hash
> +++ b/package/enchant/enchant.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e  enchant-2.3.2.tar.gz
> +sha256  3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891  enchant-2.3.3.tar.gz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
> index e00fcb25e..ee6f06195 100644
> --- a/package/enchant/enchant.mk
> +++ b/package/enchant/enchant.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ENCHANT_VERSION = 2.3.2
> +ENCHANT_VERSION = 2.3.3
>   ENCHANT_SITE = \
>   	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
>   ENCHANT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
