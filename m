Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C1CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 17:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A071F60675;
	Thu,  4 Sep 2025 17:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id av6mJs2XmSoC; Thu,  4 Sep 2025 17:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D04FB60648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04FB60648;
	Thu,  4 Sep 2025 17:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1996E111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3CE401B3
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSSxbuikWMFt for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 17:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C232401A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C232401A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C232401A1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:03:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1C28613F8B3;
 Thu,  4 Sep 2025 19:03:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 19:03:10 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 19:03:10 +0200
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250829012913.2050830-1-festevam@gmail.com>
References: <20250829012913.2050830-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2647a9a997ea870292be492981993273@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757005391;
 bh=H+ffTobg2RdRX4lPyiE20pdZqgYqZ0a4zzuzjdb/P80=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q8DMUtY/a+0OFMLiZ0qm6jzmS2bptc9tGa+5PZTvCNognKuayxFqBWaQ3Y7aq6U6e
 k3r4HsdUh0kIMZLjs4gKn8ACCgtJeq5PaDA00uLN7CYqEtyQ9CzWHgHkbnngRkmQC0
 NsO2ILhGsfkrSgY0R2l1N1beUJ44iHClkPbNWEc2AM4DDCH3w4sE+Y/8kSLe7BLLQh
 kEUszrhiXptbYHWBNEaT+s+HnnJ0AIZtIBUjNDOBOY7fxCNlpAq1R8rLoB1C7db051
 l5lx5dFa75nRTHS+qem6blCSUE1UpAypVAdOLlIy/2Ww0zN24xovcdFFIc8RRK2gm6
 vrUxIR9scWVHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q8DMUtY/
Subject: Re: [Buildroot] [PATCH] configs/imx8mm-evk_defconfig: Update kernel
 and U-Boot
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabio,

Thanks for the patch!

On 29/08/2025 03:29, Fabio Estevam wrote:
> Update the kernel version to 6.12.43 and U-Boot to 2025.07.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx8mm-evk_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/imx8mm-evk_defconfig 
> b/configs/imx8mm-evk_defconfig
> index 00fe2fa76119..1af55040a7b8 100644
> --- a/configs/imx8mm-evk_defconfig
> +++ b/configs/imx8mm-evk_defconfig
> @@ -10,7 +10,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"

Since this defconfig has BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
it should also update hashes for uboot and kernel in
board/freescale/imx8mm-evk/patches

With this patch, doing a "make source" currently fail with:

     ERROR: No hash found for linux-6.12.43.tar.xz

Could you send an updated patch, please?

>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
> @@ -31,7 +31,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
