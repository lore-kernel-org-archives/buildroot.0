Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A7E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046F860F76;
	Mon, 16 Dec 2024 20:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnxze6g3Qjgy; Mon, 16 Dec 2024 20:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DCC860901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DCC860901;
	Mon, 16 Dec 2024 20:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A884FCE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85AFE406A0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iL10M8nNDD44 for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 20:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F56640662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F56640662
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F56640662
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:56:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37C2EC0004;
 Mon, 16 Dec 2024 20:56:05 +0000 (UTC)
Mime-Version: 1.0
Date: Mon, 16 Dec 2024 21:56:04 +0100
Message-Id: <D6DFB2M8HLES.RY7H0ZIZNUBO@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com>
 <20241216213605.17b86ffb@windsurf>
In-Reply-To: <20241216213605.17b86ffb@windsurf>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734382565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GE4JNwfRkcafVHUEB314MJTgDg3bu49SsYil2WdfMI=;
 b=V4FvoJPj9NE8B0g67FHmTMws+KkQelxAu47tBuIXEFJ62/1+kKQb9UxOgxMFJuGGzDC+mG
 Kq8MsBPLEC+qZ/5gPK07iF/E/15W3mALrrxaHNwfRCYjGNruXt3B+bM7ybSi+rF9CdmTeo
 auhKYRfIYu9pHH7BOvcuQyMIISH/oRHY1lhJibM2SBDn7D1CJQwj7jS1XE98cBypYWCTKw
 qm8BDJFgihFjAx2haNxPyGTyFrDJbXdaN/b/Cz9wZtO9Vvct8UAhH8dKfsxFjkaVfSfRf/
 3UNjRE3ZotXI3I037MPoDZfRqKggCcgzGa9aGKpjStFbtQiLB5H3QRUaSeWOJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V4FvoJPj
Subject: Re: [Buildroot] [PATCH v2] package/libsha1: Fix gcc14 compilation
 in libsha1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon Dec 16, 2024 at 9:36 PM CET, Thomas Petazzoni wrote:
> Hello Thomas,
Hello Thomas,
Thank you for the review !

> On Mon, 16 Dec 2024 18:48:29 +0100
> ...
> > +
> > +Upstream: https://github.com/pseiderer/libsha1/commit/d449f26f782be91b3847f88ed2bd937582a575b6
>
> This should ideally...
>
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> ... go here, i.e right after Peter's SoB, but before yours, as it's an
> information added by you.

Ack

> But more importantly: https://github.com/pseiderer/libsha1/ isn't
> "upstream". Upstream for this package is
> https://github.com/dottedmag/libsha1. So we're interested in seeing
> the change having been submitted or accepted by the real upstream, not
> just a commit in some "random" Github repository (even though Peter
> Seiderer is a well known Buildroot contributor!)

Ok so a link to the pull-request is probably better here according to BR
documentation.
(https://github.com/dottedmag/libsha1/pull/1)
However, in this case the PR may not be merged soon given the date of
the last commit applied to the upstream package.

> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
