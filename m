Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0782DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2BB82660;
	Wed, 19 Jan 2022 21:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6h6bFj24sA-2; Wed, 19 Jan 2022 21:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E714781970;
	Wed, 19 Jan 2022 21:54:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178401BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12FA2401D2
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KFHaQmflLUo for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AFDF401D8
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4DE0582235; Wed, 19 Jan 2022 21:47:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:50:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a4300e8261f352f9e4af5e569fd55ad944843f7
X-Git-Newrev: 507b1b9770142f9dba418653b1285a65252de705
X-Patchwork-Hint: ignore
Message-Id: <20220119214719.4DE0582235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/cubieboard2: U-Boot needs Python3
 & OpenSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=507b1b9770142f9dba418653b1285a65252de705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After update of the U-Boot [1] we were missing dependency on Python3,
and so were seeing failures like in [2]:
------------------------->8--------------------
  HOSTLD  scripts/dtc/dtc
scripts/dtc/pylibfdt/libfdt_wrap.c:154:11: fatal error: Python.h: No such file or directory
  154 | # include <Python.h>
      |           ^~~~~~~~~~
compilation terminated.
error: command '/usr/bin/gcc' failed with exit code 1
------------------------->8--------------------

So that get fixed with "BR2_TARGET_UBOOT_NEEDS_PYTHON3=y".
And then once we use Python3, we also need OpenSSL, similarly to [3]
and the likes. So do it with "BR2_TARGET_UBOOT_NEEDS_OPENSSL=y".

Hopefully now all starts to build w/o any issues.

And while at it let's add a bit more structure to the config!

[1] https://git.buildroot.net/buildroot/commit/?id=06f10a88f30b73aaea5c0e0888d7ba9d9a6420f3
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650570
[3] https://git.buildroot.net/buildroot/commit/?id=cf2a7663ccc6089e98e0d6ec39fa8623749c0c24

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/cubieboard2_defconfig | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index a9356295c1..18337fac72 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,32 +1,42 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
