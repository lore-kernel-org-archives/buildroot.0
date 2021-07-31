Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:11:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4CF60524
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D4CF60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C64783498;
	Sat, 31 Jul 2021 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZBhrgww_4Md; Sat, 31 Jul 2021 07:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9590783459;
	Sat, 31 Jul 2021 07:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE891BF873
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 07:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BCA86072A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 07:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DcU1Wk2YB9CT for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 07:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AB52606E6
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 07:11:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A60707802E5;
 Sat, 31 Jul 2021 09:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627715496;
 bh=rUVst538JSHyKAAlQbiM2C7rzUD/3qL6DopnlsAGlIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qy0X7UNdjwky9RbbNbEAhmh1LTWSUyBFee0jRmRfZ+RZdvptBCnEzfxDVnNW2d9HX
 Lsvqu/FpAyJ3JTnMdp7N90OH73gkw1VG/89zVQs9I8ua7L22bNAj4bvYWstau+boeq
 Rz6QKbsIGyj6ozL53II0p/grzB6+CLnXqpxXN3dJErubg17KHbzVPbbWPcs9pbN7rh
 QvLX6dY9nPe5xb5ElOhKHkNKBKE4usMAAqnD4mTOoYEZ8P4xZ3OFupPFaPzWT4b1e2
 Uk30nEnHhqzyPkZaQZAKGoakQTXo+3+HXM1pcODW7GjY+NSC4uf5ZfwSTd2k7KOTtE
 A+FUIsXh2u/FA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 09:11:29 +0200
Date: Sat, 31 Jul 2021 09:11:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210731071129.GH3189549@scaer>
References: <20210730103908.11270-1-eugen.hristev@microchip.com>
 <20210730234234.31bc6aa0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730234234.31bc6aa0@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, Eugen, All,

On 2021-07-30 23:42 +0200, Thomas Petazzoni spake thusly:
> On Fri, 30 Jul 2021 13:39:08 +0300
> Eugen Hristev via buildroot <buildroot@busybox.net> wrote:
> > Update to AT91Bootstrap 4.0.0 version.
> > This package is now released under MIT license.
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> > -AT91BOOTSTRAP3_LICENSE = Atmel License
> > +AT91BOOTSTRAP3_LICENSE = MIT
> 
> While this change is correct for at91bootstrap 4.x, I don't think it's
> true for at91bootstrap 3.x, so I suppose this should instead be
> conditional?
> 
> The problem is... what should be the condition? Indeed, testing on
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION vs.
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X is not working, because the
> user can specify a custom Git or a custom tarball, and there we don't
> know what version is used (3.x of 4.x).
> 
> I must admit I don't have a good idea here.

This is exactly what we do in the other packages in that situation: for
known versions, we define the appropriate licensing terms, and for
custom versions, we define nothing. See for example:

    boot/barebox            only license file is conditional
    boot/uboot              both licensing terms and license file are conditional
    boot/optee-os           only license file is conditional
    linux                   only license file is conditional

And a few others I have forgotten.

So in this case, we'd hav something like:

    ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
    AT91BOOTSTRAP3_LICENSE = MIT
    else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
    AT91BOOTSTRAP3_LICENSE = Atmel License
    endif

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
