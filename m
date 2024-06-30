Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6634CC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21916811AA;
	Sun, 30 Jun 2024 14:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3G7X4_A5rxN; Sun, 30 Jun 2024 14:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 235FF81396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 235FF81396;
	Sun, 30 Jun 2024 14:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384701BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233ED81368
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pNAD8pZgKUy for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB73D811AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB73D811AA
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB73D811AA
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:52:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-363826fbcdeso1345873f8f.0
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719759145; x=1720363945;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypX9laJ5OYMrql7bvrMnrZHkeFSBrgggBEfoMF09NSg=;
 b=xVOtKBMRQnjxeZAW7ej9hghH+G1Mtuxik6jANBk5TFc24ONnpSq8vhz3w1B4PQ9Qo1
 kRUIj10zcfWhmG/98opV0sXvpWlaVqfQtAqq8kQ1M2vDteA8OTkWBv1eH/GkkuRBtdib
 3ouvalJ/7+gfirCgefWt4T3MUIARnN69/e1V9kCRmORAb6Wi4lyd1EkwgH/TsAvyhMXo
 5vFFSjewYc4skTDBoofjRux91xb9OcXbEDdhiaVnl1eXslGFK8xVYIQa5YG3kyOV6jm2
 5gRSLeNA2TIdabCTZmFjlITBj+PDqVhL3QWFXeUjtLWeeoeYRphX3jS0v6oGLZ/EhKfH
 6eBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMr4hWdC2JBnMSJ0Rt1B1nqA/gizUYnLphdrJJSrryEEW4OMitPxvcYGKMoW2dOwbTQhELPSkgAJ6yQDnebc4boLRtAEs8iQ==
X-Gm-Message-State: AOJu0Yw+a5HeZVkPNgG5YlcHLwfOXA1F6tvo5isdl64Xu8W79N6rvk4O
 3X+S89Q0gKGKo6S96/PdX2fKVeRP39BpdnZcin67Bhw5dcY75AqdyQTZNVrsrbA=
X-Google-Smtp-Source: AGHT+IEyDXauH9R1y84txEN6Oym/ZrsY5VZZg9GxzcAy1/1sxqOkf4Bg7IPMBZCtqKWQ5i2M0pmjvw==
X-Received: by 2002:a05:6000:128d:b0:366:e982:8b8d with SMTP id
 ffacd0b85a97d-36775699f59mr2269768f8f.11.1719759144749; 
 Sun, 30 Jun 2024 07:52:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a103e44sm7590025f8f.107.2024.06.30.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:52:24 -0700 (PDT)
Message-ID: <e710e75e-ddca-4d8f-8b62-2cbb2bdb78ed@mind.be>
Date: Sun, 30 Jun 2024 16:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240629125521.976475-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20240629125521.976475-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719759145; x=1720363945; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ypX9laJ5OYMrql7bvrMnrZHkeFSBrgggBEfoMF09NSg=;
 b=TKH0QvMrLFy9tWXDtf0wBKex4pnVanNszM9ZEFlJkpvn3ozoVdd/pu+lgb+khd4K7d
 +7lr6ybpvOGv31S9KBM/gZjgGxbrEtL8FBHFOPdA5MEGyBSJwl9CaDk1ptaoK7eOMj0F
 GIVXhKltuLqAjdVMFOJV/pjE/2Z1JCn8Uu7mx53iMjF6gsWsepRbxnokHxWSm6RmCnO2
 f7gz0jLf/smRT6wcHE6zo7O/8pSTMiAZCXG6Yrv3l59SjuSo5kKNpHrHrGgCd7Gl1ImL
 Lut90v8VmnJ70fFMFHMjiOsn5GS6eG3b/zDa9HshSnrrCsqUg9SQ4YQjDVSvTXOnYaRB
 fiyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TKH0QvMr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docker: bump version to
 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2024 14:55, Fiona Klute via buildroot wrote:
> Important upstream changes:
> 
> * Support for Python 3.12 has been added (in 7.0.0).
> 
> * Websocket support is no longer included by default, and thus the
>    dependency on "websocket-client" (since 7.0.0).
> 
> * Build has been switched to hatchling and hatch-vcs (in 7.1.0), so
>    Buildroot needs to use pep517 build.
> 
> * Dependency on "packaging" has been removed (in 7.1.0).
> 
> Upstream changelogs:
> https://github.com/docker/docker-py/releases/tag/7.0.0
> https://github.com/docker/docker-py/releases/tag/7.1.0
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

  Applied to master, thanks. Somewhere along the mail path, the +wiwa part got 
stripped from the Author tag, so I fixed that.

  Regards,
  Arnout

> ---
> I've gone along with upstream here on removing the websocket
> support. If it's desirable to keep in Buildroot please let me know how
> to enable an optional Python package feature in the build system and
> I'll update the patch.
> 
>   package/python-docker/Config.in          | 2 --
>   package/python-docker/python-docker.hash | 4 ++--
>   package/python-docker/python-docker.mk   | 8 ++++----
>   3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
> index 944992f251..669b9e3433 100644
> --- a/package/python-docker/Config.in
> +++ b/package/python-docker/Config.in
> @@ -2,10 +2,8 @@ config BR2_PACKAGE_PYTHON_DOCKER
>   	bool "python-docker"
>   	# docker-engine may be running on another host, so no other dependency
>   	select BR2_PACKAGE_PYTHON3_SSL # runtime
> -	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
>   	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
>   	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
> -	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
>   	help
>   	  A Python library for the Docker Engine API.
> 
> diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
> index 8e561e93a7..c8f8e7501a 100644
> --- a/package/python-docker/python-docker.hash
> +++ b/package/python-docker/python-docker.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/docker/json
> -md5  c319e75054a226776f32797e56ec82da  docker-6.1.3.tar.gz
> -sha256  aa6d17830045ba5ef0168d5eaa34d37beeb113948c413affe1d5991fc11f9a20  docker-6.1.3.tar.gz
> +md5  04e92a7b6dc8b88dde3c7cca6850b277  docker-7.1.0.tar.gz
> +sha256  ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c  docker-7.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
> diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
> index ab03ac6af0..55ba405f7c 100644
> --- a/package/python-docker/python-docker.mk
> +++ b/package/python-docker/python-docker.mk
> @@ -4,14 +4,14 @@
>   #
>   ################################################################################
> 
> -PYTHON_DOCKER_VERSION = 6.1.3
> +PYTHON_DOCKER_VERSION = 7.1.0
>   PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
> -PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/f0/73/f7c9a14e88e769f38cb7fb45aa88dfd795faa8e18aea11bababf6e068d5e
> -PYTHON_DOCKER_SETUP_TYPE = setuptools
> +PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
> +PYTHON_DOCKER_SETUP_TYPE = pep517
>   PYTHON_DOCKER_LICENSE = Apache-2.0
>   PYTHON_DOCKER_LICENSE_FILES = LICENSE
>   PYTHON_DOCKER_CPE_ID_VENDOR = docker
>   PYTHON_DOCKER_CPE_ID_PRODUCT = docker-py
> -PYTHON_DOCKER_DEPENDENCIES = host-python-setuptools-scm
> +PYTHON_DOCKER_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
> 
>   $(eval $(python-package))
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
