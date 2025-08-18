Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F1CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 01:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98906076D;
	Tue, 19 Aug 2025 01:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCWC56EcGaBL; Tue, 19 Aug 2025 01:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 009136076A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009136076A;
	Tue, 19 Aug 2025 01:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F765DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 01:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED52740456
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 01:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6UPimX5WBhK for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 01:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E85C40448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E85C40448
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 01:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB3F8799B; Tue, 19 Aug 2025 01:59:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 00:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e2bfd678b9e868ddb6ad559a726b138d2ec5110
X-Git-Newrev: f4d01d1c5eaea7c4cb702e0ef4281883f50e73fd
X-Patchwork-Hint: ignore
Message-Id: <20250819015917.1AB3F8799B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_grub.py:
 use glibc toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f4d01d1c5eaea7c4cb702e0ef4281883f50e73fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the recent bump of Bootlin toolchains in
947dbc92a20c5acea7882166cae7893e6ea661e1 ("toolchain/toolchain-external/toolchain-external-bootlin:
update to Bootlin toolchains 2025.08-1"), our grub2 tests are failing
as the new uClibc toolchains based on gcc 14.x have an issue building
grub.

Until this issue gets fixed at the uClibc level and since anyway glibc
is now the default in Buildroot, let's switch to using glibc
toolchains.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858692
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858686
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858680

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 37b7c06143..7ce7066875 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -8,7 +8,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
@@ -37,7 +37,7 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
@@ -88,7 +88,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_x86_64=y
         BR2_x86_corei7=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
