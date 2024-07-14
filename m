Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE6EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6E040372;
	Sun, 14 Jul 2024 20:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4SjAlvIRIFC; Sun, 14 Jul 2024 20:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE4A40390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE4A40390;
	Sun, 14 Jul 2024 20:29:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAD181BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8E0060631
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tautgSjcLFVd for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65DF8605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DF8605B0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65DF8605B0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:29:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4129260002;
 Sun, 14 Jul 2024 20:29:41 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:29:39 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714222939.20f9d3f2@windsurf>
In-Reply-To: <20240712124956.3925574-3-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720988981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I42FjEkP10w2JThTkWbQgiFU4J8e3lfkJblaVP2cDnE=;
 b=DRcnVriaeffW221f2eX7U7P6Wu1AW//fXUnLR8DBEqgOC+TiKREh+U0JlXiTgTfF5jd+//
 j91Ho7KxfnbJ8JDIrrwf5zo9PLaZYTK6UamH+HFP5f9P4BbphZ9Prlwo7qv/SIqj5tw/9m
 vBS5aiGEkA0H0m/VWDgTRHGsVp7iZH+jxu0XDDzPVaYLBRy9qe2y8O6OTxarEwOJ/w7RD0
 4Lh6NtSD1oTedBPrBKf8ri99y3CZ41o+FNCAE/ANEMbrloPL1b5u/aoJzs4TgrGvMNJbyg
 8Lu5WsBjU0EHrmXzLBUp7tuQxtWDzZsN+meP1I00S3zmn5XTWqOJEHQi7FMzpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DRcnVria
Subject: Re: [Buildroot] [PATCH v2 2/6] package/busybox: tidy up S01syslogd
 init script
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Fri, 12 Jul 2024 14:49:52 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The manual refers to this script as a reference of how init scripts
> should be written. The changes are:
> 
> * Use long form options for start-stop-daemon for clarity
> * Use --exec on stop to ensure the right process gets stopped
> * Avoid --quiet for clearer messages on failure
> * Wait for the process to be gone during stop
> * Avoid fixed wait between start and stop on restart
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied, with one change. See below.

> +	# Wait for process to be gone, using a loop and --stop --test
> +	# because Busybox' start-stop-daemon does not support --retry
> +	# (as of 1.36.1).

I dropped this comment, which isn't really useful, because it basically
repeats what the code is doing. The fact that we can't do X or Y or Z
isn't very useful, and I didn't want to see this comment duplicated
into each and every init script.

In fact if you want to include this information, I believe the
Buildroot manual would be a better place, in the section where we
describe a canonical init script.

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
