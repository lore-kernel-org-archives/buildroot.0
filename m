Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE97C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8C060FDA
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D8C060FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF13406DA;
	Tue, 21 Sep 2021 20:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAY-rhVOusJ7; Tue, 21 Sep 2021 20:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99894406CC;
	Tue, 21 Sep 2021 20:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 569B21BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 339D2600CA
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZA7R3uBrQOLb for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BEFB60EA2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9521B8C966; Tue, 21 Sep 2021 20:33:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 883d5a2f3ddac1ece7170502a724c5b0a8005714
X-Git-Newrev: f6d438d59fbb291e677edc030150944ee61feb4d
X-Patchwork-Hint: ignore
Message-Id: <20210921203343.9521B8C966@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_rust: remove kernel
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6d438d59fbb291e677edc030150944ee61feb4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test already use builtin kernel provided by the testsuite infra:

    self.emulator.boot(arch="armv7",
                       kernel="builtin",
                       options=["-initrd", img])

But a second kernel is build from the its defconfig. This second kernel
is not used by the test.

The TestRust (using BR2_PACKAGE_HOST_RUST=y) is really long to build,
save some cpu time by removing the kernel build.

This unused kernel (based on 4.11.3 release) doesn't even build with
host gcc >= 10.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_rust.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index cd5dccf8e1..884b40a4a3 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -65,12 +65,6 @@ class TestRustBin(TestRustBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_SYSTEM_DHCP="eth0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
@@ -92,12 +86,6 @@ class TestRust(TestRustBase):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_SYSTEM_DHCP="eth0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
