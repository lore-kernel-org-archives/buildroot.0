Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AEBD5B156
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2543E6077B;
	Mon, 28 Oct 2024 21:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1cQC47k3uwt; Mon, 28 Oct 2024 21:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 242AC6077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 242AC6077C;
	Mon, 28 Oct 2024 21:13:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E644EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 635BA4034C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmq23cRy9Tyz for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 007524034E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007524034E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 007524034E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:12:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA07CC0002;
 Mon, 28 Oct 2024 21:12:55 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:12:54 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Message-ID: <20241028221254.37434add@windsurf>
In-Reply-To: <cefe2b8e2bcf392b1db0eddc3a38b2bc@free.fr>
References: <20241027194337.2444930-1-romain.naour@smile.fr>
 <20241027194337.2444930-2-romain.naour@smile.fr>
 <cefe2b8e2bcf392b1db0eddc3a38b2bc@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730149976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/vu1HKuVJWIgRXgY9lC6lQ9LO+goOOZvc9V94ps96U=;
 b=f6ayM5Cf4C02Jf93RiUdij6Zt/BhYAeLLst54zD65IijfdI97Nw9xY9TxJM9XnSza6kWTI
 Jyz7oM1iq2Hun8TJMyWAylk5NQ2/KxND1O1YjXj2kMtLxxHSgiljInFN0s+S49hROHSvbA
 vvwxZ+8ZYBMTZ13qGvnwbM/vfIxWUVyYGVGARzY2y6Fezt2ZJM4KKzNmZRMUh5hEBDhqee
 6Z1qqq1JnDHGJjTMjCbcu6+NR/omhfm0nDCYFeKK+kh0qKPuFi48I4xDJS6bIzFbIGZP2n
 17P9XYbG9wqejNsyweNPsitvwj5tCb7Ig8zjvImcwM19yogVflu9LFZ8orc3rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f6ayM5Cf
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/edk2: bump to version
 edk2-stable202405
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

On Mon, 28 Oct 2024 21:27:30 +0100
Julien Olivain <ju.o@free.fr> wrote:

> On my side (this series applied on top of branch master at 81e7806),
> this patch does not apply. This can be reproduced with:
> 
>      make qemu_aarch64_sbsa_defconfig
>      make edk2-patch
> 
> Which fails with output:
> 
>      Applying 
> 0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch using 
> patch:

I'd say there's a fairly high chance this isn't Romain's fault. I
haven't checked but I would guess that this EDK2 code base uses
DOS-style new lines (\r\n), and so the patches have those, but they get
stripped when going through the mailing list, making the patch
unapplicable.

> When we bumping boot/edk2, we usually also bump edk2-non-osi.
> See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/edk2-non-osi/edk2-non-osi.mk?ref_type=heads#L7
> 
> Even if it is not needed to fix the qemu_aarch64_sbsa_defconfig of
> this series, it would be better to keep all those components aligned.
> 
> Could you check if edk2-non-osi needs to be updated too?
> If yes, could you update it?
> If no, could you add a mention that it does not need to?
> 
> Maybe we could add a comment in boot/edk2/edk2.mk, before EDK2_VERSION.
> Something like:
> 
> # When updating version, make sure to also update the edk2-platforms
> # and edk2-non-osi packages to their respective commit ID nearest to
> # the edk2 release.

I'll let Romain address this point before applying then.

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
