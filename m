Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E80C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3D061074
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D3D061074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D84C1401D1;
	Sat, 18 Sep 2021 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRcHGjDrZn0U; Sat, 18 Sep 2021 20:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC66B40162;
	Sat, 18 Sep 2021 20:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABAA91BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B420828F7
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAIvzNLjdXks for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:14:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E1AE83F6C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:14:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E711CB0053F;
 Sat, 18 Sep 2021 22:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631996085;
 bh=t0+Nonqmr3yV1t2tNvxBxoRIKVFr4RrIs0NistZRruE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vgw6IjfVxa2ZnVDQXmrrBPrLexCd4J67EOr8Mu+pzsscNInsbdJT1D6JllXXUmHXC
 7Yja/qQ8JtjIJwHCSriDO1heHM4cc7JfeRw6q14HA8ilPNAgHXse3ryEG7zjCYqWdQ
 BTmGLOmTHzsJ0pzgkoi1xAVSVkZfUB3jt2OtCSRtgJHpOnY8zwetB3/HHgy5VWrku/
 8oXTtff3MJSpbt0o6/qJxonPSaf2r9LbNFpK9nfzZVGdQG3qLSQ5UsUq6pHirs8hea
 +7WrTbDc8PbkLN4RYn2veLfUGBQMhq9w2AOODn2xW8QWPnE2Z25s4JdCUYs3HFJDxx
 dXmXM/O2LuEag==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:14:38 +0200
Date: Sat, 18 Sep 2021 22:14:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918201438.GO1053080@scaer>
References: <20210914210036.29189-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914210036.29189-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/3] package/ell: bump version to 0.43
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-14 23:00 +0200, Peter Seiderer spake thusly:
> - Changelog (since 0.41, from [1]):
> 
>   ver 0.43:
>     Add support for DHCP Rapid Commit feature.
>     Add support for DHCP authoritative mode feature.
> 
>   ver 0.42:
>     Add support for constant time security functions.
>     Add support for manipulating DHCP leases.
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series of three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index 2ff8889506..316d3fb81d 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c  ell-0.41.tar.xz
> +sha256  b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc  ell-0.43.tar.xz
>  
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index ec31e68088..261dc1a6db 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ELL_VERSION = 0.41
> +ELL_VERSION = 0.43
>  ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>  ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>  ELL_LICENSE = LGPL-2.1+
> -- 
> 2.32.0
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
