Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83881400E2;
	Tue, 30 Jul 2024 21:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3IfWLO3C1zi; Tue, 30 Jul 2024 21:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F157B405BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F157B405BA;
	Tue, 30 Jul 2024 21:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A30C71BF5AE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F646403FB
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CiOTb8RnL-d for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 21:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 286BE40300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286BE40300
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286BE40300
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 21:46:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 191F760003;
 Tue, 30 Jul 2024 21:45:58 +0000 (UTC)
Date: Tue, 30 Jul 2024 23:45:57 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240730234557.7e9bc707@windsurf>
In-Reply-To: <20240720201659.2253736-4-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
 <20240720201659.2253736-4-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722375958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycM909o+cy1k0kJDp7PXaU2CKvUvmBy5Pygdr2102ZE=;
 b=FIhvekWgScUOURQOIL6ffTq4B286pDCIcAs4IJTfRgVJf7C8CPDqIlY6WiKJ2pVxlpfk/p
 sETTKZFKUN/mKcZ3e1FWueLEB1b/7dTHmJj3MTiasLNqk79NH9hvFDqlncIV5qQWpTnDfe
 rKaRb98svpD4h1SKP2ikWVnh4R23CcMnxtNuUr4StBkwQnYw3oUPnbWLuvaaSRzCOfOdh2
 9McgecPD2cn0K3ZB9vTkxYgPxBOSdOqub501AdTTolZQd/oJmkXrC8xx3TfwYIai6KNdN3
 gmS8vF6DsEOXLF617JnLCMbYBttdtGWiT8o5eERNI5iB4gIrQClgkpIW1hFFjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FIhvekWg
Subject: Re: [Buildroot] [PATCH 4/5] configs/beaglebone_defconfig: add
 hashes for Linux/headers/U-Boot
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
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 22:16:58 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch adds .hash files for Linux, Linux headers and U-Boot and then
> enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
> defconfig from .checkpackageignore.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                                             | 1 -
>  .../beaglebone/patches/linux-headers/linux-headers.hash         | 1 +
>  board/beagleboard/beaglebone/patches/linux/linux.hash           | 2 ++
>  board/beagleboard/beaglebone/patches/uboot/uboot.hash           | 2 ++
>  configs/beaglebone_defconfig                                    | 2 ++
>  5 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 120000 board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/beagleboard/beaglebone/patches/linux/linux.hash
>  create mode 100644 board/beagleboard/beaglebone/patches/uboot/uboot.hash

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
