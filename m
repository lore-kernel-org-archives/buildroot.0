Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0213C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8BF60841;
	Sun, 14 Jul 2024 15:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8nfB0p-BATe; Sun, 14 Jul 2024 15:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D414260827
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D414260827;
	Sun, 14 Jul 2024 15:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A889F1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E9C36081C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB2eGskwduwl for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADF1A6080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF1A6080B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF1A6080B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 936F31C0004;
 Sun, 14 Jul 2024 15:06:18 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:06:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240714170617.4d50eb1f@windsurf>
In-Reply-To: <20240714145759.3932146-1-dario.binacchi@amarulasolutions.com>
References: <20240714145759.3932146-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9N2J1ppvH7MMxNGmxIuz3J5zKPd3dUJh+0nVGhleTo=;
 b=LLBdGfdNFDA89B9ZIVzjagLtCvcNQI6p8gVH9IzCnxftauOmJUwL+tR2Jf0cwAJP9MykOn
 Wqn8XCESjk4Y7d4kNQExNDqJDGJkr2myAAac/k/1MlTT+/7rCss+hMFohtPX3oWoesP4Y+
 JGxkkFddxnuYTLcaE367hkaU/zL7FMkRwaEjkvGrlJKkNzZo/WLnHCwdMdlePvE2Ftd5kW
 7A8LBAp2f4jIVo6ZOct11xnTBSao0okVADUBbmaluakT8ROgzIuZi/FkDrW13h6xqSftOw
 OshZntffW8QlVEMeblBefngz5bc5HPCR1Tgnt6ToPL8LhabytDmLNLsk3bxkjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LLBdGfdN
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump U-Boot
 to 2024.07
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

On Sun, 14 Jul 2024 16:57:59 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps U-Boot to version 2024.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash | 2 +-
>  configs/stm32f769_disco_sd_defconfig                            | 2 +-
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
