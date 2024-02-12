Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA8C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C8F40189;
	Mon, 12 Feb 2024 22:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uY19xjjemtTi; Mon, 12 Feb 2024 22:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786A24018A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786A24018A;
	Mon, 12 Feb 2024 22:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C20021BF39A
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEF5560A43
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYLwANnA6JcL for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9319060A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9319060A39
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9319060A39
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:59:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E313C240003;
 Mon, 12 Feb 2024 21:59:54 +0000 (UTC)
Date: Mon, 12 Feb 2024 22:59:53 +0100
To: Nayab Sayed via buildroot <buildroot@buildroot.org>
Message-ID: <20240212225953.79488771@windsurf>
In-Reply-To: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
References: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707775195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvbHPgDnL03pCPlWywS1aDY3bdSnF07YIoT5vuavtcU=;
 b=I09IhBVnFeNhzoryzubrs/yQjlou0XaGtHPmsLwPDUKILdIjSiREvrA3yr7YZEq9PHnT+x
 Z+bth8uaXDokv4MpsO9B1PDfxkXCvZn8Hqot0Qn9Lw5+yglvivkcX6HfUDMBxIzvOa8N5t
 2VNPSky2hYvor6mUwwAoMQnVc+5tRZwa4Ceex9xNzp5GyG4+7149yiFPGMVs1sdgOHkMZA
 bSko8KmQJyN9dUdhC/t9oEuS93lzQKHQJTEeK0eqA5biwrw2ICfx2YFYlfOS6dvsC3eHsx
 DqnsiNYD4whGV6Q7ApWlR9lXU8d7VGeMRDxMe9bsbRevIt8mpYF/BTLQh06ong==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I09IhBVn
Subject: Re: [Buildroot] [PATCH v2] package/environment-setup: add variable
 KERNEL_DIR alongside KERNELDIR
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nayab,

On Wed, 31 Jan 2024 23:48:28 +0530
Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:

> Update host environment setup helper script to incorporate the variable
> KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
> consistency, as some projects utilize KERNELDIR while others use KERNEL_DIR.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>

Thanks for this new iteration, but on my side, I'm tempted to reject
this patch, and actually to remove the support for KERNELDIR as well.

Indeed, even Angelo, who added the environment-setup script was not
able to provide a solid reason for exporting KERNELDIR in the first
place. I don't think there is any standard, or somewhat standard
variable to point to the Linux kernel source directory.

I'm fine with environment-setup exposing CC, LD, CFLAGS, LDFLAGS, or
even CROSS_COMPILE as these are reasonably standardized by various
build systems. But KERNELDIR or KERNEL_DIR are not, and the simple fact
that both would be needed/useful is a clear hint of that. The whole
thing I didn't like in the first place with environment-setup is the
fact that it exports a mixed bag of somewhat random environment
variables, and exposing both KERNELDIR and KERNEL_DIR clearly goes
further into this direction in my opinion.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
