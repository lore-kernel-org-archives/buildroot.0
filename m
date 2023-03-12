Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78565C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B53B60709;
	Sun, 12 Mar 2023 09:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B53B60709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkzBYQBwogEp; Sun, 12 Mar 2023 09:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6939E60FBA;
	Sun, 12 Mar 2023 09:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6939E60FBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 025211BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D01DC60FBA
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D01DC60FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_ewV8sYt1Gx for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 108F760C0A
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 108F760C0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F302286E5E; Sun, 12 Mar 2023 09:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:08:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92f6a843b81479a9c8f8769d9e728767646b9901
X-Git-Newrev: 3ecff27df15c2c22f7b9d8f7554119bc0346ff5b
X-Patchwork-Hint: ignore
Message-Id: <20230312090853.F302286E5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: move the
 kernel config only used by test_edk2.py
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ecff27df15c2c22f7b9d8f7554119bc0346ff5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel config board/qemu/aarch64-sbsa/linux.config has never been in
use by qemu_aarch64_sbsa_defconfig, neither via
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, nor via
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.

test_edk2.py is using the kernel config
board/qemu/aarch64-sbsa/linux.config. However, storing a kernel config
that is not used by qemu_aarch64_sbsa_defconfig, in a directory that is
"owned" by qemu_aarch64_sbsa_defconfig, is bound to cause confusion.

Therefore, move the config file to a new subdirectory:
support/testing/tests/boot/test_edk2/

This is similar to how e.g. test_grub.py has a subdirectory:
support/testing/tests/boot/test_grub/
where it keeps the kernel config that is only used by test_grub.py.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_edk2.py                                 | 2 +-
 .../aarch64-sbsa => support/testing/tests/boot/test_edk2}/linux.config  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index c1be8fad95..623e77e992 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -18,7 +18,7 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-sbsa/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/boot/test_edk2/linux.config"
         BR2_TARGET_EDK2=y
         BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
         BR2_TARGET_GRUB2=y
diff --git a/board/qemu/aarch64-sbsa/linux.config b/support/testing/tests/boot/test_edk2/linux.config
similarity index 100%
rename from board/qemu/aarch64-sbsa/linux.config
rename to support/testing/tests/boot/test_edk2/linux.config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
