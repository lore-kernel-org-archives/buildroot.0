Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E5AD10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BBBF81EF7;
	Sat, 26 Oct 2024 13:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTwzlCUG3a1W; Sat, 26 Oct 2024 13:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B08A80D95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B08A80D95;
	Sat, 26 Oct 2024 13:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF5C5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B25C80DF3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZRSN8S6d1s5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4360680D07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4360680D07
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4360680D07
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49FC940003;
 Sat, 26 Oct 2024 13:32:44 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:32:43 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Christophe
 Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <20241026153243.1e693d15@windsurf>
In-Reply-To: <20241008204450.3838045-1-dario.binacchi@amarulasolutions.com>
References: <20241008204450.3838045-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729949564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3G/HQravSs9AMBYs+6k6KJsptGQhnkx7a5I8dE9NEA=;
 b=TPHZPQzNFFLzohWPGdQxdl9ozqBEQRJ/K+AeqCnkGJH4iyWw4XAx0iox9H56UIzemHQJXI
 lkOKkoXh+rLDoSxt2fyfLiBPdyGIqikXE8SIvdcC9On8xNxH+xCwKkostktB/MARnMduR/
 2GhvJxUayp4tTf8JL6cPArQX0fbEpeTZYxgKLqmBbOlM3d9pLvyTX3nf6jFFH2gHHvxNbt
 SzgVaXAoZJ82E2+IZQHMdvR4ANAOa7NNlba9EC3HCY5Etmc2lHbVLCH0a6MQyb2p3RdxTJ
 PrOpuIO1FMLOn7jVwIgg3fYMzrSOt1CVr5s5eLEoSt/ytgBB+88ev/BEOF3twA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TPHZPQzN
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.112
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

On Tue,  8 Oct 2024 22:44:50 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 6.1.112. The size of xipImage
> has increased by only 54 bytes (1669958 bytes compared to 1669904 in
> version 6.1.98).
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
>  configs/stm32f429_disco_xip_defconfig                           | 2 +-
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
