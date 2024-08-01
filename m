Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC02BC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D898202B;
	Thu,  1 Aug 2024 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1JpzCUfV4Hq; Thu,  1 Aug 2024 21:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE6A82039
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE6A82039;
	Thu,  1 Aug 2024 21:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4091BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B50082039
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZICkTXdfB4QQ for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED28D8202B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED28D8202B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED28D8202B
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B637CFF804;
 Thu,  1 Aug 2024 21:38:19 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:18 +0200
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20240801233818.41e20f0f@windsurf>
In-Reply-To: <20240731235548.1792330-1-kris@embeddedTS.com>
References: <20240731235548.1792330-1-kris@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwG6EeS6zLP5vzN6kvlxuPZrmQrrKJ01TRvfFNGdSD0=;
 b=KypJYHtHQ2ZJIuwfLx22y36LzvbqXPW3HDZ8ydyhqIn4OYA342re6sAbJf5f+/eHetkZa+
 ibvS15xFvGbXXEm1jAU7/7n/gsk07guIoAaSsoQG0AAZxWjc8IMBperSfs9FOXG52ut4Ly
 wlAflodHDNKEUzRwsLoiAyVYjTDY/vKJjIfeOG2xjVPA2GdyGzqvim3OvKhSghTTN3Z6xH
 0BlEb8XSNqDzLv3y+3XROv4F8S63PKs8wJMocDP2X5+i/bUQ5Qy470A8agDLFMrFJSTUxH
 3zP0GD+az3g4K2maJzprtwYjGKIKsPmpKYVr+XcF27oIdVuwBPSifIy9g/Yu+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KypJYHtH
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: bump to
 linux4microchip-2024.04
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kris,

On Wed, 31 Jul 2024 23:55:48 +0000
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Latest update from Microchip's kernel.
> 
> Removes Buildroot patches and instead incorporates these directly
> to a community branch of the repo. Also adds a check in wilc-driver.mk
> to use the new linux4microchip-2024.04-community tag when
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4 is true.

Could you clarify why the code in linux4microchip-2024.04-community
doesn't work on older kernels?

> We investigated the potential to use backports to make maintenance
> easier as I mentioned, however it did not work out as we had expected.

Not sure what "backports" you're referring to here. Backporting what
from what, to what?

> I'm not sure if I did the kernel dependency check in the most elegant
> way. If there is a preferred way to handle that, please let me know and
> I'll happily make a revision.

The version dependency check is annoying, which is why I'm asking above
if we could get away with it, which would be the best solution.

> -WILC_DRIVER_VERSION = linux4microchip-2021.10-1
> +# Set up driver version based on kernel headers
> +# See the project's README for more information on this
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4),y)
> +WILC_DRIVER_VERSION = linux4microchip-2024.04-community
> +else
> +WILC_DRIVER_VERSION = linux4microchip-2021.10-1-upto-linux-6.6
> +endif

Unfortunately, we cannot use the kernel headers version. Some people
use external toolchains that have possibly a bit old kernel headers,
but they may be running a very up-to-date kernel. So the only option I
believe is to do like AUFS in linux/Config.ext.in, with an explicit
choice.

But that's also going to break badly with autobuilder testing. So
really, if we can use a single version for all kernel versions, it
would be much, much, much better.

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
