Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8551ACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC8A407C3;
	Sun,  7 Apr 2024 15:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ppqk8OlLSu0y; Sun,  7 Apr 2024 15:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41BF407CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E41BF407CF;
	Sun,  7 Apr 2024 15:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCA191BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6BF2608DE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qug3hjGA44O6 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC82B608BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC82B608BD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC82B608BD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:38:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D32013F86A;
 Sun,  7 Apr 2024 17:38:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 17:38:08 +0200
Date: Sun, 7 Apr 2024 17:38:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhK94BYRUWuNT2Qf@landeda>
References: <20240407152155.1913254-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407152155.1913254-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712504292;
 bh=Kc1ulF+LsHwRFbDa4m9FdQgFbLaa5vgqseGqH4282ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AE6N0zNeubLBiYAtJFc0EnWu9utGXznlfDmUpBsO3e73Z81329h3wO1Q6Hs2VmAIb
 d2EIVQPg1/dG72bZXA72vGNPhR+ubtOKgwy9u/IbNdJ7WsEvuUl8VOtrtiEhvYo4lj
 DMVBvNOtoeIvaCeRhE8nideihOxctlrYLEwZtNm7oH2Zn3f+SVJNO9Us7NgjPuV5bb
 7bc5n7I6jjQoYbl5gX1/TPppvfbQFi+OCnRiP2r90jnXVhSAtGWdV5MtPO/eAl21aC
 29tnl1SNtuqghMRcG6G0RacUCIUzJuv8d93kNz6UXPrSmaHC037BG/zdugQW+k6hJO
 3c5sGGurm3SRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AE6N0zNe
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/cups: add libxcrypt optional dependency
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-07 17:21 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: auth.o: in function `cupsdAuthorize':
> auth.c:(.text+0xdba): undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/39b72d4e14895f901590d7e3404f69b4573d2cd2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I also applied all your previous similar patches; I'm not replying to
each of them, so consider them applied if they no longer appear on
patchwork. Thanks for helping fix all this fallout mess! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add missing '\'
> 
>  package/cups/Config.in | 1 +
>  package/cups/cups.mk   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index 51cf10b073..ad852c0998 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_CUPS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# needs fork()
>  	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  The Common Unix Printing System
>  
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 91fad30b38..2ef480afe0 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -32,6 +32,7 @@ CUPS_CONFIG_SCRIPTS = cups-config
>  CUPS_DEPENDENCIES = \
>  	host-autoconf \
>  	host-pkgconf \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(if $(BR2_PACKAGE_ZLIB),zlib)
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
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
