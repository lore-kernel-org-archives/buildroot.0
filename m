Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8A2C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7F8607A5;
	Mon, 19 Aug 2024 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feSDUq0-jb-Q; Mon, 19 Aug 2024 08:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7916C607B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7916C607B5;
	Mon, 19 Aug 2024 08:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7095D1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C169404F6
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJudrtXcPvqp for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B00640132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B00640132
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B00640132
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:39:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F76BFF80C;
 Mon, 19 Aug 2024 08:39:55 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:39:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240819103954.5810fdd8@windsurf>
In-Reply-To: <CADvTj4pX3pQQavPnVyzR+R92DsjjJ0+SBoD8wXuhBk4drJmFrA@mail.gmail.com>
References: <20240819040213.3563422-1-james.hilliard1@gmail.com>
 <20240819102733.13fccbc0@windsurf>
 <CADvTj4pX3pQQavPnVyzR+R92DsjjJ0+SBoD8wXuhBk4drJmFrA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724056795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MldaSUMKx7/lxiI38bgfZPWKrCVS1UUemuTZBwwptBc=;
 b=Jb2oY2vVGSPr8P8zApFbG50NoQ69IojRQLvd6VRvF6BCUFQswc3+NnfhdyaLYkLzoNjOBc
 sLJSzSyxiaFWIYxzyrPcUHlmO+nWg4eJnzHCZyvbrsfoFEKRo+rePuCoxqGmGGtiybV6Ii
 uVQp7adzTgT5xfnlYInolPvnQEACTv8EoQE/1VObbgvA15YrnA8URWdjNmvitBpu2JePe8
 LhZOpyX9BXuj7FMJKqpZHYdmbgcUPDujnl23az0cfpe0sNHOFJfUqWLpyFYTSo+OcGh5E3
 BtF3HoObRajAir0wsYnj18HzHhbG22uzA18ynPYLiE53qLWk2zGB3pKfalfk+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jb2oY2vV
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 19 Aug 2024 02:31:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Is this fixing a build issue? If so, which one, which defconfig? Or
> > perhaps an autobuilder failure reference?
> 
> It fixes an issue where the flashlib cli was not being built at all,
> only the library was for BR2_SHARED_LIBS systems.

So there is no build issue, but parts that are expect to be built are
not built?

> > When was this problem introduced?
> 
> When bumping flashrom to version 1.4.0-rc2:
> https://github.com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285fc6fcf378c26b

Thanks. Could you clarify both aspects in the commit log?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
