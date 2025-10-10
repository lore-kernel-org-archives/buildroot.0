Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D5CAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 09:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C78361450;
	Fri, 10 Oct 2025 09:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqHQSiCGxLCW; Fri, 10 Oct 2025 09:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B1D76145D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1D76145D;
	Fri, 10 Oct 2025 09:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A40119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C297761450
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01k3XhD4lD1G for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 09:00:27 +0000 (UTC)
X-Greylist: delayed 503 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 10 Oct 2025 09:00:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 624DD6145D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624DD6145D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.61.186.89;
 helo=ibeerc.linenoise.info; envelope-from=alvaro@linenoise.info;
 receiver=<UNKNOWN> 
Received: from ibeerc.linenoise.info (ibeerc.linenoise.info [130.61.186.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 624DD6145D
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:00:27 +0000 (UTC)
Received: from [192.168.2.3] (unknown [109.227.153.227])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ibeerc.linenoise.info (Postfix) with ESMTPSA id ED4EA22DAF
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 10:52:00 +0200 (CEST)
Message-ID: <3cda94e9d0c9e9c75d9327f55ea4c822769fa4ee.camel@linenoise.info>
From: =?ISO-8859-1?Q?=C1lvaro?= "G. M." <alvaro@linenoise.info>
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 10:51:59 +0200
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=linenoise.info; s=ibeerc; t=1760086321;
 bh=Fre8LThIKhAnMaNLmtSo9V0EF9aR6rJGxvz660DTjGU=;
 h=Subject:From:To:Date:From;
 b=VNFN5L/TglahiczmJg5PYqnY3oJkSjLFjWed+AbBcK9uCBUJOKw844TrMPErcJJLk
 c+ndQ3HmB352dseXz2PGG+R1Cxojr3+MG4T3JVNwhU7fE34P88Dc1lUsvyeVvNVOMB
 MDP6pcnsfpuZCW+gI4aSmAAD6UwA8agG+gOgiqWwkD+HbpWJh3uMyP1PD0eE9lAiI4
 5cYkxMcsA4Ajeu8c75jp+z8APfAEZLsH0UBBr9XlCAiF1RwzUmmMrnm6ybI6ub9HVv
 sMOc1pyQen5I5Os5gcWUb43x53Ewj8ba+ADG3FByCMln0i2MyvLskOS1qUyHAPeiXY
 gIER+D6yps8eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linenoise.info
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linenoise.info header.i=@linenoise.info
 header.a=rsa-sha256 header.s=ibeerc header.b=VNFN5L/T
Subject: [Buildroot] Cannot build kernel with custom DTS file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I'm trying to upgrade an old 2021.08 buildroot based project to latest
master, using a more up to date kernel, for a platform based on zynqmp.

As a starting point I'm using my old defconfig and the latest zynqmp_zcu106_defconfig
with the difference that I want to provide my own DTS file to both the kernel and u-boot.

However, I'm stuck at kernel compilation because it doesn't seem to know how to build .dtb file:

$ make
make -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/../buildroot O=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR
PROJECT_NAME=SAR BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/defconfig defconfig
  GEN     /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Makefile
#
# configuration written to /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/.config
#
make -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/../buildroot O=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR
PROJECT_NAME=SAR BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/defconfig
/usr/bin/make -j1  O=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" syncconfig
  GEN     /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Makefile
>>> linux custom Building
cp -f /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/SAR.dts /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-custom/arch/arm64/boot/dts/
GIT_DIR=. PATH="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 HOSTCC="/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib" ARCH=arm64 KCFLAGS="-Wno-attribute-alias"
INSTALL_MOD_PATH=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/target CROSS_COMPILE="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/aarch64-linux-" WERROR=0
REGENERATE_PARSERS=1 DEPMOD=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
custom all
  SYNC    include/config/auto.conf
  CALL    scripts/checksyscalls.sh
GIT_DIR=. PATH="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 HOSTCC="/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib" ARCH=arm64 KCFLAGS="-Wno-attribute-alias"
INSTALL_MOD_PATH=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/target CROSS_COMPILE="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/aarch64-linux-" WERROR=0
REGENERATE_PARSERS=1 DEPMOD=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
custom Image
  CALL    scripts/checksyscalls.sh
GIT_DIR=. PATH="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 HOSTCC="/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/sslayer/Proyectos/ART/DAR/DAR-
upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib" ARCH=arm64 KCFLAGS="-Wno-attribute-alias"
INSTALL_MOD_PATH=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/target CROSS_COMPILE="/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/aarch64-linux-" WERROR=0
REGENERATE_PARSERS=1 DEPMOD=/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
custom SAR.dtb 
make[4]: *** No rule to make target 'arch/arm64/boot/dts/SAR.dtb'.  Stop.
make[3]: *** [Makefile:1408: SAR.dtb] Error 2
make[2]: *** [package/pkg-generic.mk:273: /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-custom/.stamp_built] Error 2
make[1]: *** [Makefile:83: _all] Error 2
make: *** [../common.mk:42: default] Error 2

In the old project I used 5.17. I've tried master buildroot with kernel 5.17
and this succeeds on building .dtb file, so I guess something has changed
between kernel versions that buildroot doesn't take into account.

File output/build/linux-custom/arch/arm64/boot/dts/SAR.dts exists,
so buildroot copies the file to the usual directory, but it seems
that it now requires the DTS to be behind a directory there, because
if I copy my SAR.dts file under output/build/linux-custom/arch/arm64/boot/dts/xilinx,
I can then manually run the last make line but asking it to make
xilinx/SAR.dtb instead of SAR.dtb, it will succeed.

So, it definitely looks like there's the need of placing user provided DTS file
under a directory, but I don't know how should this be fixed in buildroot.

Any insight would be appreciated.

Thanks

This is my defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
BR2_DL_DIR="$(HOME)/.buildroot-dl"
BR2_CCACHE=y
BR2_PACKAGE_OVERRIDE_FILE="$(BR2_EXTERNAL_SAR_PATH)/../local.mk"
BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_SAR_PATH)/../patch"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_SAR_PATH)/../overlay/common $(BR2_EXTERNAL_SAR_PATH)/../overlay/$(PROJECT_NAME)"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_SAR_PATH)/../scripts/set_version_file.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_SAR_PATH)/../scripts/zynq-post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-p $(PROJECT_NAME) -f $(BR2_EXTERNAL_SAR_PATH)/post_script.rc $(BR2_ART_SOFTWARE_VERSION)"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_SAR_PATH)/SAR.dts"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_XILINX_FPGAUTIL=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
BR2_TARGET_UBOOT_USE_BINMAN=y
BR2_TARGET_UBOOT_FORMAT_ITB=y
BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
BR2_TARGET_UBOOT_ZYNQMP=y
BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
BR2_TARGET_XILINX_EMBEDDEDSW=y
BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
