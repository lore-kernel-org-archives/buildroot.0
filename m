Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2413C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:44:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D2760F5E
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20D2760F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F2B605CD;
	Sun,  5 Sep 2021 17:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6eLxHVpVgRy; Sun,  5 Sep 2021 17:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2145F605A8;
	Sun,  5 Sep 2021 17:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7802C1BF425
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6898740234
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fq4Edq8k9-TR for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 17:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 678A2401E8
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 17:44:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8df:59ab:c58f:7e9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40D1DB00579;
 Sun,  5 Sep 2021 19:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630863849;
 bh=t0syujZzZSuSE897LC9FtXmwoIR+IKe2Bz/NXzRNaHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uOOCE3lTkz+obrQ1oL3GGhbxIK81gD1w/dQW7sVTG/gU0f4NbaOaPeKaaupRcHcPO
 x8fcmI1/V83xkduz/uE0AHEScQCo9Xfo8dTzg8kgn+AssO5yq51uM8+sQTFo2hyJ/R
 nXwsOlma0EKrd5ddAy/I1NX7McbsrXGC+WMLKgmBHoIPPPuSMtcWcvpvwbBnwGzScN
 gukswvEotHhYRwMGB4DyWqcCYoh/N9uyWa1/vLAnnSKOP4VHqK2+7iFU0X6tqvDqKp
 Ev1ayAQvhXAojE6Vj2Jk4EUOXKIZRZYOG3LncJHi1PFVMhkSzRj6OrXiVb+obMu+Xj
 QBbsyz67VdFwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Sep 2021 19:44:02 +0200
Date: Sun, 5 Sep 2021 19:44:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20210905174402.GV1053080@scaer>
References: <20210905173446.44137-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210905173446.44137-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
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
Cc: Leon de Rooij <leon@exquisip.nl>, Kevin Tomary <kevin.tomary@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

All,

On 2021-09-05 19:34 +0200, Yann E. MORIN spake thusly:
> Version 1.46.3 had a regression, which meant the file that would store
> the filesystem image had to pre-exist, or mkfs.ext2 would fail to
> generate the filesystem:
> 
>     mkfs.ext4: No such file or directory while trying to determine
>     filesystem size
> 
> The regression was fixed upstream, and is now part of the 1.46.4
> release, so bump to that release.
> 
> Fixes: #14196
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Reported-by: Kevin Tomary <kevin.tomary@hotmail.com>
> Reported-by: Leon de Rooij <leon@exquisip.nl>
> 
> ---
> For the stable branch 2021.08.x, I'll send a different patch, that just
> backports the upstream fix.

In fact, 2021.08 still has e2fsprogs 1.46.2, which is not affected; so,
no backports needed.

Regards,
Yann E. MORIN.

> ---
>  package/e2fsprogs/e2fsprogs.hash | 2 +-
>  package/e2fsprogs/e2fsprogs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
> index 3661801199..63c7c9929f 100644
> --- a/package/e2fsprogs/e2fsprogs.hash
> +++ b/package/e2fsprogs/e2fsprogs.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.3/sha256sums.asc
> -sha256  86d1580facdd49f2e0e6b027e26b1e6c48af538762dc40aeed2a87153c1f11b7  e2fsprogs-1.46.3.tar.xz
> +sha256  b11042533c1b1dcf17512f0da48e05b0c573dada1dd8b762864d10f4dc399713  e2fsprogs-1.46.4.tar.xz
>  # Locally calculated
>  sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
>  sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 5528ecbc34..ca891066a2 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -E2FSPROGS_VERSION = 1.46.3
> +E2FSPROGS_VERSION = 1.46.4
>  E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
>  E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
> -- 
> 2.25.1
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
