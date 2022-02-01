Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6740C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFE7402BD;
	Tue,  1 Feb 2022 22:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTxX5E9caQNr; Tue,  1 Feb 2022 22:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74BF40250;
	Tue,  1 Feb 2022 22:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C05131BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BF260D5E
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvn3C6rsGgmW for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B77C60DC6
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 529B18285F; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c7099f3abe7fd58b1642bebca5ca6c9e5d68de7
X-Git-Newrev: 750aa61300ca6434426916e83cf0ce18f729b668
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.529B18285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: add riscv support
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

commit: https://git.buildroot.net/buildroot/commit/?id=750aa61300ca6434426916e83cf0ce18f729b668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv is supported since version 0.3.0 and
https://github.com/xvisor/xvisor/commit/d6feda4e80eefd372294b081111ce709d08ee4c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xvisor/Config.in | 3 +++
 package/xvisor/xvisor.mk | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 71628e633e..1eb50c8abe 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_riscv
 	default y if BR2_x86_64
 	depends on BR2_USE_MMU
 
@@ -34,6 +35,8 @@ config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
 	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
+	default "generic-32b" if BR2_RISCV_32
+	default "generic-64b" if BR2_RISCV_64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	help
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index dc49258400..d7bb288ea8 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -32,6 +32,8 @@ ifeq ($(BR2_x86_64),y)
 XVISOR_ARCH = x86
 else ifeq ($(BR2_arm)$(BR2_aarch64),y)
 XVISOR_ARCH = arm
+else ifeq ($(BR2_riscv),y)
+XVISOR_ARCH = riscv
 endif
 
 ifeq ($(BR2_PACKAGE_XVISOR)$(BR_BUILDING),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
