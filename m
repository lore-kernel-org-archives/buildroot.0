Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CCBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAC1610A6
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AAC1610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E633A41585;
	Sun, 12 Sep 2021 07:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PqNeJVeseBk; Sun, 12 Sep 2021 07:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9FE40578;
	Sun, 12 Sep 2021 07:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 797981BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F34826D6
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZyGoikzMwgVb for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73824826C8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:40:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DA728B004EC;
 Sun, 12 Sep 2021 09:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631432403;
 bh=wIAxHLc55ueQBgW1DNFuBPk91X2ypdvZj78mn6vobyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UrPBlZ+AQTkXO+jXkVoWDGGukQc1F4zRnc9nSq7t4XbNC4KOkeZSFjrcECsminzqC
 9lPn70/XIli9Sw/8GODVkGqADrZ9eaj+B2VMXa965hbMTdsjsFSR+3jn73fooFeYtj
 SUUyzSVTLLFrB/6lxbAlhom/Ck6ic/dA8wMOEffLE1qlb7WXTvUVA75Rm+ikbwdyOY
 abIA54tWooXOncaJXSjKsYIy19nvmntr6NvX++CyK2NMjqH04G5kgFhbGQ9LU6P4L4
 SwZzYBaYSeLu2jqleI3K1INCkitUex+pw3+qB/YgHDXsPYhvEECZQ2KDjhZ8yOyw3P
 0ph7Sn7bcE2Aw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 09:39:56 +0200
Date: Sun, 12 Sep 2021 09:39:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210912073956.GA1053080@scaer>
References: <20210911214035.961528-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911214035.961528-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk: needs host gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-11 23:40 +0200, Fabrice Fontaine spake thusly:
> openjdk needs host gcc >= 4.9 since bump to version 16.0.1+9 in commit
> 057e27029c9811ba8cc4922e30cc3878bed98807 and
> https://github.com/openjdk/jdk/commit/2a8f92e7e71f7c1ed4010fa31f4b413758c8752a:
> 
> configure: Using gcc BuildC compiler version 4.8.5 [cc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
> configure: Using gcc BuildC++ compiler version 4.8.5 [g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
> configure: Using gcc build linker version 2.27 [GNU ld version 2.27-44.base.el7]
> 
> [...]
> 
> g++: error: unrecognized command line option '-std=c++14'
> 
> Add this new dependency to all openjdk versions including version 11 as
> most of the users will have host gcc >= 4.9

Actually, I think that users that are stuck on using OpenJDK 11 are
those big enterprise players, who will also have stringent requirements
on their build environment, and are thus stuck with years old distro,
like those RHEL-7 that Matt is running on his autobuilder.

So, I think we should just limit the dependency on host gcc-4.9 to
OpenJDK 16.

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/7072308d148ccb8237180729551df65c87a76f11
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openjdk/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
> index f2b7f5ffd7..cee361ec6f 100644
> --- a/package/openjdk/Config.in
> +++ b/package/openjdk/Config.in
> @@ -20,7 +20,8 @@ config BR2_PACKAGE_OPENJDK
>  	depends on !BR2_STATIC_LIBS # glibc
>  	depends on BR2_INSTALL_LIBSTDCPP # cups
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_USE_MMU # cups
>  	depends on BR2_PACKAGE_XORG7
> @@ -152,13 +153,14 @@ comment "openjdk needs X.Org"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_PACKAGE_XORG7
>  
> -comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
> +comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, host gcc >= 4.9, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  comment "openjdk does not support soft float configurations"
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
