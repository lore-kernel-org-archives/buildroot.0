Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82764D3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A5D9606C5;
	Tue, 29 Oct 2024 18:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3POn-LwDuFj; Tue, 29 Oct 2024 18:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70431606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70431606FA;
	Tue, 29 Oct 2024 18:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7431E4969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 519DB403D8
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIYEtXCTN6-6 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:40:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0967E403DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0967E403DC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0967E403DC
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:40:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22A3A240002;
 Tue, 29 Oct 2024 18:40:15 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:40:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241029194015.00535807@windsurf>
In-Reply-To: <20241028224553.2468987-1-bernd@kuhls.net>
References: <20241028224553.2468987-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UltYpbQCSwdgZ/rOh8oZqYhjXNxbB4SlP2yS7EVNfaM=;
 b=PgIN4HCg3xgwhAYvs4ymVMf/6ew6CkGnNto+N0WH/mCvSzbbx+ybOq7SA8c8Gwy7cTdXs/
 HLjKRTpDJwvgBbZ3x6Jtk2MWLWCqFNykqyX4h45zPzoxi3sXSi3SYvrNloP1ILrkdshSJV
 /Kfrl/DAQfBw3P/3yAeVOIieQnGNtEwnvmzwGpsEcLjJ6ha+cmofFaHhafymuR3gY46VzY
 X6lpPV0JHrFLmMtnTH4cVUkCNtz6O10bMwnt1hHjT65JInOQR8Ou5+dYlb0Kljci1bVlWg
 vs7E/TF2TUcd0+oGwg0X6ZWlY8ZVikvNe7RJo2/GKm7vMoCZLQAnOI+r6vuuow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PgIN4HCg
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-screensaver-asteroids:
 bump version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 23:45:53 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
>  .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
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
