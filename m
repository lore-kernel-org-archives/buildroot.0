Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9385C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5B7610FD
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F5B7610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B394240413;
	Sat, 18 Sep 2021 10:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQ4iKvtrA_xS; Sat, 18 Sep 2021 10:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8D240330;
	Sat, 18 Sep 2021 10:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFB701BF48B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B639C400C5
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJkQ63bKkl6g for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 10:28:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7654E40019
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 10:28:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A8C91B0055E;
 Sat, 18 Sep 2021 12:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631960906;
 bh=ZknHHHoOjAJ8VpevzYsndn1CvLv1HTAcfaVp30OnPU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoLRQHeDqyGVgRQx7GebpeOad5/4xnnUraDhTLdcePXFF36lxxiVGoo/fqP3XB51z
 jtZBRclfhwrJb0e9ox9epELfrxt7HQBAGXTJha5MHauPYIrut2O/i52zetcOQEDNVn
 qCZwYQHlSm/xLDpnV1D0OJwxaEvZLqNcFYWX1mFWx3lhf8e7x+aWb1L4ArDNWS89do
 5iasLkYVGzHOkOFhgCm5Q2V9CelMctvD/az6Zf8FB8j2JYYFGNVU+t6h+aEZHY9X9y
 ojtSih4db1YqQWUThtS4OIBDElPA8nDQF0dthieJmqEzsEARhAuT3O0/DSe4O9ZDVQ
 fjWJiGbrREJAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 12:28:19 +0200
Date: Sat, 18 Sep 2021 12:28:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20210918102819.GJ1053080@scaer>
References: <20210918070214.2527F8436A@smtp1.osuosl.org>
 <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-09-17
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Edgar, All,

+Romain

On 2021-09-18 10:19 +0200, Edgar Bonet spake thusly:
> The autobuilder wrote:
> > Detail of defconfig failures for master
> > ---------------------------------------
> >
> >                         defconfig |                        link to the job                        | orph?
> > ----------------------------------+---------------------------------------------------------------+------
> >                       aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248798  |      
> >        acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248800  |      
> > [...]
> 
> There may be a problem on the autobuilder. Most of those links point to
> build logs that are truncated, and do not show any error message.
> 
> I just tried one of the failed defconfigs (acmesystems_acqua_a5_512mb)
> using the exact same Buildroot commit as the autobuilder did
> (c483318d09). It all went out smoothly.

If you look at the top of the build log, you'll notice that hose
failures all occur on the gcc160 runner.

I'm adding Romain in Cc ; IIRC, he already noticed something fishy going
on with gcc160. Romain?

Regards,
Yann E. MORIN.

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
