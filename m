Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF18C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D67607A8;
	Mon, 13 May 2024 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjD1axiyDOIA; Mon, 13 May 2024 19:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB476608D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB476608D5;
	Mon, 13 May 2024 19:47:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 455F71BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C3F82A5D
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DPXZYy16fHX for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29B1D82A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B1D82A53
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29B1D82A53
 for <buildroot@busybox.net>; Mon, 13 May 2024 19:47:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E18AFF802;
 Mon, 13 May 2024 19:47:07 +0000 (UTC)
Date: Mon, 13 May 2024 21:47:07 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20240513214707.510b8f00@windsurf>
In-Reply-To: <20240513142612.21594-1-mf@go-sys.de>
References: <20240513142612.21594-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715629628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/dH5DnGAdDEev6YGTU6EWjWchZKBU7kjYJCLeZnEdE=;
 b=MEdhvhW0CWpy5ig8fM3MFkSR662GkFRQ6s+dr78H8Zyuw6nqePPXuyTHcB3QUc0QOfoOI7
 lDP0eb2Ug3Y/15KnZ/r5rsgY7mSsISM7lwIYwc/dXVkybmr8pBvzuabIX8a/ntYb6nuYmq
 svO8H2bckP1cyG6PGmzsmKhJCHM05JhKxyUeJYZOZVZPu56/iR0Ghgyp3sDDTTGoHdTJ/f
 pgB/1I7aSwDRk4xtg34pUhD1L/9tbXHxf4KVHUDVcI1yVRLR1EGpc/ht0hl7sgtg/Ua7hM
 GCTG8mrSHmNOKaZ+XT0dVsDrfy549jUwwoOKBXljSPuE1rLOyVBjlxswKi+x3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MEdhvhW0
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 16:26:12 +0200
Michael Fischer <mf@go-sys.de> wrote:

> 0001-configure-add-without-demo-option: adapt patch to 6.0.0 version

It would be very nice to submit this patch to the upstream gnuplot
maintainers :-)

> Signed-off-by: Michael Fischer <mf@go-sys.de>

Nevertheless, patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
