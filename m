Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13EC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DB0611CE;
	Tue,  1 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DB0611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PY0nmYBENaJN; Tue,  1 Aug 2023 21:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE2C61180;
	Tue,  1 Aug 2023 21:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE2C61180
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE3A1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFC040493
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFC040493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNBXzw8cFa2r for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8908D402D4
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8908D402D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750898409F; Tue,  1 Aug 2023 21:24:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:24:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee7179497bbdd1b44c8d2dd6dbfa0ac4c234567d
X-Git-Newrev: eb06a599aa578221e52e6108cf1008a65244c251
X-Patchwork-Hint: ignore
Message-Id: <20230801212448.750898409F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp*: fix atf build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb06a599aa578221e52e6108cf1008a65244c251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils 2.39 now warns when a segment has RXW permissions:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107

This causes the following build error:
aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions.

This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
included with buildroot to solve the problem.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556414 (zynqmp_kria_kv260)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556417 (zynqmp_zcu102)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556420 (zynqmp_zcu106)

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-feat-build-add-support-for-new-binutils-versions.patch         | 1 +
 configs/zynqmp_kria_kv260_defconfig                                     | 2 +-
 configs/zynqmp_zcu102_defconfig                                         | 1 +
 configs/zynqmp_zcu106_defconfig                                         | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 120000
index 0000000000..695cc80b94
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index e180d5e7e7..8ceaa6983d 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,4 +38,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 00b33261b6..f4789b9d88 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 88295571af..516f1143ce 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
