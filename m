Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC79CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A8A940A02;
	Tue,  3 Sep 2024 18:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-Bb28GIvheu; Tue,  3 Sep 2024 18:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C94FD40A1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C94FD40A1A;
	Tue,  3 Sep 2024 18:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBBBF1BF319
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF5BD40A1A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxpHaOPiBidC for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DB71404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB71404C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB71404C8
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:50:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A0D3FF804;
 Tue,  3 Sep 2024 18:50:16 +0000 (UTC)
Date: Tue, 3 Sep 2024 20:50:15 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20240903205015.06fd36ac@windsurf>
In-Reply-To: <20240903085745.2594893-1-michael@amarulasolutions.com>
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725389416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pL06Sgji06t3x05038t5Zj0K2pi7qKNX26+yymlkWmM=;
 b=gpONjQZehCDAF0QOKJ+YdowCOG1+mQ9WDaQo0iEwaq5oxMYZvKorqF4u0Pvi7nVmdSPZej
 Mk4MUEGXJolOyDs0nYB+9Gdkx6spjoBzbalZHqzor2OpXhzkbDAYr+JqEDjUWiL79yzja5
 PYXl/xI4LesezqGM6kniW13Eb8kA65IyQNfXwkLedvh69XaCB11pqWvxdbwtnzBJS2zFwS
 jApsgTo6sEL3PFsU7rmudo3I5eNMK9LtppPdMEUniY8Qe+re3MxEmNOQ+O7YQrywJI83sS
 42E4ltmqYAK+WMJPyvdtuHZ87CfnG7bA6lSVbKlU/FYHlDQmWQzNJiQUqOQ40A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpONjQZe
Subject: Re: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Sep 2024 10:57:44 +0200
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> Just a simple clone and pull with --depth 1 should be enough to parse the
> cve and generate the pkg-stats report.
> 
> From a full clone and a depth-1 clone, and the size delta is 2.9GiB vs. 2.2GiB.
> The download size does change: from 983.55MiB down to 270.78MiB.
> it's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
> V1->V2:
>     - Add statistics from Yann E. Morin
>     - Use git pull --depth 1 for update the repo

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
