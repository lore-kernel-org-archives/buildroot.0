Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547CEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D989560600;
	Mon, 19 Aug 2024 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOXKU150zphr; Mon, 19 Aug 2024 21:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1F160826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1F160826;
	Mon, 19 Aug 2024 21:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF4ED1BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7381403FE
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmgH7flyHP32 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46CE5403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46CE5403BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46CE5403BE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:12:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2B1FB13F846;
 Mon, 19 Aug 2024 23:12:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 23:12:49 +0200
Date: Mon, 19 Aug 2024 23:12:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsO1UYTTOIY7UuJn@landeda>
References: <ZsOw2IzdkaSTp+Ot@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsOw2IzdkaSTp+Ot@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724101972;
 bh=rosRo045GFWbakGVwFdzcf8msVtcXKmA27DJFbTcGv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TqaS7cRDNYc/xDtADZoTbUptVPuU5nUp0foQN4amgf7yRKiY/ix1yGGIvG7OKPFNf
 HiF/61oFNo1IK7ua1Uwsj7hKAMxFfAjF84KTvNUkbKcepAJ9MMjNL2+rs3DgDgs/i+
 nB5iJOWHYyI4qYJHyU+9Z1wkIp+ha6Va0KIngMEzc+XoZiKmQeS8fy7/tcasdIlupH
 hmS3YElm6RoCpkZA6Rz9Ws2wp9lFLs63Hp2kPSM+b7CwLOMG6Iq03uyHY+wZLPKTfj
 F0p/5+ebAmhWsrOLkIiNrn1WshJXOLMcEMVSruq5+qi87aBPH94SitF46OHmPGukCz
 J6NqDR0yKzCNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TqaS7cRD
Subject: Re: [Buildroot] [PATCH] package/botan: avoid compile error with gcc
 10.x
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,


You initial title is a misleading. Yes, it does "avoid compile error
with gcc 10.x", but "avoid" is a bit too evasive, so I changed it to the
more assertive:

    package/botan: needs gcc >= 11

On 2024-08-19 22:53 +0200, Waldemar Brodkorb spake thusly:
> The "using enum" was added in gcc 11.x, see here for a info about it:
> https://stackoverflow.com/questions/75018634/how-to-use-the-using-keyword-in-gcc-10-4

I changed that to refer to the official gcc C++ support status;
    https://gcc.gnu.org/projects/cxx-status.html#cxx20

(but I kept the S.O. thread for reference, because it is about
Buildroot, so is still interesting).

> Compile successfully tested with internal Buildroot toolchain for
> sparc with gcc 12.x as gcc 11.x is not available anymore.
> 
> The autobuild failure will be avoided now and fixed with newer external
> bootlin toolchains.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ab8/ab83b920156f5a1e51ef960e4007769b5c27d0a1
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/botan/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/botan/Config.in b/package/botan/Config.in
> index c61b368801..305cc2fe8c 100644
> --- a/package/botan/Config.in
> +++ b/package/botan/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>  config BR2_PACKAGE_BOTAN
>  	bool "botan"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> @@ -24,8 +24,8 @@ config BR2_PACKAGE_BOTAN
>  
>  	  http://botan.randombit.net
>  
> -comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
> +comment "botan needs a toolchain w/ threads, C++, gcc >= 11"
>  	depends on !BR2_INSTALL_LIBSTDCPP \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> -- 
> 2.30.2
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
