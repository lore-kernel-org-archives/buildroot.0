Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF37C52D6F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDD3F80C50;
	Sat,  3 Aug 2024 21:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcsOtYrLAefI; Sat,  3 Aug 2024 21:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DB580CBD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DB580CBD;
	Sat,  3 Aug 2024 21:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5BE1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 690E880CBD
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfp4GiGhyY1Y for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D342680D38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D342680D38
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D342680D38
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:00:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C8A1C0002;
 Sat,  3 Aug 2024 21:00:12 +0000 (UTC)
Date: Sat, 3 Aug 2024 23:00:10 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803230010.17143afd@windsurf>
In-Reply-To: <20240803202340.372011-1-ju.o@free.fr>
References: <20240803202340.372011-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722718813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IM3z9IOFMvQu1GCsDEyeeRRpmUK5EIA4eTjhvQMpIwQ=;
 b=QUc3f0ltYgVsfZJia3Kve+mtbzYax1CeiULLm5Taq2ri7GbKPHr2+sCEmF3meapyauxr6Q
 w233y7u/dlLNJPy8LXrc3Tga3gDlNTGU9Za9W/HH/u3cB3hZA9DL7VK/kIXH/ts9u11GLa
 RZ9qkOa5jyUkp0CErAsBdoY6a08eEAnlowZLU+3AmqgyCbJn8nJapKm7oaa7xb9zwlhe0L
 4R/5SWiUKxbuc3AY+MwZoFJpSMW3TjCPZWCWGQbt02c1fPuvNpQ/jCmDjRkp8qnMoK5127
 sU7i8zEuqy00dN2VjXizhtZQ4Rp36R3W0sMVeH4xjKQ7FKouiZQ76QMJ5Aohnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QUc3f0lt
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-g2d: bump
 to version 6.4.11.p2.6
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
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 22:23:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This version is aligned to the NXP BSP lf-6.6.23-2.0.0. See [1].
> 
> License hashes changed because the LA_OPT_NXP_Software_License changed
> from "v49 September 2023" to "v56 April 2024".
> 
> [1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-graphics/imx-g2d/imx-gpu-g2d_6.4.11.p2.6.bb
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
