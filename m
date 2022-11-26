Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C833C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6CC581E3B;
	Sat, 26 Nov 2022 18:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6CC581E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uapIYzctYAHO; Sat, 26 Nov 2022 18:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD0D81E25;
	Sat, 26 Nov 2022 18:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD0D81E25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0EF1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E912E416C2
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E912E416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHv7T7QoHjcL for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061F540541
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061F540541
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7EBE844CD; Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:24:07 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: af4bfa3fd2c97f93888f1f7313d94467cdc14591
X-Git-Newrev: 40c7aaec8945f8aaf16b52ad7cab243ee937f915
X-Patchwork-Hint: ignore
Message-Id: <20221126182902.E7EBE844CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] boot/edk2: fix the build
 for arm sgi575
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
Content-Type: multipart/mixed; boundary="===============0473785647725119612=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0473785647725119612==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=40c7aaec8945f8aaf16b52ad7cab243ee937f915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 79591b76674a8c0ed150021a27771a73a70d159b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============0473785647725119612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0473785647725119612==--
