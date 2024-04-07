Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9F0CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72BA3400CB;
	Sun,  7 Apr 2024 08:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-ja2eJESQIp; Sun,  7 Apr 2024 08:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F4C7403E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F4C7403E9;
	Sun,  7 Apr 2024 08:50:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF231BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CAD7400D6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myJBXorIU3sa for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3A8A400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A8A400CB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3A8A400CB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:50:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A550913F8E1;
 Sun,  7 Apr 2024 10:50:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:50:23 +0200
Date: Sun, 7 Apr 2024 10:50:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJeT1daXkjofkTW@landeda>
References: <20240404211821.1985923-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404211821.1985923-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479826;
 bh=AvuVj0a8L/3sIrF6gzlhq1+bQRC39dOlF1G8rh9Obdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7QQoHCe2RTfxqVTP06OjgxFlyUEqsX/wmjn7WY4TMfin4chat4aOxOobbXE4NbP4
 lB6Lf/Vj5wquRj6Rotr3a3vVVAU/FGie6+/lRaIrTsrKa78oHP4CN8ka76ikArQAIs
 qW8WqG/waQ30bji/aGhAuQpNDOGIhKuWUQgSC+CRNrPWntsOL9UABYy+Af2TlO+6Zc
 nT5ztd06rkwgMJ5VDPk6Ev4bP+0i1sG+VmEutI4uibl8J+dhrGYbOUbrSmkbAD8dha
 sUJQ5AGbofMehQW70pbX02kAggM67NnZIOb9irF+g52o5hZb54I3BG3LOuPOw1WlAU
 9EqcojJpU4Wdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=B7QQoHCe
Subject: Re: [Buildroot] [PATCH 1/1] package/hiawatha: add libxcrypt
 optional dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-04 23:18 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/mips-buildroot-linux-gnu/11.4.0/../../../../mips-buildroot-linux-gnu/bin/ld: CMakeFiles/hiawatha.dir/src/httpauth.c.o: in function `basic_http_authentication':
> /home/autobuild/autobuild/instance-13/output-1/build/hiawatha-11.2/src/httpauth.c:334:(.text+0x614): undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/8054bd47edf613a12b09a9958f78abd5f355f17b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hiawatha/Config.in   | 1 +
>  package/hiawatha/hiawatha.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
> index 4b1a3ca86c..0c35734c34 100644
> --- a/package/hiawatha/Config.in
> +++ b/package/hiawatha/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_HIAWATHA
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Hiawatha is a webserver for Unix and has been built with
> diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
> index 2ba8efb2fe..3e9cf2571b 100644
> --- a/package/hiawatha/hiawatha.mk
> +++ b/package/hiawatha/hiawatha.mk
> @@ -47,6 +47,10 @@ else
>  HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +HIAWATHA_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBXSLT),y)
>  HIAWATHA_CONF_OPTS += -DENABLE_XSLT=ON
>  HIAWATHA_DEPENDENCIES += libxslt
> -- 
> 2.43.0
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
