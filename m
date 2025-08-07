Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0243C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD4940584;
	Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9s5sGI_em_P; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EEF40559
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7EEF40559;
	Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CA8810A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 735F6605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uLIUwjvAgA6 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A8B660642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8B660642
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A8B660642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so644799f8f.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591046; x=1755195846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5Cx/EFvYLg0uT8vlcwmUCO9+MgIVMcEomSTHSxInzI=;
 b=G7oDbULsoyYr43L9vAeOrMz/sbfOSsg7Bu0/0IdGGOqHBxXQ3gxR5m/odlw1PMxygJ
 uazDyQVa4PZDhtStlqp0ZT9dxQVd/ON5ua2MehPMNH3Ma5eZ6NqxaHpmARNM51ZxEn4C
 oakwKae3oAyLXcf3VHDg7sxq02vcnHIF9qMwzoC73A08lbCwCo0yI/jX0DO61gbpIwGl
 d/1i6To1l4B49DoeUtbiccTSYq9LV14oObNVIE9Yere0hQI8iz+LAlHXbsEsN/xHqWpy
 zlOxW1zgxBuL+3G3KDPl4F7584eQCVQYy+aL86CqUPbzjXpt6DyxjxCalOPley14iHlu
 BWXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTEFRvOCiSovTLBRo2IAXi8LXMeQ8ARCBStsywaALZaTEAwArcncaRReE9mDSknLjEkbKT+QKF+oc=@buildroot.org
X-Gm-Message-State: AOJu0Yyi3LZ2+j6iJnnaH4toq3tN9Ev+JsKqi+1iV+uF9XPi07xjlF9w
 cqdS9idUgbvgUPhNWBg49X/9Nj7cnti+2QjBr6N0GhZNtH2qa3UI50WbBNuyi3B5IoY=
X-Gm-Gg: ASbGncuGSDv4mioXIKu9vN3whvfPxZJOBl1EabFOz8Hf9+wR6zb/70X6JBS1REMYwWR
 Rz/FHeHFfmQ5q2LpMcAZQizNAjKhegc8qaNU3KhHrqUqruhlZKkUUlw1ULaSI+E3wk0uZobmMbO
 Sh4mYvSoTjB06+fw45wZqEYp0076HUWsHzGYY1WTv65mIAj9dEOM0FcbUUE547j5o5+rFW5a6go
 y48pk8veG65pXD5zpL4xMRjgsNqbRrjAOMJq4vOVTA+7r4By6kZa1vLHC96CwD46IENGNjYd8/x
 BVFCgGRfRZxNKoEsLDAu8+qFI3QEPkRP0iSxcuU38LvaBDruyDWtOdA1zIWnmHsFHd1vQ8RjeKY
 nxGRiFmg1vzGdyg==
X-Google-Smtp-Source: AGHT+IE3iLcOo4p9IeGiHbNOUtRXfg9NAKuxoSxp1A/MBaf+7DjE2v8QdiTD8VC4rWts7TtOV5HMHg==
X-Received: by 2002:a5d:5889:0:b0:3b8:d582:6162 with SMTP id
 ffacd0b85a97d-3b900b5138fmr186210f8f.46.1754591046466; 
 Thu, 07 Aug 2025 11:24:06 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c51e2sm26853817f8f.32.2025.08.07.11.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:06 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:05 +0200
Message-ID: <20250807182405.724437-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716102159.306474-1-titouan.christophe@mind.be>
References: <20250716102159.306474-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591046; x=1755195846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5Cx/EFvYLg0uT8vlcwmUCO9+MgIVMcEomSTHSxInzI=;
 b=fkf1vm+AKYzKjZ/2a+DKvUdeQpNvfKnPv+h8DZJNCYZ1+CPC+rnroeW96tlPSR1RhG
 TvguEaVlwV4bhJaVCSbnBAOBC8WERHrqZaFMQmrN+pTPRYIPha1C6IGJ2+i5N/RfhQl/
 hurMzdhFmIbuDKFKPWaXsPvkBy8iKpS7u7EPdCG32FIxwfwxxp2vJbriA8KVvCtdYi1T
 NvMhi7uwcWhaFNVKCwkIyO+y/SvTg8lWqje8Co7jfIVmgjTSQJOzMrmyNaAKGTjGBeb1
 Gsuq/Xf7THZqer//REadhy4rGCBjcuKW7NvGnyP4kcZBBPqCSwE237S7ZhL36rG0GhvJ
 s30Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fkf1vm+A
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 v3.12.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerability:
> - CVE-2025-53643:
>     In aiohttp prior to version 3.12.14, the Python parser is vulnerable
>     to a request smuggling vulnerability due to not parsing trailer
>     sections of an HTTP request. If a pure Python version of aiohttp is
>     installed (i.e. without the usual C extensions) or
>     AIOHTTP_NO_EXTENSIONS is enabled, then an attacker may be able to
>     execute a request smuggling attack to bypass certain firewalls or
>     proxy protections. Version 3.12.14 contains a patch for this issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-53643
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-aiohttp/python-aiohttp.hash | 4 ++--
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
> index ac12cafeea..0aa8dbd3bc 100644
> --- a/package/python-aiohttp/python-aiohttp.hash
> +++ b/package/python-aiohttp/python-aiohttp.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiohttp/json
> -md5  7835f28e41adf6f09467533e8de0c199  aiohttp-3.11.14.tar.gz
> -sha256  d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c  aiohttp-3.11.14.tar.gz
> +md5  4ed66dcec63108ae3a7c01d0415b4dd9  aiohttp-3.12.14.tar.gz
> +sha256  6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2  aiohttp-3.12.14.tar.gz
>  # Locally computed sha256 checksums
>  sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
> diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
> index d3e7d12eb6..e52b6e81c5 100644
> --- a/package/python-aiohttp/python-aiohttp.mk
> +++ b/package/python-aiohttp/python-aiohttp.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AIOHTTP_VERSION = 3.11.14
> +PYTHON_AIOHTTP_VERSION = 3.12.14
>  PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
> -PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/96/91e93ae5fd04d428c101cdbabce6c820d284d61d2614d00518f4fa52ea24
> +PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2
>  PYTHON_AIOHTTP_SETUP_TYPE = setuptools
>  PYTHON_AIOHTTP_LICENSE = Apache-2.0
>  PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
