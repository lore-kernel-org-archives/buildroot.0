Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8744EE9A762
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 11:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3617460BEE;
	Tue, 24 Mar 2026 11:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Jz3f1RZCTnE; Tue, 24 Mar 2026 11:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC27608C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774350138;
	bh=BV87/cGTX2f0IMrkaJUoLQYIqEIOpS30TEfEYCAVxFo=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FUHkpURWegFw91nwo+EJ/7c7qo7TDd2laC9h8OlbWchoON0hI81zD1cXx7iKz5EIr
	 mDbU1dZjhWFM9y3TTgyq3+DSAGY4HxjSMpwTMzqQueL83wsAtbc10Y8GdJMPDtPRvx
	 nLZVB8UE3CtTHArrUDM7iYDVfQgUKcWNnq+Epl5RpwI0QRe4UcuWvj+xf/DnuWxLR3
	 6p2ynAc33b/bwPphj7Jp4Kx3P7NnDbcuD+nAvpx0eG6p3TYT/KnSSVJiQ07ZiEkGzl
	 jSgqGVjyW6usMw3tVLIaIw7EP7tsw1A2T0a4h/dockdqaFkz7nZtz6cNVNiKqCYJRy
	 TWbFZuqfkCU3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC27608C2;
	Tue, 24 Mar 2026 11:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B33FA353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6EC82284
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p07RP15b5rNW for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 11:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::190d;
 helo=smtp-190d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AD3082286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD3082286
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::190d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AD3082286
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:11 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6c])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fg6Ys0qGqzqgL;
 Tue, 24 Mar 2026 12:02:09 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fg6Yr1xQpzKLw; Tue, 24 Mar 2026 12:02:08 +0100 (CET)
Date: Tue, 24 Mar 2026 12:01:45 +0100
Message-Id: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CQAxEf4X0bEm3myr6K8QDQtF6QN1Fswnh3
 y2azOXN5M0CWZNphlO1QNKPZXtMDmFXQX/rpquiDc7AxHuKHPE1CwoGT4NeChJjwdCFYzNQ1MM
 o4O4z6Wjl99turtTEdYHzf8rvy137efuFdf0Ci5huXoQAAAA=
X-Change-ID: 20260323-qt5-5-15-18-2025-02-x-1a198d03e7f5
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774350129;
 bh=uA/IzY+3+aE2xizVZf0zsXN+16/GXz/jzjwL773aRpc=;
 h=From:Subject:Date:To:Cc:From;
 b=VAoYhMqvX5Q3Bg0ow3o1T3O4/D+Y2lcCWoYevaHaZ9Mv4F9D+JjAYDZK2jYbxNiFK
 SOmVm/yNmZJb5M52LdwTkWBnG25t0KzkWfB0cZBb3/Rredu4FntkxTYx/AqhEIRg3U
 Y162UYHieTad7vzFqzVE7d9LR3tosLd6K3poqMe8x2y1V8Zjs+InbjpcRXJX9SwMUn
 DMXxmpbwmeh+VQ3nWntVHUOyaWlcDww7fl8rtRAlLeFbMhv7SZRtGlHPFLiZtVlTzq
 g+u6bouEBmCVY9t456DCYhmHf76DjwpzxH0HHLI3L60ELy+cvE0LQ2L21rKo1x+DMv
 d1kefke2GLs1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=VAoYhMqv
Subject: [Buildroot] [PATCH 2025.02.x 0/5] package/qt5: misc fixes + bump to
 5.15.18
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport of the series
https://lore.kernel.org/buildroot/20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de/
to the LTS. This thus depends on the series being merged to master
first, and possibly using git cherry-pick -x instead of what's been done
here. I've done this because 1) I use 2025.02.x only, 2) hopefully
lowers the efforts to backport the series for master to 2025.02.x by
having a publicly available "example" of what it'd look like.

Only the last patch had a conflict because one patch file is missing in
2025.02.x and another was renamed compared to master.

This has only been build tested on top of 2025.02.x with:

BR2_aarch64=y
BR2_cortex_a76_a55=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
BR2_TARGET_GENERIC_HOSTNAME="rock5b"
BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
BR2_LINUX_KERNEL_INTREE_DTSO_NAMES="rockchip/rk3588-rock-5b-pcie-srns rockchip/rk3588-rock-5b-pcie-ep"
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
BR2_PACKAGE_ROCKCHIP_RKBIN=y
BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_DTC=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

as defconfig and the following command being run:

make qt53d qt5base qt5charts qt5connectivity qt5declarative qt5doc \
         qt5graphicaleffects qt5imageformats qt5location qt5lottie \
         qt5multimedia qt5quickcontrols qt5quickcontrols2 \
         qt5quicktimeline qt5remoteobjects qt5script qt5scxml \
         qt5sensors qt5serialbus qt5serialport qt5speech qt5svg \
         qt5tools qt5virtualkeyboard qt5wayland qt5webchannel \
         qt5websockets qt5webview qt5x11extras qt5xmlpatterns

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (5):
      package/qt5/qt53d: disable assimp support when BR2_PACKAGE_ASSIMP is not set
      package/qt5/qt53d: force using Buildroot's assimp when selected
      package/qt5/qt53d: always disable assimp support
      package/qt5/qt5webengine-chromium: fix zlib license hash
      package/qt5: bump packages to latest 5.15 kde submodule version

 package/qt5/qt5.mk                                 |    2 +-
 package/qt5/qt53d/qt53d.hash                       |    2 +-
 package/qt5/qt53d/qt53d.mk                         |   12 +-
 .../0003-double-conversion-enable-for-nios2.patch  |    4 +-
 .../qt5/qt5base/0006-Fix-build-on-riscv32.patch    |    4 +-
 package/qt5/qt5base/qt5base.hash                   |    2 +-
 package/qt5/qt5base/qt5base.mk                     |    2 +-
 package/qt5/qt5charts/qt5charts.hash               |    2 +-
 package/qt5/qt5charts/qt5charts.mk                 |    2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |    2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |    2 +-
 package/qt5/qt5declarative/qt5declarative.hash     |    2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 package/qt5/qt5doc/qt5doc.hash                     |    2 +-
 package/qt5/qt5doc/qt5doc.mk                       |    2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |    2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |    2 +-
 package/qt5/qt5location/qt5location.hash           |    2 +-
 package/qt5/qt5location/qt5location.mk             |    2 +-
 package/qt5/qt5lottie/qt5lottie.hash               |    2 +-
 package/qt5/qt5lottie/qt5lottie.mk                 |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |    2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |    2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |    2 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |    2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |    2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash |    2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk   |    2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash |    2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk   |    2 +-
 package/qt5/qt5script/qt5script.hash               |    2 +-
 package/qt5/qt5script/qt5script.mk                 |    2 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |    2 +-
 package/qt5/qt5scxml/qt5scxml.mk                   |    2 +-
 package/qt5/qt5sensors/qt5sensors.hash             |    2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |    2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |    2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |    2 +-
 package/qt5/qt5serialport/qt5serialport.hash       |    2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |    2 +-
 package/qt5/qt5speech/qt5speech.hash               |    2 +-
 package/qt5/qt5speech/qt5speech.mk                 |    2 +-
 package/qt5/qt5svg/qt5svg.hash                     |    2 +-
 package/qt5/qt5svg/qt5svg.mk                       |    2 +-
 package/qt5/qt5tools/qt5tools.hash                 |    2 +-
 package/qt5/qt5tools/qt5tools.mk                   |    2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |    2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |    2 +-
 package/qt5/qt5wayland/qt5wayland.hash             |    2 +-
 package/qt5/qt5wayland/qt5wayland.mk               |    2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |    2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |    2 +-
 .../0001-Add-python3-build-support.patch           | 1858 --------------------
 ....patch => 0001-Don-t-rebase-sysroot-path.patch} |    0
 ...atch => 0002-Remove-unused-python-import.patch} |    0
 .../0003-Migrate-presubmit-to-python3.patch        |   49 +
 .../0004-Migrate-presubmit-to-python3.patch        |  132 --
 ...grit-util.py-fix-Python-3.12-build-issue.patch} |    0
 ...Fix-build-in-Python-3.11-invalid-mode-rU.patch} |   19 +-
 ...hon-google-protobuf-internal-python_mess.patch} |    0
 ...imp.load_source-with-importlib-equivalent.patch |   55 -
 ...-command_buffer-service-program_manager..patch} |    0
 ...Include-cstdint-for-uintptr_t-uint8_t-etc.patch |  297 ++++
 .../0010-Fix-building-with-system-libxml2.patch    |   57 -
 ...Include-cstdint-for-uintptr_t-uint8_t-etc.patch |  101 --
 .../qt5webengine-chromium.hash                     |    4 +-
 .../qt5webengine-chromium/qt5webengine-chromium.mk |    2 +-
 .../0002-Add-python3-build-support.patch           |  168 --
 ...i-remove-some-of-the-thumb-detection-log.patch} |    4 +-
 package/qt5/qt5webengine/qt5webengine.hash         |    2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |    2 +-
 package/qt5/qt5websockets/qt5websockets.mk         |    2 +-
 package/qt5/qt5webview/qt5webview.hash             |    2 +-
 package/qt5/qt5webview/qt5webview.mk               |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    2 +-
 81 files changed, 425 insertions(+), 2463 deletions(-)
---
base-commit: 928c7fde8bec295612b6569703bf3db2ee19338f
change-id: 20260323-qt5-5-15-18-2025-02-x-1a198d03e7f5

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
