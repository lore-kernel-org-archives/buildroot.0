Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA5C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E14780BCD;
	Sat,  3 Aug 2024 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApdMY9STpgmo; Sat,  3 Aug 2024 20:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4022781291
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4022781291;
	Sat,  3 Aug 2024 20:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1061BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8E4F402B1
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD1i2v7NUAo6 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 781B04035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781B04035D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 781B04035D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:30:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 590551C0006;
 Sat,  3 Aug 2024 20:30:04 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:30:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803223003.2ba59a8f@windsurf>
In-Reply-To: <20240803104735.2574298-1-bernd@kuhls.net>
References: <20240803104735.2574298-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/MSeKByGLvHad5Wn6nbt44PZXdG2+XYU2EBgWs+SGc=;
 b=flP0ORqxJlujJU/Yd1F6qDjhYMrp/y6r+BI5VTZ18QBZf7Z3ibJcorMZU1gyLkrjfrEk+9
 xcnEpC6tVIS86SU9iaculwbnqvHqMefe7mo2g20ETgzA4esqWPMh5/rBps5dRcBQb69LDL
 uNBR7ZPs3Km3MDinEfN3kfEVla771F1fIb0qyyPj2zastFpvF22shj9Rmv42Yb2XQX6i+p
 /nmqdhbwL+srEAPXMRtpwHsKJZmIZujLAXgTwjKYV8PXLZsLL6tmbKy86YH9/IRcOxM280
 gxp8ZHZxOf7bQ9hfqN0WUDcwLt7XLI06/GI839a1Q/5uFyG7WuNfPtlU8EkwBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=flP0ORqx
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.3
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

On Sat,  3 Aug 2024 12:47:35 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/libass/libass/releases/tag/0.17.2
> https://github.com/libass/libass/releases/tag/0.17.3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libass/libass.hash | 2 +-
>  package/libass/libass.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
