Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C4C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2113960A48;
	Mon,  6 May 2024 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwmWoG9NzDfK; Mon,  6 May 2024 20:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192ED60A4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192ED60A4D;
	Mon,  6 May 2024 20:51:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6DB71BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B288E406D1
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJm8zHQWV2WJ for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6FAF406CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6FAF406CF
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3E5486942; Mon,  6 May 2024 20:51:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:50:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 233ba540f5c21a2305fcd29217a9767e819cfdd1
X-Git-Newrev: 3948fb33272a5c013f0b76c2e1b57daf16f5eb26
X-Patchwork-Hint: ignore
Message-Id: <20240506205155.A3E5486942@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing:
 TestFileCapabilities: update kernel to 4.19.310
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

commit: https://git.buildroot.net/buildroot/commit/?id=3948fb33272a5c013f0b76c2e1b57daf16f5eb26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
https://gitlab.com/buildroot.org/buildroot/-/jobs/6414160106 (TestFileCapabilities)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07ef00df9bdff1486622fe8248168137aa531c9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index fe21d76c94..e2600ae794 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -13,7 +13,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
