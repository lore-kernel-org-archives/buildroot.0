Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FFBC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B3C80B5E;
	Wed,  1 May 2024 21:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEzES6toRFZF; Wed,  1 May 2024 21:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2BA80C28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2BA80C28;
	Wed,  1 May 2024 21:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C90BB1BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B49D04017E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGv-byhK7ve0 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C81940110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C81940110
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C81940110
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:44:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9A4BA13F81D;
 Wed,  1 May 2024 23:44:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:44:10 +0200
Date: Wed, 1 May 2024 23:44:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjK3qqpGRgxvP1Vi@landeda>
References: <20240408192953.194898-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408192953.194898-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714599854;
 bh=JYC1muQsrgUKrvVFv0RUuuNzy7O/O4IThahLYamp+VU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jpEppv6ZRd/fhTGtZVlp92PYrJY8gCG2xNBERxcrD87glivYV5M7pjYsqsxfYkvZ7
 S6DAa6HJ8xGiUNTi48c3lkrwo1vqdMKo1QNMtK7uokcRVz/rWaajUV+Q/Cb8Aykzvj
 TEv/wXBnlT5zkkdTcAp5NWYiSNtUSPjNWRZs6DFWSj2EhiHMxEIrjSIxsi0j0J/fn6
 7tuEON6BbgrwkqmB92po/Qes257snkthcMk1icqRjEARUxoWaw44Ve8MUukN2TYoPW
 ZEGMo140p7ozCRBSKIS4yCgIwrINE05wWktD8QHzxiismsuqHCXBQ+eIuSI4ni5TsD
 LQC4Sus5YwBkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jpEppv6Z
Subject: Re: [Buildroot] [PATCH 1/1] package/libnetconf2: add libxcrypt
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fabrice, All,

On 2024-04-08 21:29 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/12.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/c84e27815cc607ad78a1901cb2be591df2686ac7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnetconf2/Config.in      | 1 +
>  package/libnetconf2/libnetconf2.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> index 7865f9e487..34934325fa 100644
> --- a/package/libnetconf2/Config.in
> +++ b/package/libnetconf2/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBNETCONF2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_LIBYANG
>  	help
>  	  libnetconf2 is a NETCONF library in C intended for building
> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
> index e349c1bce4..88163926c0 100644
> --- a/package/libnetconf2/libnetconf2.mk
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -30,6 +30,10 @@ else
>  LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +LIBNETCONF2_DEPENDENCIES += libxcrypt
> +endif
> +
>  HOST_LIBNETCONF2_CONF_OPTS = \
>  	-DENABLE_TESTS=OFF \
>  	-DENABLE_VALGRIND_TESTS=OFF \
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
