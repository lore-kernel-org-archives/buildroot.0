Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F0EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC6D60ADB;
	Fri, 13 May 2022 22:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agNlNAQBKIG4; Fri, 13 May 2022 22:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E27D60BCD;
	Fri, 13 May 2022 22:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAC91BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEBF04091F
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhEZiC5ZXeub for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE4C40949
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 143D385E2B; Fri, 13 May 2022 22:00:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 260e7fda6adca10e0341532d03a8e1f4d08e9a10
X-Git-Newrev: 62044e8675daf271a2d435edbadbd6d0540c1816
X-Patchwork-Hint: ignore
Message-Id: <20220513220046.143D385E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: Fix powerpc64le defconfig selection
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
Content-Type: multipart/mixed; boundary="===============8915948666583140052=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8915948666583140052==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=62044e8675daf271a2d435edbadbd6d0540c1816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============8915948666583140052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8915948666583140052==--
