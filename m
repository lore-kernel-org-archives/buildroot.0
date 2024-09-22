Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48256CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0875081358;
	Sun, 22 Sep 2024 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da0dJXTDBreq; Sun, 22 Sep 2024 10:08:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF5480E67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF5480E67;
	Sun, 22 Sep 2024 10:08:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2B861BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF6D80E67
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22_ccdtiWJsn for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 834D780D15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834D780D15
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834D780D15
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:08:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65A6740003;
 Sun, 22 Sep 2024 10:08:20 +0000 (UTC)
Date: Sun, 22 Sep 2024 12:08:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240922120817.73b13ea6@windsurf>
In-Reply-To: <20240922092312.2061358-5-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
 <20240922092312.2061358-5-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726999701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mr511yRUXHsmopkkEOfa/DpvylXYqSUSACg9m9GDl4=;
 b=lrRy04VytZeCkyC5IRauJ59BE8+mo4i8PYYyPEbzEYWdx0z8zQ0ti6gozrZo0/MGXQJhVB
 TcJ6/qEl0gv9nprmDoUoC+C2Mgn4QuP79adl3z673690M0xuHNelHrSnOHMZkJe5VfX82T
 JrikyBFOyDbkhYX1IVl+jd+0JI+HqWAdbkuu61tx/1XpfR3IQrkhn+flImpePZSYZgxtJy
 Ywo8Cum1SGwi59q6fiIuuMCuq5HedIDnrYDS3W8e4dHRyPzlNqmEAZrN8KtJReVOuGXhYh
 HJK521CWnLa0TYwldBfktFqd5ufeRS951JwbpqwVJ12es+ssmHEZPyAe7gbYYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lrRy04Vy
Subject: Re: [Buildroot] [PATCH v2 4/9] arch/arm: add support for FDPIC
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

On Sun, 22 Sep 2024 11:23:07 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The target name for a FDPIC toolchain must be
> arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
> and requires a special case.
> 
> According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
> possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
> available on all ARM platforms, not just no-MMU.

but then I guess the tuple would not be arm-<vendor>-uclinuxfdpiceabi,
but something with "linux" instead? Did you test this support for FDPIC
on MMU systems? Unless it has been tested to be working, I believe I
would prefer to allow FDPIC only on noMMU systems, for which it has
been tested.

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
