Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF94C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693AD60808;
	Sun, 14 Jul 2024 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1dXzImWDznI; Sun, 14 Jul 2024 15:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 787CD6080B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787CD6080B;
	Sun, 14 Jul 2024 15:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70ECF1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6DB40096
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C62s4_FUYPB7 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AD844012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AD844012A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AD844012A
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:06:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18BC9FF803;
 Sun, 14 Jul 2024 15:06:14 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:06:14 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240714170614.1499a125@windsurf>
In-Reply-To: <20240714142116.3479594-1-dario.binacchi@amarulasolutions.com>
References: <20240714142116.3479594-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oF9BnrJulMddzwWOsCQBVd2ixzenIMDdx8rLcYnyl+Y=;
 b=XoWxGYovpIS7BPH8Lot1OgII2BFdxtDLkzITk/3xnZfMGxswEyBVfTOc8cDuCUrIZ3/7kF
 wXX8b5LhukPveIKLC1HbZ4jR9dX5WIPDLgTu6YjNpU1GW7owGJVnGPr0tRuQrZszJdNHQK
 QFCkYEr+skUyUKIRh3COwbpFkHVH8T+SIpBhzHP0VSZYqaw6EOYC2VhbTxBS19W9eDAPBo
 ncQSJstMTMf+ZWD9zYp2BXs5S25+FCbh/aijG1/CuI09NfUtbrftV5kO6O4vF6s99reN/t
 UR/m9kj+NAk8cvFQmAOCLkP7ZDQiJ/PeVVlglwYM6SjHyOhQXXB70Rv2h6/77A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XoWxGYov
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd: bump U-Boot
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Jul 2024 16:21:15 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps U-Boot to version 2024.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 +-
>  configs/stm32f469_disco_sd_defconfig                            | 2 +-
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
