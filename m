Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3603C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BA860720
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59BA860720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C47605B3;
	Sat, 24 Jul 2021 21:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJyzEfqr4n3S; Sat, 24 Jul 2021 21:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B749605A3;
	Sat, 24 Jul 2021 21:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2791BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9477403C3
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rN5FLOC7RZEz for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:03:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3CFA403B4
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:03:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D19307802FE;
 Sat, 24 Jul 2021 23:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627160625;
 bh=1FFTbRVCG89w8G6VACnMPM7q0PIazpH0jNLJL55IGVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLdTSZoeRBNavrjdJ2j1UY/Gchgrh7dm2Y/NlQYypaEtma/vNIMuZLqglRk7gc1rh
 SxpstjBEbxYiuqro452BT5SXk9ag1Y7UfjGvVOhjGJjEBKLsgIXUKpd6xcXn3QsYTz
 QgNNYxT3KvVqE285XWG6vC5aI+/ufnd8VF/TVXWykor0TzFBYvZMp+QNy+g4zt8DwA
 gcfP9hoWAbpivYh8bAVrxto2A733qk94y8ghyvzOfppvomWDOkX9cMp1j/g5y0rcjO
 93I+mvONFiZswC6GAC10XkLjhoQx2SNFLCcIAje3qApc+B+toFjqsMTnK/fv53KnwE
 TG0jDEsS+Kt4Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 23:03:41 +0200
Date: Sat, 24 Jul 2021 23:03:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniil Stas <daniil.stas@posteo.net>
Message-ID: <20210724210341.GJ2382418@scaer>
References: <20210724204801.1073334-1-daniil.stas@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724204801.1073334-1-daniil.stas@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Daniil, All,

On 2021-07-24 20:48 +0000, Daniil Stas spake thusly:
> Change sources location from bintray to github since bintray doesn't
> work anymore
> 
> Signed-off-by: Daniil Stas <daniil.stas@posteo.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Backport to: 2021.02.x, 2021.05.x
> ---
>  package/htop/htop.hash | 2 +-
>  package/htop/htop.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> index 647feabb8e..e9eb5daf4d 100644
> --- a/package/htop/htop.hash
> +++ b/package/htop/htop.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
> +sha256  4c2629bd50895bd24082ba2f81f8c972348aa2298cc6edc6a21a7fa18b73990c  htop-3.0.5.tar.gz
>  sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index aa2ff24750..dd801b0dc0 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -5,8 +5,9 @@
>  ################################################################################
>  
>  HTOP_VERSION = 3.0.5
> -HTOP_SITE = https://dl.bintray.com/htop/source
> +HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
>  HTOP_DEPENDENCIES = ncurses
> +HTOP_AUTORECONF = YES
>  # Prevent htop build system from searching the host paths
>  HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
>  HTOP_LICENSE = GPL-2.0
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
