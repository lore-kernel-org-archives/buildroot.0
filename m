Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D8C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345494060A;
	Sun, 24 Mar 2024 14:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR1N68iaeiCI; Sun, 24 Mar 2024 14:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F7640622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F7640622;
	Sun, 24 Mar 2024 14:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDA61BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D11181DF4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOCcVHy9IIIX for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ACCA81D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ACCA81D72
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ACCA81D72
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:57:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2485674f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292242; x=1711897042;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rlp1MN4T+LrOfOCNaMo0cCGvc5XZGLpLCEZbq4xitic=;
 b=fJ6RdIb2KsaP1E1diRoJ5t2w9VSSjyNCinr05c2Dkv3VninRaqc4EgNIvyxSaqx/qy
 HBdcKm2zm+n+JuQTzbvfSFHlaQwPJuYHsJWUVNUWICG74uamdvFdm60erM+dXhtKus53
 T3nLYwpGmruaihwUQ57KfquBWvsZUwc1m6/EWTSXVhWd2aaPwC5Qco/aVCb/xwMFdofU
 nNoIMqhMMeY+p/0kYPLs5v+iswiGrqRESD8BA8rs8G/GEiUzBHZxDW3gAnBjLrHEq1U9
 r/ZVZqQ/ZYkBxKHflwvq9vMFvxvfUAjRO1kesOgc6fjyeg4u53lBibhp69DPfYz+cM+A
 uxew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqyffkagdZoZYeLv3UcKyUb5IlWuVn4y1v+YcKg+odu9JYAuMsc2uywN7/Cp/1lbRVuhDgIyso/FQ72Oh9MZPHhweMqDmU5A==
X-Gm-Message-State: AOJu0YwftDJmD6tKkRIXhQpYsYWBdBb0QVkoQuhjapdPntj7i6oRgHWj
 mhzMInyO+KpRdFYQkaR4cc4KhNvML+AIWwNdXmASHr2jpNfHMaUfRtVLlCmDLbc=
X-Google-Smtp-Source: AGHT+IGU7Fz742k5f7xHk9/NdkGTvykGVzqDDLPqJYmNmHUZwEynzn+H/jtVBxjf99INpK9ieieMcQ==
X-Received: by 2002:adf:e402:0:b0:33e:c2ed:d94e with SMTP id
 g2-20020adfe402000000b0033ec2edd94emr3334994wrm.56.1711292241758; 
 Sun, 24 Mar 2024 07:57:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:57:21 -0700 (PDT)
Message-ID: <1d2237e0-c7e0-43a2-85cd-5bc3d1d46aeb@mind.be>
Date: Sun, 24 Mar 2024 15:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324123300.527914-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324123300.527914-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292242; x=1711897042; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rlp1MN4T+LrOfOCNaMo0cCGvc5XZGLpLCEZbq4xitic=;
 b=e2VgNzGxDtLh6Wjufg6bjgubHerbSLS9aA5qkGko3YwiofdrGiOrctgyf7+U3PLgun
 idJPLmxV1jYNy/y9DhBxZSFPPtAxlA1KAqYXhoXMwuewYgue5WElRHNJhae0LtLkBNfk
 DAeznKaam1Li3wQVG3B5IlVsXwmM7MEQ5sJWmx/JRYSRK6XhvAxorWLdpEgpMbllkBMi
 x6AaGy7qoetmLfPDGVc131Kpgw4+Fu+wY4R1p7jCpZWPqG8NHEtS3CvYRpvntXsl/pbu
 hnWd/RGa5gA0EM61e0lDwHxFl6Q5UsrHECr1xJ3G3HOi9P+KZiTapuJzwuBdt+U471hp
 RvIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e2VgNzGx
Subject: Re: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.33.0
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



On 24/03/2024 13:33, Fabrice Fontaine wrote:
> Update hash of README, changes not related to license:
> https://github.com/notroj/neon/commit/7d39a09945830c664205dd307723c2ff51ae13e3
> https://github.com/notroj/neon/commit/9c3a4cb82db956357f120556efb7d8e706b5d46c
> 
> https://github.com/notroj/neon/blob/0.33.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/neon/neon.hash | 4 ++--
>   package/neon/neon.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/neon/neon.hash b/package/neon/neon.hash
> index 9bd6195e39..d773b0f316 100644
> --- a/package/neon/neon.hash
> +++ b/package/neon/neon.hash
> @@ -1,6 +1,6 @@
>   # Locally computed
> -sha256  b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508  neon-0.32.4.tar.gz
> +sha256  659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8  neon-0.33.0.tar.gz
>   # Hash for license files
> -sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
> +sha256  6c4f5d59a60a66cc970642c0f3799cf03b40a81c9dccbc4a254f20487d143f74  README.md
>   sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
>   sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
> diff --git a/package/neon/neon.mk b/package/neon/neon.mk
> index 93870b9966..e7872df3c9 100644
> --- a/package/neon/neon.mk
> +++ b/package/neon/neon.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NEON_VERSION = 0.32.4
> +NEON_VERSION = 0.33.0
>   NEON_SITE = https://notroj.github.io/neon
>   NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
>   NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
