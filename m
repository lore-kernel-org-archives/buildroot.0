Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0642C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E85580F7A;
	Sun, 15 Sep 2024 08:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLGSNxX2wnF8; Sun, 15 Sep 2024 08:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3D98174D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E3D98174D;
	Sun, 15 Sep 2024 08:32:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18B161BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 138E1403E2
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyYcXwfZp4La for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2F12403D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F12403D0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2F12403D0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:32:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFCCF1C0002;
 Sun, 15 Sep 2024 08:32:52 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:32:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915103250.4f0bc191@windsurf>
In-Reply-To: <20240915071642.1542317-1-james.hilliard1@gmail.com>
References: <20240915071642.1542317-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726389173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXdIwzsbvMZwtR7bhmKz5QnagwwRVfjp2QINWYgacxk=;
 b=mr8e2Ned6OC2r4pASck3E3RG1k5GVvVtWt8RJT2YMneNPDBdDbxspngU2qT7fhAdSGSMCa
 r2DrFb67X3tCO5md3X3jTXgxFPE4PH6QBYD7mAuOAw5OoY1bBdjq0UhRKVuSFLvRX3w76I
 4vKGkO2JEtVPUYoFycHknFZ3T0hYHT1OSLFSm23lWsCfgGN93mChQxfaJYF7AiCQ7UE83+
 LBsJidQPk24430orrf1yeStNnGpi1yIH8nMnWIeLviFFP3V+2P/0R0X4FkwVizYNS/S6ps
 e7xr6mQK/fBTr02CpXOLWi7NyOyKQ8NRVe9v0E7/WZOU6x1/dRKcYSVbr2ZL0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mr8e2Ned
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to
 version 2.34.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 01:16:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-google-auth/python-google-auth.hash | 4 ++--
>  package/python-google-auth/python-google-auth.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

I applied the patches from this one up to python-idna. There was issue
on one patch, which I'll point out.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
