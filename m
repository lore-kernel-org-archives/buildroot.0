Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EB1ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 19:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EDF580C4A;
	Mon,  9 Sep 2024 19:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y72w4mIloka6; Mon,  9 Sep 2024 19:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4099180F2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4099180F2B;
	Mon,  9 Sep 2024 19:09:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 692101BF313
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56846607EB
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y17uy3yTaVgf for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 19:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11816607AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11816607AB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11816607AB
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 19:09:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42bb6d3e260so42400395e9.1
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 12:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725908991; x=1726513791;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8gmv6ySvElqTexRoRIKKwNpI+9zDCVA2IrPjf4O1YOY=;
 b=t9Rb4ROVZ2b53ccE/NtsmSQ0dkpRcp83QcPwy8waYLtIXTRp2n/M0hHELLzECEcube
 ObxY1JxXKntHQvDsXHXFieQTeAOUx3XQuE9HxBxOvLFh5N57W2z4q8719HLjeQjI/WXn
 NZ1Z1/M/sup3fyhg5lFkYQkbByl/qAqJoWOcP1hHHskcwz6nMcGEAO3/6aiMtTkNlI/W
 LtJgytUkFObt8n8yHcacFBhQb/fLmv9GpA+yRFNMXvPYRJrzRxwYeVyFLUPpQR6CezVF
 /pitLE+m5jYdDmr8qj68bV6+QARBa8oNx+Ya/1pCOXyVWEUFMOv8OYlYRWoZhFMNqeQV
 Ttjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVNyb38qaC0pO6Alksv5gfIllz8ZLxF2fY79fCaIA5Xumczd4lpTyEyt5zCIt3kCBFpioAXocUuyw=@buildroot.org
X-Gm-Message-State: AOJu0YyFLr4y3MZqI01o03Ohc9ZXWUgccrnd55S3ypnCBsUMpZvBEG14
 Bz9m/24BlTEMXP8flY94AnnFXz1QfOxhFMneVYgle0CEVlfGDbyHZP232wBCF/4=
X-Google-Smtp-Source: AGHT+IFJIQU6/oCVTemS5zQ0uSapZOF6e0QAjQ0vCE6fRW/bG+o/52KSsYAZf3cpkeC47C2lSgCxUA==
X-Received: by 2002:a05:600c:5493:b0:42c:b3e5:f688 with SMTP id
 5b1f17b1804b1-42cb3e5f779mr42920255e9.4.1725908990748; 
 Mon, 09 Sep 2024 12:09:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca743bc15sm105739345e9.46.2024.09.09.12.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 12:09:50 -0700 (PDT)
Message-ID: <c8bff057-8bda-445b-9cd1-b1bb5b0ce9e4@mind.be>
Date: Mon, 9 Sep 2024 21:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240907205935.242051-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240907205935.242051-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725908991; x=1726513791; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8gmv6ySvElqTexRoRIKKwNpI+9zDCVA2IrPjf4O1YOY=;
 b=RHIc87CJu8+kOVpRri/lNp048MYX5eTItiyykUf1TVMhdK/IXuExPNvaEuW6XOhwJ2
 EIwqqzKudJyfJgUeUYWQMM/aISnGWm08OsT+ucP4IGd/ri4tzjkitntx2+60udm9bMQ3
 6gOIHiCnFvrg9tBev7xWdrYkFyLc/UAVH1kmOOKSEXM3OmYtVbVYjHSDtSqIv2DFKm6C
 MkVF6/wfwSDG/7LdwyfioIUKkxm9O00YcmM/E8ROYP7onKIibawML3eJcEWArfJ/rb1p
 /jLB5SfhFtxdNnFiPkuUdhZZy8z2oiX1oqCTf9trq1vfjt5QAEEYrkD48fG2+112BGbd
 HMkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RHIc87CJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-cryptography: bump to
 version 43.0.1
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



On 07/09/2024 22:59, James Hilliard wrote:
> Migrate from setuptools-rust to maturin pep517 backend.
> 
> License hash changed due to dropping PSF license:
> https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53
> 
> We now need to enable chacha support when building with libopenssl.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - restore cargo2 archive suffix format
> ---
>   package/python-cryptography/Config.in                | 1 +
>   package/python-cryptography/python-cryptography.hash | 4 ++--
>   package/python-cryptography/python-cryptography.mk   | 6 +++---
>   3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
> index 213aa24fa8..d12f040656 100644
> --- a/package/python-cryptography/Config.in
> +++ b/package/python-cryptography/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
>   	bool "python-cryptography"
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>   	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_PYTHON_CFFI # runtime
>   	help
>   	  cryptography is a package designed to expose cryptographic
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index 5fbf69a208..bde94ab7ce 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after vendoring
> -sha256  b55c6c011ba4bb803de0b557f40f1765bab9f63240e93516daaf75c3c68e6618  python-cryptography-39.0.2-cargo2.tar.gz
> +sha256  c57ae743b2adfb29a3fc005b6f39bf1378e20d10529a859b6e2e425845bff8f3  python-cryptography-43.0.1-cargo2.tar.gz
>   # Locally computed sha256 checksums
> -sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
> +sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
>   sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
>   sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 1cbccd0d5c..1f3b4564d3 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
> +PYTHON_CRYPTOGRAPHY_VERSION = 43.0.1
>   PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
> +PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/de/ba/0664727028b37e249e73879348cc46d45c5c1a2a2e81e8166462953c5755
>   PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
> -PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
> +PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
>   PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
>   PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
>   PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
