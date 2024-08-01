Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9552C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D09E81FB8;
	Thu,  1 Aug 2024 21:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BWLD0vsi9wL; Thu,  1 Aug 2024 21:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775BE81FC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775BE81FC3;
	Thu,  1 Aug 2024 21:16:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C47511BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF68881EF8
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2z5PKV7y3cn for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23B78101C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E23B78101C
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6BA883906; Thu,  1 Aug 2024 21:16:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:15:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15e411d800999a70cc04a8d506ead40ea3dba210
X-Git-Newrev: 44b921f605dffd07bb6294e6368c2ace34a08266
X-Patchwork-Hint: ignore
Message-Id: <20240801211627.C6BA883906@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6sx_udoo_neo: bump kernel to
 6.6.43
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44b921f605dffd07bb6294e6368c2ace34a08266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current 5.15.13 kernel fails to build:

  In file included from <command-line>:
  drivers/ata/libahci.c: In function 'ahci_led_store':
  ././include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_329' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)

This commit fixes this by using the opportunity to bump the kernel to
the latest LTS version. While bumping the kernel, the headers to use
are also updated, and the selected device trees are updated to use the
new dts per vendor organization.

This update does not introduce any new error or warning with the
current configuration.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7477108980

Signed-off-by: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mx6sx_udoo_neo_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 793d992ce7..71a7473307 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -19,10 +19,10 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-udoo-neo-basic nxp/imx/imx6sx-udoo-neo-full nxp/imx/imx6sx-udoo-neo-extended"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
