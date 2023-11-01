Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABF3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 12:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5897E4EBCD;
	Wed,  1 Nov 2023 12:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5897E4EBCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOY9AQKs25pt; Wed,  1 Nov 2023 12:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BF94EBCF;
	Wed,  1 Nov 2023 12:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BF94EBCF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A94491BF388
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5BE4EBCF
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5BE4EBCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBWIQupxsep8 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 12:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41344EBCD
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 12:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41344EBCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE05186339; Wed,  1 Nov 2023 12:56:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 13:51:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c65ba5c1d07ff311b85f65dacaebd99eb903ec0
X-Git-Newrev: 99d78b52a04119646e286081e07247cc74300e0b
X-Patchwork-Hint: ignore
Message-Id: <20231101125632.CE05186339@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle_defconfig:
 fix zicsr build error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99d78b52a04119646e286081e07247cc74300e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build is failing with an unrecognised opcode error due to missing
`zicsr` extension requirement. This is introduced with GCC version 12.
When binutils was updated to v2.38 they updated to the default ISA spec
version 20191213. In this version the original i extension split into i,
Zicsr and Zifencei. A fix for this has been added since U-Boot version
2022.01 to detect new Zicsr and Zifencei extensions and enable it when needed
therefore, an updated U-Boot tag to our latest 2023.09 release will fix
this as in our latest release we have updated to U-Boot version 2023.07.
Update the kernel verion in line with the U-Boot release version to
ensure compatiblities and latest features and fixes are included.
Remove riscv_g selection as it is now selected by default.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/microchip_mpfs_icicle_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 54a4d55a5f..1af7a3c474 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,12 +1,11 @@
 BR2_riscv=y
-BR2_riscv_g=y
 BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2023.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2023.09.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -16,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2023.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2023.09.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
