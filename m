Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8908C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FDBA40814;
	Tue, 26 Mar 2024 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjEfCCf1SbVN; Tue, 26 Mar 2024 14:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BB440819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46BB440819;
	Tue, 26 Mar 2024 14:43:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 948D51BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8173060891
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uL2cfsZdxv6 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24B8760836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B8760836
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24B8760836
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:43:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12C906000F;
 Tue, 26 Mar 2024 14:43:06 +0000 (UTC)
Date: Tue, 26 Mar 2024 15:43:06 +0100
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240326154306.0a86db6f@windsurf>
In-Reply-To: <20240228145642.436509-1-christian@klarinett.li>
References: <20240228145642.436509-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711464187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6VfOyWvpwT0+CB8PtXc/VaZlmuUuMg1vynCP/UbckI=;
 b=XEcROAliXwhdvQcFctwSPMTsNh/7xrKXQBjpw52oxw2sZNa28HPzo+5f0nGT/fvVI9IQyI
 TiK3Lmy9qvS1hVuI/RQAkKT7B51vKfTVR4gMSxwWPfzN7vwrYaS4ou6kyyGWSi3uKpuxe1
 OypfJTRwxBBrCW4WAe/r1p2Aq2358G12+eMGMksb/QZuzpfkWHRGOHGeim+Kqln98fM9tw
 L1Eyhyc+r9fF0M1kOLqTLtgFg62tRplQWFGCe2605JEz4LxS1tFcN3nzMi7D+n7bzSDpAS
 mmf8yUdBySuWKYIvc8QdWW7hZPEB4W7NwKb6YTMq2yfVrEG0XCyP+DpGCml7kA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XEcROAli
Subject: Re: [Buildroot] [PATCH 1/2] package/zic: add hash for existing patch
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 28 Feb 2024 15:56:40 +0100
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Thanks for the patch. However, could you explain why you think this is
needed? We only have hashes for files downloaded by Buildroot. This
patch is part of Buildroot itself, and we don't verify hashes of
patches part of Buildroot itself.

Am I missing something obvious here? I don't even think we have some
logic to check the hashes of patches stored in Buildroot itself.

Could you provide more details on what you're trying to achieve?

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
