Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BA2C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D538408ED;
	Sat, 13 Jul 2024 14:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oz4OlRk3cIPF; Sat, 13 Jul 2024 14:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E522840942
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E522840942;
	Sat, 13 Jul 2024 14:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3712A1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E87C81E76
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYuUntwA1Vj1 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41EAC81E84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EAC81E84
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41EAC81E84
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97F0E1C0003;
 Sat, 13 Jul 2024 14:27:59 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:27:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240713162755.676c5c39@windsurf>
In-Reply-To: <20240713130847.4097389-1-dario.binacchi@amarulasolutions.com>
References: <20240713130847.4097389-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fj86TDbR3nOaWbfdova0/8N/p0FUBvULo5aqJM02fY4=;
 b=jmXE3lR5Lj+DmTPTvg9e7k6Pk8oiGh4uPLXWkd9h1Eb5ayrpdstr/zPRJOv87T+XyNaFyW
 5iGXiGKsEkUDW4Y5g8R/wXFydNKUjLIrsquG4CDV4ResWd1ONXCMnLerNfIIhsRevWmvT1
 KnXELBM2KmYCXPDltpGwJtlk2o1WFG5lzfThawQNN2ddiBWxFOl8x7ctM+YKOXU7kUhStl
 H6B473KfIB6W1rbfqoTgoRGKIoSAOkxBfOe08DohAATwBer9dz9hnGD4m0FlFb327+Lo3d
 kCxm+rMpJ+imzDStp9qL70Qxy6G+KYfQ9BZ/4NxAwMPrm1w5XAeY/XtEHlSfaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jmXE3lR5
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp157a_dk1: bump Linux to
 6.6.39 and U-Boot to 2024.07
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
Cc: Marleen Vos <marleen.vos@mind.be>, Bartosz Bilas <b.bilas@grinn-global.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 15:08:47 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 6.6.39 and U-Boot to version
> 2024.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stm32mp157a-dk1/patches/linux/linux.hash           |  2 +-
>  .../stm32mp157a-dk1/patches/uboot/uboot.hash           |  2 +-
>  configs/stm32mp157a_dk1_defconfig                      | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)

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
