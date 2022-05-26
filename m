Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765B8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 13:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4C861473;
	Thu, 26 May 2022 13:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUGVGF5RdORD; Thu, 26 May 2022 13:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF7C6145F;
	Thu, 26 May 2022 13:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221921BF3EC
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 13:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10E09403B7
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 13:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCYqu1MvuINK for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 13:47:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86AA14023D
 for <buildroot@buildroot.org>; Thu, 26 May 2022 13:47:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15C341BF205;
 Thu, 26 May 2022 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653572815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRuhIF3GYlpFKQNIEnyilVZXY3NWvbF9HCerXlSwCTA=;
 b=n9TsYlD+AV3UChs8VbCrPmb1fX/UhGvdLY9nQZsm7U2ZeC8MFyPsl4ihIXn4htjBYrcyci
 4PP1dloinOeg4/gBEOGDJ7qJPAGtvkOF5Rnfaljm2QfwDDRJcR5YPOgk32Py42mJfJWaFG
 d1c0r4lRN2Sfa5R9bgJh6e+XL0xYK196k9zAGnBT/ueNOp9hoAZkQ3ytp17aY0aB1ffDQZ
 jkrSU+IVfFxDEJtkCEgcuUMmBglnlW2R04/oOgTk0C+4VC2PV/8cViMjqvWPraHQEs4Kj4
 OuPiSzc172PX3emLWcWoS6Di2EQrIl0rAa9eN1svyR2ARnozNAql2zRGEbQanw==
Date: Thu, 26 May 2022 15:46:52 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220526154652.030eeb4f@windsurf>
In-Reply-To: <CACPK8Xe2LB_LNd0zVneLKd+eNmZBqvKX4cuZgqgTpkQPBmyR=g@mail.gmail.com>
References: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
 <20220525234312.643dfc03@windsurf>
 <CACPK8Xe2LB_LNd0zVneLKd+eNmZBqvKX4cuZgqgTpkQPBmyR=g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 26 May 2022 02:17:19 +0000
Joel Stanley <joel@jms.id.au> wrote:

> > The problem I see with this is that many external toolchains do not
> > provide Go support. While this will probably evolve over time, this is
> > not something that we can reasonably require right now.  
> 
> I use arm64 and ppc64le hosts for my buildrooting as they are the
> fastest machines I have access to. Neither are supported by
> go-bootstrap, so moving to gcc-go looks like a win for me.

Indeed.

> Likewise, we don't have prebuilt toolchains for those host CPUs so the
> question of external toolchains is not a factor.
> 
> I appreciate that my situation is unusual.

As Yann Morin suggested in another e-mail, maybe we need to support
both situations:

 * Building Go in 3 stages when using an external toolchain that
   doesn't have Go support. This would mean building Go 1.4 with the C
   compiler, then building Go 1.16 with Go 1.4, and finally building Go
   latest with Go 1.16.

 * Building Go in 2 stages with gcc-go when using an internal toolchain
   (in which we can enable Go support) or an external toolchain that
   has Go support.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
