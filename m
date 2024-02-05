Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692E9C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1736C40556;
	Mon,  5 Feb 2024 17:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1736C40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXdXtKHXjSPA; Mon,  5 Feb 2024 17:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12C974018B;
	Mon,  5 Feb 2024 17:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C974018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C8A1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E093681F31
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E093681F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Xfm1p6jHfW4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:42:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F1681F54
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F1681F54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF0B786D96; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:26:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14fa799c576f1dbd1027fb85d1bf39fd449299e9
X-Git-Newrev: 88d3e8ca112cc932b39da21cdf4268b580a35f8d
X-Patchwork-Hint: ignore
Message-Id: <20240205174221.CF0B786D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mmpico: uboot needs openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=88d3e8ca112cc932b39da21cdf4268b580a35f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 78e8f383 "configs/imx8mmpico: bump bsp components to version
tn-kirkstone_5.15.71-2.2.0" bumped components, but forgot to add
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y.

This commit adds it to the defconfig to fix the build.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248

    In file included from tools/imagetool.h:24,
                     from tools/aisimage.c:7:
    include/image.h:1166:12: fatal error: openssl/evp.h: No such file or directory
     1166 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx8mmpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index c402ea675d..711cdeb390 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
