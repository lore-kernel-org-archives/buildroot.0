Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8401EEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B59612D1;
	Sun, 25 Jun 2023 19:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B59612D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcSflw3wkzCJ; Sun, 25 Jun 2023 19:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E638612B5;
	Sun, 25 Jun 2023 19:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E638612B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D41AC1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B96F94098A
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96F94098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opctpippwSHq for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:39:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76FA440974
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76FA440974
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:39:32 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51d80d81d6eso1615736a12.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721970; x=1690313970;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJCv9XLM8wVFCHnBdozl/kxP21HydJY3kuEGBT5iSh0=;
 b=WGmqTHbCzg7IyGTlYSmSWKnQhYowImvV394aczQ85cRKF8v5rk+j/Rdn0nIllYBZjz
 WIF/sAYlvbRFXEU+AAzmcDG/PmhEItvsyg8Pjz8Co+TXyewUgH7hI9hpKybSl4fo2kYV
 Zyoieb5x1BrvRx++zLZLotT9EOWpZXx/E2NQR4FcvskWuzMDr/YUBVSLzFYkHPpqBxDV
 L2Sok9XNshlIxFnJBQzihiWE8AtCNLL2NVdtg7VqpBTQ0K3vrnhFO+42asVZF0wT4BsG
 1NhG2+UkxmJo0829hvJvhSn/9jQa0xq3ZRvubA6r/wTZDG4BNcoDaDw/QD35i4L2f47M
 2efg==
X-Gm-Message-State: AC+VfDwK/QobQIZEGZzwt96ngsyVFN3kgXoP8Ub0JWRfg3C718WuMEas
 LFj5Pef3+QHFArT8mAByP9nqjg==
X-Google-Smtp-Source: ACHHUZ7lWDmh2Fbjbn2pck1KKvoFt4r61Wg0QzDRIqvEE6XrUOBoRnY8kOxvexbdvQHxQ/MHjUCEAA==
X-Received: by 2002:a17:906:55d4:b0:98e:a451:fac3 with SMTP id
 z20-20020a17090655d400b0098ea451fac3mr1355868ejp.42.1687721970647; 
 Sun, 25 Jun 2023 12:39:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b10-20020aa7c90a000000b0051bed090703sm2054181edt.12.2023.06.25.12.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:39:30 -0700 (PDT)
Message-ID: <d61b7e0d-4e60-a6dc-047c-0540a76bc1ac@mind.be>
Date: Sun, 25 Jun 2023 21:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230625175706.319901-1-bernd@kuhls.net>
In-Reply-To: <20230625175706.319901-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721970; x=1690313970;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PJCv9XLM8wVFCHnBdozl/kxP21HydJY3kuEGBT5iSh0=;
 b=HW3k7Qb1yrUReLP5fvRDpyEhwBIYJqgo8+Cvcetgb89dDfuptUPYcqnbDpMnlq1Sog
 4ftLd5nc0BgtNFp/Unju01DisE9YxtvRnMrKxj1QlKeCsHbXHb4V1C+JPmY2Uwiz8pRS
 v2/Rd3rqCFJcA9j34G7Jmd2T2ou06Fz0GbN7EWrUgd5NiStPHO0MbaFrWqJqq19e4buP
 QfNpnkY9r+9dI7X2YgzQenzwI3ACh7g2DHoXaBkF9PjfgeC4tOxYHxy/s6xRxhYVWnvV
 zb/wIuyTprL02JEca1rdIiZWtvk7bDn+TeVjrMrEyt+/dBx2Im0LQfcYq7nvOnSp0q8e
 aHYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HW3k7Qb1
Subject: Re: [Buildroot] [PATCH 1/2] package/quickjs: disable on microblaze
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



On 25/06/2023 19:57, Bernd Kuhls wrote:
> quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
> microblaze since its addition in commit
> 5d50793659acb95050c110d5fc05399df20ce30b
> 
> Fixes:
> http://autobuild.buildroot.net/results/3b1/3b1b1f91998bfdec65f3e6fb8931df9c8871b953/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/quickjs/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
> index dc466241ba..292dba86d0 100644
> --- a/package/quickjs/Config.in
> +++ b/package/quickjs/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_QUICKJS
>   	bool "quickjs"
> +	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
>   	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
>   	depends on !BR2_STATIC_LIBS
>   	# No way to check for fenv support.
> @@ -15,6 +16,7 @@ config BR2_PACKAGE_QUICKJS
>   	  https://bellard.org/quickjs/
>   
>   comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
> +	depends on !BR2_microblaze
>   	depends on !BR2_nios2
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
