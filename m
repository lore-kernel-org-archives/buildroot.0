Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A73C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA8C83C16;
	Wed,  7 Feb 2024 16:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTjvl973UPQv; Wed,  7 Feb 2024 16:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D178D83C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D178D83C15;
	Wed,  7 Feb 2024 16:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 969581BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8416461439
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrxv_6ITK8lo for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F412961431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F412961431
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F412961431
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:27:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fff96d5d7so7224615e9.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323242; x=1707928042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4m8EXRGccVVLVSithsT2hhROpyWabNzkWUDGWU4oHw=;
 b=EzLj2/87aQRWBxZanPUENDEbj+5+ZUenyZ+ABlRXS/G8YghHdL9aW2tpShMg0gmdjc
 vtYNiJ+WVJVsBifXUr19v7sYstZSSUY3ZczeYXoj5vmi25eOqFWGjsHrYmB0umoagYW6
 r0N02s/g7fGV2fNNSGOAGQqAbLtHSSeu5ZEyuZXelipQ8xW7294MpwxOlQRoTvYp5Cho
 FYH0OqJQnEkDiUF+IeaFNnC6hp0hw5v9Q/3m9bqJV0BSTy6kI6ijEsU76kmhRq0S6qs3
 I8NH0nD8PMy6RTtFO+tDpwNBbSS7FWV351ATVojZBhxFZrN5QqCdfPvlcZQTbW0EFVjn
 Th4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEoiT4FzT/jVqCVi/LqNF+S4dksm0C25ASfCT3Fgv+m/MrzIR05i4LxSu3lLkYd3sulGNjOu8qDK22YEZM4JBe92JhY1WZOQ==
X-Gm-Message-State: AOJu0YwVbtDcP9a/Wml2i4WMWW7k5ZsAXZtlPqWN/8+q+Ixeq6+D8Led
 hvOlLgocMWo9dgkIHBUcQbOpx25WeqbXZh2seEOPhK2AITOfr4zHDLtRC5ewABDGcO+kIql8ld5
 Q
X-Google-Smtp-Source: AGHT+IEFv5UlKyvcgwgAnrjXXVQBgmjWvkZQuXRBEZv/+l9CwPqcxIzJm38z165TYvKDJTyAAaTGDA==
X-Received: by 2002:a05:600c:3108:b0:40f:aabc:d508 with SMTP id
 g8-20020a05600c310800b0040faabcd508mr4950392wmo.10.1707323241792; 
 Wed, 07 Feb 2024 08:27:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxiuaIzVlILjl3Xpoum73U7NSm7mFdhbKO4mwnCC1whpuQev3UTk0DOhTfEeFmWHxd27XUB7ZwvEdvHFEoVQlxpqr3Iuz9v5wLpXxw3nD9kdQA0lJp0wfy7JU=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b0040ee8765901sm2597729wms.43.2024.02.07.08.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:27:21 -0800 (PST)
Message-ID: <43277e98-686d-40c5-a88c-ce1ef879a230@mind.be>
Date: Wed, 7 Feb 2024 17:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111060552.3028285-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111060552.3028285-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707323242; x=1707928042; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S4m8EXRGccVVLVSithsT2hhROpyWabNzkWUDGWU4oHw=;
 b=AXESErTFbQ8y0BWf6B3ebHvfRrirAh5bIb+gPTVVFYT+6AaDhEwWsejErLm8trfPFM
 bawHCxTb/dzsYiLnRa+SmTwDyqOba4C01QBEWKsrWqxB4aCxwl6Vtg9EI8WJT5aLSBI0
 hUxr0mYxz3ixaC6OOqK5C2fvNCeDk902tDJvMedqDFjZtkASW9SttXFfAKUi2eJLtXvo
 nXabm0mK8VMY1kv5TK994ufRM9DE8WdNPmH5wDYzGALlX++PwfGaEdcU7W2rNBMflPb3
 0nbief0RzC63gYXfgZHMR4kMhG4MHjQSKSD47lwHj4gMDSSNz3mYln+OE30Q2NA1LaEv
 Iulw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AXESErTF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 1.39.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 07:05, James Hilliard wrote:
> License changed to MIT:
> https://github.com/getsentry/sentry-python/commit/9ed5e27636d05bc30cd363c19a032ace8447f5ad
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
>   package/python-sentry-sdk/python-sentry-sdk.mk   | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
> index 38ae3380a8..2534a48221 100644
> --- a/package/python-sentry-sdk/python-sentry-sdk.hash
> +++ b/package/python-sentry-sdk/python-sentry-sdk.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
> -md5  ea2d728c847879f66c3d24cfbade2026  sentry-sdk-1.12.1.tar.gz
> -sha256  5bbe4b72de22f9ac1e67f2a4e6efe8fbd595bb59b7b223443f50fe5802a5551c  sentry-sdk-1.12.1.tar.gz
> +md5  94ba9002bbfaf8c443c496b05bbc32eb  sentry-sdk-1.39.2.tar.gz
> +sha256  24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c  sentry-sdk-1.39.2.tar.gz
>   # Locally computed sha256 checksums
> -sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
> +sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
> diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
> index c3092a5184..f1c5648f07 100644
> --- a/package/python-sentry-sdk/python-sentry-sdk.mk
> +++ b/package/python-sentry-sdk/python-sentry-sdk.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_SENTRY_SDK_VERSION = 1.12.1
> +PYTHON_SENTRY_SDK_VERSION = 1.39.2
>   PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
> -PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/32/03/496a7c8313658dec419303e8add969f314b7538c29f4ec5ebe6d86fb8ce2
> +PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/66/90/9deac5c137e9f0ede908757d886af77938ef28f94b24decedbdf98f1ca4d
>   PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
> -PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
> +PYTHON_SENTRY_SDK_LICENSE = MIT
>   PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
