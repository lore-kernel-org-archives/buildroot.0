Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3832C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E45581086;
	Thu,  1 Aug 2024 21:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLrpirI6XeTg; Thu,  1 Aug 2024 21:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A92181117
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A92181117;
	Thu,  1 Aug 2024 21:21:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF481BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E1281086
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8sUnpG47EZ6 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 686F180F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 686F180F6E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 686F180F6E
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:21:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3008E40002;
 Thu,  1 Aug 2024 21:21:24 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:21:24 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801232124.41e55667@windsurf>
In-Reply-To: <20240801174453.11300-1-ju.o@free.fr>
References: <20240801174453.11300-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722547285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGV7s6GZB+oPHcT5xDphQsyfEc2P+Bw+je45+VNBzXM=;
 b=eo3aOoVIsnpkHDe4oONsICX74L28Ov5WxyMcBPsJyJasfXAwOo9u7acV5WpjOpfkYh2u3+
 xGw86Q80eUUkA3KeVK0d0MTwH9nevyMjn2tMGUB73DAP2hF8bsdKxTH6TO0aczvn9oyaxu
 EEalXefOqyHa2VAADMG+QHSmUUTFvK8zqh7/AUreJryDWYEyC94cUUUidyHHSnVg1sbmsv
 NafPp+9Ui28+PrafRlzC0+KdxWrYCKGuj5PTPUOYn03ZF8CthXHws3bHoR+rOzEqm9Bxl5
 v7pMTJqkduI/Bc0W1x8k7MX+DEdK8ROsubnNil0IrbZnnvk4jKB/EhBVaowI8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eo3aOoVI
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8mpevk: bump BSP
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 19:44:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> this freescale_imx8mpevk_defconfig is failing to build the Kernel
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
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089468
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                    |  1 -
>  .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
>  .../imx8mpevk/patches/linux-headers/linux-headers.hash |  1 +
>  board/freescale/imx8mpevk/patches/linux/linux.hash     |  2 ++
>  board/freescale/imx8mpevk/patches/uboot/uboot.hash     |  2 ++
>  configs/freescale_imx8mpevk_defconfig                  | 10 ++++++----
>  6 files changed, 13 insertions(+), 5 deletions(-)
>  create mode 100644 board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx8mpevk/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx8mpevk/patches/uboot/uboot.hash

Applied to master, thanks. Should you add yourself in the DEVELOPERS
file for this board, and perhaps the other NXP boards?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
