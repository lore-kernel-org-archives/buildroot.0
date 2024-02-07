Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A715C4829B
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C28812AB;
	Wed,  7 Feb 2024 15:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue7907kmoswZ; Wed,  7 Feb 2024 15:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D42822F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D42822F5;
	Wed,  7 Feb 2024 15:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC6361BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8ADF40645
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtQlWY0F3JPU for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2131405E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2131405E2
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C31B875C6; Wed,  7 Feb 2024 15:18:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:18:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b114822e9897d33089cd7203edbf3d7cb7dd5d6
X-Git-Newrev: dc25b8d99f812777294b5e188d7975c0e36dd5ef
X-Patchwork-Hint: ignore
Message-Id: <20240207151854.9C31B875C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: use core2duo cpu
 emulation for TestGlxinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc25b8d99f812777294b5e188d7975c0e36dd5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestGlxinfo fail with a new runtime error:

  # glxinfo -B -display :0
  name of display: :0
  traps: glxinfo[84] trap invalid opcode ip:b73c7027 sp:bf8433c0 error:0 in swrast_dri.so[b6e4c000+64f000]
  Illegal instruction

The x86-core2 Bootlin toolchains are built for a core2 CPU [0],
this means that the Bootlin toolchains may use core2-specific
instructions.

The TestGlxinfo test is setup for BR2_x86_core2, so our
executables will also contain core2 instructions.

However, the default Qemu x86 is not guaranteed to emulate all the
instructions specific to core2, causing runtime issues as reported
above.

A similar issue has been fixed by adding Nehalem cpu emulation on
the qemu command line. See 4f565b5222 ("support/testing: use Nehalem
cpu emulation for TestGrubX8664EFI").

Set core2duo cpu emulation for TestGlxinfo on the qemu command line.

[0] https://gitlab.com/buildroot.org/toolchains-builder/-/blob/kubu/toolchain-builder-2023.08/configs/arch/x86-core2.config?ref_type=heads

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_glxinfo.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 6bedee5298..3ccbdca8d9 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -42,7 +42,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         self.emulator.boot(arch="i386",
                            kernel=kern,
                            kernel_cmdline=["root=/dev/vda console=ttyS0"],
-                           options=["-M", "pc", "-m", "512", "-drive", "file={},if=virtio,format=raw".format(img)])
+                           options=["-M", "pc", "-cpu", "core2duo", "-m", "512",
+                                    "-drive", "file={},if=virtio,format=raw".format(img)])
         self.emulator.login()
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
