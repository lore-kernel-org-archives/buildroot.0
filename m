Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C987C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 09:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C2240C56;
	Mon, 27 May 2024 09:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBQwZDE0mari; Mon, 27 May 2024 09:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1674340C0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1674340C0F;
	Mon, 27 May 2024 09:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3E31D1A65
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E950381299
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZF6f5GNdHmR for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 09:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCA381EA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FCA381EA2
 for <buildroot@buildroot.org>; Mon, 27 May 2024 09:16:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E61288760E; Mon, 27 May 2024 09:16:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 08:43:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb952e1116dc4f02d9d64402d05b55280d5da178
X-Git-Newrev: 6f9cf3b5fa4a90eef0bff576f63b068f12b55f40
X-Patchwork-Hint: ignore
Message-Id: <20240527091627.E61288760E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx51evk: bump kernel to 5.10.218
 to fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f9cf3b5fa4a90eef0bff576f63b068f12b55f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit dc0f721 "package/gcc: switch to 13.x as default",
mx51evk_defconfig is failing to build in Kernel (see [1]),
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping the Kernel to 5.10.218.

The kernel commit fixing the build failure is [2], first included in
v5.10.184. There is also many other gcc-13 fixes.

While bumping the Kernel, this commit also enables
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash files,
and removes the defconfig entry in ".checkpackageignore".

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c3ddc06cedb62f2904e58fd95170bf206bee149

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                               | 1 -
 board/freescale/imx51evk/patches/linux-headers/linux-headers.hash | 1 +
 board/freescale/imx51evk/patches/linux/linux.hash                 | 2 ++
 board/freescale/imx51evk/patches/uboot/uboot.hash                 | 2 ++
 configs/mx51evk_defconfig                                         | 6 +++++-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b9e4a61f9..68c0ea83dd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -235,7 +235,6 @@ configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
-configs/mx51evk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
 configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
 configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx51evk/patches/linux/linux.hash b/board/freescale/imx51evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..fdda2dfdaa
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From: https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
diff --git a/board/freescale/imx51evk/patches/uboot/uboot.hash b/board/freescale/imx51evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..716b56e14d
--- /dev/null
+++ b/board/freescale/imx51evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b407e1510a74e863b8b5cb42a24625344f0e0c2fc7582d8c866bd899367d0454  u-boot-2021.01.tar.bz2
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index a4bebdec97..e633a6228d 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
+# Global patches directory and hash check
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx51evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
@@ -28,7 +32,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.218"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
