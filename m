Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1974FE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BCA60853;
	Sun, 29 Dec 2024 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QixbkWdJGpDo; Sun, 29 Dec 2024 20:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA61605D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA61605D1;
	Sun, 29 Dec 2024 20:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED18C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F7924038E
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaqSJsS6lMTB for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D49864055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49864055A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D49864055A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:00:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 951DCE0002;
 Sun, 29 Dec 2024 20:00:13 +0000 (UTC)
Date: Sun, 29 Dec 2024 21:00:12 +0100
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20241229210012.7a99bdc3@windsurf>
In-Reply-To: <87ttamwmbj.fsf@tarshish>
References: <20241229131711.707899-1-thomas.petazzoni@bootlin.com>
 <20241229131711.707899-2-thomas.petazzoni@bootlin.com>
 <87ttamwmbj.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735502414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPof/HKnXiIt1wMcBfZWR9TQJgMo3txVoV+X19ksgok=;
 b=aY0vaFx58j0u8M6kXkKX1uoeMja6+fppIk6Q6FWhHpppeqWPY+bjqTeQJRN5LgwAUwO4Qg
 TiaqXRWNhc6tSRud9Qw80YjPgviN89gPJPBB7EvENJlO44W9m2JyzrAtau5F+dWw/ec/33
 WDx8XeIP8u7IULvDe8wHGW/FNhxQE0AZKehHrZd7QR8Wwt0H3Fw7FpsU7Kl2ToUxi7/MAX
 pWcEB01uTBr2ROXEz3jH8YUJYQ0avTu4/j56W8WJ8cxc3ggrmhZo+j8Df1LAxL1iIf4n2z
 yFwSD1tiIt0PGHZyGE32ss8eNQBf9fc2ElROaGCXrX5/wZEz6NkaTxSYMqRs7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aY0vaFx5
Subject: Re: [Buildroot] [PATCH 2/2] package/procps-ng: bump version to 4.0.5
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

On Sun, 29 Dec 2024 17:17:20 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > Patch 0002 is dropped as it's upstream as of
> > 263fe04f9ed6f3f40fdb7ce249221e03dc926c9b.  
> 
> With both patches dropped, is autoreconf still necessary?
> 
> In any case, the comment at PROCPS_NG_AUTORECONF needs update.

Hm, you're totally right. Let me double check this and send a v2.

Thanks for the careful review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
