Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEB5C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D1D81091;
	Mon,  5 Aug 2024 07:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ra0h0j-s1oCY; Mon,  5 Aug 2024 07:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF4181066
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF4181066;
	Mon,  5 Aug 2024 07:01:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3553F1BF966
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23619606EA
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQBF3y9-csBj for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA2360690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA2360690
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4367B84008; Mon,  5 Aug 2024 07:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 23:05:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 754e638d6bae686c8c945573caff8b94f6e163c7
X-Git-Newrev: 8009fee0f82fda9e2b3b45d93204a3c6004a6e72
X-Patchwork-Hint: ignore
Message-Id: <20240805070146.4367B84008@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx8m[mq]evk*: uboot
 needs openssl and gnutls
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

commit: https://git.buildroot.net/buildroot/commit/?id=8009fee0f82fda9e2b3b45d93204a3c6004a6e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those defconfigs were recently bumped to NXP BSP lf-6.6.23-2.0.0.

NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
version 2024.04. This version now requires OpenSSL and GnuTLS for
that configuration.

Those defconfigs are failing in uboot build, with output:

    In file included from tools/imagetool.h:24,
                     from tools/imagetool.c:8:
    include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
     1471 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

and:

    tools/mkeficapsule.c:20:10: fatal error: gnutls/gnutls.h: No such file or directory
       20 | #include <gnutls/gnutls.h>
          |          ^~~~~~~~~~~~~~~~~

This commit fixes the issue by adding BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
and BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in those defconfigs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8mmevk_defconfig | 2 ++
 configs/freescale_imx8mqevk_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index 2f57bfd2f0..335030fcd3 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -30,6 +30,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index 05a78e5b6b..50fcaeff83 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -30,6 +30,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
