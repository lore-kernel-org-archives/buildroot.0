Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D2BC25B79
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E49340855;
	Fri, 24 May 2024 21:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHCkEi4yhxz3; Fri, 24 May 2024 21:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1A8409DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1A8409DA;
	Fri, 24 May 2024 21:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F243B1CFE15
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4CFB409DA
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciRlsCgrmszo for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD9AC40855
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD9AC40855
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:15:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB7F81E34; Fri, 24 May 2024 21:15:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 23:13:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b37792f76880410726578b9080ba9649adf2c997
X-Git-Newrev: 898b794faa054e9058d3ea6d7b490f5603c1e3af
X-Patchwork-Hint: ignore
Message-Id: <20240524211537.2EB7F81E34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/amarula_vyasa_rk3288_defconfig:
 bump to Linux version 6.1.91
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

commit: https://git.buildroot.net/buildroot/commit/?id=898b794faa054e9058d3ea6d7b490f5603c1e3af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails with gcc 13 with:
drivers/ata/libahci.c: In function 'ahci_led_store':
././include/linux/compiler_types.h:357:45: error: call to
'__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed:
sizeof(_s) > sizeof(long)
  357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

As explained in Linux commit[0] that fixes the build, sizeof() of enum
like '(1<<31)' translate to a 64-bit type, but we expect a 32-bit type.
So commit[0] makes sure the data type to be 32-bits wide by using BIT()
macro.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548

[0]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=97e28deab8bfe70d5687650f94484f8f9101e566

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 7976537225..0dd47f498f 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.91"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
