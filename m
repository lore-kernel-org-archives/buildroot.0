Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE20C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241D94037C;
	Fri, 13 May 2022 21:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9_uS6XY3edh; Fri, 13 May 2022 21:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACC14027A;
	Fri, 13 May 2022 21:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5F031BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55A883F83
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hrm4YQRG7lKq for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:58:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B395883E26
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:58:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id be20so11376639edb.12
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NYIcjIrnWvry67zvpepSbNWCcrwIoLg+PntvqADcbBI=;
 b=iY58qofSZEPT9VUMreQTfQq/4jXEWcLeVDtHXirAxIPJ6S4kKyWWeHvSHBO/oOWewa
 tN+iM4apVTPVtI8qLfS3Q7tpT5Nm3Iur+l96UPowQnP1dPjQMux5wYzD1wR3fYx795BC
 V2uC30CJEpgR975TV8Rcq8WyFG4DQ5d5JpfHu0Opv+DCxkR4DyP50Y9rOB4pBtFWLLdH
 ocKliiO1lxlhFncS4TlIjCRmfDHFx2LIdIxp733S9NQN8HHnZdtapeSbWZIP07P2iCQD
 5XejHTU1djDEGSAQZPZmATLSGx9grErQd01CSlppM1o5mKUnJzGebMfTArVRiZq0nolo
 TJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NYIcjIrnWvry67zvpepSbNWCcrwIoLg+PntvqADcbBI=;
 b=L30XanFkC/sZMI/UE06kuR5Zk9UxkLdhOP+w3CdjWCf5QKoWfCIVzHaQgSedncNFbO
 bmUuIt/H2Ts/HhNBVjKQDGF9mTcxPFE5QS0TsdWC9vxlk8CUjV6sseQAu+LCUgkRfDfO
 3EdEprwMvZCHW8qOGRMdwlXYXuS339D7YwxcX1JtuvqbhiAJ09oAALcHEMTMGG+e6XeG
 PKE9BOolP+IezTjoFjHvZNRDq8OqPU/Gn/v//XwtheCiyKftVXWe6mrE8GoBfsgH6ACf
 gpgJGKNd1sYl2jL7uGLdVn713MFhREJVl6VUvbB9aNeFnAntoFD542+RCGDk0a94KtSR
 KHCQ==
X-Gm-Message-State: AOAM530SHlvjS2fKc42FELca8NB5qn8EGRAqemTCUHw33pWejYQlzB/f
 VmltotMWrXGxzjHdcPupPBFoug==
X-Google-Smtp-Source: ABdhPJwgCkfWlIM5XmkeX1zkmkkMlhd2xQRHeJf7qEk/M+1XfeOTrpwuCXaoZHbULYBatDZ2Lx7OWg==
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id
 e20-20020a50d4d4000000b00425e6bf8b81mr747216edj.209.1652479095763; 
 Fri, 13 May 2022 14:58:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a50870a000000b0042617ba63cdsm1411426edb.87.2022.05.13.14.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:58:15 -0700 (PDT)
Message-ID: <fc7ed565-1e9c-ce66-8a63-4d931177b769@mind.be>
Date: Fri, 13 May 2022 23:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509021710.1865154-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509021710.1865154-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-service-identity: bump
 to version 21.1.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 04:17, James Hilliard wrote:
> Drop BR2_PACKAGE_PYTHON_CHARACTERISTIC runtime dependency which is no
> longer used.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-service-identity/Config.in                 | 1 -
>   .../python-service-identity/python-service-identity.hash  | 8 ++++----
>   .../python-service-identity/python-service-identity.mk    | 6 +++---
>   3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index aa6d0fe715..d6ca060562 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>   	# python-pyopenssl -> python-cryptography
>   	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> -	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
>   	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
>   	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
>   	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
> index 9a20d08925..f648918dbd 100644
> --- a/package/python-service-identity/python-service-identity.hash
> +++ b/package/python-service-identity/python-service-identity.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/service_identity/json
> -md5	c6b8bac93e7d899a1da313a19cc6570a  service_identity-18.1.0.tar.gz
> -sha256	0858a54aabc5b459d1aafa8a518ed2081a285087f349fe3e55197989232e2e2d  service_identity-18.1.0.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/service-identity/json
> +md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
> +sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256	c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
> +sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
> diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
> index 5330239e48..e4ae8e6889 100644
> --- a/package/python-service-identity/python-service-identity.mk
> +++ b/package/python-service-identity/python-service-identity.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SERVICE_IDENTITY_VERSION = 18.1.0
> -PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
> -PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/9a/3d/9eb0563e066ea0540cf580695593ab079376e920016d4d1b3ff2fd8abf4b
> +PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
> +PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
> +PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
>   PYTHON_SERVICE_IDENTITY_LICENSE = MIT
>   PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
>   PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
