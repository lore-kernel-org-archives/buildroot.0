Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C001C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 257C083396;
	Wed,  7 Feb 2024 16:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH2vWKcCq7lU; Wed,  7 Feb 2024 16:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A29D2832C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29D2832C2;
	Wed,  7 Feb 2024 16:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076931BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029DD61409
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_-FJemhOq8I for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0375060ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0375060ADE
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0375060ADE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:03:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso551740f8f.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707321820; x=1707926620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmCcPoOa8pHAlgLytHOQXZGsphlLNPqzFkI2QovS42E=;
 b=YkkJAab6kXzeMCG+Cr9Rb0GMdX6tnERlA68cUja17Qv/HwRQvOlFVs1kpGus1PQ5WF
 3GxehATAfAvaMynzYcB71yJJqQICPpyH+6caZ+lNGuSFJrBR3d3NQdLYwsyz9+BqdENT
 PRPhhuwheXvdM77ONkPsC9H9VeFWApaE3i3wR9+bzP9zbfNq0/J30TIWzxiV6til0ZKp
 pST8yDt8LCNFbvx3yeLRId8nMoc7kHVU4Ltom7VCIx/HigPUkYYx970ODdeHc5gGDzik
 TsjU+RpuslccX6CXOZSp5j10gkHuRgdigh5exRDOeqqko11ltzkGQ9FkatugNxyk5vKm
 jv3w==
X-Gm-Message-State: AOJu0Yy+TECWTmU9IJ67g+uiSaQQnOJe3ubBCRysJqGmD2tC1Ml67FDD
 nNfBV+tj1vJcImRl83wCmQyZb1HqeK1wR3arQp7nNV1o/ndddPeksO8FPY01jh0=
X-Google-Smtp-Source: AGHT+IGuVgfJbsTIg5P6wHOhFU8dq2UPDBq0Kw4dyqoDJZphJ/xFJkR/0zMOQZI5mJevbM5PgMICew==
X-Received: by 2002:a05:6000:1847:b0:33b:4aeb:82f0 with SMTP id
 c7-20020a056000184700b0033b4aeb82f0mr3509418wri.49.1707321820023; 
 Wed, 07 Feb 2024 08:03:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgD3MV0yC28FZ4O5bVf9x0ljOvWrz4+QdFDKSw9oeh2OPD2Vy9WLE3F9ySPP9YnjiiQT5MyfeYZRFfvl7DFf59ZnrUgzhenLg7mPeDkv6qPmwIwvMFoxeihBQ=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d468a000000b0033b44b4da56sm1788157wrq.111.2024.02.07.08.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:03:39 -0800 (PST)
Message-ID: <3cee30f6-97c4-4a42-b5eb-5128313584dd@mind.be>
Date: Wed, 7 Feb 2024 17:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111062157.3037879-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111062157.3037879-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707321820; x=1707926620; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gmCcPoOa8pHAlgLytHOQXZGsphlLNPqzFkI2QovS42E=;
 b=P0tsUuA936/NjRAQQBM8fLCSh1ULp/WrwUpDyBZcfMWo1/5212p1OJ8VaJJ1jNfBzH
 +XoNY18BZLzdcH0cjTGTjUiECFZreAdX2XXqqpfvuL2mUJQ79FlcN6rUysLp79WwdeQI
 LYaOFiYRwNX8fpq0EpOeo6tHz7PzA9C3UBeNrBxs0JWGlvMJnMgi5MF8CW0UMWVuWGZk
 g2ZtGi28GJ+ZN1nyti62IMVdc4jeeX2vn+RluuLNyUAcSKEK7MkMvbCA07c1F7NB6me5
 Pp5wBV5YCJowgvsGpGmrLLqxk0e98Fcab3MzY9ralmtEuKsviWrfTuJZ/LYzrDxmXFkq
 lNtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P0tsUuA9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.3
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 07:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setproctitle/python-setproctitle.hash | 6 +++---
>   package/python-setproctitle/python-setproctitle.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
> index ac8fed986a..f60595bf6c 100644
> --- a/package/python-setproctitle/python-setproctitle.hash
> +++ b/package/python-setproctitle/python-setproctitle.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setproctitle/json
> -md5  fa9771540422a59a8dee1331ad6fd3a9  setproctitle-1.3.2.tar.gz
> -sha256  b9fb97907c830d260fa0658ed58afd48a86b2b88aac521135c352ff7fd3477fd  setproctitle-1.3.2.tar.gz
> -# Locally computed
> +md5  1c042d6717212de791c4f9b63e7b544e  setproctitle-1.3.3.tar.gz
> +sha256  c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae  setproctitle-1.3.3.tar.gz
> +# Locally computed sha256 checksums
>   sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
> diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
> index 7055920c08..ca2d0ffbc6 100644
> --- a/package/python-setproctitle/python-setproctitle.mk
> +++ b/package/python-setproctitle/python-setproctitle.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETPROCTITLE_VERSION = 1.3.2
> +PYTHON_SETPROCTITLE_VERSION = 1.3.3
>   PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
> -PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/b5/47/ac709629ddb9779fee29b7d10ae9580f60a4b37e49bce72360ddf9a79cdc
> +PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98
>   PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
>   PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
>   PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
