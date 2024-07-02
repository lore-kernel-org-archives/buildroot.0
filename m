Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5805FC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2757B81EF6;
	Tue,  2 Jul 2024 06:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVziflmxeLdS; Tue,  2 Jul 2024 06:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE8D81EF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE8D81EF8;
	Tue,  2 Jul 2024 06:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 655851BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50CA4413E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThvVIIhB36Xl for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 069AB400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 069AB400C6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 069AB400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:57:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso29335705e9.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903452; x=1720508252;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu6SaWYTtA5sC0n5n5xqDOSKT/BTGolicod9jr6VPWk=;
 b=twLZsINikmYeMzHE6kFwrIu9ZnFme+r9/INklwWtSebie/GzCXFdaoT+x0KWIJaBVa
 fI7pHj4Io+LMcPgTSMw0Nb46DpXMrlQEnmi8xYnocTK6tYaAC2yVZLFH61laRCf2lTve
 jGY881aOiHxMTNpFIUKo4LPZBzciGU0wEXsYyvGixTMM1nsQLd1QftDJXvxbDXaTrk2o
 X6kkBhOSxZ8+Q6U3kNpspQJE9itOp5DbkOeHvHJ0wXRGF7jG4Lr95cL9zpugMauEt/ko
 CBebayCx9iADJmTQe8G3TvHtVrDlcYZYIvhtY+FS9qGEM7Xq8hV8Dkbn7Y+A3/hEFNu5
 uqBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaaBeAo7/Ia3pP9KynZGU3RGAzP5mAOzpHT2bHooDMOF3iG17HUQCIQUxS88PDvF3n0DMaPv6St2ZtQHsceu+ZfoSxwDjqng==
X-Gm-Message-State: AOJu0Yxz1i1hHfLsXe+ory07q9XEpXjagzKu+0Sp2Bx46Ta2J4MruEmP
 LZl6hSy1wkAD0ajb5kHRfDTm5DvAJR+Pb3Y4x5FV4VvDKWKTd9/ZGrhz/7ydsJA=
X-Google-Smtp-Source: AGHT+IGlcVQYR2qfu6FMhNYSW8hQq3yzwp9uqHmR1NF7IquZ+A+qiU/INnKQKFgz5Ws245JQQ/XHCg==
X-Received: by 2002:a05:600c:6d02:b0:425:61be:c911 with SMTP id
 5b1f17b1804b1-4257a02f273mr49707505e9.21.1719903452005; 
 Mon, 01 Jul 2024 23:57:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e1481sm12252089f8f.55.2024.07.01.23.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:57:31 -0700 (PDT)
Message-ID: <df507e59-99bc-413c-a19e-5186019034f2@mind.be>
Date: Tue, 2 Jul 2024 08:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701164620.1628778-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701164620.1628778-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903452; x=1720508252; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zu6SaWYTtA5sC0n5n5xqDOSKT/BTGolicod9jr6VPWk=;
 b=RkS26vZ+LsvZR1GedaVDeG3aKZHDfSXuilBRGGbzUfBIrU5PPL5EMCzmJr+e1hx8K4
 UXlFv6n92ja02xlksMJcWiyYn5tqP1yBRKrP/OLrb534XPKUI+lLq5oCkaxNUGhYML5V
 KLWSXJfE0zzEGOssaXdYGZQiaJJLCNjOsfrlcZzvSyfrjp92KwpzU4lvU+F4rXSBMmhP
 LjIp7VshbIijsyEGIWUQIgviqsUHJAqCjHcjpm20yinF1LSm2qJgZPGVCXQ+/gAq/HbG
 932SSdXTgNBPSc/jO2V3vmh3fy6YAN27t3dxsBzcxl0jQTkqvqA+NY/wEd7QUME9b7MP
 OIsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RkS26vZ+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to
 version 1.9.0
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



On 01/07/2024 18:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-poetry-core/python-poetry-core.hash | 4 ++--
>   package/python-poetry-core/python-poetry-core.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
> index c6b180c852..2dc1198a76 100644
> --- a/package/python-poetry-core/python-poetry-core.hash
> +++ b/package/python-poetry-core/python-poetry-core.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/poetry-core/json
> -md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
> -sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
> +md5  eb8730e30aec5f644754b29587b47122  poetry_core-1.9.0.tar.gz
> +sha256  fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2  poetry_core-1.9.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
> diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
> index 4ca587b11d..5b9b8a15d5 100644
> --- a/package/python-poetry-core/python-poetry-core.mk
> +++ b/package/python-poetry-core/python-poetry-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_POETRY_CORE_VERSION = 1.7.0
> +PYTHON_POETRY_CORE_VERSION = 1.9.0
>   PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
> -PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
> +PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/f2/db/20a9f9cae3f3c213a8c406deb4395698459fd96962cea8f2ccb230b1943c
>   PYTHON_POETRY_CORE_SETUP_TYPE = pep517
>   PYTHON_POETRY_CORE_LICENSE = MIT
>   PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
