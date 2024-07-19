Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A096C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 345AC4022B;
	Fri, 19 Jul 2024 07:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv53oTCS4TXH; Fri, 19 Jul 2024 07:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A5840413
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A5840413;
	Fri, 19 Jul 2024 07:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08381BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDEAC40413
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9cOFWFYMycX for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99E4C4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E4C4022B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99E4C4022B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:30:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 429F46000F;
 Fri, 19 Jul 2024 07:30:04 +0000 (UTC)
Date: Fri, 19 Jul 2024 09:30:03 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240719093003.079a5f90@windsurf>
In-Reply-To: <CA+h8R2osC5ok1g3UYL_2iuSJwF0wKNQiHexsEUaCjLHWuzF6Rw@mail.gmail.com>
References: <CA+h8R2osC5ok1g3UYL_2iuSJwF0wKNQiHexsEUaCjLHWuzF6Rw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721374205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcHfSNUcpvHRXFKcL0BeOvrAP89DPTqowDD5lklU4x0=;
 b=MO0ymF8yYwhwTJ1aL1u2H+YVJOrum7mq/9kFCps4cGbswKpSFdOkRNaQi/KLfNYXWf6ugY
 z4R342AR+ef7+8bkKwPFDZqZzhp3d9zgdxmcOx5L3gc//4iUU/IhzUwRo1Wjxy+akZOrjT
 aABl2rFlTxDsMMwu+IagrZ47Q02PXOYd2t6sqtIUoPy9o0vyI4lixKIGfwA1tORm+C98Gu
 uD0u8O/MVC4nHJYhBgWQsLk4o7evdOmJ1oLLXCeu/IiiY9CRo9DPdH+sK67G00wkrOnYiJ
 WJ6rxcILJOsl2c5EVoq1C8q+tkV59BkiWiE6QlN8Haqk+zi3znvBR2Qk9qzqRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MO0ymF8y
Subject: Re: [Buildroot] git send-email via. GMail API
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

On Thu, 18 Jul 2024 21:44:08 -0700
Christian Stewart <christian@aperture.us> wrote:

> Using GMail, this has caused a lot of issues with SMTP:
> 
> - Leaking personal IP address in emails
> - SPF validation failures
> - Email marked as spam
> - Needing to use an app password
> 
> I have written a program `sendgmailapi` which sends via the GMail API.
> 
> https://github.com/paralin/sendgmailapi?tab=readme-ov-file#setup
> 
> Hopefully this is helpful to others developing Buildroot with GMail.

Thanks, seems useful! Perhaps something to mention in our
documentation, in the section "22.5.2. Preparing a patch series", which
already has some details about "git send-email".

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
