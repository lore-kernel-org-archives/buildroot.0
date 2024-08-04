Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27528C52D6F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590F98104C;
	Sun,  4 Aug 2024 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bYBcHRYfv1X; Sun,  4 Aug 2024 21:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467638105C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467638105C;
	Sun,  4 Aug 2024 21:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C264F1BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B03A86064C
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH6dlWBMLi4h for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 21:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DB976063D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB976063D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DB976063D
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 21:06:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 796F4FF804;
 Sun,  4 Aug 2024 21:06:40 +0000 (UTC)
Date: Sun, 4 Aug 2024 23:06:39 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240804230639.15221094@windsurf>
In-Reply-To: <20240804161806.1320340-1-ju.o@free.fr>
References: <20240804161806.1320340-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722805600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ro6l9XkNkPV3bMdFyl0RwShn8DIJrhGvY61KjV3QLNU=;
 b=V+HKyK6n0CQ2dcZ+FWdo5EV61hSaTDx0CcG3unDquiUXM+PeuLbsk4l/1qVjE5hWsuUH3N
 UWYVZgNGxxA26KKxm8JkSKgAhpCkatMnrMUEtSuA8jvU3+0cwQB1dNd2Muv4hAkrMsK4pR
 EUxJszjxX91N+FOM72YgRo7w40nRHPK+SgfpSkyRp0G5hzA51QWQ4H4XJj1al4wAARj1Lu
 687AklMmf/VGF3Ay9NFfdWKqLQ2xfzEXNfSdDF1jSEwUDepS06dKIokLfHrNmrL0x+0G21
 UAHzCt3zqqPZGxelfweXjjMTGXoro5Br0ya/JVofxnkkv0py4fgU7sV9cBi4iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V+HKyK6n
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8mnevk: uboot
 needs openssl
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Aug 2024 18:18:06 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This defconfig was recently bumped to NXP BSP lf-6.6.23-2.0.0.
> 
> NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
> version 2024.04. This version now requires OpenSSL.
> 
> This defconfig is failing in uboot build, with output:
> 
>     In file included from tools/imagetool.h:24,
>                      from tools/imagetool.c:8:
>     include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
>      1471 | #  include <openssl/evp.h>
>           |            ^~~~~~~~~~~~~~~
> 
> This commit fixes the issue by adding
> BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in the defconfig.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: Patch tested in Gitlab CI pipeline:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1400170073
> ---
>  configs/freescale_imx8mnevk_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
