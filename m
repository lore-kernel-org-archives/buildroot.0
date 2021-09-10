Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A91C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:15:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AB660F5D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82AB660F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E49B40673;
	Fri, 10 Sep 2021 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5kaVVRmShcM; Fri, 10 Sep 2021 20:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BDFA4061D;
	Fri, 10 Sep 2021 20:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11CE91BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6054061D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOrni0nZNfgB for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:15:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F29BD404E1
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:15:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A250E20039E;
 Fri, 10 Sep 2021 22:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631304951;
 bh=0L+zAssh8O+sJMT6D1yudAnFHGxhl/wg26ktnWUKEjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLjIM3yBHNH+MEKRYoUIxdjaLdYVNrn+iLfgI5E+8gGjUkaxqfB4HhPpBgs9mlsee
 gMcXYpJY6DFNW6EOJZnQzP8JIs7wO/ftpVqGu3svkeqtZ6DCKykwlKhvlynXiqdFiw
 w1Lq4G/GyomIL2x5asrCB+A/SQ2mUzgcgEC740iOuypa2CqvmPuRuPGc+vZJc03Nye
 86hJbvNV9mn9azmZlijPg79TxwpJdigf1+GP1RvFgOceYR+lpLsBjLgfBsxDrhPAK7
 yURLcLhLetjvDxL6evY8Sy7s7CMR7HCS/YOeCE28rBpcFrBVWEnuSZle+q24dLaGCN
 NsIujEs/ehX8A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 22:15:45 +0200
Date: Fri, 10 Sep 2021 22:15:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210910201545.GC1053080@scaer>
References: <20210909091453.2005878-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909091453.2005878-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/sox: install to staging
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
Cc: Adrian Amaglio <nainformatique@gresille.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

giulio, All,

On 2021-09-09 11:14 +0200, Giulio Benetti spake thusly:
> From: Adrian Amaglio <nainformatique@gresille.org>
> 
> Install header files and libraries into the staging area.
> 
> Signed-off-by: Adrian Amaglio <nainformatique@gresille.org>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: reword commit log]

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sox/sox.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index dcc1a670b4..d462eb8722 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -10,6 +10,7 @@ SOX_SITE_METHOD = git
>  SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
>  SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
>  SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
> +SOX_INSTALL_STAGING = YES
>  SOX_CPE_ID_VENDOR = sound_exchange_project
>  SOX_CPE_ID_PRODUCT = sound_exchange
>  # From git and we're patching configure.ac
> -- 
> 2.25.1
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
