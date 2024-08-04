Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C2AC52D6F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3CF80EF4;
	Mon,  5 Aug 2024 07:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meWRYNfkLzMD; Mon,  5 Aug 2024 07:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 712D381068
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712D381068;
	Mon,  5 Aug 2024 07:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7191BF3B5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 457CA40350
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMSQi0KtYxMv for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3466A400F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3466A400F8
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E04784016; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 23:05:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a672660130bba57ca5a21ed2325259172ba235f
X-Git-Newrev: 0cdbda3b56e73e8d6ee93820c3581ffa5d2adf75
X-Patchwork-Hint: ignore
Message-Id: <20240805070146.1E04784016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx8q*: uboot needs
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cdbda3b56e73e8d6ee93820c3581ffa5d2adf75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those defconfigs were recently bumped to NXP BSP lf-6.6.23-2.0.0.

NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
version 2024.04. This version now requires OpenSSL.

Those defconfigs are failing in uboot build, with output:

    In file included from tools/imagetool.h:24,
                     from tools/imagetool.c:8:
    include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
     1471 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in all the impacted defconfigs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8qmmek_defconfig  | 1 +
 configs/freescale_imx8qxpmek_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 3ad273c9d4..6fb3a54df1 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qm_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_IMX_MKIMAGE=y
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index d2fae2c9e7..3ff476e992 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qxp_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_IMX_MKIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
