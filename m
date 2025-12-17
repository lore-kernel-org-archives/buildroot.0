Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42095D68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F0B403CE;
	Wed, 17 Dec 2025 22:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGNPaFyBF4ds; Wed, 17 Dec 2025 22:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EB5140432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766009854;
	bh=y0lwY0aEv9yABKiCyPLvXk8UUqfcA5iSfvI2kdNAymc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mrm73snq4OcQGbJZjH0icl2zjF7OYYwbOz10WrGZWx1VqG9kY01ERS2cLjl3vv4FS
	 GuOrWftZjPEvY+VN3txjI0KT13rd+gYCmVbC6IOcfr5pPZ4fR3GlyRvum8q/qPjEHf
	 wKeJpW5F4Dwcektw82Z4BNImQHKOp5hsgEyJhW4cmeG4xHea0T5lIyhORzO67eUF81
	 S1YRtaG0vHpbKEK0VqRPs0Uc6sOGWuS6xS9gCavJujiUc3CIhwOUuvNl+f9Tk8tcSn
	 rb1l5vPhhdJ4cg8Ykmv9BKEmTPuoFa/o7ZjT4aGTrjwIQjuCxCTj1DmRRO/Unl/1kH
	 0OEnmT7p7rVrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB5140432;
	Wed, 17 Dec 2025 22:17:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C62CC375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFBF240432
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7NsYc1Dfo_D for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44721403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44721403CE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44721403CE
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:17:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7465419F593;
 Wed, 17 Dec 2025 23:17:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 23:17:28 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 23:17:28 +0100
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251216174352.11588-3-vjardin@free.fr>
References: <20251216174352.11588-1-vjardin@free.fr>
 <20251216174352.11588-3-vjardin@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <4f8eade4841fb79583d824f63415bdc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766009849;
 bh=j3ximQ7dk+O8H1JgyyrHqlZZ9lKtYeLbQ/g+R68wCVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iNRqoTL3+Sv+GIKyzZDSi1IhBx1lBS5trNmKxvOIOv+O7SeS87LhDsWbxl1rk9O6F
 SncbxAu0VM2Ee5PCUGb4Yr43u17FhakySAMiJWVVB6h8RSM4HdD4vnxCIG3csq+HUk
 7Ad0qFOjP82zEYOT8ASN1cmY1ANvCnVSQqiyUqzEJLRe0HyB+77MjZuPXMhoenrvYU
 cPLul+tMCthaGqA+ie3xW1hlIRjlDPcq+j6FpCxxoVmaPZBmKN5zPVeFsr+dGL/Gct
 1r/QQ+WFgDkmwK8MnAUd1YS7kLlYdMTrPiDpm+gm+UkWjFe8yOjjBB35wVILMDY85u
 Hi2qLE0nCm1gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iNRqoTL3
Subject: Re: [Buildroot] [PATCH v1 2/2] configs: add
 marvell_armada8040_db_defconfig
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

Hi Vincent,

Thanks for the patch.  I have few comments.

Could you squash this series in a single patch that introduces the
defconfig, please?  See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/c584135c0e9a2144ca2ecb09b2b21a1aa7178438

On 16/12/2025 18:43, Vincent Jardin via buildroot wrote:
> Add a new defconfig for the Marvell Armada 8040 DB (Development Board)
> using recent mainline software versions:
> 
> - Linux 6.12.8 (LTS kernel)

Any reason why you introduce this specific version?
Why not 6.12.62 (the latest 6.12.y as of now), or even 6.18.1, which 
still
contains this board:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/marvell/armada-8040-db.dts?h=v6.18.1
and is also the next LTS kernel series.
https://git.kernel.org/pub/scm/docs/kernel/website.git/commit/?id=b9ea3472ee1d973f4c27d075c7e4445afa7ade89

> - U-Boot 2024.10

Same question: why not 2025.10?
The config still seems to be here:
https://source.denx.de/u-boot/u-boot/-/blob/v2025.10/configs/mvebu_db_armada8k_defconfig

> - ARM Trusted Firmware v2.12

There is a v2.14 upstream you might consider:
https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/tags/v2.14
(even it is not the "LATEST" version in Buildroot).

> Key configuration choices:
> - TF-A platform "a80x0" with mrvl_flash target
> - U-Boot defconfig "mvebu_db_armada8k"
> - Device tree "marvell/armada-8040-db"
> - Initramfs embedded into kernel image
> 
> Output files in output/images/:
> - flash-image.bin: ATF + U-Boot for SPI NOR
> - Image: Linux kernel with embedded initramfs
> - armada-8040-db.dtb: Device tree
> 
> Boot method: SPI NOR boot, kernel loaded via TFTP or eMMC.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  configs/marvell_armada8040_db_defconfig | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 configs/marvell_armada8040_db_defconfig
> 
> diff --git a/configs/marvell_armada8040_db_defconfig 
> b/configs/marvell_armada8040_db_defconfig
> new file mode 100644
> index 0000000000..3db4f032b7
> --- /dev/null
> +++ b/configs/marvell_armada8040_db_defconfig
> @@ -0,0 +1,33 @@
> +BR2_aarch64=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

Could you switch the toolchain to use the external Bootlin glibc stable?
See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/47f4e3810c981e8cee19d8a411b38c771ebd2381

> +BR2_TARGET_GENERIC_HOSTNAME="armada8040-db"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell Armada 8040 
> DB"
> +BR2_INIT_BUSYBOX=y

This line is not needed (and few others), as it is the default value.
Could you please regenerate this defconfig by doing a:

make marvell_armada8040_db_defconfig
make savedefconfig

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.8"

Please consider the latest LTS version (6.18.1), if possible.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/marvell/armada-8040-db/linux-extras.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-db"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y

You should preferably pin a specific version (consider v2.14).
You could also eventually use:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="flash-image.bin"
> +BR2_TARGET_BINARIES_MARVELL=y
> +BR2_TARGET_MV_DDR_MARVELL=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"

Please consider 2025.10.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_db_armada8k"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> --
> 2.43.0

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
