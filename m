Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0D8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FCC560F58
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FCC560F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3472640389;
	Wed,  3 Nov 2021 17:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkF56RrLSKKo; Wed,  3 Nov 2021 17:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3590E4024C;
	Wed,  3 Nov 2021 17:44:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 832131BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724D180D6C
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpKMUl8RTAJU for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:44:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A41780CF6
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 51C3C8A268; Wed,  3 Nov 2021 17:40:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:43:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79cba4056b0d7c81490262f354bab1cc1ce33267
X-Git-Newrev: 459be36bf8ed66268f3475a850efed9df304a213
X-Patchwork-Hint: ignore
Message-Id: <20211103174022.51C3C8A268@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc_g3beige: update to Linux
 5.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=459be36bf8ed66268f3475a850efed9df304a213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BLK_DEV_IDE_PMAC driver has been removed from the kernel, so use the
libata replacement PATA_MACIO. This requires enabling ATA and BLK_DEV_SD
for the disk to show up, and changing the command line to use /dev/sda.

YENTA depends on PCCARD, so enable it.

The UART does not show up in /dev without DEVTMPFS.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc-g3beige/linux.config | 13 ++++++++-----
 board/qemu/ppc-g3beige/readme.txt   |  2 +-
 configs/qemu_ppc_g3beige_defconfig  |  6 +++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/board/qemu/ppc-g3beige/linux.config b/board/qemu/ppc-g3beige/linux.config
index 7994553544..f944884243 100644
--- a/board/qemu/ppc-g3beige/linux.config
+++ b/board/qemu/ppc-g3beige/linux.config
@@ -1,15 +1,18 @@
 CONFIG_ALTIVEC=y
 CONFIG_SYSVIPC=y
 CONFIG_HIGHMEM=y
-CONFIG_YENTA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_PCCARD=y
+CONFIG_YENTA=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_ATA=y
+CONFIG_PATA_MACIO=y
 CONFIG_ADB=y
 CONFIG_ADB_CUDA=y
 CONFIG_ADB_PMU=y
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index e6c9c2016e..e39579ade2 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user # qemu_ppc_g3beige_defconfig
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/sda" -serial stdio -net nic,model=rtl8139 -net user # qemu_ppc_g3beige_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 6e41afe8d7..824fe648ab 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
