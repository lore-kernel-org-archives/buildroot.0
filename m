Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3830EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4AC81389;
	Tue, 11 Jan 2022 20:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxrjksHvCo1O; Tue, 11 Jan 2022 20:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BD181345;
	Tue, 11 Jan 2022 20:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04A1E1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E77D360EB4
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aamF8_Cc7UEg for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:21:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D5A560EB3
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:21:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D23F4200009;
 Tue, 11 Jan 2022 20:21:45 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:21:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20220111212144.5ed9fc6f@windsurf>
In-Reply-To: <20220111035859.12895-2-peterlin@andestech.com>
References: <20220111035859.12895-1-peterlin@andestech.com>
 <20220111035859.12895-2-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] board/andes/ae350: add support for
 Andes AE350
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
Cc: Alan Kao <alankao@andestech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yu,

On Tue, 11 Jan 2022 11:58:59 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> This patch provides defconfig and basic support for the Andes
> 45 series RISC-V architecture.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>

Thanks for your patch! See below a number of comments.

> ---
>  DEVELOPERS                                    |    3 +-
>  board/andes/ae350/ae350.dts                   |  274 ++
>  board/andes/ae350/boot.cmd                    |    3 +
>  board/andes/ae350/genimage_sdcard.cfg         |   29 +
>  board/andes/ae350/linux.config.fragment       |    2 +
>  .../0001-Add-AE350-platform-defconfig.patch   |  158 +
>  ...002-Andes-support-for-Faraday-ATCMAC.patch |  510 +++
>  .../0003-Andes-support-for-ATCDMAC.patch      | 3301 +++++++++++++++++
>  .../linux/0004-Andes-support-for-FTSDC.patch  | 1884 ++++++++++
>  ...5-Non-cacheability-and-Cache-support.patch | 1132 ++++++
>  ...-Add-andes-sbi-call-vendor-extension.patch |  231 ++
>  ...e-update-function-local_flush_tlb_al.patch |  101 +
>  ...rt-time32-stat64-sys_clone3-syscalls.patch |   47 +
>  .../0009-dma-Support-smp-up-with-dma.patch    |  120 +
>  ...ix-atcdmac300-chained-irq-mapping-is.patch |  300 ++
>  .../linux/0011-DMA-Add-msb-bit-patch.patch    |  387 ++
>  .../0012-Remove-unused-Andes-SBI-call.patch   |  147 +
>  ...isable-PIC-explicitly-for-assembling.patch |   29 +
>  ...2-Enable-cache-for-opensbi-jump-mode.patch |   25 +
>  ...001-Fix-mmc-no-partition-table-error.patch |   27 +
>  ...2-Prevent-fw_dynamic-from-relocation.patch |   27 +
>  ...0003-Fix-u-boot-proper-booting-issue.patch |   26 +
>  ...04-Enable-printing-OpenSBI-boot-logo.patch |   25 +

That is really a *huge* number of patches, and some of them are very
large. I'm not sure we want all of them in Buildroot. It's of course
nice to see that it allows your defconfig to use the upstream Linux
kernel, but I think at this point it would be nicer to have a Git
repository with your Linux kernel code, and fetch that code.

Have all those patches been submitted to their respective upstream
projects?

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 12777e8d61..18b0444c72 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2122,10 +2122,11 @@ N:	Norbert Lange <nolange79@gmail.com>
>  F:	package/systemd/
>  F:	package/tcf-agent/
>  
> -N:	Nylon Chen <nylon7@andestech.com>
> +N:	Yu Chien Peter Lin <peterlin@andestech.com>

It would be nicer to have a separate patch to re-assign yourself on
this DEVELOPERS entry.

>  F:	arch/Config.in.nds32
>  F:	board/andes
>  F:	configs/andes_ae3xx_defconfig
> +F:	configs/ae350_andestar45_defconfig

It would probably be nicer to have a defconfig that starts with
"andes", to match the previous defconfig?


> diff --git a/board/andes/ae350/linux.config.fragment b/board/andes/ae350/linux.config.fragment
> new file mode 100644
> index 0000000000..299b75d2f4
> --- /dev/null
> +++ b/board/andes/ae350/linux.config.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_INITRAMFS_SOURCE=""
> +CONFIG_EFI_PARTITION=y

It feels quite odd that you need a linux configuration fragment, while
just below there is a patch adding the Linux kernel defconfig. Why not
adjust the Linux kernel defconfig directly?

> diff --git a/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch b/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch
> new file mode 100644
> index 0000000000..1384369972
> --- /dev/null
> +++ b/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch
> @@ -0,0 +1,158 @@
> +From 8a9097c1be79fdab3d907a8bbc66a222807cb81a Mon Sep 17 00:00:00 2001
> +From: Yu Chien Peter Lin <peterlin@andestech.com>
> +Date: Tue, 28 Dec 2021 09:05:34 +0800
> +Subject: [PATCH 01/12] Add AE350 platform defconfig

Please use "git format-patch -N" to generate patches.


> diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
> new file mode 100644
> index 0000000000..19cfa721a7
> --- /dev/null
> +++ b/board/andes/ae350/readme.txt
> @@ -0,0 +1,66 @@
> +Intro
> +=====
> +
> +Andestech AE350 Platform
> +
> +The AE350 prototype demonstrates the AE350 platform on the FPGA.

Is this platform publicly available? The way I read this sentence, it
seems like it's an internal prototyping platform. If that's the case,
I'm not sure what's the value for you to upstream these patches in
Buildroot, and what's the value for Buildroot to have this defconfig.

> diff --git a/configs/ae350_andestar45_defconfig b/configs/ae350_andestar45_defconfig
> new file mode 100644
> index 0000000000..fb4587b1a7
> --- /dev/null
> +++ b/configs/ae350_andestar45_defconfig
> @@ -0,0 +1,46 @@
> +BR2_riscv=y
> +BR2_riscv_custom=y
> +BR2_RISCV_ISA_CUSTOM_RVM=y
> +BR2_RISCV_ISA_CUSTOM_RVF=y
> +BR2_RISCV_ISA_CUSTOM_RVD=y
> +BR2_RISCV_ISA_CUSTOM_RVC=y
> +BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Any reason to override the default C library?

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_BINUTILS_VERSION_2_37_X=y
> +BR2_GCC_VERSION_11_X=y
> +BR2_GCC_ENABLE_OPENMP=y

Please keep the default binutils and gcc version, and don't enable
OpenMP support. The defconfigs should be minimal.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
> +BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae350/linux.config.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/andes/ae350/ae350.dts"
> +BR2_PACKAGE_OPENSSL=y

Please remove OpenSSL.

> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y

Why both cpio and ext4 ? Only one of them should be needed.

> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_PLAT="andes/ae350"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/andes/ae350/boot.cmd"

Could you rework your patch to take into account those comments and
post an updated version?

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
