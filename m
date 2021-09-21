Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8FBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6AE60FDA
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B6AE60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF73400CF;
	Tue, 21 Sep 2021 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJ7kyNtOPVD8; Tue, 21 Sep 2021 20:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9AD3400E9;
	Tue, 21 Sep 2021 20:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49E871BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2976780F71
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lXcMUVoBcVV for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61DB6818CD
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7A2BE8C967; Tue, 21 Sep 2021 20:33:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73278c8a70783ded4868542339c16968598d3048
X-Git-Newrev: e0ad7c641155a06dac385f2ffc4961d6a4e5c1b4
X-Patchwork-Hint: ignore
Message-Id: <20210921203343.7A2BE8C967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_openrc: switch to
 ARM arm toolchain and builtin kernel
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0ad7c641155a06dac385f2ffc4961d6a4e5c1b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
