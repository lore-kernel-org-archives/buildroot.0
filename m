Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD07C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D18E4111F;
	Thu, 11 Jul 2024 19:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d60BVOKT4dVi; Thu, 11 Jul 2024 19:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE1441148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE1441148;
	Thu, 11 Jul 2024 19:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03F401BF42E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E581F60895
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKxi5YZLi9qE for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE7F360794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE7F360794
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE7F360794
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:01:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C23A31C0002;
 Thu, 11 Jul 2024 19:01:06 +0000 (UTC)
Date: Thu, 11 Jul 2024 21:01:05 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240711210105.64eb0c18@windsurf>
In-Reply-To: <20240711125412.2662104-1-dario.binacchi@amarulasolutions.com>
References: <20240711125412.2662104-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720724467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziT9UaC1FmvZbkFqCXcb0u+FMOtcOkgbA1Cp/rk7I2Y=;
 b=RTfU2HnKCR3GM0ePC7fqijG1RH71r4fKRSHIHQW6QtGtcur6FF+YDI6YHhkjTCuV8Fh6je
 PAkS7rK1BGFmPEbVMM/8MUZeAhX6tcY9CQjbdP6/qzz5PuSA+qa2OTAC4/aLnI1n9YCXlC
 PFWdlr5wh5ZbaS3Bc368vgg1zGrNI4fL/9H/6z7Ho/NIE1QwWh2z2Pml8ZsDd+OaOBmA3e
 G7Fcm4iuoIQHAYeQw6tiKcAYu03G15g2oNdKpCsVwFv3Xu2Oa68aEG9h8nuNZ3YdqSUrZg
 UaqjSBT+fLz9qOK8dDiMHahzsoksnhG0MbbjmIumLjpuerDTqEFfFVAUgzb5mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTfU2HnK
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32f769_disco_sd: bump
 Linux to 5.15.162 and U-Boot to 2024.04
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

On Thu, 11 Jul 2024 14:54:12 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.162 and U-Boot to
> version 2024.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>  - Drop 0001-serial-stm32-rework-RX-over-DMA.patch.
>  - Update to Linux version to 5.15.162, which now includes the patch
>    fixing the UART issue.
>  - Update Linux hash for version 5.15.162.

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
