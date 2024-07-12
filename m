Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9258C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCBE417C4;
	Fri, 12 Jul 2024 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7av1r2OURkZ; Fri, 12 Jul 2024 14:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0C1417F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0C1417F2;
	Fri, 12 Jul 2024 14:11:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15C101BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D972845FA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8o2EmD3jW6q for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:11:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FC11845F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC11845F5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FC11845F5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:11:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso15058515e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720793505; x=1721398305;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VT4sLzREcQAywy4ptH7zVXt6hWX0mPQ5wAxhOi8BjsA=;
 b=GIXaYGDQBC4Uu6mrQFiNpeps0lukFa+T0slXNONqVJKgxz7OD5W8kDrTisMhgQdfXT
 Bw1TTBumlZm8sOuJt87HKHiuA+p38DfM+G9chS6Ed4PTWatajHiDQ8QIzN+EzoAl23D9
 zKRMkp2RrvojPCJk00C/O8GjCh+kJfqN2qFH1hLQYYZNvjEpA1XOmAR9LabAygca3mUZ
 NKv6fvlmikktWc4PYGrPT8UEryCvRr3RuGyLth620y4F2k2KsuKug8A6gu0k7CsqEhVl
 V97meUxDG7CUHlzsCX0UP4dkUTV/utgp75p6ADGDJEicjvezt/7EL/aMMZ/QZbXj4bLS
 bcRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw7fXJjh2oB1RN+98qOxfBFOBlhtxmo23NFL5GJv1OcLrKx8yAGmqQPJWN9FCG2N1oXW9nX2TUrenS52aMp34m1LBJRYCP6g==
X-Gm-Message-State: AOJu0YxFcmkaQXbstvGZ/YLOw/lB//fo2lEs8LU8TiCxFSwZnfdRQO/5
 HhjvKEtjG1xnujuRBX7rfbc+D9GsRHUlf6VQdo5LzqbtxLG0zaAQd3WIeJiHIMbF1QM0sWY38+m
 1HrY=
X-Google-Smtp-Source: AGHT+IHolT5+5LBbpyRpuMhtCIDAozFEc9kxXQkixVFFa5vEoMeGPovhjCjo/DjE0EXsO58Oeo++cA==
X-Received: by 2002:a05:600c:2050:b0:426:67df:31e6 with SMTP id
 5b1f17b1804b1-426707d7909mr77753005e9.17.1720793504994; 
 Fri, 12 Jul 2024 07:11:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm10386900f8f.24.2024.07.12.07.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:11:44 -0700 (PDT)
Message-ID: <094496df-f537-4cd9-8695-f6c67d1577cb@mind.be>
Date: Fri, 12 Jul 2024 16:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20240712113306.829994-1-buildroot@heine.tech>
Content-Language: en-GB
In-Reply-To: <20240712113306.829994-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720793505; x=1721398305; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VT4sLzREcQAywy4ptH7zVXt6hWX0mPQ5wAxhOi8BjsA=;
 b=N3PZdMSz0yhZmyiAIG2+0mye/ZmPPclz3GJi40kYORb/lTrir31YBkfw6qaoUlLzwM
 CicRF1w3AnWbhxr0w/Nnw6KYnKN8Mk0eFX2GnnBejui9n9akBrbqf0FG2RhYusDNa7Sd
 9rIEi6y41BUgIB1uQZ6xwL1yFKyriIVDLxpoGbkUrXIv2gQ9rkJT1WDtfFpZPh8OAhy8
 kD6eJKd+5OyAq/MZ73/VWh4qwcAtrrnbi5Zjh7Hc5ep7Lx/gT/EmguugcdoGNPyoUplJ
 zbATK0lXOrIGwRFXMPabZLktPTG35aN2yC6Q0opi7oWlz1AeTWDcqmsTfzmbAR3qW3xm
 Sn7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N3PZdMSz
Subject: Re: [Buildroot] [PATCH] package/boost: cleanup HOST_BOOST_FLAGS
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

  Hi Michael,

On 12/07/2024 13:33, Michael Nosthoff via buildroot wrote:
> - fix alphabetical ordering
> - align to 80 char width
> - add comment explaining why options are enabled

  Thanks for this improvement!

  Perhaps you can also change it to one per line? Because honestly, that wall of 
text still doesn't look very clean :-)

  Regards,
  Arnout

> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>   package/boost/boost.mk | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 9b1baec5bf..84c95ef993 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -13,12 +13,13 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
>   BOOST_CPE_ID_VENDOR = boost
>   
>   # keep host variant as minimal as possible
> +# regex & system are needed by host-riscv-isa-sim
>   HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
> -	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -	contract container coroutine date_time exception fiber filesystem graph \
> +	--without-libraries=$(subst $(space),$(comma),atomic chrono container \
> +	context contract coroutine date_time exception fiber filesystem graph \
>   	graph_parallel iostreams json locale log math mpi nowide program_options \
> -	python random serialization stacktrace test thread timer \
> -	type_erasure url wave)
> +	python random serialization stacktrace test thread timer type_erasure url \
> +	wave)
>   
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
