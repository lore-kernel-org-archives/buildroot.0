Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2050BC25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E568E6067E;
	Fri, 17 May 2024 14:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhFh9T0B0jXz; Fri, 17 May 2024 14:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE72E60755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE72E60755;
	Fri, 17 May 2024 14:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74E321BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6171981276
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpEjjEqiRLFO for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26E618119E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E618119E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26E618119E
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:39:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6BE4813F88F;
 Fri, 17 May 2024 16:38:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 16:38:59 +0200
Date: Fri, 17 May 2024 16:38:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZkdsA2ZEBFYqhuLh@landeda>
References: <20240515145903.363218-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515145903.363218-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715956741;
 bh=1P5xwXEfmkFm7MLJkqzOQ4rEIIFVwrlTbZ8ZCsamYP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dbn07eDFeFsZE0hXyyF+5J97gl8LDsLAKqb/NxYPHWxyLd2rkU3EXBvw9bNgTbxFY
 AW4Ccsoo7CWLDVeolAiJc962acgeYT2ih9GMDwWH3HCyI6YyC11QiRg5U/8OpqdK0M
 HYuRKQulZVpSbWiD9csFwFxytGtJ1rDmQUaMGIk9bnSNl/nVZCPJptzHdxx1+axfaT
 vXXyByIb2I5V1LOU5iWgp/74kUz5NDbdaWwd41eVOAWy8/xDfhnOIdROHt/ByPgI+e
 EE8oMxCNf76lPvYn650DaQ+JdXEqUcNqlo8G7AxJpLz44oDYMXE4RQiP1EhHYnK3ss
 6BgNSetAwyIZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Dbn07eDF
Subject: Re: [Buildroot] [PATCH] package/libvncserver: correct
 WITH_THREADS=ON/OFF logic
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

Peter, All,

On 2024-05-15 16:59 +0200, Peter Korsgaard spake thusly:
> Commit ee59023794f5540e5 (package/libvncserver: bump to version 0.9.12)
> changes the package from autotools to cmake and accidently inverted the
> threads logic.
> 
> The reason this was not noticed is that the build system verifies if threads
> support works and otherwise disables it even when -DWITH_THREADS=ON is
> passed, E.G.  for a nothread configuration:
> 
> cmake ... -DWITH_THREADS=ON ...
> ..
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
> -- Looking for pthread_create in pthreads
> -- Looking for pthread_create in pthreads - not found
> -- Looking for pthread_create in pthread
> -- Looking for pthread_create in pthread - not found
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvncserver/libvncserver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
> index 3a15a82d08..082f838f12 100644
> --- a/package/libvncserver/libvncserver.mk
> +++ b/package/libvncserver/libvncserver.mk
> @@ -22,7 +22,7 @@ LIBVNCSERVER_CONF_OPTS += \
>  	-DWITH_SDL=OFF \
>  	-DWITH_TESTS=OFF
>  
> -ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
>  else
>  LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=OFF
> -- 
> 2.39.2
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
