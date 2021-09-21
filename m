Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFBAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D129B60F4C
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D129B60F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC83A82D49;
	Tue, 21 Sep 2021 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dn0NDaZRZtEI; Tue, 21 Sep 2021 20:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB20483E96;
	Tue, 21 Sep 2021 20:37:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C21601BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C4E560A3C
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ta6vJ-Ah8FnJ for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FF3760EAA
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A5D558C966; Tue, 21 Sep 2021 20:33:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:24:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 184d20404e8a5b95f2b2940f4d959d09be7ae2f0
X-Git-Newrev: 521b6f85508ee9ab848b0b2ea1d36edaf1701bc1
X-Patchwork-Hint: ignore
Message-Id: <20210921203343.A5D558C966@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: switch to prebuilt
 toolchain, core2duo to Nehalem
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

commit: https://git.buildroot.net/buildroot/commit/?id=521b6f85508ee9ab848b0b2ea1d36edaf1701bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/testing/tests/package/test_docker_compose.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 35e659a74d..1ce132c242 100644
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
@@ -53,7 +52,7 @@ class TestDockerCompose(infra.basetest.BRTest):
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
