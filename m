Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D957C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435AB60F38
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 435AB60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E170F60755;
	Tue, 12 Oct 2021 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1RZa_V2uCcD; Tue, 12 Oct 2021 20:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CCF607F6;
	Tue, 12 Oct 2021 20:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 577D71BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B4E406F8
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1CMwYAosbSa for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE70F406F1
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:07:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p13so1045306edw.0
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nLfU+ZQl5ahi9+gv8hp8bYjjprRK/ZOPKc2MhFz9TCc=;
 b=etTBO/yVNp5ZDULh4VArrNH86M2m5zwfO1BcN1fqbDHG0ZiClaxd1+qwHqQ2JNIiBJ
 1I1FCn1X0pN21KkCqD8afJ513FojLI2THPNrS2F6QXxQnTfwfz2YL2FCKShvVqYnbi/y
 LBBK24friqMD3eZy2bAgEoL4F9uX0HPeHnERN/0j+Kw5IOuQQdzjoI+7SiZyfVgL1rLQ
 YWtDepSge+LhNyaPY2/Hs8OmTht4VVxKPehmoPsWkYCvU9ACLLyLOw9q8K3N5pFoawNH
 LoMFEMtvINPevqVS/K7eDHkgRMoxl8U+obb3R96zcxMipzps74FYp2WThvWELEp20nw2
 tfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nLfU+ZQl5ahi9+gv8hp8bYjjprRK/ZOPKc2MhFz9TCc=;
 b=gvmid9XEKudcOvGXmiUIfk5vEEuSkB6SLpWUslxxi5b9rgsE44n3GGQ8T0KPfkSZVB
 2GXjzcoKXzNoacczZb5ug2g8VBgABsQcmnJSzm0F5hoOyPICu12hlhtexfR5BsGLveJU
 tpzrUtBhvj/iwQMHb5DHUuKSCuiTDe6wDAprfGMnS2ZJC0MVToAgqZI9idLjFJ8hLDvV
 VfpQ2b9vNsNJ8zgrlxcijXfZ4oLB9JBk2fbmLtWrhw7MTmpGEmEYQ61eD36M+FdwlnQl
 qdobAPKuDBleIUFWdFNDCR/06TCpjOjrVeJmKNE+c3yKnY38VOom4Xb/H1dCGpPinBtm
 6U7Q==
X-Gm-Message-State: AOAM533wHLXyAH49NNj7sGhZbCtIZxPTKM1iIH/j/ZBtXosUw0j989BF
 Vc5M5hGYNyZZEJEX0AL/P5E5AQ==
X-Google-Smtp-Source: ABdhPJyDn172CzJuuuuq8dT61GIlmi32I6U1QuMJ50oXU+JWnZfuZ6e5TKXOtmDRnIXmigEPfXl21w==
X-Received: by 2002:a50:9d83:: with SMTP id w3mr2710864ede.305.1634069268609; 
 Tue, 12 Oct 2021 13:07:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e15sm5263634ejr.58.2021.10.12.13.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:07:48 -0700 (PDT)
Message-ID: <3f3ad1b0-94e3-9578-92d2-f7867a93364e@mind.be>
Date: Tue, 12 Oct 2021 22:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Tal Lubko <tallubko@yahoo.com>, buildroot@buildroot.org
References: <20211001015433.11176-1-tallubko.ref@yahoo.com>
 <20211001015433.11176-1-tallubko@yahoo.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211001015433.11176-1-tallubko@yahoo.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/chipsec: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Tal,

On 01/10/2021 03:54, Tal Lubko via buildroot wrote:
> Signed-off-by: Tal Lubko <tallubko@yahoo.com>
> ---
>   package/Config.in                             |  1 +
>   ...ed-modules-instead-of-source-modules.patch | 27 +++++++++++++++++++
>   package/chipsec/Config.in                     | 19 +++++++++++++
>   package/chipsec/chipsec.hash                  |  3 +++
>   package/chipsec/chipsec.mk                    | 23 ++++++++++++++++


  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.


>   5 files changed, 73 insertions(+)
>   create mode 100644 package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
>   create mode 100644 package/chipsec/Config.in
>   create mode 100644 package/chipsec/chipsec.hash
>   create mode 100644 package/chipsec/chipsec.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2f83c87582..ce73e2db72 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2010,6 +2010,7 @@ endif
>   endmenu
>   
>   menu "Security"
> +	source "package/chipsec/Config.in"
>   	source "package/libapparmor/Config.in"
>   	source "package/libselinux/Config.in"
>   	source "package/libsemanage/Config.in"
> diff --git a/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
> new file mode 100644
> index 0000000000..08a87bf3cc
> --- /dev/null
> +++ b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
> @@ -0,0 +1,27 @@
> +From fd67e6878daec7abeef649bb687464c832a04ee6 Mon Sep 17 00:00:00 2001
> +From: Tal Lubko <tallubko@yahoo.com>
> +Date: Wed, 22 Sep 2021 15:50:46 +0300
> +Subject: [PATCH] search for compiled modules instead of source code modules
> +
> +change chipsec_main to search for compiled modules (PYCs) instead of
> +source code modules (PYs).

  Every patch must have a signed-off-by, to validate that it takes the license 
of the patched project rather then Buildroot's GPLv2.

  Also, please add a line with

Upstream: <URL>

with a URL that points to your upstream submission of the patch (pull request, 
most likely).

> +---
> + chipsec_main.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/chipsec_main.py b/chipsec_main.py
> +index 1aa46ea..11cf9c6 100755
> +--- a/chipsec_main.py
> ++++ b/chipsec_main.py
> +@@ -215,7 +215,7 @@ class ChipsecMain:
> +                 while len(subdirs) > 0:
> +                     subdirs.pop()
> +             for modx in mod_fnames:
> +-                if fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):
> ++                if fnmatch.fnmatch( modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__init__.pyc' ):

  That's not the proper way to do this, since it may instead be a .pyo. Or it's 
possible that the module wasn't compiled yet and there really is only a .py. So 
you need to extend the fnmatch to match *.py, *.pyo and *.pyc.

> +                     self.load_module( os.path.join( dirname, modx ), self._module_argv )
> +         self.Loaded_Modules.sort()
> +
> +--
> +2.17.1
> +
> diff --git a/package/chipsec/Config.in b/package/chipsec/Config.in
> new file mode 100644
> index 0000000000..3da41c14a6
> --- /dev/null
> +++ b/package/chipsec/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_CHIPSEC
> +	bool "chipsec"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_PACKAGE_PYTHON3

  We generally prefer a select instead of depends in this case (since it's not 
immediately obvious that chipsec is a Python program). Of course, that means you 
have to propagate the dependencies of python3. See e.g. libsigrokdecode.

> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

  I haven't checked, but does this package really require setuptools at runtime? 
That's pretty unusual.

> +
> +	help
> +	  CHIPSEC is a framework for analyzing the security of PC
> +	  platforms including hardware, system firmware (BIOS/UEFI),
> +	  and platform components.
> +
> +	  https://github.com/chipsec/chipsec
> +
> +comment "chipsec needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL

  You need to include the architecture dependencies here:

	depends on BR2_i386 || BR2_x86_64

We don't want to show the comment if the package can't be selected anyway.

> +
> +comment "chipsec depends on python3"
> +	depends on !BR2_PACKAGE_PYTHON3
> diff --git a/package/chipsec/chipsec.hash b/package/chipsec/chipsec.hash
> new file mode 100644
> index 0000000000..344eb4fab8
> --- /dev/null
> +++ b/package/chipsec/chipsec.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 0470326e00f66c91d751e9827d9e0050e3e4ac5b2bc7a9943a76381beda58162  chipsec-1.7.1.tar.gz

  Please use two spaces after "sha256" (like the two spaces that come after the 
hash itself).

> +sha256 4c2ca80f4d3675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607  COPYING
> diff --git a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mk
> new file mode 100644
> index 0000000000..96d96176cc
> --- /dev/null
> +++ b/package/chipsec/chipsec.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# chipsec
> +#
> +################################################################################
> +
> +CHIPSEC_VERSION = 1.7.1
> +CHIPSEC_SITE = $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))
> +CHIPSEC_SETUP_TYPE = setuptools
> +CHIPSEC_LICENSE = GPL-2.0
> +CHIPSEC_LICENSE_FILES = LICENSE
> +CHIPSEC_DEPENDENCIES = linux
> +CHIPSEC_ENV = KSRC=$(LINUX_DIR)
> +CHIPSEC_BUILD_OPTS = build_ext -i

  It would be good to document why these are needed.

> +
> +CHIPSEC_POST_INSTALL_TARGET_HOOKS += CHIPSEC_INSTALL_LKM

  We normally put this just after the definition of the hook, not before it.

> +
> +define CHIPSEC_INSTALL_LKM
> +	$(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipsec.ko \
> +		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux
> +endef

  We generally prefer to use Buildroot's infrastructure to build kernel modules 
[2]. That takes care of the depmod, and passing the correct CFLAGS etc. to the 
kernel build system.

  However, in this case, it apparently needs to be installed in a nonstandard 
location. If that really is the case, then this way is probably better. But 
please add a comment to explain why.


  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
[2] https://buildroot.org/manual.html#kernel-module-tutorial

> +
> +$(eval $(python-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
