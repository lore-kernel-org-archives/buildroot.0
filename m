Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66D4CEE348
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7758C81322;
	Wed,  9 Oct 2024 20:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuhGuNuLrD4P; Wed,  9 Oct 2024 20:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790B48132A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790B48132A;
	Wed,  9 Oct 2024 20:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667651BF3E1
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 627656077F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J19YzeWdIFn0 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 20:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41B5B6075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B5B6075B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41B5B6075B
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 20:38:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 083C220002;
 Wed,  9 Oct 2024 20:38:22 +0000 (UTC)
Date: Wed, 9 Oct 2024 22:38:21 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20241009223821.582ad875@windsurf>
In-Reply-To: <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
References: <20240927235259.2046297-1-james.hilliard1@gmail.com>
 <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728506303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUjLjaDo/3+LzjyujdcErXQhDcpu1GPi+vR+Cec/FYs=;
 b=Ep8U3R8qTPkZ+mhM6PYWerdLDge0YX8rWBkUTeUKXoUlmxWMZWMkDyCagBYm3LqzEpwVZ5
 tAStkN5LIh49jdf0HdGNj385uPJoov8a+3CbafA+cXdc5LYVU+hr5+3ank5+A+2uwTVe2O
 1uTNwwyJ41JGgZHalR6iQ+KXna0JBkezpD9USZC22I0hJ6c6EYtzOiMHKHUGFrIvdQmER0
 47F7iHHWHkqrBF2v/z6orj+mkZkvD1BQKzGY2A9BVAp9XImq63dIa6Tf723Z4wEqaTcJz8
 iMyZ847cD1Lb1EPuw2L2UOpiXDWOWR1crRAz2nufALGrpVZ5f5MCgTM9IQkzmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ep8U3R8q
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 build with latest setuptools
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Sep 2024 12:33:00 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> > Backport an upstream patch removing this module dependency.  
> 
> I'd prefer to see the update to gobject-introspection 1.82.0 merged
> instead, which already includes the patch. Though the backport could be
> a stop-gap measure if the update series needs any lengthy fixes. :-)

Fundamentally, I agree with you that updating GOI with your patch
series is the way to go, but as this build failure has been impacting
severely our autobuilders, we need an immediate fix, which is why I
have applied the patch from James.

BTW James, thanks for documenting very nicely in your commit which
Buildroot commit introduced the issue: this is *exactly* what we need,
and therefore it is much appreciated!

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
