Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F4EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029FC61409
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 029FC61409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCCE40545;
	Mon,  4 Oct 2021 20:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7VT0y8ugS7U; Mon,  4 Oct 2021 20:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379F440524;
	Mon,  4 Oct 2021 20:11:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7C61BF2BA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF782833AF
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0NKGyoJIjEC for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:09:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0CC833CD
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA1F58E7F7; Mon,  4 Oct 2021 20:07:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 22:05:25 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8d4939c9e0342d8b99d863fbdcaf935d42038469
X-Git-Newrev: 801dfff468fbfb86ea5911229fa7e2b1de56fb32
X-Patchwork-Hint: ignore
Message-Id: <20211004200711.AA1F58E7F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing: switch
 to prebuilt toolchain, core2duo to Nehalem
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

commit: https://git.buildroot.net/buildroot/commit/?id=801dfff468fbfb86ea5911229fa7e2b1de56fb32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

To avoid spending some time to build the x86_64 toolchain (~20min),
switch to corei7 cpu (Nahalem) and use the prebuilt Bootlin toolchain.

We have to use the "stable" Bootlin toolchain to use the same kernel version
for the toolchain kernel headers and the running kernel.

With the "bleeding-edge" toolchain we have the "kernel too old" issue
(running kernel 4.19 vs kernel headers 5.4)

Runtime tested locally.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 521b6f85508ee9ab848b0b2ea1d36edaf1701bc1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_docker_compose.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 7ca81c311b..374cb6c5fe 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -7,10 +7,9 @@ class TestDockerCompose(infra.basetest.BRTest):
     config = \
         """
         BR2_x86_64=y
-        BR2_x86_core2=y
-        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-        BR2_KERNEL_HEADERS_4_19=y
-        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
@@ -54,7 +53,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.emulator.boot(arch="x86_64",
                            kernel=kernel,
                            kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
-                           options=["-cpu", "core2duo",
+                           options=["-cpu", "Nehalem",
                                     "-m", "512M",
                                     "-device", "virtio-rng-pci",
                                     "-drive", "file={},format=raw,if=virtio".format(rootfs),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
