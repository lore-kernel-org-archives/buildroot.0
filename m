Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4657C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE1882049;
	Tue,  6 Feb 2024 12:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9W65yQ03Ls4F; Tue,  6 Feb 2024 12:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A92820EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A92820EC;
	Tue,  6 Feb 2024 12:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8691BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E4E822C9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjJuXUA3CyjM for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7E9F820EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E9F820EC
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7E9F820EC
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:33:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b1a51743fso4074446f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707222790; x=1707827590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VFSoqqAZQGRqfrGpGEEWaR21yr6cqJ1GsN5avE4zSt4=;
 b=GL5xFHiX/WN8V8QtPv8qAo80qGfgAEg5vUB2X8r8jSTpz2T0Trl0TPmTZZggi7W1xC
 ZkKLMNYNe8nFbL74Bh7jo8UnLbrIXsKVipajcO4ftrzhGjVrLQ/tVY5S+Ewh94T9Ry1n
 7HutI/kbY76dEyCsHZXTUVyYPzW0+8S3OhfzQz5DchwGyD6ZhbAiPeBPxy9fiPqbc9ST
 1Eq6/XPi4VoBasCBNso1Cc685zvBsm97dK3+AOogG2GNm1dnvTq8syVvWDK//P2CV3FR
 LXIkA56dZwu+m4erhXvRFoTKbcF8pPeGgLFjvvyRCGqcp0QGKo1v1sYbdhiRtav2nLiV
 GkGA==
X-Gm-Message-State: AOJu0Yw0rzXl247iDQUMzEz5WnfyWOZAghFJxYHqtoRg+UJOqkgkHl90
 EK6U9IgM+feh5jooaHC5JGM13yxs8lQMRmBll2jfGc0vNxF0CeVv3Gi44m8y/Cs=
X-Google-Smtp-Source: AGHT+IFhK7QUkoGxeYnrcEOywDS8P6/z9ATzu3Ghi2X8yx+D2HCCl8UwAoVbHPRI9aOoE5NJ/2Gh1w==
X-Received: by 2002:a5d:588d:0:b0:33b:1545:fe6b with SMTP id
 n13-20020a5d588d000000b0033b1545fe6bmr1260614wrf.32.1707222790589; 
 Tue, 06 Feb 2024 04:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVP7b8lsPT4ASJTROUAV7i5gpdE9HnutHHsLqjzyFgzFuE+I4zY33R3+mVmPGF41WmIDyxCAJ7BJSYBm4LNWyssKOTOPFQsCz0VUnVzshRJsFfyLrCOGDzsWkomuZMjfoWa
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4b0e000000b0033b3c2e73e2sm1981606wrq.113.2024.02.06.04.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:33:10 -0800 (PST)
Message-ID: <931454f1-052c-4146-9c91-706cd65770ba@mind.be>
Date: Tue, 6 Feb 2024 13:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240205164615.510688-1-james.hilliard1@gmail.com>
 <20240205164615.510688-2-james.hilliard1@gmail.com>
In-Reply-To: <20240205164615.510688-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707222790; x=1707827590; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VFSoqqAZQGRqfrGpGEEWaR21yr6cqJ1GsN5avE4zSt4=;
 b=CumPgMM7TbJ6K3rX9jPh7fUXvD8FvZyC3jWSpD8sRK9ldexW1hSlkP2bdX4/RiwJZb
 lTxuEQZ7Q61QxO2CMPwvAagShd8pW/96G8pGkP/LsdgorxOKL1S4AdtqBW6AfNYkMA1B
 mDGnR6iHfzrS7CdqaCfSSh7tyE5T6fNhP2bv8WZT9bfUXsCuwzz7Tp96T8BqF3WyYcxN
 rzUaAO6+pUrEeReopa23m4Ow0BoIN0z0cCeBYyrSz4j4F3jvktviwQZ4/Bq9Nwvv30Ch
 3tRRwmFNdHOzb5jniOi8bLLexeVAyjkhSTpQ5jpNFS3DPYN3EyrF0iUoRA69AUf0aKHM
 vJQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CumPgMM7
Subject: Re: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.109.2
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
Cc: Marcus Hoffmann <m.hoffmann@cartelsol.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2024 17:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Instead of this one, I applied Marcus's one.

  Regards,
  Arnout

> ---
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3dc1578cb7..c16b7d22de 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
> -sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
> +md5  b48191c0322fb5479773925af005b2c1  fastapi-0.109.2.tar.gz
> +sha256  f3817eac96fe4f65a2ebb4baa000f394e55f5fccdaf7f75250804bc58f354f73  fastapi-0.109.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index dc6d919926..a2191c73b7 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.105.0
> +PYTHON_FASTAPI_VERSION = 0.109.2
>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e811211cd1cbc219cefa4732f9fb0555921346a59d1fec0040
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
