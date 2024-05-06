Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C65C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E3980E83;
	Mon,  6 May 2024 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuLf9MD_0zQo; Mon,  6 May 2024 19:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8F380EB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8F380EB0;
	Mon,  6 May 2024 19:30:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86A9A1BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804B340B9D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BG7HRrVcwgn4 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B13F8408CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B13F8408CA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A943C867B0; Mon,  6 May 2024 19:30:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 21:30:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45c1def9915ead52a5e4b874c33194653b598117
X-Git-Newrev: c0dc1b3425ae3bade14553a96e7475a79d753d4e
X-Patchwork-Hint: ignore
Message-Id: <20240506193050.A943C867B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sheevaplug_defconfig: bump Linux
 to fix binutils 2.41 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0dc1b3425ae3bade14553a96e7475a79d753d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/sheevaplug_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 7f186df22c..0879f17071 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -27,7 +27,7 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
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
