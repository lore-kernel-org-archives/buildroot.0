Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0427CC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0D260AAC;
	Mon, 16 Sep 2024 10:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XplmxentWdFk; Mon, 16 Sep 2024 10:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 167B360A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167B360A95;
	Mon, 16 Sep 2024 10:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED3EC1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7C0740386
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhJpwqUq-vRR for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A186940B10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A186940B10
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DABB837EC; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:21:16 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 05015b904be0b7534b131e33f1953748717b4a29
X-Git-Newrev: daaa353029e88d3ffd16bbc81da002bbf10b346e
X-Patchwork-Hint: ignore
Message-Id: <20240916102405.8DABB837EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gnu-efi: mark as
 not supported on ARM soft-float
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

commit: https://git.buildroot.net/buildroot/commit/?id=daaa353029e88d3ffd16bbc81da002bbf10b346e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

lib/print.c in gnu-efi contains some floating point computation. On
ARM soft-float configurations, these floating point operations
generate calls to __eabi_*() functions that are provided by
gcc. However, gnu-efi builds some freestanding code, so it doesn't
link with libgcc, and therefore the build fails with:

arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x78c): undefined reference to `__aeabi_i2d'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x7a0): undefined reference to `__aeabi_dsub'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x7a4): undefined reference to `__aeabi_d2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1432:(.text+0x7b4): undefined reference to `__aeabi_fcmplt'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1438:(.text+0x7c8): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x7d4): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1444:(.text+0x7f8): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x808): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x818): undefined reference to `__aeabi_f2iz'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x834): undefined reference to `__aeabi_i2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x840): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1453:(.text+0x858): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x860): undefined reference to `__aeabi_f2iz'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x868): undefined reference to `__aeabi_i2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x870): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x89c): undefined reference to `__aeabi_f2iz'

Since we don't care about gnu-efi support on ARM soft-float
configurations, let's disable such configurations.

Note that we have chosen to use BR2_ARM_SOFT_FLOAT as we're for now
making this specific to ARM as we're not sure what is the situation on
other CPU architectures (for example RISC-V without FPU maybe). This
can be revisited once we get more data on the behavior on other CPU
architectures that can support soft-float.

Fixes:

  http://autobuild.buildroot.net/results/98d955fd2fcf4a3db1ab46e4f553447031a23b92/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b62f2f7f12a381c2e8d4aeb9562b6dfc87728589)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnu-efi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index b0ad525e8a..f412e6ba18 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
+	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM && !BR2_ARM_SOFT_FLOAT
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
