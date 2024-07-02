Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB37BC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B78C581166;
	Tue,  2 Jul 2024 07:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wOW-19FVTJq; Tue,  2 Jul 2024 07:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE994812A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE994812A3;
	Tue,  2 Jul 2024 07:04:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48F721BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B1D4076E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TwaEtQlIBXN for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 058FC4076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058FC4076B
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058FC4076B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:04:52 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso37495011fa.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903891; x=1720508691;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VaG62VjS5YVzJVgGu7NxzkrLxQARba9vz8n7BawqGs=;
 b=jrc0WswBelrFzoqHY6TpUUtIM+TvLNGnUuloqCxewF8P/VxNlkz9myoaUFiUIBHPHr
 NXRvA2Qyj5GHkGn60rtUKUSkAeeK4WcA30V+4GMgQC9B7Zp8tCoR6gffsoXEbdKa0NN2
 njfu4WXnA4/5s5UztTtn3JoSg88QE2EWH9lcaON5i3LKxTu9BqsJYKABHlRUlTxRNi5x
 f6HCaYAk9nVJ8EHDWzjzXLgusJYKmpOpCp14z+Tq9M3/W7iYuTkXsWSicVeJrjjClpbg
 InSl41MshBfKlvUgf99H3Trggwk6IJ0t0hdYo0UAtIauTWl7Z8QjXbo+lCL+27SAcEKs
 Cexw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnXu4+ZFl+CwDry2qubdaKudgO66fZoOV9y4CbghCtYSN/8ByldE9WMge/7w5K+qbZ0ZeVT+qQiTvzkr16iBBAQr1hZb+4ew==
X-Gm-Message-State: AOJu0YznohrlNjioXUGaSm57funH4B2qYweDzzJ81FJZYgadpx+qB5mW
 ClBF5k1kMPa5AyE/5i2JpyIBqPFcyP5t9Rsbtz/G3FaNRvneql5C58l+Pfz4BfA=
X-Google-Smtp-Source: AGHT+IEu7YCzoN5HtewGU69oxd5MlDLRiJiKHm6FruEi6X+V29xJFQzUkaeDVeJTloj10L5fEkEmiA==
X-Received: by 2002:a2e:958a:0:b0:2ec:5dfc:a64f with SMTP id
 38308e7fff4ca-2ee5e37de2fmr50757131fa.10.1719903890842; 
 Tue, 02 Jul 2024 00:04:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55aeasm181824815e9.17.2024.07.02.00.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:04:50 -0700 (PDT)
Message-ID: <3990c9b5-3b36-47ae-8fb6-bda751724dc6@mind.be>
Date: Tue, 2 Jul 2024 09:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701181338.1737348-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701181338.1737348-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903891; x=1720508691; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VaG62VjS5YVzJVgGu7NxzkrLxQARba9vz8n7BawqGs=;
 b=gunsm1ouXmTcW2etWdu6sR24p9eNCkcvmmDdjWA3dWASd1REU+sCsmrOMjUGVE4Kky
 hURpah0fC1MdQXQhB71X3uOG3Tjxo9buv5YZFH4uC+PIsztyr9+KqecAZdXNFc6u8Ulx
 ssahIDxoK7mVhE225fPATryzvMoEupGLgE488cwINtMkowhuDKbwsIu9Q+2EXEBK2+Eg
 QhBCRAKsVwwULWVWjMpHnABO1mdqiE1YHKL/Yd5wSiktshH70o0uJ0N9Edt0u1m0zWXR
 Dn6r4hucUpsm4/3Rp97yjMYFnAHNRreiyt67IdM+Ks4HBJ4+X7FcYGs7xb87/jC0b+Ww
 rDMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gunsm1ou
Subject: Re: [Buildroot] [PATCH 1/1] package/python-annotated-types: bump to
 version 0.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:13, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-annotated-types/python-annotated-types.hash | 4 ++--
>   package/python-annotated-types/python-annotated-types.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
> index 1663bcb51f..fc92476eda 100644
> --- a/package/python-annotated-types/python-annotated-types.hash
> +++ b/package/python-annotated-types/python-annotated-types.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/annotated-types/json
> -md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
> -sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
> +md5  5c943b7c51b0b7dcadf46da4a99c84a1  annotated_types-0.7.0.tar.gz
> +sha256  aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89  annotated_types-0.7.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
> diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
> index 8bc617069d..e7a3b7e64b 100644
> --- a/package/python-annotated-types/python-annotated-types.mk
> +++ b/package/python-annotated-types/python-annotated-types.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
> +PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
>   PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
> -PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
> +PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
>   PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
>   PYTHON_ANNOTATED_TYPES_LICENSE = MIT
>   PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
