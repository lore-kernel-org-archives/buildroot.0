Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6306C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1259560E78
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1259560E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB301400BE;
	Sat, 24 Jul 2021 21:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoMtIHEQ1-67; Sat, 24 Jul 2021 21:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA15400EA;
	Sat, 24 Jul 2021 21:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293721BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 184ED400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om-yxUPxecng for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:52:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D61F7400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:52:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id q13so6376246edr.6
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZI0ScMzQaft2pK7p4MRR7uPhLmUL21oXRWLX3ArfYso=;
 b=PKN2ukT32+51WJZ1HRSWpuxzFLvqz86+xFR4uzVlP1IwttzU0kOobd34MaOEYfU6LG
 qyJgXfPMP7WUYSzyvoUQO2LqTs1Lgh2Np5Unr2tWMMTaXJ6EFYV449nhqz9+xBuIJ5iN
 3PRDtPXIORpipcQYok+gtSPc4on9pvq1fq2/YNLPDM/+Xx+P7paxQ7VT1obRIhoU4Y1h
 luHatcyr8HjET6lcq4ImH8TToOHp6/lAFdbo89CYdxiivHOwGzekdcdXurlzHSUT+yMt
 TgJD+7V/ilWze526ADvrX5NhOVp2OrS+tb8AcEnHdRcNtRsAYvrxPIau6tvk8sJYASRP
 GF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZI0ScMzQaft2pK7p4MRR7uPhLmUL21oXRWLX3ArfYso=;
 b=ZcWfk7MP97UmiLQQNXRhBl5z6wGJFdOYNLXnM21cLPa2L73qu4j0KLqCyZ1gWcGJMX
 TQkbC+zfBg3gWL+CZOxAxVrTq+oSPhGoaVpf//Za6JqARbNFOT7AxN6h1Xc3RBGVa6Pb
 sSFkaVGQXMlbFfA7mXdE3axFlkhR6IQHDYU6Lveyjs/5QgugYlah4iB9QzcMgLKcjXpf
 LmUDiw6tfFTwGyS573zquSOYGOso2KTdnowUWLep/4jDxi33LeIWwrLQYOnj5ExowoIM
 +aevi7n7pqKK+5GpJmtPi8wi2oFygWKK6kXdZHt/LLj5AUkYFuGxCvS7Gm7ZVaSZVu8q
 TZ6g==
X-Gm-Message-State: AOAM533obllDLxTfHCKsvHpHQhRJTOrUHwJrcBNy1HDZ46VvboGIdosY
 fR4c5KHVYnT/nUwolbxkM9n2Mg==
X-Google-Smtp-Source: ABdhPJySUJGQGX/kHaW9TdNo81jg6mhKkf6Kx5jd94RvaS/hxiUipqU95p1LaX7Dkmlm/tWZa0XR6g==
X-Received: by 2002:aa7:cd5a:: with SMTP id v26mr12915374edw.287.1627163551127; 
 Sat, 24 Jul 2021 14:52:31 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ba25sm16793386edb.1.2021.07.24.14.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 14:52:30 -0700 (PDT)
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20210630122245.1791249-1-gwenj@trabucayre.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a6e7ad40-e144-9af4-81a2-2e4964a846d3@mind.be>
Date: Sat, 24 Jul 2021 23:52:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630122245.1791249-1-gwenj@trabucayre.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [RESEND PATCH v3] package/armadillo: allows to
 select between clapack, lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Gwenhael,

On 30/06/2021 14:22, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> armadillo can use clapack, lapack or openblas as BLAS provider and clapack or
> lapack as LAPACK provider.
> 
> This patch
> - adds hidden variable to check dependencies/requirement for each of them
> - a choice to select wich implementation to use for blas and lapack.
> 
> Choices are required since applications, potentially, needs explicitly lapack or clapack.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v3:
> - drop all default statements for choice (Thomas)
> - add explicit -l since blas libary is called liblas for (c)lapack and
>   libopenblas for openblas (Thomas)
> - add a choice for lapack selection between lapack, clapack or none
> Changes v1 -> v2:
> - add openblas as blas provider
> ---
>  package/armadillo/Config.in    | 66 ++++++++++++++++++++++++++++++++--
>  package/armadillo/armadillo.mk | 29 ++++++++++++++-
>  2 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> index b2b61a3233..816b45be96 100644
> --- a/package/armadillo/Config.in
> +++ b/package/armadillo/Config.in
> @@ -1,3 +1,15 @@
> +config BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	bool
> +	default y
> +	depends on !BR2_m68k_cf
> +	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)

 I've created separate commits for these that add them to lapack and clapack
respectively, because they can be useful for other packages as well.

> +
>  comment "armadillo needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_powerpc

 I've also simplified the comment that is not quoted here, since it's not
entirely correct (openblas is possible on some powerpc).

> @@ -10,11 +22,59 @@ comment "armadillo needs a glibc toolchain w/ C++"
>  config BR2_PACKAGE_ARMADILLO
>  	bool "armadillo"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
> -	depends on !BR2_m68k_cf # clapack
> -	select BR2_PACKAGE_CLAPACK
> +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS || \
> +		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS || \
> +		BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>  	help
>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>  	  Fast Prototyping and Computationally Intensive Experiments.
>  
>  	  http://arma.sourceforge.net/
> +
> +if BR2_PACKAGE_ARMADILLO
> +
> +choice
> +	prompt "blas library"
> +	help
> +	  Selects blas library to use
> +
> +config BR2_PACKAGE_ARMADILLO_BLAS_LAPACK
> +	bool "lapack"
> +	depends on BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +	select BR2_PACKAGE_LAPACK

 This, unfortunately, does not work in Kconfig, because it's possible to select
clapack and then select BR2_PACKAGE_ARMADILLO_BLAS_LAPACK. So you need to add a
depends on !CLAPACK. But that then leads to a circular dependency according to
Kconfig (Kconfig is weird about dependencies in choices).

 Therefore, I think the only solution is to not make this a choice, but
automatically choose between lapack and clapack. The commit message said "needs
explicitly lapack or clapack" but I guess that meant "needs explicitly lapack or
clapack instead of openblas", right? Anyway, if an application specifically
needs lapack or clapack, it just needs to choose that one and armadillo will
adapt automatically.


 So, I needed to make some big changes to this series. Therefore, I haven't
applied it, but instead sent a v4 to the list. Please review and test and if
it's all good, I'll apply.

 Regards,
 Arnout


> +
> +config BR2_PACKAGE_ARMADILLO_BLAS_CLAPACK
> +	bool "clapack"
> +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	select BR2_PACKAGE_CLAPACK
> +
> +config BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
> +	bool "openblas"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	select BR2_PACKAGE_OPENBLAS
> +
> +endchoice
> +
> +choice
> +	prompt "lapack library"
> +	help
> +	  Selects lapack library to use
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK_LAPACK
> +	bool "lapack"
> +	depends on BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +	depends on !BR2_PACKAGE_ARMADILLO_BLAS_CLAPACK
> +	select BR2_PACKAGE_LAPACK
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK_CLAPACK
> +	bool "clapack"
> +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	depends on !BR2_PACKAGE_ARMADILLO_BLAS_LAPACK
> +	select BR2_PACKAGE_CLAPACK
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK_NONE
> +	bool "none"
> +
> +endchoice
> +
> +endif
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index 624b842ef6..bae27774d7 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -7,11 +7,38 @@
>  ARMADILLO_VERSION = 9.900.2
>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
> -ARMADILLO_DEPENDENCIES = clapack
>  ARMADILLO_INSTALL_STAGING = YES
>  ARMADILLO_LICENSE = Apache-2.0
>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>  
>  ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
>  
> +# blas support may be provided by lapack, clapack or openblas
> +# blas library from (c)lapack is libblas.a, libopenblas.a otherwise
> +ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
> +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
> +ARMADILLO_DEPENDENCIES = openblas
> +else
> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
> +ifeq ($(BR2_PACKAGE_ARMADILLO_CLAPACK), y)
> +ARMADILLO_DEPENDENCIES = clapack
> +else
> +ARMADILLO_DEPENDENCIES = lapack
> +endif
> +endif
> +
> +# lapack support may be provided by lapack or clapack
> +# but not by openblas
> +ifeq ($(BR2_PACKAGE_LAPACK_NONE),y)
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=OFF
> +else
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
> +ifeq ($(BR2_PACKAGE_ARMADILLO_LAPACK_LAPACK),y)
> +ARMADILLO_DEPENDENCIES += lapack
> +else ifeq ($(BR2_PACKAGE_ARMADILLO_LAPACK_CLAPACK), y)
> +ARMADILLO_DEPENDENCIES += clapack
> +endif
> +endif
> +
>  $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
