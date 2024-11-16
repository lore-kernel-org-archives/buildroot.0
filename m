Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC3DD68BE7
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 20:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB3B41E7E;
	Sat, 16 Nov 2024 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCpROero_-X6; Sat, 16 Nov 2024 20:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D1741E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D1741E80;
	Sat, 16 Nov 2024 20:11:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D11ABB14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD446069C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyU9pYMXgQpT for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 20:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A22F860634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22F860634
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22F860634
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 20:11:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0A888B0054E;
 Sat, 16 Nov 2024 21:11:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40196])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 21:11:07 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 21:11:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20240915090537.12330-1-dario.binacchi@amarulasolutions.com>
References: <20240915090537.12330-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b8a270bbc649794c2965ce0a950ade44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731787870;
 bh=ou+kSty0mitzym9aLGDqOyHSPx5KHmJBpmI/h0F96RM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d2QIG+LrHU++waoyt7HT8dIxo/PbVwCXYYPv8+DPXZs2oDxfIXIwRCdtmsBhMl2Qs
 pi045A5Xw7gPXV6P9dPJbywxi7R6cBNSiCrthSeTIaM9FMVhXos3OpLa/xqx1XjzUB
 UzM2mguCwnqtQtVb5xU21rfqm4CkXZSutJuTl4uX01PcvtgFoj2qcB2pmUa5zkMwKj
 Ufg4e9+fMsViNuEQUv5ROpBCgSwi3G7PYpbfFV4OyrTdy048TcGZ0sEKaeuakkhSXr
 1ixv8rZXl1nm3WtzgoefseGWkhzo+L5ou6ydQrqi1dT3C9zcOXas4adxmRI4AfV8zS
 J3zkkcJalWOnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2QIG+Lr
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/09/2024 11:05, Dario Binacchi wrote:
> The commit f69fe48404eda ("package/armadillo: temporarily update the
> site URL") changed the download URL only to continue to build the
> 9.900.2 version. This is an outdated and no longer supported version
> and as suggested by Conrad Sand, the project maintainer, it is
> recommended upgrading to the latest version, which is currently 14.0.2,
> and it's downloadable from the URL containing the most recent versions.
> 
> - Drop ARMADILLO_EXTRACT_CMDS added to fix an issue only related to
>   the previous version building.
> - C++14 is now mandatory.
> 
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.

> ---
>  package/armadillo/Config.in      |  4 +++-
>  package/armadillo/armadillo.hash |  2 +-
>  package/armadillo/armadillo.mk   | 12 ++++--------
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> index 7aed4fd02fe9..7a93343d41f8 100644
> --- a/package/armadillo/Config.in
> +++ b/package/armadillo/Config.in
> @@ -2,16 +2,18 @@ comment "armadillo needs a toolchain w/ C++"
>  	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP
> 
> -comment "armadillo needs a toolchain w/ fortran, C++"
> +comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
>  	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see 
> comment above
>  	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
>  config BR2_PACKAGE_ARMADILLO
>  	bool "armadillo"
>  	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
>  		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>  	help
>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>  	  Fast Prototyping and Computationally Intensive Experiments.
> diff --git a/package/armadillo/armadillo.hash 
> b/package/armadillo/armadillo.hash
> index 9b19b8c8c4a2..4e8652192303 100644
> --- a/package/armadillo/armadillo.hash
> +++ b/package/armadillo/armadillo.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  
> d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  
> armadillo-9.900.2.tar.xz.RETIRED
> +sha256  
> 248e2535fc092add6cb7dea94fc86ae1c463bda39e46fd82d2a7165c1c197dff  
> armadillo-14.0.2.tar.xz
>  # License files, locally calculated
>  sha256  
> 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  
> LICENSE.txt
> diff --git a/package/armadillo/armadillo.mk 
> b/package/armadillo/armadillo.mk
> index 81684a44f72f..608f8fb229f2 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -4,14 +4,14 @@
>  #
>  
> ################################################################################
> 
> -ARMADILLO_VERSION = 9.900.2
> -ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
> -ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
> +ARMADILLO_VERSION = 14.0.2
> +ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
> +ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
>  ARMADILLO_INSTALL_STAGING = YES
>  ARMADILLO_LICENSE = Apache-2.0
>  ARMADILLO_LICENSE_FILES = LICENSE.txt
> 
> -ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
> +ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false -DBUILD_SMOKE_TEST=false
> 
>  # blas support may be provided by lapack (libblas.a) or openblas 
> (libopenblas.a)
>  ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
> @@ -30,8 +30,4 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
>  ARMADILLO_DEPENDENCIES += lapack
>  endif
> 
> -define ARMADILLO_EXTRACT_CMDS
> -	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) 
> $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
> -endef
> -
>  $(eval $(cmake-package))
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
