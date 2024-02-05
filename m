Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2678C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BF560F9F;
	Mon,  5 Feb 2024 16:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54BF560F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QL_nbThWAsSG; Mon,  5 Feb 2024 16:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8003060FC6;
	Mon,  5 Feb 2024 16:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8003060FC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27F7D1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008EA417AB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 008EA417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mW4-SoPXcTjC for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16E1F41764
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E1F41764
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0224086D5C; Mon,  5 Feb 2024 16:03:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 17:02:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ff00badaa23549f6a339a43f8ce19b4115a0796
X-Git-Newrev: 4f565b52225785bfa268ea19c4c347917d38ade4
X-Patchwork-Hint: ignore
Message-Id: <20240205160313.0224086D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: use Nehalem cpu emulation
 for TestGrubX8664EFI
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f565b52225785bfa268ea19c4c347917d38ade4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 7e0e6e3b8618 (toolchain/toolchain-external/toolchain-external-bootlin:
update to 2023.11-1) the TestGrubX8664EFI fails with this error:

  # efivar -l
  traps: efivar[86] trap invalid opcode ip:7fc187f4c7f4 sp:7fff9bbaa930 error:0 in libefivar.so.1.38[7fc187f4c000+16000]
  Illegal instruction

This error can be reproduced by installing other packages like "file".

The 2023.11-1 Bootlin toolchains are built for a corei7 CPU [0], which
is in fact a Nehalem CPU; we switched to the new names in commit
653fa001f304 (arch/Config.in.x86: add "newer" names for several Intel
x86 CPU variants). This means that the Bootlin toolchains may use
Nehalem-specific instructions.

The TestGrubX8664EFI test is also setup for BR2_x86_corei7, so our
executables will also contain Nehalem instructions.

However, the default Qemu x86_64 is not guaranteed to emulate all the
instructions specific to Nehalem, causing runtime issues as reported
above.

A similar issue has been fixed in toolchain-builder by adding Nehalem
cpu emulation on the qemu command line [0].

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853712

[0] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/f2b253732b4d1fc5b87badba7c2d48f12a197f76

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[yann.morin.1998@free.fr:
  - reword the commit log to explain corei7 -> Nehalem equivalence
  - note that the toolchain-builder *and* our test target corei7, thus
    Nehalem
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/boot/test_grub.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 9f3a6a8495..5315fa23ba 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -120,7 +120,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
         # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
         qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-cpu", "Nehalem", "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
