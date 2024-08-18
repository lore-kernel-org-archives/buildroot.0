Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544CEC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 479944025D;
	Sun, 18 Aug 2024 07:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i61c7wKCWTK2; Sun, 18 Aug 2024 07:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40EFF40277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40EFF40277;
	Sun, 18 Aug 2024 07:20:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204381BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB9A80BB5
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8fC-6dSuVaN for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368E780BB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368E780BB8
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:20:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D981585F81; Sun, 18 Aug 2024 07:20:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 09:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f367ddaf35bfb8bfdbb05846dff085a3af8178a7
X-Git-Newrev: 308d2c992714520844b2dd96a4d79d688afcd28a
X-Patchwork-Hint: ignore
Message-Id: <20240818072029.D981585F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: disable on ARM and
 AArch64 big-endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=308d2c992714520844b2dd96a4d79d688afcd28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/gnu-efi/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 4f44cf9f64..012324712c 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
 	default y if BR2_RISCV_64
 	default y if BR2_aarch64
-	default y if BR2_aarch64_be
 	default y if BR2_i386
 	default y if BR2_x86_64
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
