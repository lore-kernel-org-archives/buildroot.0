Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0836FC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A607A60EF4;
	Tue,  1 Aug 2023 21:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A607A60EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGZKrNB5G-W7; Tue,  1 Aug 2023 21:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88ED611BF;
	Tue,  1 Aug 2023 21:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88ED611BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4B01BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0EE4052D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0EE4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_AYFzZzvjtU for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9087440A92
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9087440A92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FF7D840A3; Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:24:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb06a599aa578221e52e6108cf1008a65244c251
X-Git-Newrev: 59ddc3a987426a1b9ad2497038c0b52d2c11ee8b
X-Patchwork-Hint: ignore
Message-Id: <20230801212448.7FF7D840A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_vck190: fix atf build
 failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=59ddc3a987426a1b9ad2497038c0b52d2c11ee8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils 2.39 now warns when a segment has RXW permissions:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107

This causes the following build error:
aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions.

This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
included with buildroot to solve the problem.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556395 (versal_vck190)

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-feat-build-add-support-for-new-binutils-versions.patch          | 1 +
 configs/versal_vck190_defconfig                                          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 120000
index 0000000000..695cc80b94
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index a393b681c8..fab41a2991 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,3 +39,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_GLOBAL_PATCH_DIR="board/versal/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
