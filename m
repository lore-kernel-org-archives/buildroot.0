Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE870C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3AF40B69;
	Sun, 24 Mar 2024 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sppnZYJaukf7; Sun, 24 Mar 2024 17:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A54A40B2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A54A40B2C;
	Sun, 24 Mar 2024 17:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2A91BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA1FA4026A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGyL8Tp_1JNf for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F38E940469
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F38E940469
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E21DF83BB4; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:06:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b96e29723029c0a856cd558a21218fbbede7234
X-Git-Newrev: 21629634adee2e0c5541ff1d74b8bd297676815f
X-Patchwork-Hint: ignore
Message-Id: <20240324171116.E21DF83BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/avenger96_defconfig: bump Linux
 version to 6.6.22 LTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=21629634adee2e0c5541ff1d74b8bd297676815f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch upgrades Kernel version to 6.6.22 LTS on avenger96 board.
Beside that, In accordance with the kernel 6.5rc1 commit
724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
the device tree path also has been modified to point the device tree in
the proper location.

As another change, due to commit 3108eb2e8aa7
("mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS"), the order of SD card and
eMMC probing has swapped. The SD card is now mmcblk0 instead of
mmcblk1. Thus, the default root append (mmcblk1p4) in 'extlinux.conf'
file in the overlay directory of the board is changed, otherwise the
rootfs was not possible to be detected.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/avenger96_defconfig                               | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
index 5d506b3dae..7d6d7f8a44 100644
--- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
+++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
-  append root=/dev/mmcblk1p4 rootwait
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 82702bcfc7..218955fc02 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 
 # Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
@@ -13,10 +13,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
