Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C8C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3415083396;
	Wed,  7 Feb 2024 16:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngmZdDDSuxtF; Wed,  7 Feb 2024 16:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D09D83487
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D09D83487;
	Wed,  7 Feb 2024 16:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73CA91BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D93A40568
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieBZFc4HwzPn for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E31D1416F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31D1416F3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31D1416F3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:01:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41001c6e19aso4930375e9.1
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707321670; x=1707926470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AjB5bP4VAoOFF6wm/cLvY8EVAyEVDPqSJDMDS9qcqiM=;
 b=sPyAJzeI0DF+vxdevFsrgOpBVdne9v/lxGqHMCzdKM/GBCE1E2iPkLjxXm/JzIlL3O
 jvNwmOG+YAxkgKWp+W+XkcN8s3rVUTLRtcXcUMy5l/dfzBMe7c3aIBgJhXgQ3XefFfux
 D8iqgh9WLX1GrmAQtopppXkFEgfin6x2/0ll79x3OrjfLv09Gw5mNI6qNGSPM38z8yNc
 uwrQadBECDroCD2WZCZHRthn8iStrpKqZl0+3Zgv5iB/98W0RIhI6SkK+OkXa9PkeUUr
 0cQ1/GYVa+ZXVDzQ00sUe/RbVlCwoNtJ5PHLVIa0JvM/kuO8UjOL6PBkNMGGWyO+reYK
 jHVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ1+Fc7ttC14V0TRQ+u+pQGZjHoDq8cR5OBI+pQkxi2HtKwrxvOQ0A8W+PGPwxpC1Ka0cY5g/qdzB9paJ6WV6uNclmZ1O8xA==
X-Gm-Message-State: AOJu0YwpBlcJ05m0D/nsYkVWWq4oxFWjF+5VW0InrG8E5eNprSMgFJOK
 y2+nazyXMbLdMSnsI5MwBCs0bE3ewUo5O6FRuIRs+3KVHnGBKUekPxCw++ypQIBUR5UdbPWMTJw
 2
X-Google-Smtp-Source: AGHT+IGT90ws4kgBaskKVbylkIsdChX8uBuI3Cz6jZIdthyG2bXDbZXzuUjw8TQAXNRhisOyCR297Q==
X-Received: by 2002:a05:600c:1914:b0:40f:d0a7:3fdd with SMTP id
 j20-20020a05600c191400b0040fd0a73fddmr10173583wmq.6.1707321669995; 
 Wed, 07 Feb 2024 08:01:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWBJceOKCGAf7UWPCDsh765Kfy7EYEZ7YNYz4SLwFR8h+H/joMqWUq6jKG93zRmdjukldrq9cGSiIsEzrQ/aFAR0uVWFezUTVhj6rt0ffwWbgQLCXtV0vZbmOk=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0040ffd94cd27sm3314934wmq.45.2024.02.07.08.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:01:09 -0800 (PST)
Message-ID: <457e9920-3397-40b6-a746-9ba3bf0511f7@mind.be>
Date: Wed, 7 Feb 2024 17:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111061658.3034731-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111061658.3034731-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707321670; x=1707926470; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AjB5bP4VAoOFF6wm/cLvY8EVAyEVDPqSJDMDS9qcqiM=;
 b=AbCBE0dAsskszFjjBtymudQJ+XAycszI0Uqb0E3gDmPfgL0NCsyhc7I9XX4yA4y0QK
 WwRFzlvKXDLji7di1xvXEyKZx9VYHTocbV3iO+di+87zE1Rkdsg7QFpS3jB0gobkiIaS
 Q+zLHxoBdDoICZOQizbJ/XtHH2LL1BHwghWbz8zmqunb1hWB4hLBIcwZnwxZzgyJ/9lf
 cLLHZTo6OlXewzNOGW9MHboahq6wHtFJ9gYcSkJwZ5ErTgbjkM3EYOBfp8RgLYBewpj7
 ZFa1v+LfEJK6s9I4jNArS3PUqtvdeW94JPqtlE839Qm3Wb4BJ9gltKcwtaTYDMKqhJ3P
 CYGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AbCBE0dA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-service-identity: bump
 to version 23.1.0
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



On 11/01/2024 07:16, James Hilliard wrote:
> License hash changed due to MIT header added:
> https://github.com/pyca/service-identity/commit/a4a82c1b646d07cf2f3b4705ce17f22e6484556c
> 
> Migrate from setuptools to hatchling pep517 build backend.
> 
> Drop no longer python-pyopenssl runtime dependency.
> 
> Drop no longer python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-service-identity/Config.in            |  2 --
>   .../python-service-identity.hash                     |  6 +++---
>   .../python-service-identity.mk                       | 12 ++++++++----
>   3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index 278900971e..dccd8f37c0 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -5,8 +5,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>   	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>   	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
>   	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
> -	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  Service identity verification for pyOpenSSL.
>   
> diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
> index f648918dbd..32d8f21ad4 100644
> --- a/package/python-service-identity/python-service-identity.hash
> +++ b/package/python-service-identity/python-service-identity.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/service-identity/json
> -md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
> -sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
> +md5  14a751406024544784459474d93d1ea5  service_identity-23.1.0.tar.gz
> +sha256  ecb33cd96307755041e978ab14f8b14e13b40f1fbd525a4dc78f46d2b986431d  service_identity-23.1.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
> +sha256  51f7c647190e74d19f9f24f1b19645b425eb8f30f049196053686bff188505cf  LICENSE
> diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
> index e4ae8e6889..6e61dd951b 100644
> --- a/package/python-service-identity/python-service-identity.mk
> +++ b/package/python-service-identity/python-service-identity.mk
> @@ -4,11 +4,15 @@
>   #
>   ################################################################################
>   
> -PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
> -PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
> -PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
> +PYTHON_SERVICE_IDENTITY_VERSION = 23.1.0
> +PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
> +PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/3b/98/2a46c7414ffc1d06ba67d2c2dd62a207a70cb351028a8cd8c85b3dbd1cf7
>   PYTHON_SERVICE_IDENTITY_LICENSE = MIT
>   PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
> -PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
> +PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
> +PYTHON_SERVICE_IDENTITY_DEPENDENCIES = \
> +	host-python-hatchling \
> +	host-python-hatch-vcs \
> +	host-python-hatch-fancy-pypi-readme
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
