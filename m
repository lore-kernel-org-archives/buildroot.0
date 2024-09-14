Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79384C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A598401C2;
	Sat, 14 Sep 2024 13:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ0kieUkridT; Sat, 14 Sep 2024 13:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE9624020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE9624020B;
	Sat, 14 Sep 2024 13:12:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45DAC1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409FD4020B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9c1cxtGdg4q for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6341401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6341401C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6341401C2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:12:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C46A7780518;
 Sat, 14 Sep 2024 15:12:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 15:12:31 +0200
Date: Sat, 14 Sep 2024 15:12:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZuWLv2Xe1qn8G0sO@landeda>
References: <20240914095501.194725-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914095501.194725-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726319555;
 bh=dMIRMTEDQpGTi/VLtLfXhVMMhDkmnf9k/jmfJYpBgWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saTN018VW4g1zZK/3wwtfebNl5lZTUDkEoOJJxcrCwXZPs6r+Y4Z1vbI8GqQSg4P2
 +i9iX/cuFVWLR9j1B6vBT5fUJFu7MRj8VJJO2PlfYJP+GT5/QdnXSb45PhXmjGr0Zg
 mwN6SyUISw0r4DBp0/EPJZWPo7CIpmxd7N/xHlk8Wa3JXZuPFpoXHPiV68GQH/pbyZ
 NGImb1JXuI/1/0VoE2sFvORax35b06xYYNPovhoPMaR+y93738YBEYj/c+gBH4Ig9M
 tQehPYM89fOLXwH0cY3WnzL1R1brf+dP9BKfdh6pcvpvKRLdvTezKStETOyvr81P3F
 X7NCJUBHtznPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=saTN018V
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-generic.mk: legal-info:
 create redist directory for override
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2024-09-14 11:54 +0200, Arnout Vandecappelle via buildroot spake thusly:
> Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
> possibility to also create tarballs for packages that are local or
> overridden (i.e., with a custom version). However, it forgot to create
> the directory in which that tarball is stored. The original patch did,
> but it was reworked by Arnout to use mk_tar_gz instead of tar directly,
> and the mkdir was dropped there.
> 
> This failure was silent because the mk_tar_gz function doesn't exit on
> error. The following error was printed but ignored:
> 
>     support/download/helpers: line 68: .../legal-info/sources/busybox-custom/busybox-custom.tar.gz: No such file or directory
> 
> Create the directory before calling mk_tar_gz.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>

You confused me with the other me. ;-)

Applied to master with the proper reported-by assignment, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 171163dcb4..69352b3730 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1163,6 +1163,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>  	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
>  		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
>  		 $$($(2)_BUILDDIR)/.legal-info-rsync/
> +	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
>  	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
>  		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
>  		$$($(2)_BASENAME_RAW) \
> -- 
> 2.46.0
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
