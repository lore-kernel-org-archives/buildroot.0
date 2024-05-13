Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3394CC25B5F
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D2804092B;
	Mon, 13 May 2024 21:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8mgl8vgTSUZ; Mon, 13 May 2024 21:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E57B240889
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57B240889;
	Mon, 13 May 2024 21:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50C931BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E477404B4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZse1f1ttsxY for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D2D94012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D2D94012A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D2D94012A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:25:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 776EFE0004;
 Mon, 13 May 2024 21:25:00 +0000 (UTC)
Date: Mon, 13 May 2024 23:24:59 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240513232459.47921ffd@windsurf>
In-Reply-To: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
References: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSDfzyTNUApeQwei4bIpu5ncUMuTDcegYgyqx5z2Y/g=;
 b=l4rDAEjFluzF39a/eyyERLJEszW+zUeyKcomrlkrzSJARFibFwbcbWvBSjrKObyk8zmpf6
 kwgM4mwSIyes/8xB8RJw5WQnMIH/X3DiUwOpuljXunAWVcdeeN/7cKqw6m9e301GOfHghE
 3Ean28yrC7SUbq86q57oMFAz3ECOjubFJ1w+2zNoYCSNqiECqoEGlOD1xg1JTQQTEFq1h8
 5JgKTSEXbQflV9TZEAzLl0sbANE2NZfWv16POLP5MKEBhVRblqLUKFn96rpNaV5/blJ5ug
 b16bPeUMGzW6alyDZ9e+FlSQhYUS2KLBFcPzQ65sjKsBW0BP9m+TsastB1KQPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l4rDAEjF
Subject: Re: [Buildroot] [PATCH] package/flutter-packages: bump version to
 ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Mar 2024 11:40:59 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-packages/flutter-packages.hash | 2 +-
>  package/flutter-packages/flutter-packages.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
