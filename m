Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8619C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2E282306;
	Sun, 11 Feb 2024 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9CiPaO21dso; Sun, 11 Feb 2024 22:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D855A82343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D855A82343;
	Sun, 11 Feb 2024 22:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155AF1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 021F440B3E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9iiTSpS08Ob for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA8CB40B02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8CB40B02
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA8CB40B02
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:14:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A443FF803;
 Sun, 11 Feb 2024 22:14:28 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:14:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240211231428.5d9049c1@windsurf>
In-Reply-To: <20231215213019.32352-1-giulio.benetti@benettiengineering.com>
References: <20231215213019.32352-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nd3vpoSNvJ1UVTF/YO/sKSsGyiKKM+oTwGV2NsOcsn8=;
 b=KOG3jYB2yOxnSWJ15eNx8HVvV1Q0XXERqH5Shy+dn2RZq8ioh7dKRa20rmrtUc9a/8N3ep
 y6zPrDsEu7W+QdGv1nw4TIC3ODqoRHdLuIEE+Q81Eui8dQgxQMqCOgKJq2ZES6RBexk2eY
 7Xhmgcn6SS5a6fVzrS64FHPar5aKD9H108zQe90jNLSG7U1Aua4WFyK9AAw37K9peLlJ0A
 CS5M6K8RbKz8CbQF35WEGw8SuzcpxTPQvO59cOdm0OiT8j5/CIdxBCaMW1+RWxtljh/cu4
 HvAETfijCF06iPBDXqujSbaTZEAeeUh1kPDr2BiQFL0fJ09GQB6aUZ0h+js9UQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KOG3jYB2
Subject: Re: [Buildroot] [PATCH] configs/mangopi_mq1rdw1_defconfig: new
 defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Dec 2023 22:30:19 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add support for MangoPi MQ1RDW2:
> https://mangopi.org/mqr
> 
> An Allwinner T113-S3(2xCortex-A7+128MB DDR3-1600 embedded) based SBC
> with:
> * USB-OTG Type-C socket
> * USB-HOST Type-C socket
> * 2x 18 pin GPIO headers
> * TF card slot
> * RTL8723DS WiFi module with ext. antenna connector
> * 40 pin RGB FPC connector
> * 6 pin CTP FPC connector
> * 24 pin DVP FPC connector
> * onboard mic
> * onboard audio amplifier
> * FEL,reset button
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied, with minor changes.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 83b970b591..12dd1fdcc9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1213,6 +1213,7 @@ N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>  F:	board/bananapi/bananapi-m2-ultra/
>  F:	board/freescale/imx6ullevk/
>  F:	board/freescale/imxrt1050evk/
> +F:	board/mangopi/mq1rdw2

                             ^^^ missing final slash

> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M

The size is not needed: the partition will automatically take the size
of the rootfs.ext4 image.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
