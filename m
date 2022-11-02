Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18386C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52D760F94;
	Wed,  2 Nov 2022 20:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A52D760F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGkWgyqOoobI; Wed,  2 Nov 2022 20:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C520A60F8D;
	Wed,  2 Nov 2022 20:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C520A60F8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43FF61BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C111416B7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C111416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1V2KFb81h6q for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:08:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04398416EA
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04398416EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E184287A65; Wed,  2 Nov 2022 20:08:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 21:07:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e45766058f10b987e7eee7aeb550d88a33e169b
X-Git-Newrev: eb2a53c26f17b1affe98c982da7a805a85c96990
X-Patchwork-Hint: ignore
Message-Id: <20221102200808.E184287A65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive: add missing
 host-openssl dependency for the kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb2a53c26f17b1affe98c982da7a805a85c96990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel build needs host-openssl:

certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
   21 | #include <openssl/bio.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.host:95: certs/extract-cert] Error 1
make[2]: *** [Makefile:1852: certs] Error 2
make[2]: *** Waiting for unfinished jobs....

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3259660751

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/visionfive_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/visionfive_defconfig b/configs/visionfive_defconfig
index 9f5fb03610..0d9325078a 100644
--- a/configs/visionfive_defconfig
+++ b/configs/visionfive_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="visionfive"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-starfive-visionfive-v1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
