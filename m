Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CC1C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7938206C;
	Thu,  1 Aug 2024 21:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxZ797icJAxI; Thu,  1 Aug 2024 21:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED0782073
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED0782073;
	Thu,  1 Aug 2024 21:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 887661BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E2340437
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dK3CEyvc-1ql for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BAC340472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BAC340472
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BAC340472
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF56A1BF203;
 Thu,  1 Aug 2024 21:38:42 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:41 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801233841.76680fad@windsurf>
In-Reply-To: <20240801193029.51175-1-ju.o@free.fr>
References: <20240801193029.51175-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p59H2j4NC7Lu9mQEVmAwCtfkop1aqbpeIYjKdBGBdH4=;
 b=gRE/9j8ehyXSsxHZer716is/NT64QMPESI12swFHkGoAep4IG6KORYY0jHW1WAeGJecODV
 hZz1BmgzMePNJsor1T4Yn5FM9dsy2Afws9Dz13lUpDBd4Zd4WC2S4u5fHsYA3tYAVtRA/o
 IgAPLCDM1TH0EGU1IwXmr/7IerFGszPlBqgvEfSKt+7h6sHN7ArAvq87TjG868o0UGATzm
 fQ2DNvTZOh06cEJ7UGuD+cP8ERInN23J3WaVzEc7jMHkhSLtWQY4yPzWsSybOYGWQID1Hp
 sX1Xupi75g/ST1Z/z3EDV0Q9VfO5yNLazeznASxP27bfIRdveYqbWDH4gCGLwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gRE/9j8e
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-seco: bump to
 version 5.9.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:30:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".
> 
> License hashes changed because the LA_OPT_NXP_Software_License changed
> from "v48 July 2023" to "v56 April 2024".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
>  package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
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
