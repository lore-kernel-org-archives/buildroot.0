Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220D3C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FD761166;
	Tue, 22 Nov 2022 21:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FD761166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5fZhPIHYHPl; Tue, 22 Nov 2022 21:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051AD61037;
	Tue, 22 Nov 2022 21:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051AD61037
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8341BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B840861037
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B840861037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92I8iPMRjjfw for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:27:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E599860D8E
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E599860D8E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0E1484178; Tue, 22 Nov 2022 21:27:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:27:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a013d25a09d07a3e7a89b1afbb20da206a383d
X-Git-Newrev: 79591b76674a8c0ed150021a27771a73a70d159b
X-Patchwork-Hint: ignore
Message-Id: <20221122212753.D0E1484178@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: fix the build for arm sgi575
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
Content-Type: multipart/mixed; boundary="===============0607943331520866211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0607943331520866211==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=79591b76674a8c0ed150021a27771a73a70d159b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The edk2 package can be configured for platform Arm Sgi575 but this
does not build correctly:

Usage: build.exe [options] [all|fds|genc|genmake|clean|cleanall|cleanlib|modules|libraries|run]

build.exe: error: option -a: invalid choice: '-b' (choose from 'IA32', 'X64', 'EBC', 'ARM', 'AARCH64', 'RISCV64')
make[1]: *** [package/pkg-generic.mk:293: /home/thomas/buildroot/buildroot/output/build/edk2-edk2-stable202102/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

Add the necessary definitions to fix the build.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/edk2/edk2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 5cbd9d152e..7d8765c310 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -75,6 +75,12 @@ EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemuKernel
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_SGI575),y)
+EDK2_ARCH = AARCH64
+EDK2_PACKAGE_NAME = Platform/ARM/SgiPkg/Sgi575
+EDK2_PLATFORM_NAME = Sgi575
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
 EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg

--===============0607943331520866211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0607943331520866211==--
