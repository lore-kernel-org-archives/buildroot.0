Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F907CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFE92400C8;
	Sun, 15 Oct 2023 18:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE92400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17Qo03uwfaeS; Sun, 15 Oct 2023 18:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82E1340185;
	Sun, 15 Oct 2023 18:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E1340185
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63DAE1BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 496EC81DAB
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496EC81DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjBzTcW_4Wvp for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:13:51 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F7F281D11
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7F281D11
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9bda758748eso324167166b.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697393628; x=1697998428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ingpjlpqGWd6HIT7AYEKdk/hytbkAmNwtVxRhvDaXmM=;
 b=vtFoK/HK5fbkEDoyzEDVOtNoA93/HXNy9OfDzyO2FnGd9ID2aJAsDjCllhopADqSoF
 DSK1HpBTOHnb7Fp/s6hOHl9F5VaEfwvxTG8RaUjdC9+pxDIaFwgMrLEiZTMYgBvxAjlv
 B6KVlFeUOTwQ5bjRK7dBsGqzk5xOeQCS00gsaouVkSnJpyjcR7T7DvkC383AxSqwN8J2
 nNKIBnZjql/WBoSbWhfjqxY4oN28OCkmhpm4FUw3gi9L/k6J95dUfffSLA+aawxtaTVm
 JEQ4TjYYINBkrR04A0UF+5AX+OAuTFCF00Oe/HOiu1fv2kgIhjHa5zSF+K2azz8PTuxH
 tDjw==
X-Gm-Message-State: AOJu0Yz/XYnRPy41wVBpKZSLcSKTq1C6fxXEHwC7lKie1Na5w4Z3pNIU
 PUX/14XiLrkmBdSGfA2OwqriOQ==
X-Google-Smtp-Source: AGHT+IFrvzC1RPJBfIoxUXQOnZ5VNDtJOlDpljfkqV3nCDjmz7YZ1bU1XGnliqPT9CkxjESU1mVsDg==
X-Received: by 2002:a17:906:23ea:b0:9b7:37de:601a with SMTP id
 j10-20020a17090623ea00b009b737de601amr25714293ejg.49.1697393627313; 
 Sun, 15 Oct 2023 11:13:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ks18-20020a170906f85200b009a193a5acffsm2567436ejb.121.2023.10.15.11.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 11:13:46 -0700 (PDT)
Message-ID: <6e13becd-d5a4-48ab-7453-17f09665bcba@mind.be>
Date: Sun, 15 Oct 2023 20:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20231015173706.408993-1-bernd@kuhls.net>
In-Reply-To: <20231015173706.408993-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697393628; x=1697998428; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ingpjlpqGWd6HIT7AYEKdk/hytbkAmNwtVxRhvDaXmM=;
 b=D6SrgwYTNQjnl7olrHfWgPgfd3eVLYA4z9Axs1EWElh1P9nvE/bAaOfeyVBZnYgnoP
 Tlh+QYqr1gVGqfhsTNjnXTHBNh8h7TXCm0+69OefmjqlcQBRbgeI3yJuM3UMN8yc3hwG
 1JL3H+HxRvWqnX+RBh0b1HUiYiPvP+XElU/LUwTvzJaQoPRLc6PbB8tky3QX9pYElm/n
 vgxByGPbcMhOdEnYZ6N4DeXfEZVUkzRMnsQuRCEq4Xb7dPiTaKfzep2I5bqMR5RadqeC
 SYCPoZUNtCZRi4j0jeeirXNGpOoOAdOK6L9BZlQg8kkeJMARydGbpBZ3wsz9K/06okBe
 pcYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D6SrgwYT
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.96.2
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 19:37, Bernd Kuhls wrote:
> Release notes: https://seclists.org/oss-sec/2023/q4/107
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/exim/exim.hash | 4 ++--
>   package/exim/exim.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index 6cdeea0614..e784bf7521 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>   # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  93ac0755c317e1fdbbea8ccb70a868876bdf3148692891c72ad0fe816767033d  exim-4.96.1.tar.xz
> +sha256  038e327e8d1e93d005bac9bb06fd22aec44d5028930d6dbe8817ad44bbfc1de6  exim-4.96.2.tar.xz
>   # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  ef1a0e57c59cdf4e915b3ac5dcdbc69f565b14dd92b0527f6796b2c46a9ec34f991f9790fb4171c99417f7e482cdd62d77e780cc71fab227c8bed876103f7fdd  exim-4.96.1.tar.xz
> +sha512  dc9f6a114e64ac826489edff88d50a24195b64714428e691c10a7bfb119b3ebb6455bf80cbb34dfd0a4e2e44cbde72effb009357a8e0a6065e512fe32092e3ed  exim-4.96.2.tar.xz
>   # Locally calculated
>   sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index f5695d048d..166a4ead54 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EXIM_VERSION = 4.96.1
> +EXIM_VERSION = 4.96.2
>   EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>   EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>   EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
