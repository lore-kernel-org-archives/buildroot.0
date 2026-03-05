Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFAEF3092A
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 10:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF1C60B14;
	Thu,  5 Mar 2026 10:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKPU3I74In1Q; Thu,  5 Mar 2026 10:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5CC60B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772706637;
	bh=hZB54ENh4dKUTNtDmniTZIsW++czQB41hsI3gkH5uKg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LSa6mTNViuSKji6d+umzuRc8mEIrW8JLbFF8UrJxYDGMTlbzIFs74GQoEfYR1AoOL
	 PQklH8DnRdpUbHXJnvRs/3H/NXrtlFVQFIF9AXv7ejVpCyRnM9hQgI4oIYL2hxCo5f
	 +fM4wXDaEEaJVYmfArQDddERjr+cKRpVBGpREfSY3aVeMAOaSdgPRJ6jN/oB2c8BD3
	 DRwvtWJagOOTdmvvOOwI18MtJX6Wal9A6f/UBr59jPHzxZdH44zCm7IPbmz27i3bZR
	 9uT7wJDYi68F0zrZXarADRHg391IQ39yoY6rMSJHgBCE6HTfgdZZtAw93WyikXEKCC
	 MS1PRIO7vQXtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5CC60B08;
	Thu,  5 Mar 2026 10:30:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF5E223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8B1040505
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djPxV4Kwc6Su for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 10:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD78140A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD78140A8F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD78140A8F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:30:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 50A6D1A2CDC;
 Thu,  5 Mar 2026 10:30:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 142B85FDEB;
 Thu,  5 Mar 2026 10:30:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C99FC10369846; Thu,  5 Mar 2026 11:30:25 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 05 Mar 2026 11:30:24 +0100
Message-Id: <DGUS1WXB2PT4.1XYOOGX90GM1N@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260305084526.798988-1-neal.frager@amd.com>
In-Reply-To: <20260305084526.798988-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772706629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zed4D9mXMEVMLZOQQvzL4GTHUhyrC6l2DZj898BtonI=;
 b=eZtb6ANurEh/ipV3HNO+EZZUppizwT3uxkxyLCzi+0VqvUG7W0ZHfhoOQuB+b9Sch2xwFF
 vk6bMOfHz8psW3JmtmcZkgul+yC3JQOoUJP9zaA6SAmxuDDo5G1KTBX644YOZecoFhhoox
 0AadAmoGR9tRCbETuTIEFYyVc6KVk7sufMtKFRXaKZV86MBMhzU6Si0zl0pxFine1b0l5e
 FjFsRpvO9wNjkKSesMst+92d32Tv7J9Wv8WexOizvgc5kSa0FJF6BwRn4vtPeuZvJVlGbT
 dY5HMupURR6sFTDCWcC6ue2ODMx+u/cE5ewJCihEoTF5mlYWT+23pJ3ECBkK/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eZtb6ANu
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal2/post-image.sh: remove
 unnecessary $BINARIES_DIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, fiona.klute@gmx.de, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Mar 5, 2026 at 9:45 AM CET, Neal Frager wrote:
> Remove unnecessary $BINARIES_DIR reference from the symbolic link creation.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

It's not only unnecessary, it is also bad, because it creates a symlink to
an absolute path instead of a relative path.

I don't think you need to resend just for this clarification though.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
