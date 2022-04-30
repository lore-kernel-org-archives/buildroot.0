Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F003C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1921A404D8;
	Sat, 30 Apr 2022 18:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDBmAewkyqd8; Sat, 30 Apr 2022 18:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F644404C6;
	Sat, 30 Apr 2022 18:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0D61BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C2D560B5E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5WVJ8Bt50RO for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:51:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78CD960B58
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:51:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g6so21096129ejw.1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0o71yZM48xmdkgulmkjhA/zr2BdMCKzNumCkAP5DxC4=;
 b=DRmEgreboq5bMdSydeSv9fNsO7sgYOSrHem/3xenXh60witDZTh39ty79uAoGYpwRb
 eRfjNRh+/lWMPWzAgv4+ok+H44uqErr3AEVV/HhuAaf7LXCvDnQL49gm57XYfk6/Di6z
 oWAizxdUnODXjl5x2lBjErnyJf5IIqhu4F2/Dix9ogSjMxMtFzmo9od6nHKY5tnUHP7t
 ceqEm7yiuO3ZDtff6KW7IQ7yjX6GoTb+7aL0CgZe/Gsu6eK+vKFka26ptUpBJlrwRtut
 ZeENMVAhC8kwylOOSUxYqpRVW2iogfuxH/SSFypAT+pxrGtU131eVFQPgI7cFXtmy3pv
 ngSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0o71yZM48xmdkgulmkjhA/zr2BdMCKzNumCkAP5DxC4=;
 b=oIAkqlAr8h7vg840a04A5MXteBxEI07Ue5KdJPhD1XYl6sqR0hcnvn28/D/6f/WkAG
 JeL3TjF05GWvfxdzlK41XdvCSer0KU/BoF+NAvC/hrJEptQNJBgMg56jHhI3qrB2ttWg
 z/0JP2UJCNxO0IKCZApIG6/WLt79H30wNSHBQWK/oFS/EG0dR5molX0TAL/79t2TPSij
 8KpHXtkbmq4PIo8Jn1bdXH9FXk8Knr/Dp5CwaOLGNnfP3qQ2TDk/VuMsmQcIwz0KLU8S
 g1P9gKdWwRfr+WpVxjYitc3+GRVQvRzZHCk1EKIwXG/uCmU5DWphPDIr2yeN4MKIm03f
 gTSw==
X-Gm-Message-State: AOAM530Pss/bp3X+MVe75taJw4JCtSvtTih0nDl0AV3l8ugb/bxzhJm0
 zUvXlhmXg2kQmgEPi67kjD/sVw==
X-Google-Smtp-Source: ABdhPJxahmFiqPtp3DzRN1iNx+PMyU0Q/DS4WdeT7SbAiczvMm80fKl6TYd0Y67uDUMD16Gy5qpt7w==
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr4740443ejc.286.1651344661657; 
 Sat, 30 Apr 2022 11:51:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ee47-20020a056402292f00b0041d893ed437sm4693182edb.2.2022.04.30.11.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:51:01 -0700 (PDT)
Message-ID: <e0676749-54c7-948c-c0f7-9dbc0e9b9c0b@mind.be>
Date: Sat, 30 Apr 2022 20:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220428221727.1680234-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428221727.1680234-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/3] package/pkg-python: deduplicate
 common env/opts variables
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/04/2022 00:17, James Hilliard wrote:
> There are many varibles shared via setuptools, distutils and pep517,
> combine those common env/opts variables to make them easier to
> maintain.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - restore accidentially dropped LDSHARED in distutils env
> ---
>   package/pkg-python.mk | 96 +++++++++++++++++++------------------------
>   1 file changed, 43 insertions(+), 53 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index e9de5cb8d3..b86e12423f 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -33,78 +33,77 @@ PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
>   PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
>   PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
>   
> -# Target distutils-based packages
> -PKG_PYTHON_DISTUTILS_ENV = \
> +# Target python packages
> +PKG_PYTHON_ENV = \
> +	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> +	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
> +	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>   	PATH=$(BR_PATH) \
>   	$(TARGET_CONFIGURE_OPTS) \
> -	LDSHARED="$(TARGET_CROSS)gcc -shared" \
>   	PYTHONPATH="$(PYTHON3_PATH)" \
>   	PYTHONNOUSERSITE=1 \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib \
> -	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> -	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
> -	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>   	_python_sysroot=$(STAGING_DIR) \
>   	_python_prefix=/usr \
>   	_python_exec_prefix=/usr
>   
> +# Host python packages
> +HOST_PKG_PYTHON_ENV = \
> +	PATH=$(BR_PATH) \
> +	PYTHONNOUSERSITE=1 \
> +	$(HOST_CONFIGURE_OPTS)
> +
> +# Target distutils-based packages
> +PKG_PYTHON_DISTUTILS_ENV = \
> +	$(PKG_PYTHON_ENV) \
> +	LDSHARED="$(TARGET_CROSS)gcc -shared" \
> +	SETUPTOOLS_USE_DISTUTILS=stdlib \
> +
>   PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
>   	--executable=/usr/bin/python
>   
> -PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
> +PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>   	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--prefix=/usr \
> +	--prefix=/usr
> +
> +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
> +	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
>   	--root=$(TARGET_DIR)
>   
>   PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
> -	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--prefix=/usr \
> +	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
>   	--root=$(STAGING_DIR)
>   
>   # Host distutils-based packages
>   HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -	PATH=$(BR_PATH) \
> -	PYTHONNOUSERSITE=1 \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib \
> -	$(HOST_CONFIGURE_OPTS)
> +	$(HOST_PKG_PYTHON_ENV) \
> +	SETUPTOOLS_USE_DISTUTILS=stdlib
>   
>   HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>   	--prefix=$(HOST_DIR)
>   
>   # Target setuptools-based packages
>   PKG_PYTHON_SETUPTOOLS_ENV = \
> -	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> -	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
> -	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
> -	PATH=$(BR_PATH) \
> -	$(TARGET_CONFIGURE_OPTS) \
> -	PYTHONPATH="$(PYTHON3_PATH)" \
> -	PYTHONNOUSERSITE=1 \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib \
> -	_python_sysroot=$(STAGING_DIR) \
> -	_python_prefix=/usr \
> -	_python_exec_prefix=/usr
> +	$(PKG_PYTHON_ENV) \
> +	SETUPTOOLS_USE_DISTUTILS=stdlib
>   
> -PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
> +PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
>   	--executable=/usr/bin/python \
> -	--single-version-externally-managed \
> +	--single-version-externally-managed
> +
> +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
> +	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
>   	--root=$(TARGET_DIR)
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
> -	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--prefix=/usr \
> -	--executable=/usr/bin/python \
> -	--single-version-externally-managed \
> +	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
>   	--root=$(STAGING_DIR)
>   
>   # Host setuptools-based packages
>   HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	PATH=$(BR_PATH) \
> -	PYTHONNOUSERSITE=1 \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib \
> -	$(HOST_CONFIGURE_OPTS)
> +	$(HOST_PKG_PYTHON_ENV) \
> +	SETUPTOOLS_USE_DISTUTILS=stdlib
>   
>   HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--prefix=$(HOST_DIR) \
> @@ -113,28 +112,21 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   
>   # Target pep517-based packages
>   PKG_PYTHON_PEP517_ENV = \
> -	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> -	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
> -	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
> -	PATH=$(BR_PATH) \
> -	$(TARGET_CONFIGURE_OPTS) \
> -	PYTHONPATH="$(PYTHON3_PATH)" \
> -	PYTHONNOUSERSITE=1 \
> -	_python_sysroot=$(STAGING_DIR) \
> -	_python_prefix=/usr \
> -	_python_exec_prefix=/usr
> +	$(PKG_PYTHON_ENV)
>   
> -PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
> +PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   	--interpreter=/usr/bin/python \
> -	--script-kind=posix \
> +	--script-kind=posix
> +
> +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
>   	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--scripts=$(TARGET_DIR)/usr/bin \
>   	--data=$(TARGET_DIR)/usr
>   
>   PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
> -	--interpreter=/usr/bin/python \
> -	--script-kind=posix \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
>   	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--scripts=$(STAGING_DIR)/usr/bin \
> @@ -142,9 +134,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>   
>   # Host pep517-based packages
>   HOST_PKG_PYTHON_PEP517_ENV = \
> -	PATH=$(BR_PATH) \
> -	PYTHONNOUSERSITE=1 \
> -	$(HOST_CONFIGURE_OPTS)
> +	$(HOST_PKG_PYTHON_ENV)
>   
>   HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
>   	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
