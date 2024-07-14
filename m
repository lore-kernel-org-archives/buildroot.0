Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B6A40054;
	Sun, 14 Jul 2024 20:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uKx2n6w55iL; Sun, 14 Jul 2024 20:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6C5402A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6C5402A1;
	Sun, 14 Jul 2024 20:25:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A091BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F417B60631
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dfj1SP9AjLI for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 106B4605C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 106B4605C3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 064A584E41; Sun, 14 Jul 2024 20:25:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 22:24:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17deaf60f66fc08a796233920a104e5233b501e0
X-Git-Newrev: 14192d722c09ca5355566303e8808d9f2c83ad31
X-Patchwork-Hint: ignore
Message-Id: <20240714202543.064A584E41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_lite: uboot needs openssl
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14192d722c09ca5355566303e8808d9f2c83ad31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig fails in uboot build, with output:

    In file included from tools/imagetool.c:10:
    include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
     1178 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the defconfig.

Fixes: 0e1b6ab700f575226c2290c6a41db333e0b03a60

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/orangepi_lite_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 4298019837..f1c63f9b1d 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
