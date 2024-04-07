Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AEBCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F5140835;
	Sun,  7 Apr 2024 15:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYovOkn6dYtL; Sun,  7 Apr 2024 15:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5848E40851
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5848E40851;
	Sun,  7 Apr 2024 15:49:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4F581BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB1981F0D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fcvva-puCKLN for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BC3C81EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC3C81EFA
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC3C81EFA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:49:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d68651e253so43217631fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712504971; x=1713109771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWybMUkhlKWn66y1/BscUIa6ktFpDWLYoFObpZcrl7A=;
 b=BFGMFCXiWzudkd7lfCSodBDwROC0B5mkttYruoVXVJ8+wodypqY+JkESjCMb67fac9
 XCzwsUedKyL0CbwBBSY+kD3m47azAdS7IZ90Nop4G45V9sChLzuNNbmLphIRA1gwRyBY
 kpVsip7lv0RwYFesEa4mWJ7JNjch9MCNMWXY5IdsPSSM13PNIhZ8U7wZlthDpPmxbiPj
 xkZMZF7h7+YET6tfKTYEOZA8RrT63aFpO56bS4HcREgUWwQ+oKTqX8dcR2ieCd74LLnE
 Ns0/3DQmPHT2JsiqUrK5EW7Cf/oAImdY43y4MLuHDEErbSKiGw2nY3/GNyDYo4b9c3d5
 EI3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSwNabQeLWxrNgd4xTfaDjNjpewG9swqEc3KrLy4SSJ3q8wiHZj2VJLV0BVPKxcWxAVaunS5ZuwbT4SrTVaPy7/7EeBWyFiw==
X-Gm-Message-State: AOJu0Yzw0+T2odirG8O0DKLeQtmxOWHfreb8pPNLSagB3+S6mJHnKDne
 k2id0+HkVSBopLyp4bub5ntNaIliRUZSmsHe4Nk2BS04lmBFF9ooFAoBjeVzx+o=
X-Google-Smtp-Source: AGHT+IGXIM+FMQz5Td2J3n6vBHy6Gu+HK6UhjpZsYvSULoGqgO10r+g7YII8KCCTXqT+9+0lBpr7fg==
X-Received: by 2002:a2e:98d9:0:b0:2d7:8152:1ee5 with SMTP id
 s25-20020a2e98d9000000b002d781521ee5mr3997563ljj.31.1712504970760; 
 Sun, 07 Apr 2024 08:49:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b004148d7b889asm14022673wmq.8.2024.04.07.08.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:49:30 -0700 (PDT)
Message-ID: <f2b7f3fa-2068-4e41-8b53-6a9de7bb12b5@mind.be>
Date: Sun, 7 Apr 2024 17:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Saeed Kazemi <kazemi.ms@gmail.com>, buildroot@buildroot.org
References: <20240304202136.3291714-1-kazemi.ms@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240304202136.3291714-1-kazemi.ms@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712504971; x=1713109771; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kWybMUkhlKWn66y1/BscUIa6ktFpDWLYoFObpZcrl7A=;
 b=EUeloQNWWHXnb7Ut4xUqQ3poFzDjLot0+PEGWGxzYACecdQD83c0VgRpRgrvEmYtCz
 lFFDXH4ajOXkBb43GsInQgV0tc7aasG77XJi1f24wVDPYjo3i/JHSuz7Y85IqIijv3bp
 AmD7LmIFeiMclTRIL149VdECaHSogNSd2Ojs14BuVfInania3vpd1zA1nsSp0Wo3Lkn5
 hxly9scJRUAccxgAiGVEhiqjvxelcAXQ9pRwFL5jVm0NeLuwggqXUQJOcmpWZ8gV5YVn
 SGJJGKYRGGM9NNGrEpGYK0OApApci3WAaNUz2R3UgbwGTH4kol5/0gBsqX5zuesLHNU9
 cMyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EUeloQNW
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.5
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

  Hi Saeed,

On 04/03/2024 21:21, Saeed Kazemi wrote:
> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.18.5
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

  When you posted this, there was already a bump to 0.18.3 from you on the list. 
Peter ended up committing that one instead of this one. Similarly, you now 
posted a bump to 0.18.8, and I was about to apply this one...

  Please create an account on https://patchwork.ozlabs.org/project/buildroot 
with the same e-mail address as the one you use to post patches. That will allow 
you to change the status of your own patches. Then you can change the status to 
Superseded when you post a new version bump, and we can avoid this confusion.

  Regards,
  Arnout

> ---
>   package/eza/eza.hash | 2 +-
>   package/eza/eza.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eza/eza.hash b/package/eza/eza.hash
> index 64f46759d7..e01bdaab2a 100644
> --- a/package/eza/eza.hash
> +++ b/package/eza/eza.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  11e6127a615744b52d52d66ebcdf9e5366f62746e8123b3eec00e35a057db988  eza-0.16.0.tar.gz
> +sha256  18a9dfba0904a7f3099ac04fc99089914414eccfebb6eedf9ddf16355b0c9c1d  eza-0.18.5.tar.gz
>   sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
> diff --git a/package/eza/eza.mk b/package/eza/eza.mk
> index b11c1a1e7f..c65a2af28c 100644
> --- a/package/eza/eza.mk
> +++ b/package/eza/eza.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EZA_VERSION = 0.16.0
> +EZA_VERSION = 0.18.5
>   EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
>   EZA_LICENSE = MIT
>   EZA_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
