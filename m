Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16D8C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7BF81EBD;
	Tue,  9 Jul 2024 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pKrax1-JeLW; Tue,  9 Jul 2024 20:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D18481EBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D18481EBE;
	Tue,  9 Jul 2024 20:52:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F081C1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCB3181EBE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY_aBzFHC9AW for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0BC381EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BC381EBD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0BC381EBD
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:52:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03838FF803;
 Tue,  9 Jul 2024 20:52:34 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:52:33 +0200
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <20240709225233.7e44e407@windsurf>
In-Reply-To: <20240603230940.51746-2-foss@athaariq.my.id>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <20240603230940.51746-2-foss@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720558355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivgiWrs2vQ8hptn70A/mYUm9ERsmclYeJqTdy+4qVGM=;
 b=HJwVPj5/Yk4czbk2CsrQ/ax2cc/y0vmfFB/ceTw6fOL4EUZywU1pLgIwYBgPCWUVq39Ze3
 FCglU/SKuDXc8vRnlwri1Ywlr+Ch9DgXIneR3+u8eg4ro6j70IzjWuT4++79v+fRfIFWcY
 mS85hN7Uc+NoXF26jPYq43SNDEnZsv/6eqv4jz0fSsbEVQRMdNXPHziO8Djv98mrJxNHDo
 sJLDcy8Kj8YoOlldbrkw5hQfhGlm/X6uRxF9j29rUTwyJVtWrVywdc7TtRtmgcwnm0IqcX
 FioOiNzv2Q2BsADAqsymvgIOcQY7l4cqf3gAm3dClegvyRwBM8ykLoOhsGudhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HJwVPj5/
Subject: Re: [Buildroot] [PATCH v3 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
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
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Athaariq,

On Tue,  4 Jun 2024 06:09:35 +0700
Athaariq Ardhiansyah <foss@athaariq.my.id> wrote:

> Latest raspberrypi-usbboot package has Raspberry Pi 5 support. It is
> considerably matured at commit 4a3d31171769f87d919340778e5aaeaba01e10b5.
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

I have for now applied the older patch from Fiona Klute. Please submit
an updated patch if it still makes sense to update raspberry-usbboot
even further.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
