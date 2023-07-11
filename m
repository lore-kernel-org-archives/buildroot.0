Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D7DEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 686A881464;
	Tue, 11 Jul 2023 19:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 686A881464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLbwFo8jNZqc; Tue, 11 Jul 2023 19:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D3C8140F;
	Tue, 11 Jul 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D3C8140F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB3DB1BF3E0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF8A1414D8
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 19:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8A1414D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjoUFR3UKQiI for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 19:18:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 498FE4033B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 498FE4033B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 19:18:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so4391912f8f.1
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 12:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689103114; x=1691695114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHkAWMvCaIwsijsCZsz2pfy/f4pZ32C+n9rllMWGK78=;
 b=E8XI7GVOe+9wTVyxGjTUXmGjek9p7XklLGtYnIroC3FvaN61tYXfgoaqWLL2q7kCCK
 mwhQqnYfNTnxAxlElJ8bXxLJBf2TRQy8k3rWuv9K8c1dPP5LLvrYKy3RZVlO2UIo1yT4
 NBdIDbnr11JHqZTMHndiZgN5ZiBc7BAlhQJI2TqqlclwwGiwSu6DN71DqKURm0UIY4mA
 eg6dD2xZqkXdFhypkgPrsbL2YyCaark5g6XphkSLu6vRkAhMoOrx/aXB6I56op45gsz7
 +YSQzBb09Gjh7aIcQWZMGLd0S1tvpVbsx4Yh6DxgyC000LC7+h3leRbQosg9+sEPivcR
 ljkQ==
X-Gm-Message-State: ABy/qLbk2j6G5lKv85qzUJvvloBgTkOpm0l+OC2NzakyZ3TehLAOV5EB
 zWXou8YJbeOfH/CpX9jFjdYbcxhjra8=
X-Google-Smtp-Source: APBJJlGRiBP40XDTykrp8DyrYT2u3nKWo2m/AAtmXrszbTNwJS80CNRa7Lu6Pedb3OitNiTpkNXeRw==
X-Received: by 2002:adf:f286:0:b0:313:e20c:b90b with SMTP id
 k6-20020adff286000000b00313e20cb90bmr15353362wro.26.1689103114124; 
 Tue, 11 Jul 2023 12:18:34 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a5d5703000000b003143cb109d5sm3001297wrv.14.2023.07.11.12.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 12:18:33 -0700 (PDT)
Message-ID: <4c0a75fc-77db-9630-ce8c-c9b90433cb85@gmail.com>
Date: Tue, 11 Jul 2023 21:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230709091622.1022345-1-bernd@kuhls.net>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20230709091622.1022345-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689103114; x=1691695114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DHkAWMvCaIwsijsCZsz2pfy/f4pZ32C+n9rllMWGK78=;
 b=fhPPoyC3NMheFg2o9iH+DZjElP6+Tj4PL7WGu0Yd3wspVVbc8ZcTSjMd+/vp/0254Z
 b76gIu2d/eGk58CiqtWsnwITurRpHZTFgIzxX6b8YR/H2aY7GJLALrtWFvLgTvz13uLN
 13ju3l1zcpq0kZkA+kNM5bO8Nu/pquaYZH3Qpitfg2IwSlXOU+qx5WbEAj4tbd8+S5rK
 P8oHBMdSEUOd9CsYrLyaLHFO6iKSTbgfq6Ca0qMHmmbSiynDF/P6ZWtUetWBje4k5Ay/
 6MZtR/h1Rk0auM6ICwS/vvZ40AOFySQ1/7FSEZE1ztv2IMMgi3EkP+7GgrmrCdKaQ6al
 HnZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fhPPoyC3
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: Fix yescrypt-only build
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

Hi Bernd,
I created a similar patch, but did not try to make it upstream.

https://patchwork.ozlabs.org/project/buildroot/patch/20230325175815.24876-1-raphael.pavlidis@gmail.com/

On my side, it looks good. Unfortunately, I do not have permission to 
merge it ;).

Thanks,
Raphael Pavlidis

On 09.07.23 11:16, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/afd/afd5d59f94986593cd697148f4cce2bf70e4d81b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   .../shadow/0001-Fix-yescrypt-support.patch    | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 package/shadow/0001-Fix-yescrypt-support.patch
> 
> diff --git a/package/shadow/0001-Fix-yescrypt-support.patch b/package/shadow/0001-Fix-yescrypt-support.patch
> new file mode 100644
> index 0000000000..e346a2ece0
> --- /dev/null
> +++ b/package/shadow/0001-Fix-yescrypt-support.patch
> @@ -0,0 +1,38 @@
> +From 7a63017b3c873a59e3482322b7824160a8c8ca67 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 9 Jul 2023 10:55:03 +0200
> +Subject: [PATCH] Fix yescrypt support
> +
> +Fixes build error:
> +newusers.c: In function 'update_passwd':
> +newusers.c:433:21: error: 'sflg' undeclared (first use in this function); did you mean 'rflg'?
> +
> +introduced by
> +https://github.com/shadow-maint/shadow/commit/5cd04d03f94622c12220d4a6352824af081b8531
> +which forgot to define sflg for these configure options:
> +
> +--without-sha-crypt --without-bcrypt --with-yescrypt
> +
> +Upstream: https://github.com/shadow-maint/shadow/pull/748
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/newusers.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/newusers.c b/src/newusers.c
> +index 7cb8434b..08f79798 100644
> +--- a/src/newusers.c
> ++++ b/src/newusers.c
> +@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
> + #ifndef USE_PAM
> + static /*@null@*//*@observer@*/char *crypt_method = NULL;
> + #define cflg (NULL != crypt_method)
> +-#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
> ++#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
> + static bool sflg = false;
> + #endif
> + #ifdef USE_SHA_CRYPT
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
