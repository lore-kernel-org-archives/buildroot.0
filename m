Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D0C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5ADF41A42;
	Sun,  5 Nov 2023 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5ADF41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXOGq6WMsQG7; Sun,  5 Nov 2023 21:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCCE41950;
	Sun,  5 Nov 2023 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCCE41950
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99EA21BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7374381A0D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7374381A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hZMX7ezi5pO for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:06:29 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81299818D0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81299818D0
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso6352228a12.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218387; x=1699823187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qrDQQA4LbGZhQuNXLov2d0DTJMqYOAJptE8y0ovKBMY=;
 b=CJ5Sq13aDHr+WSmPNB+4uNgPgBGfomEBxrk9P506LMCDXMjr2zA0qst8YqkG3n+KwT
 Bda8yKQhC3iEHo1CYK4n3GrMB3hCqqO8EX0Szw+8ROwhMJ8+aZdOCrwuYwaq7Gta8oml
 LZJ2Uis0okanLUWFFtODD7qrKYF6AxgVr7yLkPw1/MRArVw4mRZJbM4b9b8BmzX4pQk9
 B09xgMOc9Wo2SRuHDdiqP0mkavmEEHILw+qf5iigjRzO6X6Y50H/KBOQ24zWvIHTrvxF
 GPHt2eXNBF2n4uZWy+4SXIyN21HwZ3M+uqE8sK8LjpB9kNVam5Ay7zliaDKRS+9332iv
 9xYQ==
X-Gm-Message-State: AOJu0YxFYD88jdYYo+NOi2HvbcJOHIUOaIvoNMha9E0XYRRTm6NFkVV1
 7pqA66ar4L/DPUnON8I9yT/Xuw==
X-Google-Smtp-Source: AGHT+IG7IX6LnZg4CQFw7yA2iEX1j36CUP5KnCUwpq19kPN/kwtM72XZtD+von8Ysjn58eq//lAe7A==
X-Received: by 2002:a17:906:da84:b0:9d2:ab03:a22d with SMTP id
 xh4-20020a170906da8400b009d2ab03a22dmr12443088ejb.73.1699218387789; 
 Sun, 05 Nov 2023 13:06:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b00992e94bcfabsm3343523ejb.167.2023.11.05.13.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:06:27 -0800 (PST)
Message-ID: <58b309cf-8d3e-4204-8c9b-05e6819a4df2@mind.be>
Date: Sun, 5 Nov 2023 22:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104232732.2676337-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104232732.2676337-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218387; x=1699823187; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qrDQQA4LbGZhQuNXLov2d0DTJMqYOAJptE8y0ovKBMY=;
 b=bwNaqfHTFMB2y8RGcfmSYAU68dJ05ZkMTqbvkifFwbmi5G1JT2VQCmdfNHrL39eeMQ
 unu0eUdNf4u6bROs+aixWTR6aOEtq/j++Ud+DB6xDCu9AhAgckM2T1wDZbss3E+gAqjV
 kDF3NcLx6BFTSm2OymKfGyliitY0KivCU63Yw9ceyXJEB6fr4iH5fAKDw4ZZMxLiDtaK
 /iyNPyvgHVz2YTdkyGrqRdbduzaEmdIqwfLnJN0l4qEQQqXpJNiJxG/XRmxee3KwwMaK
 x8QgWv49cI1hc0eQZFFBXXnlIQlcoCcsZGuktGi4DsLRWugD9Nh64bR2AMwyR3cuYLpt
 zeXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bwNaqfHT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.6
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



On 05/11/2023 00:27, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiohttp/python-aiohttp.hash | 4 ++--
>   package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
> index ec8334b193..35c899cb0f 100644
> --- a/package/python-aiohttp/python-aiohttp.hash
> +++ b/package/python-aiohttp/python-aiohttp.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiohttp/json
> -md5  4bb59a17563df9a692c64418224ade12  aiohttp-3.8.5.tar.gz
> -sha256  b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc  aiohttp-3.8.5.tar.gz
> +md5  bdf57b82c0d1804f458e10320bb0dcd5  aiohttp-3.8.6.tar.gz
> +sha256  b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c  aiohttp-3.8.6.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
> diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
> index 50b8268070..e814fc9224 100644
> --- a/package/python-aiohttp/python-aiohttp.mk
> +++ b/package/python-aiohttp/python-aiohttp.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOHTTP_VERSION = 3.8.5
> +PYTHON_AIOHTTP_VERSION = 3.8.6
>   PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
> -PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/d6/12/6fc7c7dcc84e263940e87cbafca17c1ef28f39dae6c0b10f51e4ccc764ee
> +PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fd/01/f180d31923751fd20185c96938994823f00918ee5ac7b058edc005382406
>   PYTHON_AIOHTTP_SETUP_TYPE = setuptools
>   PYTHON_AIOHTTP_LICENSE = Apache-2.0
>   PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
