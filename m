Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28958C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF1983BBA;
	Wed,  7 Feb 2024 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlRB3FDLns50; Wed,  7 Feb 2024 15:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B573A83BBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B573A83BBB;
	Wed,  7 Feb 2024 15:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A69C01BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0EB683BBB
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ek_wiwNtpXQY for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:58:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81DF883BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81DF883BBA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81DF883BBA
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:58:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b0e5d1e89so697547f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707321504; x=1707926304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4m8EXRGccVVLVSithsT2hhROpyWabNzkWUDGWU4oHw=;
 b=ZGvsM5qzLhTsOafYRgrC2OgmeKyGAuWupB5hsgEtXH1uDQuVNB+ZpR8rhXV2lobloS
 iuiLn5WYH+kN+MAtYeoc+NxnhP/HnzRCICVDm7z1kqc7UNM6bLJV37bX3sH9ZhJXxWqR
 S4LFXZi9opUXlpunDSxrSQ1zck0Zj4D1CzoQAF30wcK6tztpaWT4f7DF9121oA+aeE2q
 df2+4CM6BcezNTwfhuw6ncYk9qJ+XRgbQkf/0b8ojxTiM5hHrv2xWo/T0+4UvtNAuUhD
 L2eCK8RXgZvVcWEKJ+1/JI5AFT/n4ADAoHkbXL8TGdT1A7HG/GqUSYtkS5iK8ySlziEh
 IVqA==
X-Gm-Message-State: AOJu0YxTngY700wmWkCJhfvkGekXVYpasuUd2p2E6xMoo1CeBeDy+skQ
 yygVDfxqQLDw9dzk8eER5E80jmub3QY0GaQBYpiNHdGMO0C4/rN5yeQcgBjsD9U=
X-Google-Smtp-Source: AGHT+IGeNg82zUDn8pPKkolJbQurOQV2q0qdnTftj7dDTdJtIVAwcLNAogGjkj1teqrN3VBN/wkUCw==
X-Received: by 2002:a5d:47a2:0:b0:33b:3aa6:a28e with SMTP id
 2-20020a5d47a2000000b0033b3aa6a28emr4146508wrb.55.1707321504419; 
 Wed, 07 Feb 2024 07:58:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhddZwXFhAvE4pyj9bHPSLxOFrsPwZumeVThEoipZJhNC/bGaWHGSpu8J1lXlNySuMqN7EqLYOvkDiFZ8+gHS9icF6hXh+CHi4JKiVpGPI/lmh/Xo17tbvzMY=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a056000104d00b0033b4ef142edsm1572792wrx.110.2024.02.07.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 07:58:24 -0800 (PST)
Message-ID: <56eb755c-7365-477c-baf8-898ea62dd24c@mind.be>
Date: Wed, 7 Feb 2024 16:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111060552.3028285-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111060552.3028285-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707321504; x=1707926304; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S4m8EXRGccVVLVSithsT2hhROpyWabNzkWUDGWU4oHw=;
 b=gjWYg1cNH/QhT9fy93BLqghYHHSgWxFHzuXd5H9GyemXnCxtJ47oTO9VjpSeKBjBgU
 lg4iWE0J+yIxC+2puLrHjdbF1tJqMGEJliIUJx2kQEEi+impEDYytrLUHbk9PV7Tx+Ky
 an7g2hHq1J0tA8fflaP0SwEgQRhG6Mz9ArMQ274XwlVbp/utaG4hwwhMZwHxATM8/JBk
 qUEik9o7KtvFX7E/kSE0geYMap6fagPYyiGmeljHgct6ULde6+5PScSkyJnmRsqzt5n8
 7dz5POz4uKxyWuIqY68CznXtQG+2aD1GdVrJnaQtNRERev5vesJvl430OXH9tGRo3HOF
 JcYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gjWYg1cN
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
