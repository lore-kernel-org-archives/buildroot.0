Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93362C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265F360608;
	Tue, 26 Jul 2022 19:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 265F360608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvjGJARcWDXu; Tue, 26 Jul 2022 19:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F320360644;
	Tue, 26 Jul 2022 19:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F320360644
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C30501BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7F7A81377
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F7A81377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCtBQ7rXL0Jj for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2C8481376
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C8481376
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7472285F9E; Tue, 26 Jul 2022 19:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:56:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70e37f806031c7bda3d49de6bf377ad3e7887e69
X-Git-Newrev: fecec75b6205c299b6f422bbf175bd5d43485e02
X-Patchwork-Hint: ignore
Message-Id: <20220726194331.7472285F9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/*: use BR2_ENABLE_LTO to enable
 LTO instead of BR2_GCC_ENABLE_LTO
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

commit: https://git.buildroot.net/buildroot/commit/?id=fecec75b6205c299b6f422bbf175bd5d43485e02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_GCC_ENABLE_LTO only enables LTO in the toolchain, not in packages.
Use BR2_ENABLE_LTO instead to enable it in packages as well.

Note that BR2_GCC_ENABLE_LTO is currently non-functional (LTO is still
enabled in the toolchain even if it's not set), so we *do* have LTO
available in the toolchain.

Note that the option has no effect at all on these defconfigs anyway,
since they don't contain any package that is affected by the
BR2_ENABLE_LTO option. Still, it makes sense to enable it for these
really memory-constrained targets for when packages are added.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/stm32f429_disco_xip_defconfig | 2 +-
 configs/stm32f469_disco_xip_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 01b54c02cc..f9b3270ecd 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
-BR2_GCC_ENABLE_LTO=y
+BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index d95b7759f3..fc3b3f9213 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
-BR2_GCC_ENABLE_LTO=y
+BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
