Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE78CC3DA7F
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C1682075;
	Thu,  1 Aug 2024 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZYP4neOTLUb; Thu,  1 Aug 2024 21:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 845A5820A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845A5820A8;
	Thu,  1 Aug 2024 21:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC6581BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 958C060615
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enZL1cleqNlA for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6522E6067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6522E6067A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6522E6067A
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC612E0003;
 Thu,  1 Aug 2024 21:38:54 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:54 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801233854.4cedd06d@windsurf>
In-Reply-To: <20240801195648.61942-1-ju.o@free.fr>
References: <20240801195648.61942-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+/0fo1zudZxi6v6qozDGMxsWV+9N/vvG4kLeJJx8cs=;
 b=YKvzfW5jGRhkzww9ntO6AXaqy8TlhsLebtr560yWyE7BO7UIExgSe1SpVY1nRqCqF7jLxS
 HT/6E7AdX1+WcpOpS7/n2vaHy+rVpGx47Yi37uiiu1VN7riIqD3O4M69K69VwKRtTmXy8b
 A4L0wpkl7zBZTGhFQT6vRJxmaXikPtBhO4Nu8E4lIXy4PbgKX0hTI7SFBBPJ/hWQZL/eGz
 UVMOaxZus6A5x4WEAH5y9J0yNO2NDTHmBKavEZUQdbyqZbC8OqML6/081WjTcK4JYkvhVu
 kH5MYA2WfvtMwhw1+fVV1XE2oudl9q9lS1djQB12LOUfxTGOWiyy1bVJVIg7fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YKvzfW5j
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8dxlevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Nickl <Stefan.Nickl@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:56:48 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> this freescale_imx8dxlevk_defconfig is failing to build the Kernel
> with output:
> 
>     drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c:5675:1: error: conflicting types for '_QuerySignal' due to enum/integer mismatch; have 'gceSTATUS(struct _gckOS *, void *)' {aka 'enum _gceSTATUS(struct _gckOS *, void *)'} [-Werror=enum-int-mismatch]
>      5675 | _QuerySignal(IN gckOS Os, IN gctSIGNAL Signal)
>           | ^~~~~~~~~~~~
> 
> This commit fixes the issue by updating the Kernel.
> 
> This commit also adds the custom version package hashes. Therefore,
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
> BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
> the hash files are added.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089463
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                    |  1 -
>  .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
>  .../patches/linux-headers/linux-headers.hash           |  1 +
>  board/freescale/imx8dxlevk/patches/linux/linux.hash    |  2 ++
>  board/freescale/imx8dxlevk/patches/uboot/uboot.hash    |  2 ++
>  configs/freescale_imx8dxlevk_defconfig                 | 10 ++++++----
>  6 files changed, 13 insertions(+), 5 deletions(-)
>  create mode 100644 board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 board/freescale/imx8dxlevk/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx8dxlevk/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx8dxlevk/patches/uboot/uboot.hash

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
