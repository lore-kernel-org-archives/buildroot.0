Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EA5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C550C40306;
	Thu, 24 Mar 2022 20:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOuljjIg5yu9; Thu, 24 Mar 2022 20:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C033402C6;
	Thu, 24 Mar 2022 20:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 714BE1BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562F384487
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpe70R5HffB5 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC9CE84485
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:38:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b15so6989969edn.4
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tF+3D/WqzPJn+uzwIFvb7VS48+w1rU7W3lFXUBPF8/s=;
 b=ILlAHvpJIDwEGbhR1VW9+kQ5hpvpmZVzNHM9I6wueLYuLF69FR8Qwc8qbgKSXH6YBl
 nan/VFe4ByGA3wl8SiFU86EC0V7RdFtQDGz8xDZHxI9qp7MBJSh7x2Fs/0doYutrzRX7
 H0ik1HeFBL5ljxd1uEhTTOiRWAAMc9kMMIf7rbhSA8lcUQnmoBv3b7TwxSSqvvIdCHC5
 AcZn5qp6qTjmxCJmhfn0CtuJm8JkNaN/3uxsr6uAg72ecqkZgCpO+54SPgYpCrVgqUd/
 HTr6N1t66qJTeW6b05IaSTMWKf3oIr0ybvge0niE/R4jpXkXM+cAWDPakhA3fb9ECEt3
 IvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tF+3D/WqzPJn+uzwIFvb7VS48+w1rU7W3lFXUBPF8/s=;
 b=eaeqoNPvR6LEb9m6c3+NSYyHFVC/rPM6QOO4y4hkDuh4Tp+I32kMwY/jFWyXAbgOOp
 W3YtxOCHxPRAEQckepefIa40nFQqwUrulyVlJlgn1IAUZnngLfhwe74FXVmQJZ5p5sFy
 Md9Z6DBsedi7bTSVSVfo8oxLAwdg1MXuTWDjQboq1ZlfPcXuLuuALRSAPhTAPcbt4hXY
 uxMGDKpjLKUSY9MxIuZ6UL+vIg0M3FZRFn/3/KizltC/15zc8Eim+eMUIIxoXuTshAyN
 9pEA8rJiJn2X+HNpXELjj4byh6rTX+FrNvTw13nXz1Zee1NUCwQorsLbeKAbWEH1ZCHX
 qtaw==
X-Gm-Message-State: AOAM532QAyR8TNfQRb0nhlhG8R/J1CnI7WYv3wjFx2iYZwu+YNhObRDb
 g4FTJw3+sGDt2qcMBUzqRgsO7w==
X-Google-Smtp-Source: ABdhPJx1fgvUFjuZvGmqs4t8LGpwNcsIuhT1aU6JMOySodQnHxvC0BU6k1uQQJa2W2XToELbAAB4GQ==
X-Received: by 2002:aa7:c683:0:b0:418:f5f3:9684 with SMTP id
 n3-20020aa7c683000000b00418f5f39684mr8898314edq.184.1648154283726; 
 Thu, 24 Mar 2022 13:38:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7dc42000000b00418ef55eabcsm1896132edu.83.2022.03.24.13.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:38:03 -0700 (PDT)
Message-ID: <5313758f-f64d-f9f8-cdf2-3ca2ab426c7e@mind.be>
Date: Thu, 24 Mar 2022 21:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220313175615.406390-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313175615.406390-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: migrate flit to
 new bootstrapping sequence
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 18:56, James Hilliard wrote:
> There are a number of flit toolchain dependencies currently in the
> process of deprecating distutils based fallbacks.
> 
> This will be needed in order to update tomli.
> 
> We need to migrate these to use a new bootstrap based build+install
> sequence which relies on flit's bootstrap wheel build+install
> features to build and install host-python-pypa-build and
> host-python-installer which gives us a full pep517 toolchain.
> 
> Note that one can run host-python-flit-core commands for building
> and installing itself since the package build directory is the cwd.
> 
> For host-python-installer to do this we need to add the package src
> directory to PYTHONPATH as we need to run it from the source directory
> for installing itself. This is due to a directory structure that does
> not let us run directly from the top level.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - formatting/cleanup
>    - add comments
> ---
>   package/pkg-python.mk                        | 45 ++++++++++++++++++--
>   package/python-flit-core/python-flit-core.mk |  2 +-
>   package/python-installer/python-installer.mk |  3 +-
>   package/python-pep517/python-pep517.mk       |  2 +-
>   package/python-tomli/python-tomli.mk         |  2 +-
>   5 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..f08d8ce04c 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -154,6 +154,9 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   	--scripts=$(HOST_DIR)/usr/bin \
>   	--data=$(HOST_DIR)/usr
>   
> +HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
> +	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> +
>   ################################################################################
>   # inner-python-package -- defines how the configuration, compilation
>   # and installation of a Python package should be done, implements a
> @@ -211,8 +214,25 @@ $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $
>   $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
>   else
>   $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
> -$(2)_BASE_BUILD_CMD = -m build -n -w
> -$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
> +# Use flit built in wheel builder for packages that are host-python-pypa-build dependencies.
> +# This is needed to avoid a circular with host-python-pypa-build and those dependencies.
> +#
> +$(2)_BASE_BUILD_CMD = $$(if \
> +		$$(filter \
> +			host-python-flit-core host-python-installer host-python-pep517 host-python-tomli, \
> +			$(1)) \
> +		, \
> +		-m flit_core.wheel, \
> +		-m build -n -w \

  This is adding way too much complexity to the infra just to support these four 
packages. I think there a a couple of better options:

- don't use python infra at all for these packages; or
- set HOST_PYTHON_FLIT_CORE_BUILD_CMDS etc. in python-flit-core.mk; or
- add a fifth SETUP_TYPE "generic" or "custom" or something, which requires 
$(2)_BASE_* to be set by the python-flit-core.mk;
- in the infra change it to $(2)_BASE_BUILD_CMD ?=, set 
HOST_PYTHON_FLIT_CORE_BASE_BUILD_CMD in python-flit-core.mk; or
- add a fifth SETUP_TYPE "flit-bootstrap" or something like that which only gets 
used by the problematic packages.


  The latter two options have my preference because I think they are the 
cleanest, but any of them is OK for me. The "generic" setup type and the 
overridable _BASE_BUILD_CMD would also require an update in the manual.


> +	)
> +# Use flit built in bootstrap_install for installing host-python-flit-core.
> +# This is due to host-python-installer depending on host-python-flit-core.
> +#
> +$(2)_BASE_INSTALL_CMD = $$(if \
> +		$$(filter host-python-flit-core,$(1)), \
> +		-m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS), \
> +		$(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS) \
> +	)
>   endif
>   else
>   $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> @@ -235,9 +255,26 @@ endif # ($(4),target)
>   ifeq ($$($(2)_SETUP_TYPE),setuptools)
>   $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
>   else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> +# Filter out host-python-pypa-build and any of its dependencies that need a flit based build.
> +#
> +$(2)_DEPENDENCIES += $$(if \
> +		$$(filter \
> +			host-python-flit-core host-python-installer host-python-pep517 host-python-pypa-build host-python-tomli, \
> +			$(1)) \
> +		,, \
> +		host-python-pypa-build \

  With the "generic" or "flit-bootstrap" setup types, this would no longer be 
needed. For the other solutions, we will indeed still need this ugly thing.

> +	)
> +# Filter out host-python-installer and any of its dependencies that need a flit based build.
> +#
> +$(2)_DEPENDENCIES += $$(if \
> +		$$(filter \
> +			host-python-flit-core host-python-installer, \
> +			$(1)) \
> +		,, \
> +		host-python-installer \
> +	)
>   ifeq ($$($(2)_SETUP_TYPE),flit)
> -$(2)_DEPENDENCIES += host-python-flit-core
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
>   endif
>   endif # SETUP_TYPE
>   
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index 0e058a1f17..d206a72f82 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
>   PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
>   PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
>   PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
> -PYTHON_FLIT_CORE_SETUP_TYPE = pep517
> +PYTHON_FLIT_CORE_SETUP_TYPE = flit

  This means there's no package any more that uses pep517 setup type. Do you 
think it's ever going to be used again? Or can we remove it altogether?

  (Removing it is not urgent at all even if it's unused. But if it's really not 
likely to be used again, I'd prefer to get rid of it by 2022.05.)

>   
>   $(eval $(host-python-package))
> diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
> index 862a251415..97a158b738 100644
> --- a/package/python-installer/python-installer.mk
> +++ b/package/python-installer/python-installer.mk
> @@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
>   PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
>   PYTHON_INSTALLER_LICENSE = MIT
>   PYTHON_INSTALLER_LICENSE_FILES = LICENSE
> -PYTHON_INSTALLER_SETUP_TYPE = distutils
> +PYTHON_INSTALLER_SETUP_TYPE = flit
> +HOST_PYTHON_INSTALLER_ENV = PYTHONPATH=$(@D)/src

  You said that all these packages have to be converted in a single patch, but 
that's not true: it's perfectly possible to change the infra and keep using 
distutils for this package. The infra changes don't affect distutils setup type 
at all. Only the change in flit-core really needs to be in the same patch.


  BTW, when someone reviews a patch (i.e. Yann), it's nice to put them in Cc of 
later iterations.

  Regards,
  Arnout


>   
>   $(eval $(host-python-package))
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> index 99aa62d51d..1ca1bc4e35 100644
> --- a/package/python-pep517/python-pep517.mk
> +++ b/package/python-pep517/python-pep517.mk
> @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
>   PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
>   PYTHON_PEP517_LICENSE = MIT
>   PYTHON_PEP517_LICENSE_FILES = LICENSE
> -PYTHON_PEP517_SETUP_TYPE = distutils
> +PYTHON_PEP517_SETUP_TYPE = flit
>   HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
>   
>   $(eval $(host-python-package))
> diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> index b8c20ca736..3539a505be 100644
> --- a/package/python-tomli/python-tomli.mk
> +++ b/package/python-tomli/python-tomli.mk
> @@ -7,7 +7,7 @@
>   PYTHON_TOMLI_VERSION = 1.2.0
>   PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
>   PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> -PYTHON_TOMLI_SETUP_TYPE = distutils
> +PYTHON_TOMLI_SETUP_TYPE = flit
>   PYTHON_TOMLI_LICENSE = MIT
>   PYTHON_TOMLI_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
