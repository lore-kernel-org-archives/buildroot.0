Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA28C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAD881F01;
	Fri, 23 Aug 2024 14:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2-ZkgK-EkQX; Fri, 23 Aug 2024 14:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A58481F13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A58481F13;
	Fri, 23 Aug 2024 14:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C447B1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B18004047D
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTbOvXFHb_Yk for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EDA140025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDA140025
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EDA140025
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:28:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2CF7E000B;
 Fri, 23 Aug 2024 14:28:22 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:28:21 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20240823162821.6e63644d@windsurf>
In-Reply-To: <20240823083150.74230-1-huth@tuxfamily.org>
References: <20240823083150.74230-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724423303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG3fiw6CzRL5CkAamtrp/8zag3FcxqR0Z/za2Yrf4EM=;
 b=FtNz7SNcYjVvofjQw2X4nTYWpPZVHQWv2EUb4CkTPTBvg291QYz7NkO9CiGCvEu1F61hfP
 d+g85EbpUBeoOx86nmgd2YMtZGuCYsA2b6ZlrRUZMAljtWSZ9eZZIvo6xoXROYvhdzB6SY
 gnBxniP8ugK0RVeDcg4VNlEzFFs9wKHPYyGsbipmDhQTMyOdvqPCV3NVeLQLcM16L3bgiv
 j+g/6UZVjPag5vuIunFo8O8aUSfulcT24MoXMZKyJ1dFQyHU7wAVzXCXQHSiSBL5BrKHpO
 56UmlvIj12IQ70rwEnE/P9wVyhO4lI1SwnhbAbTkoEK33jMTucbVuljHIOtwYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FtNz7SNc
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Drop some entries from Thomas
 Huth's section
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

On Fri, 23 Aug 2024 10:31:50 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> I lack the time (and interest) to properly keep these entries up to
> date, so drop them from my section.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  DEVELOPERS | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
