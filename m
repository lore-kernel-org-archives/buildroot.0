Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADCCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF8C8129D;
	Sun, 22 Sep 2024 10:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEaxB3UD_bjS; Sun, 22 Sep 2024 10:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5ED813A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5ED813A6;
	Sun, 22 Sep 2024 10:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCECA1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BA34061C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f48HQ-VtLRb0 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79A8D40619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A8D40619
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A8D40619
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:14:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18A3FFF802;
 Sun, 22 Sep 2024 10:14:33 +0000 (UTC)
Date: Sun, 22 Sep 2024 12:14:31 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240922121431.3fa71502@windsurf>
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727000075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTkok7P4bg0EbOJD/FPCmMtfigtpL+ElrPvjA97QQag=;
 b=U8GTrAhQmn4YtYZbvVlJRXK6Unjn+LwZBJySTAv/nJfHKEagYh/O+RqchlcBIWoQsV+gO8
 72nqA9p2Dvr6yRwLhEgvx0pnEZA4gHOmBZlDhvJmupckfB9FoIhpDbPV40iUJgXswr2AQb
 4EnnWkbht519ucVXZzcSBQtJBckcGoluMKSnPDJfk2VoL6FdA51TgHqZ2J4fvOCcxQxmxU
 4sDprgZquSsX031IxqSAp4RSW/sciwlUrtba47UQ5P4WrFltUGGaCRtV9IobTrj44btmjQ
 nUTfAy19iEc6krTuR1NIpzNdfCD5UN4IuVC7JJHqVP9MaaZYtYBCxeSCQiH10A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U8GTrAhQ
Subject: Re: [Buildroot] [PATCH v2 0/9] add ARM FDPIC support
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sun, 22 Sep 2024 11:23:03 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Dario Binacchi (1):
>   configs/stm32f746_disco_sd: new defconfig

Aside from this defconfig, it would be really nice to have a defconfig
that allows to test ARM noMMU (both FLAT and FDPIC) with Qemu. Could
you, and perhaps Waldemar, check what the options are? I had a quick
look, and it doesn't seem obvious which ARM noMMU platform supported by
Qemu is also supported by Linux. I vaguely remember at some point that
the versatile (or vexpress?) platforms allowed to boot a noMMU system,
but I'm not 100% sure.

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
