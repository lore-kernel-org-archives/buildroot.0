Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D7DC02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42DB0840CE;
	Sat, 14 Sep 2024 08:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLo45QcN6D_u; Sat, 14 Sep 2024 08:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D78A846EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D78A846EF;
	Sat, 14 Sep 2024 08:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7B71BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0C940558
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSGymSIDhDQS for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B76984023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76984023E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B76984023E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:05:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D88081C0005;
 Sat, 14 Sep 2024 08:05:21 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:05:20 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240914100520.65e5b0dc@windsurf>
In-Reply-To: <20240908182856.422176-1-dario.binacchi@amarulasolutions.com>
References: <20240908182856.422176-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726301122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7mXh4CuDN+9JQjMc86TzhMwKRnSrZCjSXs5g/4Mouo=;
 b=IcPHGlAUOvldDrH2uAWwKJsIKuzFEqgRzjkHsJ1axHB+aKJ6o8PkEOOQwkkGGH4DhAVLHT
 yF+lnF+MLLGFshaEzqUZHnKQinjcUyYP9MNKJY4yjZraxxt38CriOOGn4zgRiR3djPu2t6
 fQndB8WxbwjTAge9HXboQzjcSaM+UhahURKMDjlou9oCE2FMQd2JtXUUpuVI4XlTlv0eTx
 UXl8wRa18dQ2rlGeGXc1kzIo5EGFDju3okNz7E3NEkVxJIdJVzoOFAATf7Y9Q8pp90jS6A
 k2wS+9AxDxBbwQtb3XsSdtJDBqfJJFqsJH+53DiSS1yKVOys1gGNVsMKbD7Fug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IcPHGlAU
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: fixup download URL
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
Cc: Romain Naour <romain.naour@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  8 Sep 2024 20:28:56 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in [1], https://xenomai.org/downloads/xenomai/stable has
> been moved to https://ftp.denx.de/pub/xenomai/xenomai/stable.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/83061154a9c21ecf981fdf5b4c02be6a793a8e56
> 
> [1] https://lore.kernel.org/xenomai/95d4f7a6-1237-4ae0-9fb6-3979fa058bcc@siemens.com
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/xenomai/xenomai.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. It seems like we're at 3.0.10 for Xenomai
v3, and the latest is v3.2.4. And also there's the new Xenomai v4 (but
which uses a different approach if I understood correctly). Our Xenomai
packaging is not very well maintained unfortunately :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
