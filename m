Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E1ECD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA887605AA;
	Tue,  3 Sep 2024 19:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81be9TzIobQS; Tue,  3 Sep 2024 19:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC7A60680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC7A60680;
	Tue,  3 Sep 2024 19:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61FDF1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F74E60680
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vafXcM0F8zcg for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BCF1605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCF1605AA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BCF1605AA
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:55:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAE53FF803;
 Tue,  3 Sep 2024 19:55:02 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:55:01 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240903215501.36cf0b25@windsurf>
In-Reply-To: <20240901194422.383895-1-ju.o@free.fr>
References: <20240901194422.383895-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725393303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmBHVwTfo5ivKiqRwK3lGJU31HS9ZZPgKKhgzno2ZtQ=;
 b=MMn5gu0QRvqz7nw6sXZ7ZndZb98XQxH4NXbqy7CRqKvOynzPmrC6fG4LoQ7y0slO/sjZPK
 zouLYa8SfogU1xiAPGRhTjwnrDlCbn68TFWZ8WU0YzyXb9uYRXeB1EGpCFxeVlQTdNj3pT
 qYli37nIMcuUQ2V4UgOvv/Cbhvo++1lPkK8sWUcpIiCgu0RncrgWOwSjeVdAJJS29XUt0b
 8ZeMxFD0TCk915HdazzTlkRtWNpoLNuuKb+6iCKX78IdA90m7VRM5GyLjOLsodQVpolZER
 Sf8a7H4iCZV7Q8ThEOAef7lK/VbfQ1lr8NhsbFS57QFD49tDwf89H+8EIsl36g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MMn5gu0Q
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mqevk: bump TF-A,
 U-Boot and Linux Kernel version
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  1 Sep 2024 21:44:22 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The imx8mqevk_defconfig is failing to build the arm-trusted-firmware
> package, with the error message:
> 
>     plat/imx/imx8m/hab.c: In function 'imx_hab_handler':
>     plat/imx/imx8m/hab.c:65:57: error: array subscript 0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'} [-Werror=array-bounds=]
>        65 | #define HAB_RVT_CHECK_TARGET_ARM64      ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
>           |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is happening since commit dc0f721 "package/gcc: switch to 13.x
> as default".
> 
> This commit fixes this build failure by updating the TF-A, U-Boot and
> Linux Kernel. Note: this imx8mqevk_defconfig uses the upstream Kernel
> (in contrast of the freescale_imx8mqevk_defconfig which is using the NXP
> BSP Kernel version).
> 
> Also, this new uboot version needs gnutls and openssl, so the
> corresponding options are added to the defconfig.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7691701411
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7715641622
> ---
>  configs/imx8mqevk_defconfig | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

I have initially applied to next... and then realized it was fixing a
Gitlab CI issue, so I also applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
