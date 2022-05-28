Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B28260AAA;
	Sat, 28 May 2022 19:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pG9nkvAWRxEs; Sat, 28 May 2022 19:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C50610E8;
	Sat, 28 May 2022 19:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDF91BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49DA8610D0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yY6ahLCy_KJT for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 823F4610D5
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4D74385DB4; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:24:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8b2d0c31a723b10b2c4fa647521c466b0e49d1e7
X-Git-Newrev: f12c3cc3a856ff3aa866f8e638db787f5deb3f94
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.4D74385DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux: Fix powerpc64le
 defconfig selection
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
Content-Type: multipart/mixed; boundary="===============5053192164854345400=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5053192164854345400==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f12c3cc3a856ff3aa866f8e638db787f5deb3f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The default defconfig target for the 64 bit powerpc kernel is
ppc64_defconfig, the big endian configuration.

When building for powerpc64le users want the little endian kernel as
they can't boot LE userspace on a BE kernel.

Fix up the defconfig used in this case. This will avoid the following
autobuilder failure:

 VDSO32A arch/powerpc/kernel/vdso32/sigtramp.o
 cc1: error: ‘-m32’ not supported in this configuratioin
 make[4]: *** [arch/powerpc/kernel/vdso32/Makefile:49: arch/powerpc/kernel/vdso32/sigtramp.o] Error 1

 http://autobuild.buildroot.net/results/dd76d53bab56470c0b83e296872d7bb90f9e8296/

Note that the failure indicates the toolchain is configured to disable
the 32 bit target, causing the kernel to fail when building the 32 bit
VDSO. This is only a problem on the BE kernel as the LE kernel disables
CONFIG_COMPAT, aka 32 bit userspace support, by default.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 62044e8675daf271a2d435edbadbd6d0540c1816)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index b27e436b0d..67832127d9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -307,7 +307,11 @@ endif
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
+ifeq ($(BR2_powerpc64le),y)
+LINUX_KCONFIG_DEFCONFIG = ppc64le_defconfig
+else
 LINUX_KCONFIG_DEFCONFIG = defconfig
+endif
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif

--===============5053192164854345400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5053192164854345400==--
