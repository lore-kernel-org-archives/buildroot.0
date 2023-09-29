Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00ECE728EA
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D338834BB;
	Fri, 29 Sep 2023 20:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D338834BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wp8jHxAI4FOt; Fri, 29 Sep 2023 20:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9EF83E15;
	Fri, 29 Sep 2023 20:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9EF83E15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD07A1BF358
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5DC483139
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5DC483139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdWhR-bCz2Ds for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31E5D83C80
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31E5D83C80
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso116263815e9.3
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 13:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696017903; x=1696622703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jVbCxLk8ImTRn/095crWig+BotshA7RtUtAKY2I/0D8=;
 b=DOfq6j3pcgMXrJzwZ5v81I8iz6VmG04xX1+S22pxY7dXR5rQ/Tok383N8repkARxpM
 0trQe1RTkQZbzF4E70dZSo+6b5f1Rxie/3ELylv1AJVFoH8qsxMxb7/h9qj1skrg4iV6
 YsfgGR/dw0v/N+FOBH6+hI2OHCdFQ3CqJHjk/g9vZwkZY0JZuDDGClPdDK1qMxVR0AMP
 75c3OBAMEIk4MyzkE2z4nswesijQtIxrh2OW+1o6Z32qp+aYW8Pfjq29+PqjTltfXb/u
 7iq9ks+bE6ndU11FpThrgBcuAEhc+uTKZo+687SmBdN+Hekh5B6D75210w422T2c3dPn
 /Dvg==
X-Gm-Message-State: AOJu0Yx4bM6WH2guTDfzV2Xdc7RaYXmkH5eret0tyctNoT2kyL96QW29
 LwMs12K4cd8hF5up7ntwEYjhTg==
X-Google-Smtp-Source: AGHT+IEAsnk6ZlgpCB2zz70BrcdQiI1nRdO4LabYacWII8bYzApNDZnHI9rot9EPHaw4gNwLPoQ1Gg==
X-Received: by 2002:a05:600c:420b:b0:406:5359:9311 with SMTP id
 x11-20020a05600c420b00b0040653599311mr4542481wmh.0.1696017902628; 
 Fri, 29 Sep 2023 13:05:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b00405d9a950a2sm1715289wmq.28.2023.09.29.13.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 13:05:02 -0700 (PDT)
Message-ID: <5203737b-4f66-2515-ba80-c61344ad5ac5@mind.be>
Date: Fri, 29 Sep 2023 22:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220807003832.1177015-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20220807003832.1177015-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696017903; x=1696622703; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jVbCxLk8ImTRn/095crWig+BotshA7RtUtAKY2I/0D8=;
 b=Bxen+7+jEzkoC2LZgemzvTLf/RiUNUHUBaqm3PZBvHCAO+z3Uut2sOe/K++btryBOg
 6hq+VJh3SMZ9IkDwVvtcuWA4rRXXuou0e+O1GeAiNS7r+KwW+iS5k1uQjQaKHIKIoDZ8
 Q4SlgrshBL635Lzu5mZw1lawUqbMGfrHFcWZzp7DRera07ZS3z1librM89E0M2QYpVsz
 9BFRiU8kibcr/mb/OI9jzsJtDcCsZDRUpghCVDO5qRdL3H32zwONtEkcrGEQL/7W3bCe
 vLjrY+3MtYGjiANvmvd+C8HKt7LFEUC4cO3vmF/8Rx0nuNXnoaXCO6m4jvzS1JDCsEVA
 xY7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bxen+7+j
Subject: Re: [Buildroot] [PATCH v4 1/5] package/pkg-python: add
 pyo3(setuptools-rust/maturin) infrastructure
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/08/2022 02:38, James Hilliard wrote:
> The pyo3 package infrastructure provides two build backends, one
> of which is based on setuptools while the other is a pep517 backend.
> 
> The setuptools-rust build backend is a setuptools extension that is
> capable of building python rust extensions.
> 
> The maturin build backend is a pep517 build extension that is itself
> written in rust, it is itself bootstrapped using setuptools-rust but
> is not itself a setuptools extension and uses pep517 infrastructure.
> 
> As both backends use pyo3 we need to set up the pyo3 environment in
> addition to cargo vendoring for each.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Series _finally_ applied to master, thanks!

> ---
> Changes v3 -> v4:
>    - generalize infrastructure to support both pyo3 build backends
> ---
>   package/pkg-python.mk | 92 ++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 87 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 5794e3a195..0dcd2622c5 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -113,6 +113,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--root=/ \
>   	--single-version-externally-managed
>   
> +PKG_PYTHON_PYO3_ENV = \
> +	$(PKG_CARGO_ENV) \
> +	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"

  This _PYO3_ENV variables aren't contributing much and make the code even more 
difficult to read, so I removed them.

> +
> +HOST_PKG_PYTHON_PYO3_ENV = \
> +	$(HOST_PKG_CARGO_ENV) \
> +	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +# Target setuptools-rust-based packages
> +PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> +	$(PKG_PYTHON_SETUPTOOLS_ENV) \
> +	$(PKG_PYTHON_PYO3_ENV)
> +
> +# Host setuptools-rust-based packages
> +HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> +	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> +	$(HOST_PKG_PYTHON_PYO3_ENV)
> +
>   # Target pep517-based packages
>   PKG_PYTHON_PEP517_ENV = \
>   	$(PKG_PYTHON_ENV)
> @@ -142,6 +160,16 @@ HOST_PKG_PYTHON_PEP517_ENV = \
>   HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
>   	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
>   
> +# Target maturin packages
> +PKG_PYTHON_MATURIN_ENV = \
> +	$(PKG_PYTHON_PEP517_ENV) \
> +	$(PKG_PYTHON_PYO3_ENV)
> +
> +# Host maturin packages
> +HOST_PKG_PYTHON_MATURIN_ENV = \
> +	$(HOST_PKG_PYTHON_PEP517_ENV) \
> +	$(HOST_PKG_PYTHON_PYO3_ENV)
> +
>   ################################################################################
>   # inner-python-package -- defines how the configuration, compilation
>   # and installation of a Python package should be done, implements a
> @@ -180,25 +208,41 @@ $(2)_BASE_BUILD_CMD   = setup.py build
>   $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
>   endif
>   # Setuptools
> -else ifeq ($$($(2)_SETUP_TYPE),setuptools)
> +else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)

  This stuff is becoming increasingly difficult to read with all the different 
setup types. I'm going to try to refactor it a little.


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
