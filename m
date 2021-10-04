Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4FAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:10:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DD9613D2
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67DD9613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249426077B;
	Mon,  4 Oct 2021 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ge2qSZA15POo; Mon,  4 Oct 2021 20:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582C4606A9;
	Mon,  4 Oct 2021 20:10:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 715341BF2BA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74191400F3
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNNRTsW5GjtY for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B13840017
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7E2C78E734; Mon,  4 Oct 2021 20:07:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 21:15:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3cd5312bdb16605c9eb8b5a618f96408d3a878ef
X-Git-Newrev: 29d2920dd9c463a253c732f45b2ad84ba34fe425
X-Patchwork-Hint: ignore
Message-Id: <20211004200711.7E2C78E734@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing:
 test_openrc: switch to ARM arm toolchain and builtin kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=29d2920dd9c463a253c732f45b2ad84ba34fe425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The kernel 5.5.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

But we can't just update this test to the next linux kernel LTS 5.10.y since
the minimum gcc version has been updated to gcc 4.9 since 5.8 kernel [2]
and the Sourcery CodeBench ARM 2014.05 is used (gcc 4.8 based).

Enable arm cortex A9 and VFP support to switch to the ARM arm prebuilt
toolchain (the Bootlin toolchain could be used).
While at it use the prebuilt buildin kernel for the vexpress target
recently updated to 5.10.7.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1564202094

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4476ac82512f09c94aff5972654b70f3772b2
[3] 3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e0ad7c641155a06dac385f2ffc4961d6a4e5c1b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_openrc.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index 14839434ef..c6ade7676d 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -5,15 +5,11 @@ class InitSystemOpenrcBase(InitSystemBase):
     config = \
         """
         BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_OPENRC=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.5.7"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -34,7 +30,7 @@ class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("squashfs")
         self.check_init()
 
 
@@ -46,5 +42,5 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("ext2")
         self.check_init()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
