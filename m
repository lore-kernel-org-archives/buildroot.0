Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B2CC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F4A41579;
	Tue, 30 Apr 2024 20:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmZg75wADSKY; Tue, 30 Apr 2024 20:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BB441571
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9BB441571;
	Tue, 30 Apr 2024 20:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A04C1BF475
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4637081CA3
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdSiKpjOsjW1 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483D781B71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 483D781B71
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3514D8631F; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:50:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc75b09b1c18541abaa47fc34eab44e91e2018ca
X-Git-Newrev: 7e126bd38d5eedb49cd29699c1afe8b53edd71e0
X-Patchwork-Hint: ignore
Message-Id: <20240430205156.3514D8631F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestF2FS: update kernel
 to 4.19.310
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e126bd38d5eedb49cd29699c1afe8b53edd71e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
kernel build is broken with binutils >= 2.41 with:

  arch/arm/mm/proc-v7.S: Assembler messages:
  arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

A similar issue has already be fixed for qemu m68k [2].

Bump to the latest kernel 4.19 that already include the backport
of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

[1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
[2] a1ce9474e40f731f327035d8c0962abb16f00ff7

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222383

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 425fbe31ca..826077ac94 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
