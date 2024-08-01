Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934A4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B913820BC;
	Thu,  1 Aug 2024 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUFrN6rESkTY; Thu,  1 Aug 2024 21:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5527882073
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5527882073;
	Thu,  1 Aug 2024 21:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBBF51BF98E
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6BE28202B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-kTp3a8nvF5 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01B6082072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B6082072
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01B6082072
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD74AFF803;
 Thu,  1 Aug 2024 21:38:46 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:46 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801233846.1f4d5e25@windsurf>
In-Reply-To: <20240801194649.57484-1-ju.o@free.fr>
References: <20240801194649.57484-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntNzTBKtrHBlvi0GpnWAkWMkNLpedA6QjbuChO7Qa0c=;
 b=T2vMeVKNNJRnb0OZ3IzB2sKPhm4BDXnNSF25C8gDv4UcnAlCxu6LcpBplgQWJDPt1dX6t0
 w/e/blJY07rDhJjRo4pz6XVMmvNoLmSRax9T2jRGWBHRGnKf2HL2P2PChK9oxO/IiHqvBd
 C+/aZox3PWHpuaPf/xQeTfbcUdZ8saUgMsezj+N55MAq8KjX5Pkwk+4l47dJ1RgbmeFWNu
 uE7mvGRz3ysOK292kIsEJaY0YjEEsrsDFYZf8cRAB9dTOEOUD4XizpnUO5ctGNwNkkgolG
 hbNtBW8OwC7LPadnMPxuKuoi0e1kI/Oa54Z3X2Bo9FGs/gVkTz+zHVJ2T6w06g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T2vMeVKN
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8qmmek: bump BSP
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:46:49 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> this freescale_imx8qmmek_defconfig is failing to build the Kernel
> with output:
> 
>     drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c:5769:1: error: conflicting types for '_QuerySignal' due to enum/integer mismatch; have 'gceSTATUS(struct _gckOS *, void *)' {aka 'enum _gceSTATUS(struct _gckOS *, void *)'} [-Werror=enum-int-mismatch]
>      5769 | _QuerySignal(
>           | ^~~~~~~~~~~~
> 
> This commit fixes the issue by updating the Kernel.
> 
> The BR2_GLOBAL_PATCH_DIR is also changed from
> "board/freescale/common/patches" to
> "board/freescale/imx8qmmek/patches". This for two reasons:
> 
> 1. the common patch directory is removed, because the patches for
>    arm-trusted-firmware are no longer needed. Patch 0001 is included
>    in this new version, and patch 0002 no longer needed due a code
>    rewrite in this new version. The common patch files are kept,
>    because they are used in other freescale_ defconfigs.
> 
> 2. the imx8qmmek patch directory is introduced, to include the needed
>    hash files, because this commit enables
>    BR2_DOWNLOAD_FORCE_CHECK_HASHES=y. Those hash files are introduced
>    in a board specific directory to allow updating this defconfig
>    independently of the other i.MX defconfigs: there is 16
>    freescale_imx*_defconfigs, with more or less dependencies
>    (firmwares, gpu drivers, ...). The ".checkpackageignore" entry for
>    this defconfig is also removed.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089474
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                   |  1 -
>  .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 ++
>  .../patches/linux-headers/linux-headers.hash          |  1 +
>  board/freescale/imx8qmmek/patches/linux/linux.hash    |  2 ++
>  board/freescale/imx8qmmek/patches/uboot/uboot.hash    |  2 ++
>  configs/freescale_imx8qmmek_defconfig                 | 11 ++++++-----
>  6 files changed, 13 insertions(+), 6 deletions(-)
>  create mode 100644 board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 board/freescale/imx8qmmek/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx8qmmek/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx8qmmek/patches/uboot/uboot.hash

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
