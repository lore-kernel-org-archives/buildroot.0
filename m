Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A3CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5809661076
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5809661076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FCD960687;
	Sat, 18 Sep 2021 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HwHZ2WZZEiH; Sat, 18 Sep 2021 20:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE8C6067F;
	Sat, 18 Sep 2021 20:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4751C1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F6F83F8B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 424BeEnxo0s1 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5418783F6C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:15:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9E7CCB0053F;
 Sat, 18 Sep 2021 22:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631996113;
 bh=Eh7Bnp+ZQfuIGH2mlmsFxZIxfwKIL0OkdKT/V48bETY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADmtoOfB1RP75bOxvdJMtGs9orb/TSrsz+75OIIpk4F473Ye5BfsdfoeqPsTsICeY
 MzHIuwEm5GHwl8gw2CKC3/jHNSuyjmL7TzV/VN9TSuKeWdX8Mj5aMPv1bPMUHWrHiH
 I/Fw4RTxcFolK8W5zDB8q1m35/NNLpH/OfUPsBx1eI71xLpDgVYRUdzrpTziPAuyWQ
 kbA0viI66139X7G/g6tSKTVu6KvVBBvTBTL7J634WtQyyxQrfHNTozTvgtCmvoEAFu
 pL6xHjeiEab0gwG9KsOevi+Hx4s+V+WQDYNBLOtOv8OSw/bQMZO7lueTjs4uR03SL8
 TYZHlxhgjUnow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:15:09 +0200
Date: Sat, 18 Sep 2021 22:15:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210918201509.GP1053080@scaer>
References: <20210914175351.21107-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914175351.21107-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/feh: bump version to 3.7.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Petr, All,

On 2021-09-14 19:53 +0200, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/feh/feh.hash | 2 +-
>  package/feh/feh.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/feh/feh.hash b/package/feh/feh.hash
> index 3a2296ac23..07c0dd9403 100644
> --- a/package/feh/feh.hash
> +++ b/package/feh/feh.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256 437420f37f11614e008d066e2a3bdefcfc78144c8212998b2bacdd5d21ea23b4  feh-3.6.3.tar.bz2
> +sha256 57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
>  sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
> diff --git a/package/feh/feh.mk b/package/feh/feh.mk
> index f27509330d..3aa509abfe 100644
> --- a/package/feh/feh.mk
> +++ b/package/feh/feh.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FEH_VERSION = 3.6.3
> +FEH_VERSION = 3.7.1
>  FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
>  FEH_SITE = http://feh.finalrewind.org
>  FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
