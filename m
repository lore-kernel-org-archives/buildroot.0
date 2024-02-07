Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6350AC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 312DE81AA7;
	Wed,  7 Feb 2024 16:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNMRZVj-Drht; Wed,  7 Feb 2024 16:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3374381AAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3374381AAB;
	Wed,  7 Feb 2024 16:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF7D1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1508D81AAB
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsmT-5E5SjxW for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFBFB81AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBFB81AA7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFBFB81AA7
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:41:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4102a186cfbso709605e9.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707324077; x=1707928877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GTp6fAI0KUtDJ0qX7r6ILp9ufNkcw7wd6tLL6nPOKDg=;
 b=MGptmpJDVYcKUmRXkHKuGZ1oYENlfFQunZm8/jJtOpktag5/ckE7/nwzk4ALfi3Pmy
 se5hKIayNOwDEmBFRwrhtQXbjAIUhtJNs7iOHVwHxZAS5ig3xy8SToKHSV2ziU4dHM/t
 J7WhOmpVdFHjfjGcZ8gv1WNIyHagTkEocdTa+BQsqQfLcLaRChqqjxFYHY8w4M8nvdJZ
 UBLTqtMGWnm2trE/QQtmB1Y9iZ847uBZO8/egsWD/k3PcaMdT9ScpAU7P6lMcX98ToZE
 fgWzyb1W4EnQe5ZLKbofVHIdoiPpumuBpoaxRaKUCZcJnq7py9UzZz8nqyRMRXohi29/
 NNxQ==
X-Gm-Message-State: AOJu0YwGGUpcQP+xz/+qnR1VchF+8ALNEScQ6YvYyqbYpnvqu9lZx9tB
 ZAh4QrrGk4pAWbWR+dI9MnQasjl1GC6NtC2AZk1LBL0nlk+aQW+2JmE7s6nDhD0=
X-Google-Smtp-Source: AGHT+IF85mXpQoPGP3C0b4kA4zLQgVGpjYWZya/ZQFmYzKNDHjAY1Fvub5LspF2PyegHNCuryznpMw==
X-Received: by 2002:a05:600c:1c01:b0:40f:fe1a:6b96 with SMTP id
 j1-20020a05600c1c0100b0040ffe1a6b96mr2281282wms.4.1707324076965; 
 Wed, 07 Feb 2024 08:41:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUoovPXWSFwi0GuqZFXP/1W9uavzo3anjNfUcWQsnyaYUwX8XxI5oNbBiLoDo2yh0r5RY4iLRDzo2JgC4FWL3LmnIsBM5FUkQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:41:16 -0800 (PST)
Message-ID: <b35b2dcd-66df-44ac-8484-5603c3004a92@mind.be>
Date: Wed, 7 Feb 2024 17:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111070215.3064748-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111070215.3064748-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707324077; x=1707928877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GTp6fAI0KUtDJ0qX7r6ILp9ufNkcw7wd6tLL6nPOKDg=;
 b=HGlon9jiAETD5e5Ol1BQnR735qxI2NjtA+O3ieZDsH5qirCtRUlSdY1jAf5YIQDOie
 UsYBsqMuWpMZDSM7Ym8fYASIh1rzC7E5UchEoNg+9LbJrbOBijP0bjSe11Eajc+wrG03
 7Syp4Qmy1mvP2IoYCjyVQPjS8U3ktCALD6oiB5gvIX/xBJeTrOyTyAz3sJ6wvswCEdJB
 oeOaIOvJXZZpWoYo4DwOiHUH3Yx8qKFFPWkeMgJmMsjsQddBeaCIZvJY03kDfkrrxM5B
 9t0HafvwiTas6fIboH8BldHTyLMqWi5EZHHmQ+8AfPb6ZiPYWPbqTT7su24NZEl/k/F1
 M6sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HGlon9ji
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smbprotocol: bump to
 version 1.12.0
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



On 11/01/2024 08:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout


> ---
>   package/python-smbprotocol/python-smbprotocol.hash | 7 +++----
>   package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
> index a46f9f635b..b9d5f74999 100644
> --- a/package/python-smbprotocol/python-smbprotocol.hash
> +++ b/package/python-smbprotocol/python-smbprotocol.hash
> @@ -1,6 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
> -md5  a7474ab4cf8912dffaab56ad5067f429  smbprotocol-1.10.1.tar.gz
> -sha256  b5bc9d4930ec947d42c21089a4d373b97e3f6488fd15d32d27189312fd8a04c9  smbprotocol-1.10.1.tar.gz
> -
> -# Locally computed
> +md5  ccbb42bdd58a0070f56e966d8562451b  smbprotocol-1.12.0.tar.gz
> +sha256  5916a4b6c948bb70f82c246bdbfc86cf152226b71dac9f33b3d731d91e86274f  smbprotocol-1.12.0.tar.gz
> +# Locally computed sha256 checksums
>   sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
> diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
> index 17c2b17dbc..ece0744252 100644
> --- a/package/python-smbprotocol/python-smbprotocol.mk
> +++ b/package/python-smbprotocol/python-smbprotocol.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SMBPROTOCOL_VERSION = 1.10.1
> +PYTHON_SMBPROTOCOL_VERSION = 1.12.0
>   PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
> -PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/13/1a/73ad1883beebe4f6f47879cb9880690944faa00681141920c7a2219f6152
> +PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/57/72/d95216a9fd5da1b2fa225130741f50d4949c8f76d46669d30921c06d69ff
>   PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
>   PYTHON_SMBPROTOCOL_LICENSE = MIT
>   PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
