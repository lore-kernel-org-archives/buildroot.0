Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83187C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2237960E08
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2237960E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6E2D4014B;
	Mon, 25 Oct 2021 20:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3d0s6QlA5Qp; Mon, 25 Oct 2021 20:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0A8D403CB;
	Mon, 25 Oct 2021 20:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 142A11BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F708608A8
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWg48tyJ91cE for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07F826089F
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:88a7:5655:8f62:bf4c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7182C19F553;
 Mon, 25 Oct 2021 22:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635193099;
 bh=tNc+JxWY3L5+zLTCvN/BB4KMaJprO4zHd71YlyDaIjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/cd4g4zDwi6Yax7TRgRJPBVyUgLkP1ZeY2Qo2xX+5FX5WpltpxK9Sg6LXnNdSxf0
 hDg5SpeIU7Xufk/RCLB1HmGpkFuzHSg6S27VL5vk+jiXg0amGHqW/hpCjKW8i83R+3
 C4W4K5TdaLrYlH5u/OlobO5dCbJH8kRFxb8sSgy4JbOVhGiohb0xEAvAd1B7srPJ6r
 r8XMzDOIqrimoZ9vwXpTRgCrm52F92bMb7HbQEU7tW3gQrKEyxWy1AU+7xX4gL9/ub
 tg1FD1wz0B3NXycfMZfgE2XYi+QnYRwwOaWQeMGxMkjs3SWxIkP6LoA+WO2kRHKA7b
 Zkg9GxT0HjQ2w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Oct 2021 22:18:05 +0200
Date: Mon, 25 Oct 2021 22:18:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211025201805.GT2400@scaer>
References: <20211019052531.1604264-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019052531.1604264-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: needs
 host gcc >= 7
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Anisse Astier <anisse@astier.eu>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

+Adam

On 2021-10-19 07:25 +0200, Fabrice Fontaine spake thusly:
> Commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65 forgot to propagate
> host gcc >= 7 dependency to reverse dependencies of host-qemu resulting
> in the following build failure:
> 
> ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/14cd0250d55c5ca5dc1d297aee1b927fda889531
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Note however, that the issue is really about gcc >= 7.5. We do not have
such a symbol, and we do not want to add it. So, adding the dependency
on host gcc >= 7 is not strictly correct, because it allows for gcc 7.4
and below... And gcc 7.5 was the last release in the 7.x branch. It is
probably a safe bet to require 8.x now.

Adam has sent a patch doing that; I already asked him on IRC to rebase
on master now that I applied your patch.

Regards,
Yann E. MORIN.

> ---
>  package/gobject-introspection/Config.in | 6 ++++--
>  package/python-bluezero/Config.in       | 6 ++++--
>  package/python-gobject/Config.in        | 6 ++++--
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> index bacf44363c..c631c84755 100644
> --- a/package/gobject-introspection/Config.in
> +++ b/package/gobject-introspection/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
>  	# compile errors with locale.c. As such, require 4.9 until this
>  	# can be verified.
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	# gobject-introspection does not require python3 to run on the
>  	# target; however, because the tools run in a qemu wrapper, a
> @@ -41,8 +42,9 @@ comment "gobject-introspection needs python3"
>  	depends on !BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  
> -comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
> +comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
> index c391bfa858..3d40b1e275 100644
> --- a/package/python-bluezero/Config.in
> +++ b/package/python-bluezero/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
>  	bool "python-bluezero"
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
>  	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_DBUS # runtime
> @@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
>  
>  	  https://github.com/ukBaz/python-bluezero
>  
> -comment "python-bluezero needs a glibc toolchain, gcc >= 4.9"
> +comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
>  	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
> index 1c9303b0ba..910f990026 100644
> --- a/package/python-gobject/Config.in
> +++ b/package/python-gobject/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
>  	depends on BR2_USE_MMU # libglib2, gobject-introspection
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
>  	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
>  	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> @@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
>  
>  	  https://wiki.gnome.org/action/show/Projects/PyGObject
>  
> -comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
> +comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
> -- 
> 2.33.0
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
