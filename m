Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B1FC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A643403E2;
	Mon, 15 Jul 2024 10:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0bndcZw2Ulv; Mon, 15 Jul 2024 10:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AECE403F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AECE403F8;
	Mon, 15 Jul 2024 10:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97EDE1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90B278120C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIBBVSDv-ajX for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74AC481120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74AC481120
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74AC481120
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:52:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1CB81BF208;
 Mon, 15 Jul 2024 10:52:39 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:52:37 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240715125237.04908049@windsurf>
In-Reply-To: <20240213114933.2444440-2-buildroot@bubu1.eu>
References: <20240213114933.2444440-1-buildroot@bubu1.eu>
 <20240213114933.2444440-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721040760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jY8HaICyoSYeqs4HqFF5LEOLq5nDHQIIUsmE1EYQ3k=;
 b=JLrnHJwg+ysSV/ZCarb78a9diWLeMem6aWPy91czHIyu6eYY32b4lM9JJC02x3bH3/etCf
 nLvoYSGprGHZ1Dk9aWGnPfc5F1Nx0jjiGGNMehfiQaF9d9B5V4Q4H9VpH/3wpUq5GQK5a+
 zHDO2vC1IDs9x+vHFQGzz69PX7eGoo2dWEPtUyrz6bkl26L0b0IcsnAzIaO5k3MG2CT3lI
 lawqP7LRVUcLRBNYD4hyW7gzmdHLZR8qU1xCTw4CQbfvMqjdJ6NWACRoUaOS+o+BnityNU
 p6/H4zdM5J4FwI6zwrn7DCUuh9WKEwGDZcAk6+ZCUQRssGzVPLPi97hCLoSkKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JLrnHJwg
Subject: Re: [Buildroot] [PATCH 2/2] package/tio: disable installing man page
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Tue, 13 Feb 2024 12:49:32 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Remove the man subdir from inclusion in the main meson.build file.
> 
> Reported upstream to get an option to disable this properly:
> https://github.com/tio/tio/issues/222
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

I did not apply this patch. Indeed, man pages are anyway removed at the
end of the build, so we don't really care that much if they are
installed. Of course, if there's a convenient option to disable
installing manpages we can use it (and upstream has added one following
your bug report, and therefore once we upgrade to a newer release that
has this option, we can use it). But when we don't go through great
lengths to disable manpages otherwise, *except* if building the
manpages requires some additional tools that would bring in extra
dependencies into the build.

So I've marked your patch as Rejected. Feel free to use the new option
to disable manpages at the next version bump of tio.

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
