Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9619E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED066068C;
	Wed,  4 Dec 2024 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUSowtgBcxO7; Wed,  4 Dec 2024 21:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC066079B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC066079B;
	Wed,  4 Dec 2024 21:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4851DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69A5784533
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWTSrHKZhqZt for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62DC38119C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62DC38119C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62DC38119C
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:38:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a1639637so2568135e9.1
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733348306; x=1733953106;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7NMbdEseScdxlGTO3RtyOoCsRIXXrCWPsctelkQMW3k=;
 b=Jg7SRwSI+hiv3b9z//gpD3KzcW2kSLs1nMEAOOSzjKCQLPYZsL2vAMcb+zNUxf18VW
 k6hrsoUqzohcEOsMQpXFNemrOJZX9sbl68xq5hzphkLjC5AMUcDtL0csyzCWLFHAFeOu
 bvhQCdcNKypyWg0vTS7E66Qtp+m0Ro7RsQFwW0AZSx5qJq3sgVY1B/jzjwFp3C9Xz+FD
 PfHgy/Kjouty/eYSSsLJazmQ0kRlOmBMwl3rFAdHMQCGG1oUCklqOSYH/SBVOD4itaNt
 KHoIIDbCr+14yD5jWOPSAIBYXv6kO0emkUAs+WEKnhcizP7q671/m9FTpOVU3uJmrX2L
 kiqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeIRlp2Bou91+e3hopVIrlduITFjr8brn3wRGnKepB44YJjd5gX59rgFfrkfuydzDkAvqixoOOUxY=@buildroot.org
X-Gm-Message-State: AOJu0YzrN9xb4m1EgbZvXxMHFRAyLtiKEzWVhSba1Klq8sgjn9AAQP5V
 7VfT4nMSJMevWkbWm0kfxU2JtFPmt4N+FHIcLKaGGI+zcWD+QLxjLqLnMqJgdNc=
X-Gm-Gg: ASbGncvz2G52kRJkDXgrGkURGOe2Sd+7PwFWdt95LNw4cRkyEWw0KFsy4Y24885+UmM
 mdGAjYYCtWLnzbVcY4Yg5ivKMsWpTpHm1FjmbDqUh51r6OnU+90z7QYeSairzAzLmDS8lSkkuc9
 zh9fHnYV8Ji5C8Gnheak/ByPd3fgaC4j6El0Ra89bAuNazl7RPtA00zGj1ZLecKGKOMPO5dcZlo
 /Wa3TZZfKvCgF78xifQc2TJ2VTTdrjW3fqtOliI6wjtHKOvUwv2h+4gVbRxzd5+3+okuFyk3cF7
 u13OXPLI4DMzd7RdJDbsGob2bDxAHBm3m+jBRjq/YPRvLRLIxBo3EAhx9TrLlbdAi9bJuNCtHDL
 hdArH
X-Google-Smtp-Source: AGHT+IG3KItIz/rTB4LXj4RIroHrZQ7oa4ia6KHD+mWz940viJU+v0Hi9vvOwKBPtwN/yueDCg62Ow==
X-Received: by 2002:a05:600c:3c97:b0:431:5d4f:73a3 with SMTP id
 5b1f17b1804b1-434d09c7f34mr75203635e9.18.1733348306256; 
 Wed, 04 Dec 2024 13:38:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d04e7380sm60382135e9.0.2024.12.04.13.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:38:25 -0800 (PST)
Message-ID: <0a450bdf-3174-487f-831d-83e7359147b2@mind.be>
Date: Wed, 4 Dec 2024 22:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241203225132.300296-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20241203225132.300296-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733348306; x=1733953106; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7NMbdEseScdxlGTO3RtyOoCsRIXXrCWPsctelkQMW3k=;
 b=bhr+WY3CDBVh9B8DAU2MJEfCPABP9UOKWv5/tVxrTie4Qv3i/P+gthrgJueytbl3xd
 zDelbtKM2Px3fvoZ7XskpgBBe0C4/4R0udYmmpBq46heuZ2q6vyyCJ7Y02kRnha6WSCb
 f3HvTyUQU0CFfHhp2RPAYAjO4O4t3mUAQpHh9KZlXMTmIQbxQFejRH3ZsPz4JAUdVNGw
 Xy+ag5qAd+IjvStDTftA4Q/dq9oYApawJ83OVL0rQuBS1mXZ9XvqTeZDFYGwfWceqvOH
 BS7+fjx8K7IRt1A5shqFZD0LGN+i3kGPTL9S9OOmoRPVbkRUDa5BInp4F3jjXKMfpiIF
 M2bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bhr+WY3C
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: fix _SITE download url
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/12/2024 23:51, Julien Olivain wrote:
> Upstream moved old versions in an "older" directory. The current version
> in Buildroot was moved to this directory and fail to download.
> 
> This commit simply updates the _SITE url to reflect this change.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189435
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8536372649
> ---
>   package/rt-tests/rt-tests.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 419260db3c..e048ee94d0 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
> +RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
>   RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
>   RT_TESTS_VERSION = 2.7
>   RT_TESTS_LICENSE = GPL-2.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
