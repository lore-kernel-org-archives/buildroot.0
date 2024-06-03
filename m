Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA2C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B262405BE;
	Mon,  3 Jun 2024 16:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlei7X1bVzGQ; Mon,  3 Jun 2024 16:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E087405F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E087405F2;
	Mon,  3 Jun 2024 16:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D91C1BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1D382145
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfthsqyuHJM8 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A9FF820C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A9FF820C4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A9FF820C4
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:23:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E5F020004;
 Mon,  3 Jun 2024 16:23:00 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:23:00 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603182300.1573ce70@booty>
In-Reply-To: <20240603124737.222442-1-neal.frager@amd.com>
References: <20240603124737.222442-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPTYk14c5I3p4zWKy3bmkOLl/eAvJwoXKI33MMmLoYQ=;
 b=R+0Qdb32JwulaDhXsT1z8ndtKqBhp3T5iycxrx+hUKpLxPSehcxZOLmdk2grKljJMemlua
 FJDPyKuZIYa1EGSLpnmBXMV/8u8ZK8ZC2e/bK8zaP5jHFFDFg6IbTtNkjrdSU7ztZSA+/u
 6bHsrHQTmv8nfWBiPFMqZolvt99EQLOmasUGOu8k3rM+mo/RiVy58Xt2rbSnXGiQG4bjf6
 er/IxYbQNjrfmC6lz7unA/eKvCw/N0+XQ49Ryt3mdeTo9OpXtFdfrVht3ZGuKowlwviDoz
 mKnlxLvjLHUWbuKWINvzzUqv/s2rADVZDIlDXVeDPawli4hRlHzPh1kzEoEL+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R+0Qdb32
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_*: move hashes
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: martin.chabot@gmail.com, michal.simek@amd.com, brandon.maier@collins.com,
 ju.o@free.fr, juju@cotds.org, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jun 2024 13:47:37 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch moves the linux and uboot hashes from 'board/zynq/patches' to
> 'board/xilinx/patches'.  The reason for this is that all of the Xilinx boards
> including zynq, zynqmp and versal will be using the same linux and uboot repo.
> By putting the hashes in 'board/xilinx/patches', the same hashes can be shared
> amongst all of the Xilinx boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
