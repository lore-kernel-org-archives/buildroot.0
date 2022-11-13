Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3568C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A09440888;
	Sun, 13 Nov 2022 20:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A09440888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhjxav9H4_SX; Sun, 13 Nov 2022 20:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C79E408AE;
	Sun, 13 Nov 2022 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C79E408AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7BE1BF406
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04E18812A3
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E18812A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZ_NnSydF3ZN for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 20:55:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E9F81285
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6E9F81285
 for <buildroot@busybox.net>; Sun, 13 Nov 2022 20:55:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3862840003;
 Sun, 13 Nov 2022 20:55:20 +0000 (UTC)
Date: Sun, 13 Nov 2022 21:55:19 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221113215519.21ec14a6@windsurf>
In-Reply-To: <a165e1785fec7f9b4ce3e38f1282c5ab87bff511.1668366594.git.baruch@tkos.co.il>
References: <a165e1785fec7f9b4ce3e38f1282c5ab87bff511.1668366594.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668372921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFt9DrjUm2Bx8Pjf8sr28uOwl7jfcRFfLGsp4FDhS5g=;
 b=UhDqWL4V4RFW/5PRwDU/0+ZkWd1tuv9Oqv3H3T55TMrV/YKyoi26UqlrhuEaMLz/KaNNS8
 3acPSCR96TB9hUsbHfEhNDxZiWfddLl8sEiNtef68gb5+4ukZv108Qd/aCW7Y7B5q0re2N
 T9huytbkr8pPN7qP5BpsQi6xypvAJiY56q6jA3KU3fkpflT1+BoLhcxy1pPtDHEM+WRKbW
 4PjnTisa+qdPBMW3LuTY0kAsD8kmeuz7kShW5mkXTlZsTf9DQg5TRdCrF6UXCBQVc3LEUn
 UmHrT88db71bwPjwrNL8GRW1puB0OpIbf0UHjmD1y5tN+5lBme+6NEJb3DmiHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UhDqWL4V
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix SSP disable
 in v2.2
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
Cc: buildroot@busybox.net, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Nov 2022 21:09:54 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> ATF version 2.2 and older does not disable SSP when
> ENABLE_STACK_PROTECTOR is not set. This is because the compiler enables
> SSP by default, and ATF does not pass -fno-stack-protector to the
> compiler. Upstream commit 7af195e29a42 ("Disable stack protection
> explicitly") fixed the issue for v2.3 and newer.
> 
> Add -fno-stack-protector in CFLAGS when
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set to fix older ATF
> versions.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171
> 
> Cc: Dick Olsson <hi@senzilla.io>
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks for having looked so quickly at this issue!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
