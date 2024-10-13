Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA04FCF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B33574094C;
	Sun, 13 Oct 2024 10:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KzgypxdtuKY; Sun, 13 Oct 2024 10:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8261D40973
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8261D40973;
	Sun, 13 Oct 2024 10:49:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEA221BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD22F4094C
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c_PeK_zxkkx for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5958640918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5958640918
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5958640918
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:49:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC56EFF805;
 Sun, 13 Oct 2024 10:49:22 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:49:21 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241013124921.6ebe5e20@windsurf>
In-Reply-To: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
References: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heF2XmhCt7sVELSFenVjfso2qhq1Ju+xUTEKz/jGUdQ=;
 b=kkQtNqITCzuyaes8E7UYbeYcw0UuwXiikWipMyk2d/usu7gPBA0e4sI4mfOBlOnATi90u5
 mLuqmEZS76e708+Vr340pL0dY0tFaZSzFU6hXFwydXT6AA5ZaLrUp+t/jTa7vU6r4xcJsV
 LkpSud5UM+M4egec9Wcq+Mv4LfLAYHpLELoykhofXpCj9oXNkps7Y+HqUl8pMzNk9+puBR
 leVINIRkoTGb7uHr9Pd4IDP0xBGTvnNFuKSLx1NDcimNcyDB+s+JRP4bsEDPCX5qmJhrF3
 CukP48RIi8yHBo8hKKvtNlIzEk67uFDbDyaTlzpcrBVjOnmu4Qoe2ywAuv4xUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kkQtNqIT
Subject: Re: [Buildroot] [PATCH 1/2] package/aespipe: bump to version 2.4h
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

On Sat, 12 Oct 2024 17:24:16 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> aespipe-v2.4h     May 14 2024
>     - Added assembler implementations of AES for 32-bit arm and 64-bit arm64
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/aespipe/aespipe.hash | 6 +++---
>  package/aespipe/aespipe.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
