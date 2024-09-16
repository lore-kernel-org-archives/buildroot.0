Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EF3C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E88460A80;
	Mon, 16 Sep 2024 10:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp5nmM7yG4du; Mon, 16 Sep 2024 10:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00EF160AA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00EF160AA2;
	Mon, 16 Sep 2024 10:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA3FD1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 950EE40B07
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNj5ryjmivLk for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9815740386
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9815740386
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DCD8249B; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:19:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 56aeb15a87a7efc30eb0071a7cf611c49fe43f46
X-Git-Newrev: 05015b904be0b7534b131e33f1953748717b4a29
X-Patchwork-Hint: ignore
Message-Id: <20240916102405.82DCD8249B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gnu-efi: disable
 on ARM and AArch64 big-endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=05015b904be0b7534b131e33f1953748717b4a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Since the bump of gnu-efi to version 3.0.17 in Buildroot commit
fa9893ad8fb94278d7e8b80cd3e795469223faf0, the build of gnu-efi fails
on ARM big endian and AArch64 big endian.

Indeed, since that bump, gnu-efi builds some "apps", using a special
linker file part of gnu-efi that explicitly sets the architecture:

OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")

OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")

Due to this, big endian builds are now failing:

armeb-buildroot-linux-gnueabi-ld: ../gnuefi/crt0-efi-arm.o: compiled for a big endian system and target is little endian
armeb-buildroot-linux-gnueabi-ld: failed to merge target specific data of file ../gnuefi/crt0-efi-arm.o

Since we are not really interested in supporting gnu-efi on ARM big
endian and AArch64 big endian and it is not supported upstream, let's
disabled on those architectures.

Fixes:

  http://autobuild.buildroot.org/results/4d385d6759346e19664d0bded1e419f004f82b47/ (ARM big endian)
  http://autobuild.buildroot.net/results/b6df43408ca4cd469962c96d49d9ac7935b6dbe9/ (AArch64 big endian)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 308d2c992714520844b2dd96a4d79d688afcd28a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnu-efi/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d456a23837..b0ad525e8a 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
 	default y if BR2_aarch64
-	default y if BR2_aarch64_be
 	default y if BR2_i386
 	default y if BR2_x86_64
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
