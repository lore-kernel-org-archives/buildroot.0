Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A71C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E83607DD;
	Sun, 14 Jul 2024 15:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJnfbz5YzZWX; Sun, 14 Jul 2024 15:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95ADD6088C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95ADD6088C;
	Sun, 14 Jul 2024 15:08:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C28091BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B02BB608A0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tq2f3GpIY-15 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64AF660875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AF660875
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64AF660875
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EAA5C0002;
 Sun, 14 Jul 2024 15:08:18 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240714170817.63dfd93f@windsurf>
In-Reply-To: <20240713215218.2665512-1-dario.binacchi@amarulasolutions.com>
References: <20240713215218.2665512-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3E+6I/sq3rqKWPodeEL417gdJ3XMBQe00ZLYgE+4fM=;
 b=F7kBX8ghR96PulpAr2PQGkImPB57rR1SWuZNU6hSC13/Za74XbUtGlcAB1ZFj4XI+f3C1+
 eC0vVSzOR8oZ1fuXibfvm9lXrvE5q47kZd1BTax9v4GUQVPkmuDp4yQJBWdVx8DpKRVAn+
 Vx0o6agvZoAdqbuO4SZvih6TdtcuGbKRUC5RxyQYZ39LiaAtCwjMQRPqV4zpTvocUCgaS8
 pi+HIzNjJLfnq5pWEja63DIWfhkmQr6AIiya5YZ5u0qwS2c/1COoB3Mvw8VDJKBAAOzrQ5
 4n+hxunxxldJM4d2bLUwUtQFe+WEOC481fysyUxdWg8tfY97G0Sjhcwjqv5mlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F7kBX8gh
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32mp157a_dk1: bump Linux to
 6.9.8 and TF-A to 2.9
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
Cc: linux-amarula@amarulasolutions.com,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Marleen Vos <marleen.vos@mind.be>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 23:52:17 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch, following the suggestion expressed in [1], aligns the
> software versions of stm32mp157a_dk1 to stm32mp157c_dk2. Indeed, the two
> boards have many more similarities than differences.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240713130847.4097389-1-dario.binacchi@amarulasolutions.com
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
>  .../stm32mp157a-dk1/patches/linux/linux.hash             | 2 +-
>  configs/stm32mp157a_dk1_defconfig                        | 9 +++++----
>  3 files changed, 7 insertions(+), 6 deletions(-)

Patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
