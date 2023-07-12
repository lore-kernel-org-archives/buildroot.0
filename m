Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDFEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 10:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D739860AB0;
	Wed, 12 Jul 2023 10:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D739860AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ITdohMa18Wi; Wed, 12 Jul 2023 10:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E6F60B21;
	Wed, 12 Jul 2023 10:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E6F60B21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2641BF3EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 474D4822AD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474D4822AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Wb2IMiGIfMC for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 10:02:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F41E822A8
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 10:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F41E822A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46C8886E86; Wed, 12 Jul 2023 10:02:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 12:02:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6742f533ab0de72854cf2063a6bbd79e598ef2c
X-Git-Newrev: e3d97f52bf589815e97bb397b7e8f0ff9f6585ed
X-Patchwork-Hint: ignore
Message-Id: <20230712100237.46C8886E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_edk2: bump ATF
 version to 2.9 for binutils 2.39+ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3d97f52bf589815e97bb397b7e8f0ff9f6585ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the toolchain-external-arm-aarch64 bump to version 12.2-rel1
by commit [1], binutils 2.39 is now provided by the toolchain.

This new binutils version break the ATF build due to new linker warnings as
reported by the EDK2 test:

  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions

From [2]
"Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
 of a new warning when linking the bl*.elf in the form:

   ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
   ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
   ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions

 These new warnings are enbaled by default to secure elf binaries:
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
"

Bump the ATF custom version to 2.9 for binutils 2.39+ support.

[1] 90404e84c1c9d65b4f38cc3ebc30ef6a4da314cb
[2] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4581325484

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_edk2.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 623e77e992..16fa10f8c9 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -24,6 +24,8 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
