Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8C7E732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55BDB4208A;
	Sat, 30 Sep 2023 19:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55BDB4208A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4rg09CNVbda; Sat, 30 Sep 2023 19:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1A042064;
	Sat, 30 Sep 2023 19:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1A042064
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF661BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 492CB60F66
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 492CB60F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovnaidMWLTPq for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:01:32 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E276A60BEB
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E276A60BEB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C91CAB0055A;
 Sat, 30 Sep 2023 21:01:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 21:01:26 +0200
Date: Sat, 30 Sep 2023 21:01:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230930190126.GH2579@scaer>
References: <20230930134234.3567570-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930134234.3567570-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696100488;
 bh=x8+Gj5AvxvkvL5pkdIlWoB4PXf+F2lBojZrYYOUKoTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HoC/0IDxoPcByxkwrnUk1O4HuSwNwhtBIz9NYCcylnQviWXuu2H8epyiHYJcUSe4b
 pEgobIzsIEFxBCKp7wIui50zWBr3HpSyvepEQZx+Uumx1LtAPJe1rM7aEi4rVezR8w
 XAIVyktnncwZWV0Y3TvKfu7Zhpu5TgX/qBpuc8AWJrbMfu3oqQXnrYeFWQj8d7fbZx
 DvOBTAMXeta5zrY4s2r1gOO6CNhc8b2+vd6JBWRKE6qbnJzGPG+flJAENsltSenwfR
 MORBo9M2W8pHptWFkZF51+N3UQE0TDgPv7h1W+iN9iPWWqx/7pjUkfDTnocjmILhXG
 zbMkp8diYXB/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HoC/0IDx
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: move seedrng init
 script to S01
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

On 2023-09-30 15:42 +0200, Peter Korsgaard spake thusly:
> We want to initialize the kernel random number generator as soon as
> possible, as early init scripts may also need random numbers (E.G.
> syslog-ng in S01syslog-ng does).
> 
> Seedrng was presumably only using S20 because the previos urandom script
> used S20, which (after som moves) dates all the way back to:
> 
> commit 8262508fc4456b5230216473ea14c897268ba791
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Fri Apr 26 22:01:43 2002 +0000
> 
>     With this update, everything now works as expected.
>      -Erik
> 
> Seedrng needs persistent storage, but mount -a is run before executing the
> init scripts, so S01 should be as good as S20 - Atleast with the scripts in
> upstream Buildroot.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/urandom-scripts/{S20seedrng => S01seedrng} | 0
>  package/urandom-scripts/urandom-scripts.mk         | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/urandom-scripts/{S20seedrng => S01seedrng} (100%)
> 
> diff --git a/package/urandom-scripts/S20seedrng b/package/urandom-scripts/S01seedrng
> similarity index 100%
> rename from package/urandom-scripts/S20seedrng
> rename to package/urandom-scripts/S01seedrng
> diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
> index 32f3e09343..89abdfff72 100644
> --- a/package/urandom-scripts/urandom-scripts.mk
> +++ b/package/urandom-scripts/urandom-scripts.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20seedrng \
> -		$(TARGET_DIR)/etc/init.d/S20seedrng
> +	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
> +		$(TARGET_DIR)/etc/init.d/S01seedrng
>  endef
>  
>  $(eval $(generic-package))
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
