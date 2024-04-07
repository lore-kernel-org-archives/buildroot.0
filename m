Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E1FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA527400D6;
	Sun,  7 Apr 2024 08:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Up8nmYz0marO; Sun,  7 Apr 2024 08:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B16DC40141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B16DC40141;
	Sun,  7 Apr 2024 08:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0E6F1BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC57F81F1F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScZsDYWLyZLn for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:50:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1BB181F04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BB181F04
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1BB181F04
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:50:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1AB0613F8AE;
 Sun,  7 Apr 2024 10:50:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:50:36 +0200
Date: Sun, 7 Apr 2024 10:50:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJeXKh7eaAcXrxc@landeda>
References: <20240404211228.1979139-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404211228.1979139-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479841;
 bh=dQVikuUPPEg6FLfHqmt4xlat5X/FxgzQa2qDkZAmt+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MU+w1T15m9CRJ/t3AxFMOTCQKnDNb3RQFfuZC3D10XteS9TVGR2UqTVIL+fE9CHJz
 3J+HjsC+j+O2DhNArC4SfOYTJNZ8TlOuaotOcBOi6pXw2NEe9rW7tZStA5YiACFi0t
 9/BTK4vsBLooPc1PG98uJ8v4WL+T8U60fJ4l6qVNhZaBM4bYyVDPptgsSq4wOYmbMd
 vSaRY1eX/xg1ryrDXraQNxbyh7TtQe7WRijN+XgGxAx59LKVAS/K7EstpA+8R3tsqU
 Y0wReaCRzkOfyV86p75GYa9nsgW4PNxI8UvnPzIV/pbJvEcc9gOzdJAS4ECU/8lo4z
 zJptiZ2YbukeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MU+w1T15
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: add libxcrypt optional
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-04 23:12 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> crypt16.c:45:10: fatal error: crypt.h: No such file or directory
>    45 | #include <crypt.h>
>       |          ^~~~~~~~~
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/3c846c763a05f2569db7a019af8b91b0563c8f42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exim/Config.in | 1 +
>  package/exim/exim.mk   | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/exim/Config.in b/package/exim/Config.in
> index 2557251fd1..0d2f5f4999 100644
> --- a/package/exim/Config.in
> +++ b/package/exim/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_EXIM
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_PCRE2
>  	select BR2_PACKAGE_BERKELEYDB
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Exim is a message transfer agent (MTA) developed at the
>  	  University of Cambridge for use on Unix systems connected to
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 84fe96218c..d78b95ad15 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -75,6 +75,10 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +EXIM_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  EXIM_DEPENDENCIES += host-openssl openssl
>  define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
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
