Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6526ECFA44F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21708400FE;
	Wed, 23 Oct 2024 16:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkbvJjWI7vBW; Wed, 23 Oct 2024 16:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1920C40113
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1920C40113;
	Wed, 23 Oct 2024 16:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E272072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0648240113
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaP31ArQD5Jz for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC6D9400F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC6D9400F7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC6D9400F7
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:22:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8FE31BF207;
 Wed, 23 Oct 2024 16:22:04 +0000 (UTC)
Date: Wed, 23 Oct 2024 18:22:03 +0200
To: Bryce Johnson <bryce@redpinelabs.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Message-ID: <20241023182203.70b00e29@windsurf>
In-Reply-To: <CADXxVSLZVC_BagdEePyLLV3_DAOytuCj46tzWWoa8N5ai=Z0mw@mail.gmail.com>
References: <20241022210334.261117-1-bryce@redpinelabs.com>
 <20241022231736.7e5626ef@windsurf>
 <CADXxVSLZVC_BagdEePyLLV3_DAOytuCj46tzWWoa8N5ai=Z0mw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729700525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGyRn+UHevdgwJhSeNaD++KA7ULmg52ladIfk+U0MrY=;
 b=N2St0z0bIlCucBtdFK/u9xa3dY6loiMk9XJOLlWA8wCtwSuziPc5YRNXexBsWcJgspAKun
 gxNu/liIWDbG8oJ2BjukRYnIcoWhQFAFsSuQuqxQ03Pi34Gui6CMXo7eAVOnG3QADFrxB8
 /XUlzCh9zBf5HmJxxel1+UsIGZDa8rcgNJA5zak1YokDOchOojOisBuy6zzkdEepQoDrup
 Yv5ImmXoRUWuVynHr8WEBI66Ka7aBOQPfwIBBi1ELthVsk6syuYRjX/4VzFzrXVeP/EA2F
 AaApdA7fekMSVy9CwqpFNOE3nOGLW2NqfU2Or6hg19WNQUK/F7vJOnHvp28rBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N2St0z0b
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so can be built with aarch64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryce,

On Tue, 22 Oct 2024 15:37:51 -0600
Bryce Johnson <bryce@redpinelabs.com> wrote:

> I'm looking at that as well, but figured I would start with this
> easier change to make sure I followed the contribution process
> correctly.

Sure, makes sense! I see you've posted a series, I'll have a look!

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
