Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E4DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 16:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D92F812A9;
	Sun, 13 Mar 2022 16:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_lTYo5oLn7z; Sun, 13 Mar 2022 16:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0AA81801;
	Sun, 13 Mar 2022 16:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8893E1BF300
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8476B81801
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c53Jk1dcehI8 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 16:21:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5851817F2
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 16:21:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D01D6780310;
 Sun, 13 Mar 2022 17:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647188497;
 bh=yVCefUSWeOj4qB9hUvIQ/LeuTmim0Y10PXnXHDR0egg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHs+2VSYY9Wto4vuev2qxotPodJxeWG3hXKeHCDbNokTWWj/d+vhHSBzq0v5TbzXX
 yvOe8Y5rJD5m8xjbIbKIitgNoLQlNUC6n9sLr5ZHzEYIY04IwsM7mltW0ujYK9CGAM
 8lazEXQYRmh6gu7VmmIISi61//9HK3uWGO4WrpLpce2Bqm+fb3xoU5QM7kHi3HxWOm
 51TG6Rh+AGyl2Zj7mzDDWrEL4KJ9AEhSCWjWwjxMPbM3Cm8DfBEwSp5UZI3xhbOaxC
 XiOcvU/3ORUwH5EwMuNmkEVYycItd4bEQeGurDiaU2ih7mbj6S/+u891z58BFf9AIQ
 X4HRvnASQYF8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 17:21:32 +0100
Date: Sun, 13 Mar 2022 17:21:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220313162132.GT283544@scaer>
References: <20220313122112.261290-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313122112.261290-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-python: migrate flit to new
 bootstrapping sequence
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
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-03-13 06:21 -0600, James Hilliard spake thusly:
> There are a number of flit toolchain dependencies currently in the
> process of deprecating distutils based fallbacks.
> 
> This will be needed in order to update tomli.
> 
> We need to migrate these to use a new bootstrap based build+install
> sequence which relies on flit's bootstrap wheel build+install
> features to build and install host-python-pypa-build and
> host-python-installer which gives us a full pep517 toolchain.

Would it be possible to split this change into separate patches:

  - introduce the new support,
  - migrate patches one by one
  - drop the leftovers of no longer needed stuff

Also, see below...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..6dee8aa7d1 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
[--SNIP--]
> @@ -212,7 +215,16 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
>  else
>  $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
>  $(2)_BASE_BUILD_CMD = -m build -n -w

So this assignment to $(2)_BASE_BUILD_CMD...

> -$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
> +$(2)_BASE_BUILD_CMD = $$(if $$(filter \

... is completely overriden here...

> +	host-python-flit-core \
> +	host-python-installer \
> +	host-python-pep517 \
> +	host-python-tomli,$(1)),\
> +	-m flit_core.wheel,\
> +	-m build -n -w)
> +$(2)_BASE_INSTALL_CMD = $$(if $$(filter host-python-flit-core,$(1)),\
> +	-m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS),\
> +	$(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS))
>  endif
>  else
>  $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
> @@ -235,9 +247,19 @@ endif # ($(4),target)
>  ifeq ($$($(2)_SETUP_TYPE),setuptools)
>  $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
>  else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> +$(2)_DEPENDENCIES += $$(if $$(filter \
> +	host-python-flit-core \
> +	host-python-installer \
> +	host-python-pep517 \
> +	host-python-pypa-build \
> +	host-python-tomli,$(1)),,\
> +	host-python-pypa-build)

This is totally unreadable. One can't easily spot what is filtered from
what...

    $(2)_DEPENDENCIES += $$(if \
        $$(filter \
            host-python-flit-core host-python-installer host-python-pep517 host-python-pypa-build host-python-tomli, \
            $(1)) \
        , \
        host-python-pypa-build
    )

So, what this is saying, as I can understand, is that if the current
package is one of the list;
    host-python-flit-core host-python-installer host-python-pep517
    host-python-pypa-build host-python-tomli

then we want to add host-python-pypa-build to their dependency.

However, from what I understand, all those packages really are packages
that implement the 'flit' and pep517 now?) infrastructure, and thus the
dependency should be explicitly listed in those packages, rather than
implcitly added by the infra.

> +$(2)_DEPENDENCIES += $$(if $$(filter \

Why use an other assignment to the same variable? It could be a single
assignment...

> +	host-python-flit-core \
> +	host-python-installer,$(1)),,\
> +	host-python-installer)

Ditto, this should be explictly added to the packages.

>  ifeq ($$($(2)_SETUP_TYPE),flit)
> -$(2)_DEPENDENCIES += host-python-flit-core
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)

I don't understand how this is going to work. The dependency exclusion
here is correct, indeed, I am not questionning that.

However, I don't understand how host-python-flit-core can use the flit
type at build time, when it is not already installed, especially since
host-python-flit-core does not define any custom configure/build/install
commands...

You will have to add a blurb in the commit log to explain how it
works...

>  endif
>  endif # SETUP_TYPE
>  
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index 0e058a1f17..d206a72f82 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
>  PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
>  PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
>  PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
> -PYTHON_FLIT_CORE_SETUP_TYPE = pep517
> +PYTHON_FLIT_CORE_SETUP_TYPE = flit

Yup, see my comment above, about the corresponding change in the infra.

>  $(eval $(host-python-package))
> diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
> index 862a251415..97a158b738 100644
> --- a/package/python-installer/python-installer.mk
> +++ b/package/python-installer/python-installer.mk
> @@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
>  PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
>  PYTHON_INSTALLER_LICENSE = MIT
>  PYTHON_INSTALLER_LICENSE_FILES = LICENSE
> -PYTHON_INSTALLER_SETUP_TYPE = distutils
> +PYTHON_INSTALLER_SETUP_TYPE = flit
> +HOST_PYTHON_INSTALLER_ENV = PYTHONPATH=$(@D)/src

Why do we need to provide this here? Can't that be made generic be using
something like HOST_PYTHON_INSTALLER_SUBDIR=src ?

python-package already uses $(2)_BUILDDIR, which by default is the same
as $(2)_SRCDIR, which by default is (basically) $(@D)/$(2)_SUBDIR, so it
should jsut work automatically, no?

Regards,
Yann E. MORIN.

>  $(eval $(host-python-package))
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> index 99aa62d51d..1ca1bc4e35 100644
> --- a/package/python-pep517/python-pep517.mk
> +++ b/package/python-pep517/python-pep517.mk
> @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
>  PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
>  PYTHON_PEP517_LICENSE = MIT
>  PYTHON_PEP517_LICENSE_FILES = LICENSE
> -PYTHON_PEP517_SETUP_TYPE = distutils
> +PYTHON_PEP517_SETUP_TYPE = flit
>  HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
>  
>  $(eval $(host-python-package))
> diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
> index b8c20ca736..3539a505be 100644
> --- a/package/python-tomli/python-tomli.mk
> +++ b/package/python-tomli/python-tomli.mk
> @@ -7,7 +7,7 @@
>  PYTHON_TOMLI_VERSION = 1.2.0
>  PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
>  PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
> -PYTHON_TOMLI_SETUP_TYPE = distutils
> +PYTHON_TOMLI_SETUP_TYPE = flit
>  PYTHON_TOMLI_LICENSE = MIT
>  PYTHON_TOMLI_LICENSE_FILES = LICENSE
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
