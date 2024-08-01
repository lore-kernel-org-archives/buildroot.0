Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8132CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4846180BC6;
	Thu,  1 Aug 2024 21:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQ2Ut_yadG7Y; Thu,  1 Aug 2024 21:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E9B3801CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9B3801CF;
	Thu,  1 Aug 2024 21:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E16B51BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF9A08207D
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujY6qb5E9K9E for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5335C81F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5335C81F91
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5335C81F91
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:44:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 186DBFF804;
 Thu,  1 Aug 2024 21:44:22 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:44:22 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801234422.3f7c069e@windsurf>
In-Reply-To: <20240731200814.35460-1-ju.o@free.fr>
References: <20240731200814.35460-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTrv8MWy04Urgsz8Ot9msxrrE9HmvhCgoMGtmMNLmuw=;
 b=R44eEDC9LAvWrFPTr9GmLgHAtH0qv75ZychczcdH0hN4Q7gIjDnm315yz07cw8uIV/kqJj
 /hYuDLi5iAWttuZAZPbTpYJ295CajOQJdUO3Wax7qSn49sd80jXYXQ2DF0tBRdBOpDcCLG
 ig3axwSUTusEymJftTvC0bCclfT4V085eBCj4ktfDAuHk46gRNKZLm2EA+1zOU5zx0bvjC
 /MSNHYgrWEd0pTRWQ39/8klaP5lbd7HcmvyZKOGtH2HQBlSmh81SEp1DPZxaO85yS6hZjz
 1xHAt0rmdHjv4Ytau5wH5BnLVOUgEp/R2lH86pUixpfZ9fY1VGXpkPfvYXn/nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R44eEDC9
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8mmevk: bump BSP
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
Cc: Fabio Estevam <festevam@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 22:08:14 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> this freescale_imx8mmevk_defconfig is failing to build the Kernel
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
> "board/freescale/imx8mmevk/patches". This for two reasons:
> 
> 1. the common patch directory is removed, because the patches for
>    arm-trusted-firmware are no longer needed. Patch 0001 is included
>    in this new version, and patch 0002 no longer needed due a code
>    rewrite in this new version. The common patch files are kept,
>    because they are used in other freescale_ defconfigs.
> 
> 2. the imx8mmevk patch directory is introduced, to include the needed
>    hash files, because this commit enables
>    BR2_DOWNLOAD_FORCE_CHECK_HASHES=y. Those hash files are introduced
>    in a board specific directory to allow updating this defconfig
>    independently of the other i.MX defconfigs: there is 16
>    freescale_imx*_defconfigs, with more or less dependencies
>    (firmwares, gpu drivers, ...). The ".checkpackageignore" entry for
>    this defconfig is also removed.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089464
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                   |  1 -
>  .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 ++
>  .../patches/linux-headers/linux-headers.hash          |  1 +
>  board/freescale/imx8mmevk/patches/linux/linux.hash    |  2 ++
>  board/freescale/imx8mmevk/patches/uboot/uboot.hash    |  2 ++
>  configs/freescale_imx8mmevk_defconfig                 | 11 ++++++-----
>  6 files changed, 13 insertions(+), 6 deletions(-)
>  create mode 100644 board/freescale/imx8mmevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 board/freescale/imx8mmevk/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx8mmevk/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx8mmevk/patches/uboot/uboot.hash

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
