Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C440DC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 06:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752F560A5C;
	Tue, 18 Jun 2024 06:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44nbIP0-fUuY; Tue, 18 Jun 2024 06:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7357D60824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7357D60824;
	Tue, 18 Jun 2024 06:53:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 817601BF284
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D35D820B0
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_vGND5AMkYn for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 06:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 378CD820AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378CD820AC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 378CD820AC
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:53:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 153C81C0004;
 Tue, 18 Jun 2024 06:53:39 +0000 (UTC)
Date: Tue, 18 Jun 2024 08:53:38 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240618085334.6db4e9fa@windsurf>
In-Reply-To: <20240615024513.GB58848@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240208112940.6fa6e89b@windsurf>
 <20240615024513.GB58848@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718693620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYXhcyIgQB4N1NxRUcFsSHkz9bO+xB3tn3VZq6340o4=;
 b=eF0SeCkgCkw9efktxcDOD9FrBBWDfovO3UFxbXgOQxsyXTr9Oy1Www4qWJpGfh9+spXu1A
 hh2j9ow3U79BeJzVPeIxi55xFJB3JHbu3cgDbmzXYEaD0WnlH8MwnKD7zy/mRipQ1Fq8CX
 ej6gseK+Oh938hY3VkGu4EBHOMeY/xlJh2rny5c+BvWeG7aDMxL/hPnrvKQXQmoHiKd5k4
 vyRmMmfl8fz7aEowh7efg3Y1pvbymJEcet42gqN5iAExskHAXYT5cUlvXpKa36iJP8Lm9g
 BsLsuxFsbmOKeL/I8iTp73dNhG/9Rc3+57YYokXE1exsAfmNW5ccJxLoddAI+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eF0SeCkg
Subject: Re: [Buildroot] [PATCH 0/3] Add support for the WPE WebKit RDK
 backend
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Sat, 15 Jun 2024 02:45:13 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> > Some from you:
> > 
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230423213001.2961215-1-aperez@igalia.com/
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230423213233.2961770-1-aperez@igalia.com/
> > 
> > Are they still valid/application?  
> 
> These two are no longer needed after the update to wpewebkit and
> webkitgtk 2.44.x

Thanks, I marked those two patches as "Superseded".

> > We also have twice the same (?) patch from Giulio:
> > 
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-1-giulio.benetti@benettiengineering.com/
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-2-giulio.benetti@benettiengineering.com/
> > 
> > is it relevant?  
> 
> I think these two shouldn't be needed anymore, Giulio sent a PR to
> upstream WebKit which ended up being merged [1] and it was included
> in the 2.44.x releases as well.

ACK, Giulio took care of changing the state of those other two patches
in patchwork.

> > Could you have a look so we can hopefully clear up the backlog?
> > Thanks a lot!  
> 
> My apologies for taking so long to reply, somehow I managed to let
> this slip ^_^

No worries :-)

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
