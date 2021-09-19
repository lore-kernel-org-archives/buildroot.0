Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A4DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:29:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F88761074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F88761074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CAC04023D;
	Sun, 19 Sep 2021 12:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlL99CYE6ACy; Sun, 19 Sep 2021 12:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 305C14024A;
	Sun, 19 Sep 2021 12:29:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221941BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8EF4023D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJCtxmD8znUm for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:28:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E68A4016C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:28:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B3AEC2003B4;
 Sun, 19 Sep 2021 14:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632054536;
 bh=E5ed9J7nlSp/odzbI4kILoVRXD49b+exdwDFJpzbiJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s5zL8gOvIymSKTFAbo20wOaF42hM8mJ6zvI54BM9CnpEGMbdlIuNG2nD7cul/49s7
 xduLXh1UVFqYtYd8b1JWOQbwmj1d2flJkVvTCwV0XuTjGD3gUg8AdASNbpxyek4n3O
 574ljZRF0A4Q0PFVt43VrQWIeRhzRc9li4uQ8Ru3mnYjbBomKdbcj/5u8T6LZphyd6
 sPhQMTmlq7i+NS+0+pc0yiAQS/7aBmY8/7c/KmX2qKLTiGGoKfxOy+klmV8dfnDdj0
 cTZNvX5rj2e1Dh42d+ArNiZz+zIdCAi5ErMYVzQqt8KSpDsrn1Inr+QIiXi0humZZm
 coELuvtPJjPMg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 14:28:45 +0200
Date: Sun, 19 Sep 2021 14:28:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210919122845.GT1053080@scaer>
References: <20210919114547.103955-1-yann.morin.1998@free.fr>
 <20210919140237.6cf62fa5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919140237.6cf62fa5@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] toolchain/custom: hide away incompatible
 gcc versions
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Thomas, All,

On 2021-09-19 14:02 +0200, Thomas Petazzoni spake thusly:
> On Sun, 19 Sep 2021 13:45:47 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Some CPUs have a requirement on a minimal gcc version. Until now, ot was
> > possible to use a custom external toolchain that has a gcc older than
> > the requirement, which would lead to build failures (early!) during the
> > build.
> > 
> > Propagate the gcc version requirement down to the external toolchain gcc
> > version choice. By limiting the selection to acceptable gcc versions, we
> > inform the user that its toolchain is too old, and if they decide to lie
> > and select one of available version, we still check that when we extract
> > and install their toolchain.
> 
> I think there was a reason to not have these for external toolchains:
> they can use patched gcc versions that support newer CPU cores that are
> normally not supported in the same gcc upstream version. It was for
> example the case I believe at some point for Linaro toolchains.
> 
> This argument is not necessarily a strong disagreement against your
> patch, I'm just stating why I believe we hadn't done that in the past.

OK, I see the point, and I agree.

> BTW, has there been some recent issue that prompted you to write/submit
> this change ?

No. I was looking at the mips CPUs entries, and I was just looking where
all those BR2_ARCH_NEEDS_GCC_AT_LEAST_xxx were used, and  suddenly my two
neurons collided one with the other, and made me check the custom
toolchains...

But OK, as I was also one to lift some custom toolchain limitations to
account for backported features, the current situation is fine.

I'll drop my patch.

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
