Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9BAD10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0178408A;
	Sat, 26 Oct 2024 16:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zrs03mWKno7e; Sat, 26 Oct 2024 16:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 277A78408C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 277A78408C;
	Sat, 26 Oct 2024 16:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF0E5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BDD0411D0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y4wvQ7o0lnA for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF37A411BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF37A411BB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF37A411BB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D8E11C0004;
 Sat, 26 Oct 2024 16:22:22 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:22:22 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabio Urquiza <fabiorush@gmail.com>, Bernd
 Kuhls <bernd@kuhls.net>
Message-ID: <20241026182222.05359dbd@windsurf>
In-Reply-To: <20241013164759.3729983-1-ju.o@free.fr>
References: <20241013164759.3729983-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729959743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUPI6V5ZegGifZNn5ZrqhmYeicAx0s9NbQqzRIC8LP8=;
 b=LQ3ranVFItExRRCeVngocRilPJDlf2PpdbIqqdLuReye/tlp/9GlU0pOdyOJjGNAkfK1GN
 Nfzg592OTnvFaToOEsJGgugaDM5G2CLJLP777ynv2D5Hbxf7pFwECSQQNY+9H4a2AzsZiC
 7KE/E6iyOWJyK51jA/pL0DKQOKhW7FFBUxDACl+xxG7UGKYIr44uGO49AigOsiC11pfP5u
 VBubHbScwrpMpAj4MN0Yjmh00zt7nylm7QZUU0HanQXvX1mtyXAtO2YeFJvx/JlyITs4fY
 ZOqUoXvGk6WJp7qhdtXj44mnHqbeKRWIlXDNKy9a1UIcuuek9XBJv+GzBzqdog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LQ3ranVF
Subject: Re: [Buildroot] [PATCH 1/2] package/bitcoin: bump to version 28.0
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

On Sun, 13 Oct 2024 18:47:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 26.2, see:
> https://bitcoincore.org/en/releases/27.0/
> https://bitcoincore.org/en/releases/27.1/
> https://bitcoincore.org/en/releases/28.0/
> 
> A notable change in version 28.0 is that bitcoin code now needs
> gcc >= 11.1. This change is reflected in the package Kconfig
> Config.in file.
> 
> License file hash changed, due to year update in upstream commit:
> https://github.com/bitcoin/bitcoin/commit/1f8450f066724dfbb5c5bc4060843e2f3340ed88
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8072857206
> ---
>  package/bitcoin/Config.in    | 6 +++---
>  package/bitcoin/bitcoin.hash | 8 ++++----
>  package/bitcoin/bitcoin.mk   | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
