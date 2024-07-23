Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBF2C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7BF80B4D;
	Tue, 23 Jul 2024 08:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPCb5r_4QCo4; Tue, 23 Jul 2024 08:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 749EB80B7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749EB80B7E;
	Tue, 23 Jul 2024 08:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0171BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B6240447
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfgON6pycAJH for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A14754014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14754014D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A14754014D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:08:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79956C0006;
 Tue, 23 Jul 2024 08:08:53 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:08:52 +0200
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240723100852.17ddd3e5@windsurf>
In-Reply-To: <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
 <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721722134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wZ26nEn6Mke95kpMcjeA+Dw4VMJlg5dNHgCf7FdhT0=;
 b=LvPyqYATAPDkMWXVZ8op20qEJfhJ4slNksUgg/7qqF6t8i5cFablHza69tWrzh2sKyil+r
 deieCAyoTRWCpLRoORJS7cW1QGKHYJQ6v8pt3ZSxRrh8an1e8u8C1d3RhBd1PDTfMqVzqw
 u586bmVQPhc9p1e5XJAoWCPzZ2mBPMl98aLPU/VH+Rjm8M3RjrdtmvSMzAccERJ9cSp1zT
 DzjYp7j/klJtTnjs+ffVRzkYhg2LzINgoXsCdGEXtOZV2vCL9uWlQ75Mkwy9OX7Nc/oLDN
 JzujZsMG6foEfQtiWOw96quZQytRXbhIMPigvpntk1BSvB9lF0wPCiFgPwn6nA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LvPyqYAT
Subject: Re: [Buildroot] [PATCH v4] Create a .gitignore file in the
 CANONICAL_O directory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 22 Jul 2024 18:49:11 -0500
Bryan Brattlof <bb@ti.com> wrote:

> For some odd reason this seems to have broken 
> python-jsonschema-specifications in a fairly weird way that I'm not 
> fully sure I understand. 
> 
> Somehow when downloading the source with this patch applied the build 
> will succeed but it will never be installed in the host directory. 
> Reverting this patch and deleting the package in the dl/ directory fixes 
> everything. (at least for TI's reference boards)
> 
> I'll continue to look into this, just wanted to start the thread just in 
> the off chance someone else is doing the same :)

Interesting, thanks for the heads up on this. I don't know if I'll have
the time to look into this right now, but I can imagine that the
package is somehow using git, and the fact that a .gitignore file
exists breaks stuff?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
