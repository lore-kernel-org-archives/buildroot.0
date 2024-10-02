Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFDCF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F5106116F;
	Wed,  2 Oct 2024 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiUQTx4xmucd; Wed,  2 Oct 2024 19:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC65861161
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC65861161;
	Wed,  2 Oct 2024 19:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E84E1BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D5B6413CE
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc3PIW4qpYW5 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A37400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A37400AC
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:43:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E67AA7F9BB; Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 21:08:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17bdd10cb350e9c45926c2a5a05f278d104ee4c9
X-Git-Newrev: edc0a6b1a43689fb832bc024b5997312e0770e99
X-Patchwork-Hint: ignore
Message-Id: <20241002194306.E67AA7F9BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: regenerate all defconfigs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edc0a6b1a43689fb832bc024b5997312e0770e99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the hackathon in Vienna, it was decided [0] to stop requiring
annotated defconfig files, and that they should all be regenerated.

This commit does just that.

This is a mechanical change, achieved by running (the defcfg script is
repriducedc at the end of the commit log):

    $ for cfg in configs/*_defconfig; do
        ./defcfg "${cfg##*/}" || break
      done

Out of our 302 defconfig files, only 247 needed regenerating, which
means that about 1 in 5 was already not providing the requested
annotations.

To be noted: three defconfig files had duplicate definitions, which this
commit resolves:

    nitrogen6sx_defconfig
    nitrogen7_defconfig
    olimex_a33_olinuxino_defconfig
        warning: override: reassigning to symbol BR2_PACKAGE_HOST_UBOOT_TOOLS

[0] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

====
Below is the script to reproduce the commmit. What it does is regenerate
the configuration first, then applies a patch to update kernel headers
to 3.11, and then recalls the defconfig again, and finally verifies that
the 3.11 headers are not selected (and ignores whether the latest are
selected or not): we want to catch whether defconfig that were using
3.10, currently the latest we support, would stioll get those headers
after we regeerate those.

    --->8------>8------>8------>8------>8---
    #!/bin/sh

    cfg="${1}"

    git checkout -- package/linux-headers/Config.in.host toolchain/Config.in
    make "${cfg}"
    make savedefconfig

    patch -p1 <<_EOF_
    diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
    index 2ae4077ffe..e669f89267 100644
    --- a/package/linux-headers/Config.in.host
    +++ b/package/linux-headers/Config.in.host
    @@ -129,8 +129,12 @@ choice
    	  If your kernel headers are more recent than the latest version
    	  in the choice, then select the latest version.

    +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
    +	bool "6.11.x or later"
    +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
    +
     config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
    -	bool "6.10.x or later"
    +	bool "6.10.x"
     	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10

     config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
    diff --git a/toolchain/Config.in b/toolchain/Config.in
    index 6e91ab756c..c2522aca7f 100644
    --- a/toolchain/Config.in
    +++ b/toolchain/Config.in
    @@ -656,6 +656,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
     config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
     	bool
     	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
    +
    +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
    +	bool
    +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
     	select BR2_TOOLCHAIN_HEADERS_LATEST

     # This should be selected by the latest version, above, to indicate that
    @@ -669,6 +673,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
     # stops affecting a value on the first matching default.
     config BR2_TOOLCHAIN_HEADERS_AT_LEAST
     	string
    +	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
     	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
     	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
     	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
    _EOF_

    make "${cfg}"
    git checkout -- package/linux-headers/Config.in.host toolchain/Config.in

    diff="$(
        diff -I '_6_11\|BR2_TOOLCHAIN_HEADERS_LATEST=y' -du \
            <( tail -n +5 .config.old ) \
            <( tail -n +5 .config )
    )"
    if [ "${diff}" ]; then
        printf 'Not idempotent for "%s"\n' "${cfg}" >&2
        exit 1
    fi
    ---8<------8<------8<------8<------8<---

====
To verify that no other changes are made to the defconfigs that are
risky when the defaults change, we ran the following simple script
(where buildroot-prev is a checkout just before this commit). It shows
that there are many settings removed because they are default, but none
of them run the same risk that the default is going to be changed in the
future.

    for i in configs/*_defconfig; do
        diff="$(diffconfig ../buildroot-next/$i $i)"
        if [ -n "$diff" ]; then
            echo "==> $i"
            echo "$diff"
            echo
        fi
    done

    --->8------>8------>8------>8------>8---
    ==> configs/aarch64_efi_defconfig
    -BR2_TARGET_GRUB2_ARM64_EFI y

    ==> configs/acmesystems_aria_g25_128mb_defconfig
    -BR2_arm926t y

    ==> configs/acmesystems_aria_g25_256mb_defconfig
    -BR2_arm926t y

    ==> configs/acmesystems_arietta_g25_128mb_defconfig
    -BR2_arm926t y

    ==> configs/acmesystems_arietta_g25_256mb_defconfig
    -BR2_arm926t y

    ==> configs/amarula_vyasa_rk3288_defconfig
    -BR2_PACKAGE_HOST_UBOOT_TOOLS y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/armadeus_apf27_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/armadeus_apf28_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/armadeus_apf51_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/aspeed_ast2600evb_defconfig
    -BR2_ARM_FPU_VFPV4D16 y

    ==> configs/asus_tinker-s_rk3288_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/at91sam9260eknf_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/at91sam9g20dfc_defconfig
    -BR2_TARGET_ROOTFS_TAR y
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_TARGET_ROOTFS_UBIFS_LEBSIZE 0x1f800
    -BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE 0x800
    -BR2_TARGET_ROOTFS_UBI_PEBSIZE 0x20000
    -BR2_TARGET_ROOTFS_UBI_SUBSIZE 512
    -BR2_arm926t y

    ==> configs/at91sam9g45m10ek_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/at91sam9rlek_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/at91sam9x5ek_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/at91sam9x5ek_dev_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y
    -BR2_arm926t y

    ==> configs/at91sam9x5ek_mmc_defconfig
    -BR2_arm926t y

    ==> configs/at91sam9x5ek_mmc_dev_defconfig
    -BR2_arm926t y

    ==> configs/atmel_sama5d3_xplained_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/atmel_sama5d3_xplained_dev_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/atmel_sama5d3xek_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/atmel_sama5d4_xplained_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/atmel_sama5d4_xplained_dev_defconfig
    -BR2_TARGET_ROOTFS_UBIFS y

    ==> configs/bananapi_m2_ultra_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/bananapro_defconfig
    -BR2_ARM_EABIHF y
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y

    ==> configs/beaglebone_qt5_defconfig
    -BR2_PACKAGE_TI_SGX_KM y
    -BR2_TOOLCHAIN_BUILDROOT_GLIBC y

    ==> configs/beagleboneai64_defconfig
    -BR2_TARGET_TI_K3_BOOT_FIRMWARE y
    -BR2_TARGET_UBOOT_NEEDS_PYLIBFDT y

    ==> configs/beelink_gs1_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/canaan_kd233_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y

    ==> configs/ci20_defconfig
    -BR2_KERNEL_HEADERS_AS_KERNEL y
    -BR2_PACKAGE_HOST_UBOOT_TOOLS y
    -BR2_TARGET_UBOOT_SPL_NAME "spl/u-boot-spl.bin"

    ==> configs/cubieboard2_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/freescale_imx28evk_defconfig
    -BR2_arm926t y

    ==> configs/friendlyarm_nanopi_r2s_defconfig
    -BR2_cortex_a53 y

    ==> configs/globalscale_espressobin_defconfig
    -BR2_cortex_a53 y

    ==> configs/hifive_unleashed_defconfig
    -BR2_LINUX_KERNEL_IMAGE y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/imx23evk_defconfig
    -BR2_arm926t y

    ==> configs/imxrt1050-evk_defconfig
    -BR2_LINUX_KERNEL_ZIMAGE y

    ==> configs/khadas_vim3_defconfig
    -BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE "khadas-vim3"

    ==> configs/kontron_bl_imx8mm_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/kontron_pitx_imx8m_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/kontron_smarc_sal28_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/lafrite_defconfig
    -BR2_cortex_a53 y

    ==> configs/lego_ev3_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_arm926t y

    ==> configs/linksprite_pcduino_defconfig
    -BR2_PACKAGE_WPA_SUPPLICANT_NL80211 y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/ls1046a-frwy_defconfig
    -BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM "ls1046"

    ==> configs/mx6cubox_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/nexbox_a95x_defconfig
    -BR2_cortex_a53 y

    ==> configs/nitrogen6sx_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/nitrogen6x_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/nitrogen7_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/nitrogen8m_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_cortex_a53 y

    ==> configs/nitrogen8mm_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_cortex_a53 y

    ==> configs/nitrogen8mn_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_cortex_a53 y

    ==> configs/nitrogen8mp_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_cortex_a53 y

    ==> configs/odroidc2_defconfig
    -BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY y

    ==> configs/olimex_a10_olinuxino_lime_defconfig
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/olimex_a13_olinuxino_defconfig
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/olimex_a20_olinuxino_lime2_defconfig
    -BR2_ARM_EABIHF y
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_TOOLCHAIN_BUILDROOT_GLIBC y

    ==> configs/olimex_a20_olinuxino_lime_defconfig
    -BR2_ARM_EABIHF y
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_TOOLCHAIN_BUILDROOT_GLIBC y

    ==> configs/olimex_a20_olinuxino_micro_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/olimex_a33_olinuxino_defconfig
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_FORMAT_BIN y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/olimex_a64_olinuxino_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/olimex_imx233_olinuxino_defconfig
    -BR2_arm926t y

    ==> configs/openblocks_a6_defconfig
    -BR2_arm926t y

    ==> configs/orangepi_lite2_defconfig
    -BR2_PACKAGE_WPA_SUPPLICANT_NL80211 y
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_cortex_a53 y

    ==> configs/orangepi_one_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/orangepi_one_plus_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_cortex_a53 y

    ==> configs/orangepi_pc_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/orangepi_pc_plus_defconfig
    -BR2_PACKAGE_WPA_SUPPLICANT_NL80211 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/orangepi_r1_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/orangepi_zero2w_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/orangepi_zero3_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/orangepi_zero_defconfig
    -BR2_PACKAGE_WPA_SUPPLICANT_NL80211 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/orangepi_zero_plus2_defconfig
    -BR2_PACKAGE_WPA_SUPPLICANT_NL80211 y
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/orangepi_zero_plus_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y
    -BR2_cortex_a53 y

    ==> configs/pine64_defconfig
    -BR2_cortex_a53 y

    ==> configs/pine64_sopine_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_cortex_a53 y

    ==> configs/qemu_aarch64_sbsa_defconfig
    -BR2_TARGET_GRUB2_ARM64_EFI y

    ==> configs/qemu_aarch64_virt_defconfig
    -BR2_cortex_a53 y

    ==> configs/qemu_arm_versatile_defconfig
    -BR2_arm926t y

    ==> configs/qemu_arm_vexpress_defconfig
    -BR2_ARM_FPU_VFPV3D16 y

    ==> configs/qemu_arm_vexpress_tz_defconfig
    -BR2_PACKAGE_LIBOPENSSL y

    ==> configs/qemu_m68k_mcf5208_defconfig
    -BR2_LINUX_KERNEL_VMLINUX y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_m68k_q800_defconfig
    -BR2_LINUX_KERNEL_VMLINUX y
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_m68k_68040 y

    ==> configs/qemu_microblazebe_mmu_defconfig
    -BR2_microblaze y

    ==> configs/qemu_microblazeel_mmu_defconfig
    -BR2_microblaze y

    ==> configs/qemu_mips32r2_malta_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips32r2el_malta_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips32r6_malta_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips32r6el_malta_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips64_malta_defconfig
    -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips64el_malta_defconfig
    -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips64r6_malta_defconfig
    -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_mips64r6el_malta_defconfig
    -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_ppc64le_powernv8_defconfig
    -BR2_powerpc_power8 y

    ==> configs/qemu_ppc64le_pseries_defconfig
    -BR2_powerpc_power8 y

    ==> configs/qemu_ppc_bamboo_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_ppc_g3beige_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_ppc_mpc8544ds_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_riscv32_nommu_virt_defconfig
    -BR2_LINUX_KERNEL_IMAGE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_riscv32_virt_defconfig
    -BR2_LINUX_KERNEL_IMAGE y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_riscv64_nommu_virt_defconfig
    -BR2_LINUX_KERNEL_IMAGE y
    -BR2_RISCV_64 y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_riscv64_virt_defconfig
    -BR2_LINUX_KERNEL_IMAGE y
    -BR2_RISCV_64 y
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/qemu_sh4_r2d_defconfig
    -BR2_sh4 y

    ==> configs/qemu_sparc64_sun4u_defconfig
    -BR2_sparc_v9 y

    ==> configs/qemu_sparc_ss10_defconfig
    -BR2_sparc_v8 y

    ==> configs/qemu_x86_defconfig
    -BR2_i386 y

    ==> configs/raspberrypi0_defconfig
    -BR2_ARM_EABIHF y

    ==> configs/raspberrypi0w_defconfig
    -BR2_ARM_EABIHF y

    ==> configs/raspberrypi2_defconfig
    -BR2_ARM_EABIHF y

    ==> configs/raspberrypi3_64_defconfig
    -BR2_cortex_a53 y

    ==> configs/raspberrypi3_qt5we_defconfig
    -BR2_PACKAGE_KMOD y
    -BR2_PACKAGE_QT5BASE_JPEG y
    -BR2_PACKAGE_QT5BASE_PNG y
    -BR2_TOOLCHAIN_BUILDROOT_GLIBC y

    ==> configs/raspberrypi_defconfig
    -BR2_ARM_EABIHF y

    ==> configs/riotboard_defconfig
    -BR2_TARGET_GENERIC_GETTY y

    ==> configs/rock64_defconfig
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/rock_pi_n8_defconfig
    -BR2_LINUX_KERNEL_USE_DEFCONFIG y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/rockpro64_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31 y
    -BR2_TARGET_UBOOT_NEEDS_PYTHON3 y

    ==> configs/s6lx9_microboard_defconfig
    -BR2_microblaze y

    ==> configs/sheevaplug_defconfig
    -BR2_TARGET_GENERIC_GETTY y
    -BR2_TARGET_UBOOT_NETWORK n
    -BR2_arm926t y

    ==> configs/sipeed_maix_bit_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y

    ==> configs/sipeed_maix_bit_sdcard_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y
    -BR2_TARGET_UBOOT_FORMAT_BIN y

    ==> configs/sipeed_maix_dock_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y

    ==> configs/sipeed_maix_dock_sdcard_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y
    -BR2_TARGET_UBOOT_FORMAT_BIN y

    ==> configs/sipeed_maix_go_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y

    ==> configs/sipeed_maix_go_sdcard_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y
    -BR2_TARGET_UBOOT_FORMAT_BIN y

    ==> configs/sipeed_maixduino_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y

    ==> configs/sipeed_maixduino_sdcard_defconfig
    -BR2_BINFMT_FLAT y
    -BR2_RISCV_64 y
    -BR2_RISCV_ABI_LP64D y
    -BR2_TARGET_UBOOT_FORMAT_BIN y

    ==> configs/snps_archs38_hsdk_defconfig
    -BR2_TOOLCHAIN_BUILDROOT_GLIBC y

    ==> configs/solidrun_clearfog_gt_8k_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP n

    ==> configs/solidrun_macchiatobin_defconfig
    -BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP n
    -BR2_TARGET_ROOTFS_TAR y
    -BR2_TARGET_UBOOT_USE_DEFCONFIG y

    ==> configs/spike_riscv64_defconfig
    -BR2_RISCV_64 y

    ==> configs/ts5500_defconfig
    -BR2_i386 y
    -BR2_x86_i586 y

    ==> configs/versal_vck190_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/versal_vpk180_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_kria_kd240_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_kria_kr260_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_kria_kv260_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_zcu102_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_zcu104_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"

    ==> configs/zynqmp_zcu106_defconfig
    -BR2_TARGET_XILINX_PREBUILT_VERSION "xilinx_v2024.1"
    ---8<------8<------8<------8<------8<---
---
 configs/aarch64_efi_defconfig                    | 30 ++------
 configs/acmesystems_aria_g25_128mb_defconfig     | 14 ----
 configs/acmesystems_aria_g25_256mb_defconfig     | 14 ----
 configs/acmesystems_arietta_g25_128mb_defconfig  | 14 ----
 configs/acmesystems_arietta_g25_256mb_defconfig  | 14 ----
 configs/am574x_idk_defconfig                     | 25 ++----
 configs/amarula_vyasa_rk3288_defconfig           | 45 +++++------
 configs/arcturus_ucls1012a_defconfig             | 13 ----
 configs/arcturus_ucp1020_defconfig               | 11 ---
 configs/arm_foundationv8_defconfig               |  1 -
 configs/arm_fvp_ebbr_defconfig                   | 17 +----
 configs/armadeus_apf27_defconfig                 | 19 +----
 configs/armadeus_apf28_defconfig                 | 17 +----
 configs/armadeus_apf51_defconfig                 | 14 +---
 configs/aspeed_ast2500evb_defconfig              | 29 ++-----
 configs/aspeed_ast2600evb_defconfig              | 27 ++-----
 configs/asus_tinker-s_rk3288_defconfig           | 40 ++++------
 configs/asus_tinker_rk3288_defconfig             | 39 ++++------
 configs/at91sam9260eknf_defconfig                | 13 ----
 configs/at91sam9g20dfc_defconfig                 | 18 -----
 configs/at91sam9g45m10ek_defconfig               | 15 +---
 configs/at91sam9rlek_defconfig                   | 15 +---
 configs/at91sam9x5ek_defconfig                   |  5 +-
 configs/at91sam9x5ek_dev_defconfig               | 21 +-----
 configs/at91sam9x5ek_mmc_defconfig               | 27 ++-----
 configs/at91sam9x5ek_mmc_dev_defconfig           | 26 +------
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 19 -----
 configs/atmel_sama5d3_xplained_defconfig         |  3 +-
 configs/atmel_sama5d3_xplained_dev_defconfig     | 20 +----
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 19 -----
 configs/atmel_sama5d3xek_defconfig               | 14 +---
 configs/atmel_sama5d4_xplained_defconfig         |  7 +-
 configs/atmel_sama5d4_xplained_dev_defconfig     | 24 +-----
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 19 -----
 configs/avenger96_defconfig                      | 15 +---
 configs/bananapi_m2_ultra_defconfig              |  1 -
 configs/bananapi_m2_zero_defconfig               |  6 +-
 configs/bananapro_defconfig                      | 49 +++---------
 configs/beaglebone_defconfig                     | 27 ++-----
 configs/beaglebone_qt5_defconfig                 |  4 +-
 configs/beagleboneai64_defconfig                 |  4 +-
 configs/beagleboneai_defconfig                   |  2 +-
 configs/beelink_gs1_defconfig                    | 13 +---
 configs/canaan_kd233_defconfig                   | 18 +----
 configs/chromebook_elm_defconfig                 | 31 ++------
 configs/ci20_defconfig                           | 18 +----
 configs/cubieboard1_defconfig                    | 15 ----
 configs/cubieboard2_defconfig                    | 30 +++-----
 configs/engicam_imx6qdl_icore_defconfig          | 36 ++++-----
 configs/engicam_imx6qdl_icore_qt5_defconfig      | 96 ++++++++++--------------
 configs/engicam_imx6qdl_icore_rqs_defconfig      | 36 ++++-----
 configs/engicam_imx6ul_geam_defconfig            | 36 ++++-----
 configs/engicam_imx6ul_isiot_defconfig           | 36 ++++-----
 configs/freescale_imx28evk_defconfig             | 20 +----
 configs/freescale_imx6dlsabreauto_defconfig      | 27 ++-----
 configs/freescale_imx6dlsabresd_defconfig        | 27 ++-----
 configs/freescale_imx6qsabreauto_defconfig       | 27 ++-----
 configs/freescale_imx6qsabresd_defconfig         | 27 ++-----
 configs/freescale_imx6sxsabresd_defconfig        | 27 ++-----
 configs/freescale_imx7dsabresd_defconfig         | 21 +-----
 configs/freescale_imx8mmevk_defconfig            |  2 +-
 configs/freescale_imx8mpevk_defconfig            |  2 +-
 configs/freescale_imx8mqevk_defconfig            |  2 +-
 configs/freescale_p1025twr_defconfig             |  9 ---
 configs/freescale_t1040d4rdb_defconfig           |  9 ---
 configs/freescale_t2080_qds_rdb_defconfig        | 10 ---
 configs/friendlyarm_nanopi_neo_defconfig         | 17 -----
 configs/friendlyarm_nanopi_r2s_defconfig         |  1 -
 configs/galileo_defconfig                        |  3 +-
 configs/globalscale_espressobin_defconfig        | 13 +---
 configs/hifive_unleashed_defconfig               | 33 ++------
 configs/icnova-a20-adb4006_defconfig             | 18 +----
 configs/imx23evk_defconfig                       | 20 +----
 configs/imx6-sabreauto_defconfig                 | 34 +++------
 configs/imx6-sabresd_defconfig                   | 34 +++------
 configs/imx6-sabresd_qt5_defconfig               | 96 ++++++++----------------
 configs/imx6slevk_defconfig                      | 16 ++--
 configs/imx6sx-sdb_defconfig                     | 18 ++---
 configs/imx6ulevk_defconfig                      | 21 +-----
 configs/imx6ullevk_defconfig                     | 32 ++------
 configs/imx6ulpico_defconfig                     | 37 ++-------
 configs/imx7d-sdb_defconfig                      | 23 ++----
 configs/imx7dpico_defconfig                      | 45 ++++-------
 configs/imx8mqevk_defconfig                      |  2 +-
 configs/imxrt1050-evk_defconfig                  | 20 +----
 configs/khadas_vim3_defconfig                    | 26 +------
 configs/kontron_bl_imx8mm_defconfig              | 27 ++-----
 configs/kontron_pitx_imx8m_defconfig             | 24 +-----
 configs/kontron_smarc_sal28_defconfig            |  3 +-
 configs/lafrite_defconfig                        |  1 -
 configs/lego_ev3_defconfig                       | 28 ++-----
 configs/linksprite_pcduino_defconfig             | 48 +++---------
 configs/ls1028ardb_defconfig                     | 22 +-----
 configs/ls1046a-frwy_defconfig                   | 25 +-----
 configs/mender_x86_64_efi_defconfig              | 57 ++++----------
 configs/minnowboard_max_defconfig                | 30 ++------
 configs/mx51evk_defconfig                        | 37 +++------
 configs/mx53loco_defconfig                       | 35 +++------
 configs/mx6cubox_defconfig                       | 17 -----
 configs/mx6sx_udoo_neo_defconfig                 | 22 +++---
 configs/mx6udoo_defconfig                        | 18 ++---
 configs/nexbox_a95x_defconfig                    |  1 -
 configs/nitrogen6sx_defconfig                    | 37 +++------
 configs/nitrogen6x_defconfig                     | 36 +++------
 configs/nitrogen7_defconfig                      | 39 +++-------
 configs/nitrogen8m_defconfig                     | 58 +++++---------
 configs/nitrogen8mm_defconfig                    | 58 +++++---------
 configs/nitrogen8mn_defconfig                    | 58 +++++---------
 configs/nitrogen8mp_defconfig                    | 58 +++++---------
 configs/octavo_osd32mp1_brk_defconfig            | 22 +-----
 configs/octavo_osd32mp1_red_defconfig            | 22 +-----
 configs/odroidc2_defconfig                       | 28 ++-----
 configs/odroidxu4_defconfig                      |  2 +-
 configs/olimex_a10_olinuxino_lime_defconfig      | 19 +----
 configs/olimex_a13_olinuxino_defconfig           | 43 ++++-------
 configs/olimex_a20_olinuxino_lime2_defconfig     | 29 +------
 configs/olimex_a20_olinuxino_lime_defconfig      | 29 +------
 configs/olimex_a20_olinuxino_micro_defconfig     | 16 +---
 configs/olimex_a33_olinuxino_defconfig           | 48 ++++--------
 configs/olimex_a64_olinuxino_defconfig           | 45 ++++-------
 configs/olimex_imx233_olinuxino_defconfig        | 29 +------
 configs/olimex_stmp157_olinuxino_lime_defconfig  | 17 -----
 configs/openblocks_a6_defconfig                  | 16 +---
 configs/orangepi_lite2_defconfig                 | 59 ++++++---------
 configs/orangepi_one_defconfig                   |  9 +--
 configs/orangepi_one_plus_defconfig              | 38 ++++------
 configs/orangepi_pc_defconfig                    |  1 -
 configs/orangepi_pc_plus_defconfig               | 34 ++++-----
 configs/orangepi_r1_defconfig                    | 11 +--
 configs/orangepi_zero2w_defconfig                | 57 +++++---------
 configs/orangepi_zero3_defconfig                 | 52 +++++--------
 configs/orangepi_zero_defconfig                  | 53 ++++---------
 configs/orangepi_zero_plus2_defconfig            | 67 ++++++-----------
 configs/orangepi_zero_plus_defconfig             | 50 +++++-------
 configs/pc_x86_64_bios_defconfig                 | 42 +++--------
 configs/pc_x86_64_efi_defconfig                  | 46 ++++--------
 configs/pcengines_apu2_defconfig                 | 17 +----
 configs/pine64_defconfig                         | 43 ++++-------
 configs/pine64_pinecube_defconfig                | 13 ----
 configs/pine64_sopine_defconfig                  | 42 ++++-------
 configs/pine64_star64_defconfig                  | 28 +++----
 configs/qemu_aarch64_ebbr_defconfig              | 21 +-----
 configs/qemu_aarch64_sbsa_defconfig              | 42 +++--------
 configs/qemu_aarch64_virt_defconfig              | 24 +-----
 configs/qemu_arm_ebbr_defconfig                  | 21 +-----
 configs/qemu_arm_versatile_defconfig             | 24 +-----
 configs/qemu_arm_vexpress_defconfig              | 27 ++-----
 configs/qemu_arm_vexpress_tz_defconfig           | 48 +++---------
 configs/qemu_m68k_mcf5208_defconfig              | 27 +------
 configs/qemu_m68k_q800_defconfig                 | 28 +------
 configs/qemu_microblazebe_mmu_defconfig          | 24 +-----
 configs/qemu_microblazeel_mmu_defconfig          | 24 +-----
 configs/qemu_mips32r2_malta_defconfig            | 26 +------
 configs/qemu_mips32r2el_malta_defconfig          | 26 +------
 configs/qemu_mips32r6_malta_defconfig            | 26 +------
 configs/qemu_mips32r6el_malta_defconfig          | 26 +------
 configs/qemu_mips64_malta_defconfig              | 27 +------
 configs/qemu_mips64el_malta_defconfig            | 27 +------
 configs/qemu_mips64r6_malta_defconfig            | 27 +------
 configs/qemu_mips64r6el_malta_defconfig          | 27 +------
 configs/qemu_nios2_10m50_defconfig               | 19 +----
 configs/qemu_or1k_defconfig                      | 21 +-----
 configs/qemu_ppc64_e5500_defconfig               | 19 +----
 configs/qemu_ppc64_pseries_defconfig             | 23 +-----
 configs/qemu_ppc64le_powernv8_defconfig          | 22 +-----
 configs/qemu_ppc64le_pseries_defconfig           | 22 +-----
 configs/qemu_ppc_bamboo_defconfig                | 30 ++------
 configs/qemu_ppc_e500mc_defconfig                | 19 +----
 configs/qemu_ppc_g3beige_defconfig               | 26 +------
 configs/qemu_ppc_mac99_defconfig                 | 25 +-----
 configs/qemu_ppc_mpc8544ds_defconfig             | 30 ++------
 configs/qemu_riscv32_nommu_virt_defconfig        | 21 +-----
 configs/qemu_riscv32_virt_defconfig              | 23 +-----
 configs/qemu_riscv64_nommu_virt_defconfig        | 22 +-----
 configs/qemu_riscv64_virt_defconfig              | 24 +-----
 configs/qemu_riscv64_virt_efi_defconfig          |  6 +-
 configs/qemu_s390x_defconfig                     | 21 +-----
 configs/qemu_sh4_r2d_defconfig                   | 24 +-----
 configs/qemu_sh4eb_r2d_defconfig                 | 21 +-----
 configs/qemu_sparc64_sun4u_defconfig             | 22 +-----
 configs/qemu_sparc_ss10_defconfig                | 22 +-----
 configs/qemu_x86_64_defconfig                    | 23 +-----
 configs/qemu_x86_defconfig                       | 24 +-----
 configs/qemu_xtensa_lx60_defconfig               | 29 ++-----
 configs/qemu_xtensa_lx60_nommu_defconfig         | 29 ++-----
 configs/raspberrypi0_defconfig                   | 37 +++------
 configs/raspberrypi0w_defconfig                  | 37 +++------
 configs/raspberrypi2_defconfig                   | 38 +++-------
 configs/raspberrypi3_64_defconfig                | 38 +++-------
 configs/raspberrypi3_defconfig                   | 37 +++------
 configs/raspberrypi3_qt5we_defconfig             | 49 ++++--------
 configs/raspberrypi4_64_defconfig                | 37 +++------
 configs/raspberrypi4_defconfig                   | 37 +++------
 configs/raspberrypi5_defconfig                   | 39 +++-------
 configs/raspberrypi_defconfig                    | 38 +++-------
 configs/raspberrypicm4io_64_defconfig            | 41 +++-------
 configs/raspberrypicm4io_defconfig               | 41 +++-------
 configs/raspberrypizero2w_defconfig              | 38 +++-------
 configs/riotboard_defconfig                      | 36 +++------
 configs/rock5b_defconfig                         | 57 ++++++--------
 configs/rock64_defconfig                         |  3 +-
 configs/rock_pi_n8_defconfig                     | 43 ++++-------
 configs/rockpro64_defconfig                      | 47 +++++-------
 configs/roseapplepi_defconfig                    | 10 +--
 configs/s6lx9_microboard_defconfig               |  6 +-
 configs/sheevaplug_defconfig                     | 32 +++-----
 configs/sipeed_lichee_rv_dock_defconfig          |  2 +-
 configs/sipeed_licheepi_nano_defconfig           | 19 +----
 configs/sipeed_licheepi_zero_defconfig           | 21 +-----
 configs/sipeed_maix_bit_defconfig                | 18 +----
 configs/sipeed_maix_bit_sdcard_defconfig         | 33 ++------
 configs/sipeed_maix_dock_defconfig               | 18 +----
 configs/sipeed_maix_dock_sdcard_defconfig        | 33 ++------
 configs/sipeed_maix_go_defconfig                 | 18 +----
 configs/sipeed_maix_go_sdcard_defconfig          | 33 ++------
 configs/sipeed_maixduino_defconfig               | 18 +----
 configs/sipeed_maixduino_sdcard_defconfig        | 33 ++------
 configs/snps_arc700_axs101_defconfig             | 13 +---
 configs/snps_arc700_nsim_defconfig               | 11 +--
 configs/snps_archs38_axs103_defconfig            | 13 +---
 configs/snps_archs38_haps_defconfig              | 11 +--
 configs/snps_archs38_hsdk_defconfig              |  3 +-
 configs/socrates_cyclone5_defconfig              |  6 +-
 configs/solidrun_clearfog_defconfig              | 17 +----
 configs/solidrun_clearfog_gt_8k_defconfig        | 43 +++++------
 configs/solidrun_macchiatobin_defconfig          | 44 ++++-------
 configs/spike_riscv64_defconfig                  |  1 -
 configs/stm32mp157a_dk1_defconfig                | 15 +---
 configs/stm32mp157c_dk2_defconfig                | 13 ----
 configs/stm32mp157c_odyssey_defconfig            |  4 +-
 configs/ts5500_defconfig                         | 13 ----
 configs/uevm5432_defconfig                       | 15 ----
 configs/versal_vck190_defconfig                  | 15 ++--
 configs/versal_vpk180_defconfig                  | 17 ++---
 configs/visionfive2_defconfig                    |  2 +-
 configs/wandboard_defconfig                      | 33 +++-----
 configs/warp7_defconfig                          | 37 ++-------
 configs/zynq_microzed_defconfig                  |  2 +-
 configs/zynq_zc702_defconfig                     |  2 +-
 configs/zynq_zc706_defconfig                     |  2 +-
 configs/zynq_zed_defconfig                       |  2 +-
 configs/zynqmp_kria_kd240_defconfig              | 15 ++--
 configs/zynqmp_kria_kr260_defconfig              | 13 ++--
 configs/zynqmp_kria_kv260_defconfig              | 15 ++--
 configs/zynqmp_zcu102_defconfig                  | 11 ++-
 configs/zynqmp_zcu104_defconfig                  | 11 ++-
 configs/zynqmp_zcu106_defconfig                  | 11 ++-
 247 files changed, 1460 insertions(+), 4632 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
