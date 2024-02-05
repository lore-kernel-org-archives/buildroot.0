Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D231C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A961140108;
	Mon,  5 Feb 2024 10:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A961140108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUx-h5RR_hOz; Mon,  5 Feb 2024 10:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FE7340168;
	Mon,  5 Feb 2024 10:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FE7340168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A184E1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB96606F2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB96606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeQfxzjawhPi for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:49:21 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95CF60F30
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95CF60F30
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso1736848e87.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130158; x=1707734958;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2zWrjprTB49suZtcvL7m2G3pF/ADk2icdKUn7ub1rU=;
 b=rVyu/8RhuvRTpjjaNBHxj5TSQlsT5x8X4qL6d9EI0HGOdFDE8Hm4lAGaCuk8F7O8w8
 dQrVsFLZqCIq4IoPTWTq5ALawWNIEdKxzQm0QXj68z7m8nonbjoHVwKg8vg/TLUAKSh1
 VQb3HdteoVs6D4e2gTmRwNA+LdDovidCIxFNGGDrRyfwUD+oQTFq0/nd3MhHvsvke1MV
 HKedm0L/yiHdXev7ooXLpf3AGO5AmsbPRomnNmNaEE7HcH8XWiP/s5puFSz03/0S8zvw
 W7DxDNp0D8ZVRRMVjLuEEdhVYp8oN6EnK4OQK1nxB6YdJAcW//tuERqz12u+aJO9TBoQ
 0bFA==
X-Gm-Message-State: AOJu0Yy5AHKG9QWsH8JQ/Qsy2r7g5gy4Sh8zXoQbDGWFPjNwSRoxI73l
 S8S1eIPSeiM8Z0U1af4Nhg73/voHYiGxODCZjIbzQoy9UlGO5dFtyBMu+3+P3Z0=
X-Google-Smtp-Source: AGHT+IGmjI7Hwt/VPHnk6WC8iBBXxshR76wFS2eMZNyA2IDFEklHoKkNq2qagiVhn50srA0kaKZkrg==
X-Received: by 2002:a05:6512:480b:b0:511:479c:1d8e with SMTP id
 eo11-20020a056512480b00b00511479c1d8emr3528502lfb.29.1707130158497; 
 Mon, 05 Feb 2024 02:49:18 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVRmfCe5p8rj2EJap6UqafsBraAma4NV3SWD4xhi9bWU38n8zO+9KnxZCXUuCl9MuGbPozV+Y6lYPAYBQww2RKDkZJWd/FkMVXJBL6CSH+9CUfHUuY2P6/v6NI=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:49:18 -0800 (PST)
Message-ID: <3f39f2e2-e773-408f-8dfc-0877e6a9b115@mind.be>
Date: Mon, 5 Feb 2024 11:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111045405.2894223-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111045405.2894223-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130158; x=1707734958; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2zWrjprTB49suZtcvL7m2G3pF/ADk2icdKUn7ub1rU=;
 b=ZXe9wFSJOREfM9ERvC0YMZqd3+qxaYhRbZXZ8yootCYrjbHLv/IRL7CL3Mbe+4Kag5
 9RgcL7uBdS9B1msBqE/raDr5FEisEbo8JATOzF3S8PRBvvC/2C5HtDuMwgh9FfUKfWQ7
 WU2MPrqEkT+a3nHd/fbDu3JpAz1d/qz1i23SH6QJGK9o70YygPAbVCPQPCsOCZoxGmci
 4MEJsiS/bYMTKMsOvsGyrLKqUIE+uQ9hPmwV4sdZ6O9QDLvoENnasIfE162h5r5EwNR4
 ygNDY0YX7dYni5CMNVO0udK603ysBB6BlIMjqnEB8hO2RfiFEDGWwITcOGjpNSVygCdF
 9BkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZXe9wFSJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-redis: bump to version
 5.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 05:54, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/redis/redis-py/commit/28cc65c18cc4fb37ef14497c963eb181dba8d25d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-redis/Config.in         | 4 ++--
>   package/python-redis/python-redis.hash | 6 +++---
>   package/python-redis/python-redis.mk   | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-redis/Config.in b/package/python-redis/Config.in
> index 4143e1f1c1..e22959cf7b 100644
> --- a/package/python-redis/Config.in
> +++ b/package/python-redis/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_REDIS
>   	bool "python-redis"
>   	help
> -	  Python client for Redis key-value store.
> +	  Python client for Redis database and key-value store.
>   
> -	  https://github.com/andymccurdy/redis-py
> +	  https://github.com/redis/redis-py
> diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
> index e27f87bd50..2d9df87a10 100644
> --- a/package/python-redis/python-redis.hash
> +++ b/package/python-redis/python-redis.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/redis/json
> -md5  ad365234df634680d15294ddc87c42de  redis-4.5.5.tar.gz
> -sha256  dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880  redis-4.5.5.tar.gz
> +md5  f4bff9e3819ec832bb789b8b58363d6b  redis-5.0.1.tar.gz
> +sha256  0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f  redis-5.0.1.tar.gz
>   # Locally computed sha256 checksums
> -sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
> +sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
> diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
> index 186702dc83..067a754352 100644
> --- a/package/python-redis/python-redis.mk
> +++ b/package/python-redis/python-redis.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_REDIS_VERSION = 4.5.5
> +PYTHON_REDIS_VERSION = 5.0.1
>   PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
> -PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/30/128c5599bc3fa61488866be0228326b3e486be34480126f70e572043adf8
> +PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/4a/4c/3c3b766f4ecbb3f0bec91ef342ee98d179e040c25b6ecc99e510c2570f2a
>   PYTHON_REDIS_SETUP_TYPE = setuptools
>   PYTHON_REDIS_LICENSE = MIT
>   PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
