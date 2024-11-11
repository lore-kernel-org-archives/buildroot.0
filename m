Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF44D3ABF7
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F4360773;
	Mon, 11 Nov 2024 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 338EyrttFZHH; Mon, 11 Nov 2024 21:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C088A60777
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C088A60777;
	Mon, 11 Nov 2024 21:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D16EED8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEDB8405B3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id endLXUQvm2ws for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65DCB40584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DCB40584
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65DCB40584
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:31:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D9B7FF803;
 Mon, 11 Nov 2024 21:31:04 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:31:03 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
Message-ID: <20241111223103.07d01414@windsurf>
In-Reply-To: <20241108155434.1924823-2-fancp2007@gmail.com>
References: <20241108155434.1924823-1-fancp2007@gmail.com>
 <20241108155434.1924823-2-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731360664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K//LODlQEFWrQ4E/5Jmz0pu4G6DiDqqK/hRhXWO7fBU=;
 b=DlCy3AwjbFhQVKPXbiqicQUgUFHSU92t5YYYVcEQDKUBdCGRJxIuHhnqNUr/X/mAFtyb7m
 VpZSD6jMi0fwqZDALV+F9TYZfQPismrLW/glPh9JaAKNaj1abe3QHJp24ANgbBIJNBGAgc
 6EyzDcqbdt913ryG+xTrZE+A67IsCXAmS17ANg3BVnfCo/yGcKDGuiaje/+JGpzWz6Xp/8
 OEZj+vfjf1k/OYFer9xUnZ5Kccxli52cNsnrUhQaQc18rYKhFTlFVw7vhpNObqCZ7lK3S4
 khJbvlphlF8A/93I/M1dSo+7YYxkpIVtTARxMyxmE+jN40X4Lo6PUucJvxoURA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DlCy3Awj
Subject: Re: [Buildroot] [PATCH 2/2] configs/cubieboard2: switch to use
 extlinux.conf
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

Hello,

On Fri,  8 Nov 2024 23:54:32 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Switch to extlinux instead of U-Boot boot script.
> Remove obsolete entry from the .checkpackageignore file.
> Drop custom boot script and genimage config.
> Drop unnecessary generic and host configs.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Nice change!

> diff --git a/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..8465f6deaf
> --- /dev/null
> +++ b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,5 @@
> +DEFAULT linux

Drop this line.

> +LABEL linux
> +  KERNEL /boot/zImage
> +  DEVICETREE /boot/sun7i-a20-cubieboard2.dtb
> +  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait

Could you use lowercase label, kernel, devicetree and append, like we
do in the other extlinux.conf file?

I see
board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
is the only one using upper-case, but that should be fixed, just for
the sake of consistency.

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
