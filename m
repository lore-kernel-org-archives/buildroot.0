Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3D310F284F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C44083E95;
	Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EBMW21K-YS7; Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E11583E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630406;
	bh=WFa2LyEWOVy9cLWcOSXSKfT0q9+tYB1Alk9vP3JvK0I=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Xm0BmY4iI5f9EuJ0s8k7fqLvTfn4TAXuQH3zEuBOQyB6hB7Jxn6u3E0zFPgd6El+d
	 H9QbVTioVWQU4OkZnoxO7MnhSIyr5X3yHawlur7kfK6pCH8r2+w3XJ07spY8nXKFM9
	 2DG2L4z/PIw9LDL6RnhDuqIz7/G/NkIKmrzDxBSidXR9X9yXpIIPVZK6VZ/I9ayc70
	 PFDhBvmkdD8Ua02ED38XiUFWCRpQK6k5Cn0ZDiAxorWjyNdVabLldFgI2Kzuq80qop
	 +nYkb1qXG3RMdDAg31c84lVBoItBPDS3DJdoyFCbX6h6tTmBBiWsxdLVh2QNDruw+G
	 6546jY0EaPqxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E11583E96;
	Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84575249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 691E54179F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR6cE9ucTyG0 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.14;
 helo=smtp-bc0e.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD2C7417A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2C7417A1
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch
 [45.157.188.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD2C7417A1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:19 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fj6Cc6NsQzKZp;
 Fri, 27 Mar 2026 17:53:16 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fj6Cb4d3SzNfq; Fri, 27 Mar 2026 17:53:15 +0100 (CET)
Date: Fri, 27 Mar 2026 17:53:01 +0100
Message-Id: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBREf6W5a6/hEbC68j9MFy3cWly0CkhsG
 v5dqFuT2Zxk5swGgbyjAJdmA0/JBbfMBcShATP1853Q2cIgmNBMComvqFAhL2lR03Ay0kipzgr
 K4ulpdJ/ddut+HN7Dg0ysitqYXIiLX/e7xGvvvzlxZCjN2NqeaztydjUTeb8eLUGXc/4C4eLlo
 bgAAAA=
X-Change-ID: 20260323-qt5-5-15-18-6eb7c3c33595
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774630396;
 bh=+P1I3jpm8zt0jKy5XWOyEPB0fFA700DDQglHmu39Af4=;
 h=From:Subject:Date:To:Cc:From;
 b=Pv3bqiPCI1NbZMZJhvzt3DakzzKXRbFsV1SltW8CDDaQqw/s7k8sAlgug4NIwfx56
 gS2Z1PqMO4xWAzwrbuzlu13mxq6+nFFxXj1OED+8cBwEG3TT4KaqlwYgAYbG3/3don
 kNjQZMwuz9gjtqQ16Tp6cLkjsiylgNTC6ivW8g8U030pIP7GIBR+vWSJ758yZujlBG
 EwuRV6cRCvD8iSppbDBl32Dpma+6aeDppTdDHWT+iPa584Y+OADsqgXmSxTGAVfa8N
 I9oRsnZPzqNItEMzg3cDkB/SOUBYoK9XXmc3poiWoHFJINEZzPmqINVexWD7O2flbt
 nlcVUv87kk6yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=Pv3bqiPC
Subject: [Buildroot] [PATCH v2 0/5] package/qt5: misc fixes + bump to 5.15.18
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

qt53d currently doesn't build with assimp support enabled, either coming
from Buildroot or with the module sources coming from qt53d itself.

The first patch makes sure we disable assimp support when we're building
without BR2_PACKAGE_ASSIMP. The second patch makes sure we use assimp
package from Buildroot when its support is requested. The third patch
force-disables assimp support since it doesn't build with either
Buildroot's assimp or the one coming with qt53d source code. We could
squash the three into one, I just wanted to provide intermediate patches
if anyone is interested in bringing back support for assimp later on,
they would only need to revert the third patch.

The last qt5webengine-chromium forgot to update the license file hashes
so this is now fixed.

Then we bump qt5 to the latest version available in KDE's GitLab. The
only thing I'm unsure is whether we also need to bump catapult, and if
yes, to which version?

This has only been build tested on top of master with:

BR2_aarch64=y
BR2_cortex_a76_a55=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
BR2_TARGET_GENERIC_HOSTNAME="rock5b"
BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
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
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT53D=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5CHARTS=y
BR2_PACKAGE_QT5CONNECTIVITY=y
BR2_PACKAGE_QT5DOC=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5LOTTIE=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICKTIMELINE=y
BR2_PACKAGE_QT5REMOTEOBJECTS=y
BR2_PACKAGE_QT5SCRIPT=y
BR2_PACKAGE_QT5SCXML=y
BR2_PACKAGE_QT5SERIALBUS=y
BR2_PACKAGE_QT5SPEECH=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
BR2_PACKAGE_QT5WAYLAND=y
BR2_PACKAGE_QT5WEBKIT=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_QT5WEBVIEW=y
BR2_PACKAGE_QT5XMLPATTERNS=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
BR2_PACKAGE_NEARD=y
BR2_PACKAGE_ROCKCHIP_RKBIN=y
BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
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
BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
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

I'm now working on backporting this to 2025.02.x and will be sent as a
separate series.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- fixed QT5BASE_CPE_ID_VERSION reporting the wrong value,
- Link to v1: https://patch.msgid.link/20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de

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
 package/qt5/qt5base/qt5base.mk                     |    4 +-
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
 ...rted-printed-cmd-when-long-commands-fail.patch} |    0
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
 82 files changed, 426 insertions(+), 2464 deletions(-)
---
base-commit: 0ce674c2449fd506b4836a80ec0d78c2862d353d
change-id: 20260323-qt5-5-15-18-6eb7c3c33595

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
