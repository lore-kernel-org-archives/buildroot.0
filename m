Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3393C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 839778186E;
	Wed, 21 Feb 2024 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KZxr8FXM0cc; Wed, 21 Feb 2024 20:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE5481B17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE5481B17;
	Wed, 21 Feb 2024 20:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 916441BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E97881B17
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AJHaYqf3wpj for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 028F58186E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028F58186E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 028F58186E
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:12:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 252FC13F8A7;
 Wed, 21 Feb 2024 21:12:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 21:12:33 +0100
Date: Wed, 21 Feb 2024 21:12:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZdZZMWgSp0IaDVr4@landeda>
References: <20240217172923.3629905-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217172923.3629905-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708546357;
 bh=jQbUho2bT73f7077xIz2p7dF7WkFwpmhUn4vMd/K7e0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9Xf+6P57Kk+cvi8zsWSNaNIhBQZUlZ54ej5PLyUUiggn7rv4n0xviqWu4WMpy0B5
 nXosLj3fsrxbHk4WJ2nAfA6xkhLVcPcUQmKI+HnzO/6xzYP/StsQaJVWOHdD3REcqb
 33X4ul2E11fKA792tlGmtZrpIrfZHkWuuOR2SiOeRDOEkkMrHijN1zweiT0qZxGMqH
 qZag1TT0IsxmSOAxAWbPwZnJe/p986pWsXUypvxRat4okQvZdX8Lx0PKpz1uo7xhx/
 rD7MkofZxfNBkwBA2yjmyiKP0O0Opk/N2NtbzQZxASg2SwI2Yi+4+iXztnjIxRD+9L
 aI5wRKY/wjOpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V9Xf+6P5
Subject: Re: [Buildroot] [PATCH] package/sudo: drop legacy, useless,
 and broken post-configure hook
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-02-17 18:29 +0100, Yann E. MORIN spake thusly:
> Commit b9e89b340e27 (sudo: bump version) introduced the explicit build
> of mksigname and mksiglist as host tools, as they were required to run
> on the build machine, to generate C code then used to build the target
> program.
> 
> This is now failing to build since the bump to sudo 1.9.15p5 in commit
> c87746afefe7 (package/sudo: security bump to version 1.9.15p5)
> (lines manually wrapped and slightly elided for ease of reviewing):
> 
>     /usr/bin/cpp \
>         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
>         -I../../include \
>         -I../.. \
>         ./sys_signame.h \
>     | /usr/bin/sed -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
>     In file included from /usr/include/features.h:394,
>                      from /usr/include/sys/types.h:25,
>                      from ./sys_signame.h:4:
>     /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>           |     ^~~~~
>     /usr/bin/gcc -I../../include -I../.. -I. -I. \
>         -D_PATH_SUDO_CONF=\"/etc/sudo.conf\"
>         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
>         -DDEFAULT_TEXT_DOMAIN=\"sudo\" \
>         -O2 \
>         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
>         ./mksigname.c -o mksigname
>     In file included from /usr/include/features.h:394,
>                      from /usr/include/bits/libc-header-start.h:33,
>                      from /usr/include/stdlib.h:26,
>                      from ./mksigname.c:27:
>     /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>           |     ^~~~~
>     make[2]: *** [Makefile:263: mksigname] Error 1
> 
> The core of the issue has not been really identifie, but it turns out
                                                    /
Typo fixed when applying --------------------------'

> that neither mksiglist nor mksignames is used during the build. This has
> been tested with a minimal sudo with no option, and with a sudo with all
> options enabled (linux-pam, zlib, opensldap, and openssl), with the
> three types of C libraries (glibc, musl, and uClibc-ng).
> 
> Digging in the sudo buildsystem did not reveal an obvious reason when
> those would be needed either.
> 
> Drop the hook now it seems it is no longer used and is atually breasking
                                                                     /
Typo fixed when applying -------------------------------------------'

> the build.
> 
> Fixes: http://autobuild.buildroot.org/results/72f/72ff18fb9b41394a29006f881ee1fbea67a66a09/
> 
> Note that there is a second issue in there: the call to the host cpp
> fails, but since it is on the LHS of a pipe, the error is lost, as the
> RHS of the pipe (the sed call) succeeds; a fix for that will be send
> in a separate patch.
> 
> Reported-by: Christian Stewart <christian@aperture.us>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sudo/sudo.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index a4e838dd94..7961a99002 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -58,15 +58,6 @@ else
>  SUDO_CONF_OPTS += --disable-openssl
>  endif
>  
> -# mksigname/mksiglist needs to run on build host to generate source files
> -define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
> -	$(MAKE) $(HOST_CONFIGURE_OPTS) \
> -		CPPFLAGS="$(HOST_CPPFLAGS) -I../../include -I../.." \
> -		-C $(@D)/lib/util mksigname mksiglist
> -endef
> -
> -SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
> -
>  define SUDO_PERMISSIONS
>  	/usr/bin/sudo f 4755 0 0 - - - - -
>  endef
> -- 
> 2.43.0
> 

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
