Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BFDC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF1E82A0B;
	Tue,  6 Feb 2024 17:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72uK9ByzV6Xi; Tue,  6 Feb 2024 17:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491FE82B5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491FE82B5E;
	Tue,  6 Feb 2024 17:53:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 253951BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E567541FBD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E567541FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgrN1y8yYJeX for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:53:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0D8841F9F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D8841F9F
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3B60C0003;
 Tue,  6 Feb 2024 17:53:02 +0000 (UTC)
Date: Tue, 6 Feb 2024 18:53:02 +0100
To: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Message-ID: <20240206185302.75f46cf6@windsurf>
In-Reply-To: <CH2PR12MB500494BC58558496ED6A78B3F0422@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-4-neal.frager@amd.com>
 <CH2PR12MB500494BC58558496ED6A78B3F0422@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707241983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdv+uNB3BRwyFvaLYqwUBMNSkwx2YB6Cly1SkN2lSeY=;
 b=XyyNqOI0sMetpj8pOCtjYGfJVBtAxLB5NSNrLv/ESrJPlnm9pYKqq/bbZmsysmRNbV3c8D
 +KpeNr1KORllcqtGpqjIiBKhtu9zqp66WhAPYsPAMl6Bdl9ErngiaIz2DitgKF1+oRP5SS
 xxGixG74Qg4/lDMoiyzDWyII5HFot9YhN46C+XcCUAe6nk7EBHSbyVa+qU18TZKpQxSdy8
 aNBAO4WFwxAy5AnImG9efMWg6HtC0qyFE1Tl8YvCaWBvI1SVReMYclR8loZtWeOS383jDn
 MxT7f/SmFW7fu3iPJlNZO1GTEQOKe4xtb0iNf75ZOpYp1WRGNdyCEb3jszrdRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XyyNqOI0
Subject: Re: [Buildroot] [PATCH v9 04/11] package/newlib-bare-metal: new
 package
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
 "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 2 Feb 2024 12:11:29 +0000
"Frager, Neal via buildroot" <buildroot@buildroot.org> wrote:

> 1. Thanks to the binutils 2.42 release, we do not need microblaze patches
> anymore.

Excellent!

> 2. I chose to keep the newlib fixup. Even though the --with-tooldir patch was
> accepted upstream, newlib requires autoconf 2.69 for this patch to be applied.
> So rather than including a version of the patch that works on the output
> configure script directly, I thought it would be better to just keep the fixup
> for now.  We can remove the fixup with the next newlib release which will have
> a configurable --with-tooldir option.

I think it's a reasonable trade-off indeed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
