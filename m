Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8488AC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 400B2410F3;
	Thu, 11 Jul 2024 19:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TwVxMCtHof2; Thu, 11 Jul 2024 19:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB14141168
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB14141168;
	Thu, 11 Jul 2024 19:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEA1E1BF42E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA16B60761
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tUZvZcHo51V for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE2B460794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2B460794
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE2B460794
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81F6660002;
 Thu, 11 Jul 2024 19:02:27 +0000 (UTC)
Date: Thu, 11 Jul 2024 21:02:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240711210225.03ca9062@windsurf>
In-Reply-To: <20240711090526.2206829-1-dario.binacchi@amarulasolutions.com>
References: <20240711090526.2206829-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720724548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ca67b9/ZeJGyLafobeHyjCu8XcNTBCkvsFY1X7O+JRk=;
 b=PuGDEkhoy5+my05lpy25IT+FneRtz0gGWT3j9nfZboEmVThZSbzjsIr9qsEQV5qnUBDGsJ
 M3xmiFImXqsf8i3yd6uFwUJgJJrke0G2YzkcAKESlWyaKU3DsAQhy02BlFPJzg3gwvVAMP
 7971ZlZcXBq8mIjDJipV1K7634XxMZZYmpa3NX82qYYdzOL1/7bkxkcnD8yiIxuW3p5Uq9
 E0D+QKL9IHHqUjw/BbQo6yRT1Gt//wffcv+iQYLeoSX7d04HucagbJjosnv/VuIgcyrUNq
 x+MrckMlw28Htwt348RyVHuzQ68jxDRQ+qpkC3l0M7eai9+89pMQVkQHvRx7EQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PuGDEkho
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.162
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

On Thu, 11 Jul 2024 11:05:25 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.162 for both
> configurations and U-Boot to version 2024.04 for the SD one. Using the
> same kernel will subsequently allow adding the hash files in a single
> location.
> 
> Furthermore, now even the xip configuration uses the same headers as
> the used Linux kernel.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>  - Drop 0001-serial-stm32-rework-RX-over-DMA.patch.
>  - Update to Linux version to 5.15.162, which now includes the patch
>    fixing the UART issue.

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
