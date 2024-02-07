Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051B6C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C097381BE3;
	Wed,  7 Feb 2024 16:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzqC8NBn3MLi; Wed,  7 Feb 2024 16:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB84C81C0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB84C81C0A;
	Wed,  7 Feb 2024 16:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACEF81BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9893541553
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSXVEf85zD-i for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AF2441461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF2441461
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AF2441461
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:40:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso7404305e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707324015; x=1707928815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrfuWgExoHVeriU8T9Tu6taKbK2ifbJ9gUey1q+wb6E=;
 b=fMITAIGZ7ZGiCRiMTkqQqYobR+qW5+MfnqmowKWJXyXyeznWVJ2he2lgUOwv8czXJ9
 QsYVNmDJjz5wa6V+Ut0u1uFVFVBP5pKPvjWAR2f6EH320AiJ4v1dFq5/wt/8G+3CE1+O
 wCylMRx05Ji8n7IqN9dH0NvD9A6ByulDYL8goTc6p4oy/ZUXfKNPuDshyV0ya/FDbvQB
 JccJqbdVqv6fUhczXLRt7YvvOszhiJV1HIXNHuuS0r4esJMZ3UI1qTNcX53er3nmC7DZ
 lSo5UGpp5rf9bImI07fcpkyf6jDvr3FUk03kybe6MhdWoY5f7x9D3whRUcXI+dCxvEIj
 fVhQ==
X-Gm-Message-State: AOJu0YyKy358n6abEltjbffJCRNAmPe9267uY3i2641YhJWeS8SXYq+s
 sGBMODUUnoCFC3Mshkh+qhQqSKCXnioFWlthxKY07CRgVusDNaUnca5G604rrf4XmnI7msezO/Y
 /
X-Google-Smtp-Source: AGHT+IGYBn9kIsX+5RX5nU6sqd7BNWR2Q4yNKp8Lss2Lu5o2sbHrc6zHX2uykH0U37BWAt7It1rX8g==
X-Received: by 2002:a5d:4986:0:b0:33b:139e:9110 with SMTP id
 r6-20020a5d4986000000b0033b139e9110mr3906163wrq.36.1707324015374; 
 Wed, 07 Feb 2024 08:40:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUSj3VEJiK+XMu8gWmBAOhx/dEmmy8R3ancl+Yd194RZx258sYklTRh9pnydUJz2pxGNxI7NIPwr+vq/ZC8O2H/JCrG/L8jMdgpb11ryn5+BqmenpqjzyEa0U=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:40:15 -0800 (PST)
Message-ID: <8275fdf4-c20b-4f30-b6bd-a3ef1c03575c@mind.be>
Date: Wed, 7 Feb 2024 17:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111065011.3057364-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111065011.3057364-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707324015; x=1707928815; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrfuWgExoHVeriU8T9Tu6taKbK2ifbJ9gUey1q+wb6E=;
 b=GKMPrPU0IeQ3J3oa4PALo6ehMtlQw13k69g1W6pOX88ZBjqHzZPyPEIuAAZS/Ku68b
 IS7PE3Bamu7qo49a4SFSUp35A/bjNYLUFW12dMfyUAhFYZo4rSIAxSugoE9JWze+bCUH
 BQeDnpwir83hwHG5P0hVY8pDpNcczOd682S4jXgfupjS0KNRX4RjmYTPPfvA2dE8RJGM
 u8Cm2uoE9ThUxvmwcM+zhshpFjicZ3mjHVcEqnDxeCfMxnTGVwmLFSam0IxW5xRCNKe1
 M3PUQOPwB5xCuB4wWlOGhWw6jzeNL6BlJyScPPcBTWKJ7aZ+rSJEJNrZoeiKXT5yGRDG
 wlOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GKMPrPU0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to
 version 3.19.2
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 07:50, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-simplejson/python-simplejson.hash | 4 ++--
>   package/python-simplejson/python-simplejson.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
> index a8b946b2c4..9f96f99bf4 100644
> --- a/package/python-simplejson/python-simplejson.hash
> +++ b/package/python-simplejson/python-simplejson.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/simplejson/json
> -md5  ecd07fca7a7fa0bcc9acdf9d82e41eb1  simplejson-3.18.1.tar.gz
> -sha256  746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa  simplejson-3.18.1.tar.gz
> +md5  3b334627d870a3c849e1322d18a7bfe7  simplejson-3.19.2.tar.gz
> +sha256  9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c  simplejson-3.19.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
> diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
> index 5782626387..d5ba3948b7 100644
> --- a/package/python-simplejson/python-simplejson.mk
> +++ b/package/python-simplejson/python-simplejson.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SIMPLEJSON_VERSION = 3.18.1
> +PYTHON_SIMPLEJSON_VERSION = 3.19.2
>   PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
> -PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0f/a0/79d2bec499cb53678bc20d41f9706ca02777f0876efa9b29a69fb3d55dfd
> +PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/79/79/3ccb95bb4154952532f280f7a41979fbfb0fbbaee4d609810ecb01650afa
>   PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
>   PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
>   PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
