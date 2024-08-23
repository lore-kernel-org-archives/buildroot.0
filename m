Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B901EC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F26D81EF5;
	Fri, 23 Aug 2024 14:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qaz7P2Mo4Kn0; Fri, 23 Aug 2024 14:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E27581EF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E27581EF8;
	Fri, 23 Aug 2024 14:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5691BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85B374047D
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwkwFK82YBYW for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4424B40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4424B40025
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4424B40025
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:32:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 586F5240003;
 Fri, 23 Aug 2024 14:32:23 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:32:22 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20240823163222.16448eef@windsurf>
In-Reply-To: <20240823084040.74851-1-huth@tuxfamily.org>
References: <20240823084040.74851-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724423543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prY9Fizx4K5reQUsb8x/wurmnjlxtfaUhpg2RJQDYAo=;
 b=foN117qqt9M+8/MIBulpxEJCDFKXoxlrQJ0fKG9iaLPg8/++eiL36ySc6h85NWWlFZDm1g
 7KQN5EFKwdeDDHY0EZvs75ZRsbey2k5au9fPYcyAlyVwWr8wxIz9As+jrJM6KefhsVrpqp
 gzEe9Kf/5HXz+katLUTi4msNC26/MHNFzUy/jdNgY5qfL94E//L4gnPFABwxrqKZaIvVEF
 17TMR0TRAs3HsPPHMSGONUDYrCmWMq9LHs2qb/JeRMgacKGzsDaS9NQfCxYg9G0t+dFLk/
 z249VVgS2KPgj1zAa/MK9JGvFXwCVl+DeVLdjMeoL1DoYwpskJTPSzh9vZSUaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=foN117qq
Subject: Re: [Buildroot] [PATCH] package/frotz: Remove the "frotz" package
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

Hello Thomas,

On Fri, 23 Aug 2024 10:40:40 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> I'm not much interested anymore in maintaining the "frotz" package
> in buildroot, and since I likely was the only one who really used
> it in the past years, I guess it's time remove it now.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  In case somebody else want's to take over the maintenance, feel free
>  to ignore this patch.

I was initially tempted to reject your patch, as frotz is still
maintained upstream. But this package causes some build failures in our
autobuilders, so I opted for applying your patch removing frotz (after
adding an entry in the Config.in.legacy file).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
