Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35743C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBAD41835;
	Mon,  5 Feb 2024 10:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEBAD41835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dounYUeGgbw; Mon,  5 Feb 2024 10:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C91417E3;
	Mon,  5 Feb 2024 10:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C91417E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7327E1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B264417D2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B264417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNcQqj7SdihV for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:31:24 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3963A4179D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3963A4179D
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso25937955e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129082; x=1707733882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70tb5xq+iKywIhOIovDXpsjfn3yRsjYDnMgUbjzYHys=;
 b=rdu1L3vSPvqZntS7+wuYjRvdSjMQMn3lJ7g4vnrrZWZo/KGOUnL87vESGJBSUG34YZ
 Eg9k1oWhqPpfwzFuhpUsrb3CPAnliQ8pCbY+sCHhWVjx5fY1KxqFZxXKqLIXxX0Jy1AK
 NydpyS5CvWC4ikbZCgiBwk4ADje5pRv+BC0of3+G1Ib8CUetCeOlGUfxb/mK3Xu8RZ8b
 ONljSUlOw4s3O4awAdOkfsCGn5RXdl1TgR5Gl3cDibL8ql3TmIlOOfk6NFU66PsSmvPs
 Qdu61CY3SpV6xSYvRILbW7g6a0WKD2n2oCiu2buTtm5a76yyEY9nHKdPi+gPxh7MH8e1
 mKYw==
X-Gm-Message-State: AOJu0Ywy4ZOC8Z39JXj7IbWP1IhNYlGZb/qE3+S7iE9mS6kOeUaznwl2
 DHQzlFZkcBORYo5SY24dt4Db5pPc37gR1LLTgo60suJ4ehp4QYgkfHFVDbomf1I=
X-Google-Smtp-Source: AGHT+IGo0Js7N7BZXe7mhGTQW0oliZYA4bFKFQgc2NsxtIA4UgIgFUzS/ykW9jOy+2rVw6FjFVRXbg==
X-Received: by 2002:adf:cb02:0:b0:33b:1e84:9684 with SMTP id
 u2-20020adfcb02000000b0033b1e849684mr5951366wrh.70.1707129082308; 
 Mon, 05 Feb 2024 02:31:22 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUqIyTou+W5k4piI5dLpa8m7kzS4L4SmEvZX1M9q1wSzN1ymLKZaerhCJ2orLJ6gh/jOiWw3XZgRf4ylFz9n8ByiSC3PxjQMPNys8uzu3FkxvgE5iqNHeyRg/A=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b0033b3ca3a255sm2185221wro.19.2024.02.05.02.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:31:21 -0800 (PST)
Message-ID: <8a7596c5-c74a-477c-994a-30f2f779a0f6@mind.be>
Date: Mon, 5 Feb 2024 11:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111030356.2678848-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111030356.2678848-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129082; x=1707733882; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=70tb5xq+iKywIhOIovDXpsjfn3yRsjYDnMgUbjzYHys=;
 b=OLJJI/ItaxpCTQBQxNXLoGLeLbv8dE4u7XvhQ/5pOubV8zlVyyfk4WRkYoG6z1GIB4
 3e5Yb41D6uKHo7b6Jdbn1BLQPmlZ3whOsBEW4UVjJnJ/Y1GkrIuSXfo9GnByKr5X6EG5
 rIlMPjjBoMZ1Xu4U1zbRw8Uguuy1vvZrXg9ER6d+vk+r/GFOtdKqvvcwCZzLd/BVvH+R
 +0KFrS+gmmd5djkdYn8PtjpH0Daer00yCWd2gqHtKrEEaCSHIXDyINZLGy0GxKM4dmW7
 OOnVsFN002237eKAT3d4C6+ElSzJZ7Jl5pzPlS7tisQ0hhoNotnRCDA2R6r/fszxFiBg
 dsxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OLJJI/It
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.23.3
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 04:03, James Hilliard wrote:
> Add new host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Thank you Marcin for reviewing.

  Regards,
  Arnout

> ---
>   package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
>   package/python-pytest-asyncio/python-pytest-asyncio.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> index f6cc1d2413..29a38c7dc7 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
> -md5  1d10f607444a375c1425a2a90960006e  pytest-asyncio-0.21.1.tar.gz
> -sha256  40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d  pytest-asyncio-0.21.1.tar.gz
> +md5  0c81f6de855e546180de424c0db05c20  pytest-asyncio-0.23.3.tar.gz
> +sha256  af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f  pytest-asyncio-0.23.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> index 5c5efd819c..8464c70f5f 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> @@ -4,11 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.1
> +PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.3
>   PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
> -PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/5a/85/d39ef5f69d5597a206f213ce387bcdfa47922423875829f7a98a87d33281
> +PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/1d/27/f036ec4bcbfd056c54572d7169ba3dbb54e7181f02f21caadd3aecb9cf5b
>   PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
>   PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
>   PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
> +PYTHON_PYTEST_ASYNCIO_DEPENDENCIES = host-python-setuptools-scm
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
