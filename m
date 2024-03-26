Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EFC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2221040385;
	Tue, 26 Mar 2024 16:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM8c0OO643mH; Tue, 26 Mar 2024 16:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A39D4150C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A39D4150C;
	Tue, 26 Mar 2024 16:10:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF051BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2E681F69
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id En8L9GeV3zbc for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDBEA81F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDBEA81F60
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDBEA81F60
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:10:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AF6D2000B;
 Tue, 26 Mar 2024 16:10:21 +0000 (UTC)
Date: Tue, 26 Mar 2024 17:10:20 +0100
To: christian@klarinett.li
Message-ID: <20240326171020.1290064d@windsurf>
In-Reply-To: <2e226b32ddd0dbfde7aa120b5263c638@klarinett.li>
References: <20240228145642.436509-1-christian@klarinett.li>
 <20240228145642.436509-2-christian@klarinett.li>
 <20240326154434.7734ca6f@windsurf>
 <2e226b32ddd0dbfde7aa120b5263c638@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711469421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVDMNmh6KrQ+6S69UcPsrTYxHLWuAHTTYyjuGKjiJ8Q=;
 b=eLttuvobTYI4YBKkKyN1TtJOMx0k1E2d8XdyqvYUF5MfkIxvZZUvmE4h4nZuO4+n3cXomX
 JefLpx5RZERxmvi5Qpww988TnXs7M/W06nHaB0YX76XT0lf4FKxGFEzfixyUZJd88HALV5
 B9bu77CdElopEQyJy3OtH83AacgRaVqy+3VzS+OSwMHUrFXXRcGR8rGjqWSciqLdOd95H2
 jBz23iFavoj369tYoNN2Wi1e0JgLz1VEbRBpjtESufyvyB0aPOxSPYaIRrNIFAeN9HKf34
 03uXlFvQQDYIPlHNvVI8x3aVAftvCXc5YLhTT+BR6uoiTbYIjlSfS6Ry3idmLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eLttuvob
Subject: Re: [Buildroot] [PATCH 2/2] package/zic: enable installation on
 target
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
Cc: Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Christian Hitz via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue, 26 Mar 2024 17:03:20 +0100
christian@klarinett.li wrote:

> > Thanks, but for a patch like this, we definitely need a non-empty
> > commit log. Why do you need zic on the target, what is the use-case?  
> 
> When we configure a time zone on our device's GUI we use the standard
> time zones. This gives us the usual benefits e.g. automatic daylight
> saving time switching.
> We also need to support an API that wants to set the "time zone" by
> specifying the offset in minutes from GMT. The given information
> is not enough to reliably selecting one of the existing time zones.
> Instead, when the time zone is set over this API we dynamically create
> and configure a "Custom" time zone with the given offset. For this
> we use the `zic` tool on target.

Thanks for the explanation. I'm not too familiar with time zone stuff
(or in fact, I did have a look a long time ago, but I forgot the
details of how it works), bu your explanation seems to make sense :-)

> >> +define ZIC_INSTALL_STAGING_CMDS
> >> +	$(INSTALL) -D -m 644 $(@D)/tzfile.h 
> >> $(TARGET_DIR)/usr/include/tzfile.h  
> > 
> > So just the header file is needed, no library is installed?  
> 
> Actually, this is not required at all. I'll drop it in v2.

OK, then you can drop ZIC_INSTALL_STAGING = YES as well.

> Thanks for the review. I'll update the patch and will send a v2.

Perfect, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
