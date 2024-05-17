Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336C7C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA39B607C2;
	Fri, 17 May 2024 14:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmq0KyLBP9V4; Fri, 17 May 2024 14:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7905260779
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7905260779;
	Fri, 17 May 2024 14:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A022B1BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BBC2405C2
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2B2AnEaJ4XG for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F3E405C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F3E405C0
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C4478744F; Fri, 17 May 2024 14:36:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:34:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95093854e4c6ce69ee54df17fce20417312a3d0a
X-Git-Newrev: e711b827a94f589754e8c4eddfe9bbccd53684ca
X-Patchwork-Hint: ignore
Message-Id: <20240517143639.6C4478744F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/openblocks_a6_defconfig: bump
 Linux to fix binutils 2.41 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e711b827a94f589754e8c4eddfe9bbccd53684ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125272

The Linux kernel fails to build since commit e88225ed882 (package/binutils:
make 2.41 the default version):

arch/arm/mm/proc-feroceon.S: Assembler messages:
arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
make[3]: *** Waiting for unfinished jobs....

Fix the build by bumping the kernel to 4.14.336, which includes commit
3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
directive):

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/openblocks_a6_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index 2238c0940c..69b75f5043 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.253"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
