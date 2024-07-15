Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28808C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2044032A;
	Mon, 15 Jul 2024 19:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H92zEEK-fyZl; Mon, 15 Jul 2024 19:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2503B402B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2503B402B8;
	Mon, 15 Jul 2024 19:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDC31BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D975403B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYl1Sg0wWa3A for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25A9E40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A9E40373
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A9E40373
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:24:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1581BF204;
 Mon, 15 Jul 2024 19:24:44 +0000 (UTC)
Date: Mon, 15 Jul 2024 21:24:42 +0200
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20240715212442.367a9df9@windsurf>
In-Reply-To: <27d046a7a40bbc72279aac3e5971d8d58842b55d.camel@embeddedTS.com>
References: <20240715180236.664036-1-giulio.benetti@benettiengineering.com>
 <27d046a7a40bbc72279aac3e5971d8d58842b55d.camel@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721071485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6zAp7ZKJ/sGXJB9k+xv8QJx00BhcBOmRbazdjdBumg=;
 b=RsyXtIStqKYr193OE36ZmxAJHC/3QuvmyPmVzyHzRnog9CYNdcdFNjhA+fKOILT8x7Vugs
 4nMN+Z/zClRSOVUaHKx3I24v/RJE/g0BT4R4s8a8V3XaavglgPFk/AgafHck3ZMI0NPk85
 O6vQFj77xT7V0B06wDeisQUZGjwDVDXE1CsQR8q9ejkn6G5tFapRQtDNyHatXLvofv9Gx7
 ixNL9z/9nn27jdIygPuVr/MxQX0w75mmupiOlBwgoAQU+1PAWyOb3fJ2d1GOAAw7yw9z9m
 Qx5TQvXkg+JqWr8tqY6XFocwGDtAedCE8UzG6FBaFM/aA1QLTVxAKW5kJ/u+FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RsyXtISt
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: bump version to 2024.04
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, kris@embeddedTS.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jul 2024 11:25:13 -0700
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Be advised that this does NOT support "up to" Linux 6.6. The latest
> updates from Microchip drop any backwards compatibility support, which
> is why we have not pushed this up to Buildroot yet.
> 
> I think this only will support kernels 6.2~6.6 and currently do not
> believe it will compile against upstream Linux 6.9 (I tested it a while
> ago but don't remember the outcome as it wasn't important).
> 
> As I mentioned in my previous email responding to build failures, we're
> working on a solution to be able to handle backwards compatibility with
> 'backports' but are first catching up on other tasks.

So what can we do in the mean time? Support a few versions of the
driver, and let the user chose?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
