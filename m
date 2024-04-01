Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA314CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380981E19;
	Mon,  1 Apr 2024 12:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Yc_Z4lzc529; Mon,  1 Apr 2024 12:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D38D81E30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D38D81E30;
	Mon,  1 Apr 2024 12:11:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B65471BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A22B481E30
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQGqFoh89e-W for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:11:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A5E881E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5E881E19
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A5E881E19
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 12:11:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 77D8D13F838;
 Mon,  1 Apr 2024 14:11:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:11:39 +0200
Date: Mon, 1 Apr 2024 14:11:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Zgqke-dukSf_iyCq@landeda>
References: <20240401112421.27763-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401112421.27763-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711973504;
 bh=3kdJsH6czck7+A8ErqKZdjPlDsf2yhJ38b3NXTl9GqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ua2D01GSICWDlWq6b+xU3Lz+2glHz2rmsJj7z5Wl1si79+znlpsTjEqFOVzT7Pqax
 y8+0bIctOWVCUHTwkXp6nZLXf/fAifQDfKPwgAdyHPnegs3VGOmEXpUU9IxbusAVYz
 KkRlZuC6IQLTMMXzYwj7YNVrY04c/3lIRQxrnYNE4T9xrJKYWjV7VcwxU4tvoT8aOP
 8d9gOQnw7dbKs1vSan599Ce/WAQCHYpIkoo2Z2P/8+DmPjBUCvpP4xa/44ILPfgMwU
 hAllKEm7BsMrXAXzLKVONBkelrumOohKsp/TVYCo6NHzpNgCenYUWG9YnAn6y1lRuB
 jS18/Aei4EjKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ua2D01GS
Subject: Re: [Buildroot] [PATCH v1] package/zic: fix host compile (needs
 CC/HOST_CONFIGURE_OPTS set)
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
Cc: buildroot@busybox.net, Kadambini Nema <kadambini.nema@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-04-01 13:24 +0200, Peter Seiderer via buildroot spake thusly:
> Host compile of zic needs CC defined since version bump to 2024a (given by
> HOST_CONFIGURE_OPTS).
> 
> 	$ diff -ru build/host-zic-2023c/Makefile build/host-zic-2024a/Makefile
>   --- build/host-zic-2023c/Makefile	2024-04-01 12:44:14.515490354 +0200
>   +++ build/host-zic-2024a/Makefile	2024-04-01 13:10:50.138333771 +0200
>   [...]
>   +# To affect how this Makefile works, you can run a shell script like this:
>   +#
>   +#	#!/bin/sh
>   +#	make CC='gcc -std=gnu11' "$@"
>   +#
>   +# This example script is appropriate for a pre-2017 GNU/Linux system
>   +# where a non-default setting is needed to support this package's use of C99.
>   +#
>   +# Alternatively, you can simply edit this Makefile to tailor the following
>   +# macro definitions.
>   +
>   +###############################################################################
>   +# Start of macros that one plausibly might want to tailor.
>   [...]
>   -cc=		cc
>   -CC=		$(cc) -DTZDIR='"$(TZDIR)"'
>   [...]

This diff is not very helpful, so I replaced it with a reference to the
upstream commit that changed the requirements.

I also slightly reworded the commit log to also mention that our CFLAGS
and LDFLAGS are now used as well, in addition to the now required CC.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> 
>   c99 -O1   -c -o zic.o zic.c
>   make[2]: c99: No such file or directory
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/zic/zic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 95fa1eaa96..8abcec9360 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -12,7 +12,7 @@ ZIC_LICENSE = Public domain
>  ZIC_LICENSE_FILES = LICENSE
>  
>  define HOST_ZIC_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) zic
>  endef
>  
>  define HOST_ZIC_INSTALL_CMDS
> -- 
> 2.44.0
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
