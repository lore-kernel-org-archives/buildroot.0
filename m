Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A35BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13ABD60D54;
	Tue,  1 Feb 2022 22:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pjjg64nvHdG1; Tue,  1 Feb 2022 22:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F7D060F96;
	Tue,  1 Feb 2022 22:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3407E1BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B6760D54
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qedQAbqc1E-S for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A6F60D5E
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 49AFF82858; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 145a401b3b2d94e39e76b7ffea154971711aa6f3
X-Git-Newrev: 3c7099f3abe7fd58b1642bebca5ca6c9e5d68de7
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.49AFF82858@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: drop ARM32 without
 virtualization support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c7099f3abe7fd58b1642bebca5ca6c9e5d68de7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for old 32-bit ARM boards (i.e. ARMv5, ARMv6, ARMv7a) without
virtualization has been dropped since
https://github.com/xvisor/xvisor/commit/9fcd69692484e0f6aa5036c27196f55c797582c5
resulting in the following build failure since bump to version 0.3.1 in
commit c4f8b8968770ecbf6444a5921c6472f126717626:

*** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v6-defconfig"!

*** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-0/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v7-defconfig"!

As spotted by Thomas Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20220125190650.107677-1-fontaine.fabrice@gmail.com,
"ARM32 cores that support the ARMv7ve instruction set are still
supported by Xvisor. This means that Cortex-A7, Cortex-A12, Cortex-A15
and Cortex-A17, which are all ARM32 cores, are still supported"

Fixes:
 - http://autobuild.buildroot.org/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b
 - http://autobuild.buildroot.org/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xvisor/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index eb7475b86d..71628e633e 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
-	default y
+	default y if BR2_aarch64
+	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_x86_64
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
-	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
 
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
@@ -32,9 +32,7 @@ endchoice
 
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	default "generic-v5" if BR2_ARM_CPU_ARMV5
-	default "generic-v6" if BR2_ARM_CPU_ARMV6
-	default "generic-v7" if BR2_ARM_CPU_ARMV7A
+	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
