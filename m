Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063DFC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:21:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E68160E92
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E68160E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74235606A7;
	Sat, 24 Jul 2021 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IeLOg3C1FML; Sat, 24 Jul 2021 21:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BABA1605F7;
	Sat, 24 Jul 2021 21:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7D0B1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D450640372
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kVQVV7w9NaP for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:21:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A421240350
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:21:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A8BD7802FE;
 Sat, 24 Jul 2021 23:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627161670;
 bh=5CWNkKzC76LxmjSyDaUOYWJoHuvZdM7zC9NAeJzvviE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L9OwCNNx+OsQi0nLYx9Vq6IW2hA+Y/gAoJWFZWwejJc3GjfkoQyhgQGrRk/wsBrBR
 yNttUvynpnPNpRg8uxObEJg6BQD+dwb0MXsf2QN0xO5vYzTIMms4oQHOL4XpZs61eI
 Z/+GFkV9iByAFo9272YAtZUSvizRjKw7rUFq0xiEbw6e18qcf1jivRPuHam6x7ahav
 TSKTZdi8Zn/3+JnSt0jJ018lQ42oDLsAZJ/uFNv/NkUtE85R7GgspzZL4pD7jo8+Zr
 x4Y+lroRrA6hrVCXvdlaLWmDeygTZOQ+YC2J9kgt/xi2JagKhwZjV5HlO+km1BXyYr
 oL8qZP9fFgLoA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 23:21:02 +0200
Date: Sat, 24 Jul 2021 23:21:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210724212102.GK2382418@scaer>
References: <20210703194001.693553-1-thomas.petazzoni@bootlin.com>
 <20210704080555.GA2521@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210704080555.GA2521@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] boot/, linux/,
 package/: improve help text of kconfig packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Simon Dawson <spdawson@gmail.com>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-07-04 10:05 +0200, Yann E. MORIN spake thusly:
> On 2021-07-03 21:39 +0200, Thomas Petazzoni spake thusly:
> > The <pkg>_HELP_CMDS variable allows packages using the kconfig-package
> > infrastructure to display their specific targets related to the
> > handling of their configuration.
> > 
> > However, it was not consistently used and handled by the different
> > packages. This commit makes sure all packages using kconfig-package
> > have that help text, and that is does reflect which targets are
> > available/usable.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> I wonder wy we can't have that generated automatically by the
> kconfig-package infra, rather than repeast it in all packages.

I've now sent a proposal for review:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=255056

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
