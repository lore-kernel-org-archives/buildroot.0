Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EFBCCF9EF
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 659CE84ADB;
	Wed, 25 Sep 2024 20:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HGDgMS5F1ZG; Wed, 25 Sep 2024 20:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B855884AD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B855884AD5;
	Wed, 25 Sep 2024 20:26:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5BB1BF340
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D71440413
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5U3zWirx4zhh for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 20:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E157B402F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E157B402F4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E157B402F4
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 20:26:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47E3CC0004;
 Wed, 25 Sep 2024 20:26:14 +0000 (UTC)
Date: Wed, 25 Sep 2024 22:26:13 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Message-ID: <20240925222613.3f62ed72@windsurf>
In-Reply-To: <Zuk_RMVJAzqVO5s8@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf> <Zuk_RMVJAzqVO5s8@ryzen.lan>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727295974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QXYS6iP8bV3DnPqtWFEzojfp14bVDltL2SWlOy2guM=;
 b=QVqqOsGzzYlIW42jVgUsIhgIiWbIfUr0QvAQabuHJFBrVxWRrektS3PJ4qurUYt3cjSw0S
 9nykEgEPTLoN5YNmw36ucckKSHLotGosr58hwSlVVL+laQYQ7oT+qPxwYfLj1ksDKHG9Bd
 cXeYvFgmQ3FN+6Ceh1o64j0FfwC5AEHuDkh+spk293ruMLVsg4iq8RMpokYReXfeC4v1O2
 7MWBsTtZHKhLP5h+yzDgzBwV7n01WON02M3jJeRkOo51Vg6o0GneoBwuHzlxbIQd38DLix
 4gSiMilb0mgpr4bDsseiOT+8tqR0z5EecmkqhpomZnZlSt5z566wgH45Z5IkHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QVqqOsGz
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

It was nice meeting you during Linux Plumbers last week!

On Tue, 17 Sep 2024 08:35:16 +0000
Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> > This won't work because the output directory is not always output/. But
> > I believe this is useless, because you're creating an image of what is
> > the default environment. So basically, you should instead not create an
> > environment image at all: just tell U-Boot that the environment is at
> > offset XYZ (or even better, in partition X). The environment partition
> > will contain nothing or garbage, so at the first boot, U-Boot will use
> > its built-in environment itself, and at the first "saveenv", it will
> > save the environment to the designated partition.  
> 
> Well, what happens if you simply point to an offset or partition that is
> empty, is that uboot will see an empty environment, so it will see bootcmd
> as empty, so it will just enter the uboot command prompt without booting
> anything at all.

This is not what should happen. Indeed, if the environment on the
non-volatile storage is empty or corrupted, U-Boot should ignore it,
and load its built-in environment (which is compiled into the U-Boot
binary). Why isn't this working for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
