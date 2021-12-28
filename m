Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF8FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 17:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECD1040010;
	Tue, 28 Dec 2021 17:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHSEvqDXsI7P; Tue, 28 Dec 2021 17:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0865B4023B;
	Tue, 28 Dec 2021 17:14:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B28B1BF42E
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 17:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29F2460ADB
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 17:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTRcS8OIpuVA for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 17:14:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC8E66066D
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 17:14:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 726CFE0006;
 Tue, 28 Dec 2021 17:14:48 +0000 (UTC)
Date: Tue, 28 Dec 2021 18:14:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228181447.2a42dc86@windsurf>
In-Reply-To: <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 28 Dec 2021 18:07:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > An important (and unfortunate point) is that apparently mbedtls3 cannot
> > be installed side-by-side with mbedtls. At least that's what your
> > "depends on !BR2_PACKAGE_MBEDTLS" seems to hint.  
> Indeed, both versions install their headers in include/mbedtls.
> >
> > This is a major annoyance, and I'm not sure how Linux distributions
> > will handle this migration if they cannot have mbedtls 2.x and mbedtls
> > 3.x installed side by side.  
> 3.0 was released in July.
> To my knowledge, hiawatha is one of the first package that uses this
> new API and buildroot will probably be one of the first build system
> that will provide mbedts3.
> IMHO, being unable to install both versions side by side is pretty
> common: we had the same issue with libupnp 1.6.x and libupnp 1.8.x.
> Concerning libupnp, we even had to revert the possibility to install
> both versions side by side because it was a "burden to programs
> linking against libupnp":
> https://github.com/pupnp/pupnp/commit/07f504c61bd9e4d93eb3d373ffc8527cafe0b9af

I'm not sure to follow you here. The fact that it's pretty common
doesn't make it a good solution. It makes the transition period
absolutely awful.

With the currently proposed approach, someone who today has a working
configuration that has hiawatha and belle-sip can conveniently build
both in the same image. With your patch applied, this is no longer
possible, due to hiawatha now using mbedtls3, which cannot be installed
side-by-side with mbedtls.

This doesn't seem very acceptable for us, and probably is even less
acceptable for major Linux distributions.

Has this been discussed with upstream mbedtls ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
