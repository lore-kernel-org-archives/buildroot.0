Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8DCFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 13:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74868810EF;
	Sun,  6 Oct 2024 13:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_7ghWR1Id4O; Sun,  6 Oct 2024 13:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBF381119
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBF381119;
	Sun,  6 Oct 2024 13:54:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 823411BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705A44034D
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua2k5wN4LWCL for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 13:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CB6F40346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB6F40346
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB6F40346
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 13:54:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so35948645e9.0
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 06:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728222891; x=1728827691;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQFfYY4De+u0sE9RxrPX2UZusbbjAHFS0k5inWP07UY=;
 b=msTi1yH3kwy0UvGr8RIoioiphFBFMjcZk/P7+vyTL1NkHftkZKDG+kkZVv9o8+Am27
 k44nF9gzYQy1dj3VEvo1SimpB5TVBGoDWK1Fa4KsI/vj1ouyMVyE0fzf5wYufE4ihtPa
 9dzdhfWy4EnsYN8Gjjw/0YevABWd3sW6TE+0/ZDkbbBrcBg32bQcD9mJ45mIu1SXkdHw
 7/5UgobhXvttixDoYP/cxZZO/OJ86X2G5qSRZGlCq4AdK4irXLkwV6aqLP3kf5fwt90C
 QLxFSfswLSl0b3pEHYVB6S3rJM0pRCW6gdobLxOW1UjqytMI/tTkdQQxaG19cu//Z3gW
 0KTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQv3F62oC/BuunNnSyDhhCNRBf+ltjPBx7rbkjHLdxsSqOS1QcWjvCBddIDpAXHCyNmlnA5FA8H0Y=@buildroot.org
X-Gm-Message-State: AOJu0YwWxvwEPkAZIHFZ7IgBPYe7D+9Ef6C8fWHkj7CYMRB++U6vqmUC
 ey2U9NLcbHUEY4VITtUrOaauLrGe0rGkKoXRImxFeONyPVbZ9jD0up2EQYE2YYcuZj/90Ck7I6K
 I
X-Google-Smtp-Source: AGHT+IF3KzRWLlGID5/6HNcIhsrlh1OXR3Kg+9HTdHDaNaf5AeZa092rb0GFlK/11qY5YcyTgTiALQ==
X-Received: by 2002:adf:e9cd:0:b0:37c:d20d:4481 with SMTP id
 ffacd0b85a97d-37d0e6f2658mr5185593f8f.4.1728222890603; 
 Sun, 06 Oct 2024 06:54:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8671933fsm67536855e9.1.2024.10.06.06.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 06:54:50 -0700 (PDT)
Message-ID: <0b60884c-0078-4493-aee3-9e7125cc8245@mind.be>
Date: Sun, 6 Oct 2024 15:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@gmail.com>, buildroot@buildroot.org
References: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
 <20241005-dtc-1-7-1-v1-2-89550f828a4c@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241005-dtc-1-7-1-v1-2-89550f828a4c@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728222891; x=1728827691; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQFfYY4De+u0sE9RxrPX2UZusbbjAHFS0k5inWP07UY=;
 b=Y3cO+nFKmNdDgpvKnunAHgD2PLHvBap82UplNkqty6jM1U10t1hAhZ/RURxI6F7w4J
 G7cdGI4T5t5048V93cGPSg1X9jNq2bC0mH828X1GdMz7I41Uz4jwIapCotBmxMjopB7x
 4STNKRjo0KiNpNwcAAqV1SEl87i8BoAKDFipwRDxkVMt46L/EU/QVpHl2Bs4iNnI9Zmf
 KM8S4Iwv5w8m7eDcORQkSE0yKQGptilDKLTXoXxyfpVd9LIGG0LB0HVjnNP8yRhj9Rdh
 YruqRpJO1PQPUhn3gdEX360sW44SxzaxVapOEdM+i0+mW82n8dxVuR2t6I6XFI4DLsw8
 3WKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y3cO+nFK
Subject: Re: [Buildroot] [PATCH RESEND 2/2] package/dtc: update to dtc 1.7.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2024 18:58, Brandon Maier wrote:
> Release notes: https://lore.kernel.org/linux-devicetree/ZsBvsq5pVv9xEPmp@zatzit/
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dtc/dtc.hash | 2 +-
>   package/dtc/dtc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
> index 5856156f008871558b72dba4a847d360f9fd163b..325a80880918146ec2bf08da0d2d0b1813acdc64 100644
> --- a/package/dtc/dtc.hash
> +++ b/package/dtc/dtc.hash
> @@ -1,5 +1,5 @@
>   # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
> -sha256  29edce3d302a15563d8663198bbc398c5a0554765c83830d0d4c0409d21a16c4  dtc-1.7.0.tar.xz
> +sha256  398098bac205022b39d3dce5982b98c57f1023f3721a53ebcbb782be4cf7885e  dtc-1.7.1.tar.xz
>   
>   # Hash for license files
>   sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 5868ae0e5a818e9d92dd577991e1cc4d1cc25924..ce5ea05da7882fcd0affaacdb73654db2168cbc6 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DTC_VERSION = 1.7.0
> +DTC_VERSION = 1.7.1
>   DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
>   DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
>   DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
