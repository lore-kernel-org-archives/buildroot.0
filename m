Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692FCC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D82981331;
	Sun, 16 Mar 2025 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1ewKsVkWY3d; Sun, 16 Mar 2025 17:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0966C81316
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0966C81316;
	Sun, 16 Mar 2025 17:17:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69F7E16E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EE15401F1
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPjyD_Z_Ok61 for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 17:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A30640378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A30640378
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A30640378
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:17:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1BC542003BE;
 Sun, 16 Mar 2025 18:17:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 18:17:22 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 18:17:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Michael
 Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <20250310055356.273718-2-meena.murthy@amarulasolutions.com>
References: <20250310055356.273718-2-meena.murthy@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e79f82c56b52b16221625312fab2894f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742145445;
 bh=BwkZQZKi+g6HcD/tY681NkWyEQTlPeD0FsiDS42DDgk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qe60TC5LP2ZVvUM5xykUKySNkfyBcGcErfmfQXXUtQHYgf9K09AtqbKHW+2XGQlKu
 LF3TDhNeVQjLfuF22KcleZEI+uNgjsNIue7jzMdKzXCLifACxahOhEFgoocpGKCo7j
 f6EhGIsF9WMFpoBi4/+rWOnvT13aq7OtsGz1INH5I7MVKukazcSCIvkYgkdLXOk/NL
 qCqysknk3HHIvaN4gQadELJU+5tCr37sVlvL5QMeQ+YCUntF154/yKzlysYcHF0KhS
 A+3+IRuCuiFLHpTNm1bGrkFr7U7gudKdzcgwoSVS1q0+mt0BH1R3gAPX94pmmh1/MW
 9psKlFfNkEGwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qe60TC5L
Subject: Re: [Buildroot] [PATCH v3] board: Add support for Engicam PX30 SOM
 board
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Meena,

Thanks for the patch!  I have few comments.

First, to follow the "convention" with other commits, could you
change the commit one-liner title to:

configs/engicam_px30_core_defconfig: new defconfig

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/27b3e6774fe447dc5eb12cc7f498ec8868eb65c9

On 10/03/2025 06:53, Meena Murthy wrote:
> Add initial support for Engicam PX30 SOM board
> with below features:
> - U-Boot 2024.01
> - Linux 6.4.16
> - Default packages from buildroot
> 
> px30 ctouch2 with 10 inches display
> 
> https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/ \
> 	General-purpose-carrier-board-with-capacitive-touch-interface-EDIMM-20-compliant
> 
> ---
> 
> Changes v2 -> v3:
> Used BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS so tht arguments are passed only 
> to BR2_ROOTFS_POST_IMAGE_SCRIPT
> 
> Changes v1 -> v2:
> Based on code review comments
> - Added more details in readme.txt for Engicam board
> - Corrected board name
> - Removed android-sparse image from genimage.cfg
> - Changes to configuration file
> 
> Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Those "Signed-off-by" lines should be moved in the previous section
(before "---", as this patch change list gets removed when applied).

> ---
>  DEVELOPERS                                    |  4 ++
>  board/engicam/px30core/extlinux.conf          |  4 ++
>  board/engicam/px30core/genimage.cfg           | 22 +++++++
>  .../patches/linux-headers/linux-headers.hash  |  1 +
>  .../engicam/px30core/patches/linux/linux.hash |  2 +
>  .../engicam/px30core/patches/uboot/uboot.hash |  2 +
>  board/engicam/px30core/post-build.sh          |  5 ++
>  board/engicam/px30core/readme.txt             | 60 +++++++++++++++++++
>  configs/engicam_px30_core_defconfig           | 55 +++++++++++++++++
>  9 files changed, 155 insertions(+)
>  create mode 100644 board/engicam/px30core/extlinux.conf
>  create mode 100644 board/engicam/px30core/genimage.cfg
>  create mode 120000 
> board/engicam/px30core/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/engicam/px30core/patches/linux/linux.hash
>  create mode 100644 board/engicam/px30core/patches/uboot/uboot.hash
>  create mode 100755 board/engicam/px30core/post-build.sh
>  create mode 100644 board/engicam/px30core/readme.txt
>  create mode 100644 configs/engicam_px30_core_defconfig

[...]

> diff --git a/board/engicam/px30core/patches/linux/linux.hash 
> b/board/engicam/px30core/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..db84a5e56b
> --- /dev/null
> +++ b/board/engicam/px30core/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated

Since you are using an upstream Kernel, we can get hashes from
upstream. Can you change this "# Locally calculated" with:

# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc

> +sha256  
> 9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  
> linux-6.4.16.tar.xz

[...]

> diff --git a/configs/engicam_px30_core_defconfig 
> b/configs/engicam_px30_core_defconfig
> new file mode 100644
> index 0000000000..d92dba69ed
> --- /dev/null
> +++ b/configs/engicam_px30_core_defconfig
> @@ -0,0 +1,55 @@
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y

The Kernel device tree you reference below is:
rockchip/px30-engicam-px30-core-ctouch2-of10

 From:
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=v6.4.16#n9
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/px30.dtsi?h=v6.4.16#n38

this DTS describes 4x Cortex-A35 CPUs in the PX30.
This should preferably be:

BR2_cortex_a35=y

Can you double-check, and correct if needed?

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y

I recommend to switch to 6.12.x series, so this should become:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
See also my comment for BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE.

> +BR2_BINUTILS_VERSION_2_42_X=y

Buildroot defconfigs usually keep the default binutils version. So
this "BR2_BINUTILS_VERSION_2_42_X=y" can be removed.

> +BR2_CURL="curl -q --ftp-pasv --retry 3"
> +BR2_WGET="wget -nd -t 3"
> +BR2_SVN="svn --non-interactive"
> +BR2_SCP="scp"
> +BR2_SFTP="sftp"
> +BR2_GNU_MIRROR="http://ftpmirror.gnu.org"

BR2_CURL to BR2_GNU_MIRROR variables does not seem specific to this
board defconfig. They can be removed so the defconfig can use the
Buildroot default values.

> +BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_TARGET_GENERIC_HOSTNAME=""

BR2_TARGET_GENERIC_HOSTNAME should preferably contain a string
identifying the board, like "engicam-px30-core", or could be
completely removed (to use the default value). Could you change
to use one of those two options?

> +BR2_TARGET_GENERIC_ISSUE=""

Same comment for BR2_TARGET_GENERIC_ISSUE. Can you use a string
identifying the board, like "Welcome to Engicam PX30.Core C.TOUCH 2.0"
or remove this config variable (to use the default value)?

> +BR2_ROOTFS_MERGED_USR=y

BR2_ROOTFS_MERGED_USR should be a choice left to the end user.
Can you remove this configuration from this defconfig?

> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c 
> board/engicam/px30core/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"

Kernel 6.4.x series is not LTS and is no longer maintained. Since
this board is still maintained upstream, could you update the
kernel to the latest LTS? At this time, this is v6.12.19. See:
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=v6.12.19

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
> +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"

The _CUSTOM_REPO_URL given here is the same as the Buildroot
default value. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/boot/arm-trusted-firmware/arm-trusted-firmware.mk?ref_type=tags#L19

So _CUSTOM_GIT and _CUSTOM_REPO_URL can be removed.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"

Since this platform seems to be supported upstream, can you
update to the latest lts version? At this time, it is "lts-v2.12.1".
See:
https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/tags/lts-v2.12.1

So this should become:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.12.1"

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="px30"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"

Same comment for u-boot. Since this board seems to be supported in
upstream u-boot, it could be updated to v2025.01. See:
https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/configs/px30-core-ctouch2-of10-px30_defconfig

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="px30-core-ctouch2-of10-px30"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_USE_BINMAN=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Can you send an updated version of this patch with those changes,
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
