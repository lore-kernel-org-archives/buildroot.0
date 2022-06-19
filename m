Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77218C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C0641299;
	Sun, 19 Jun 2022 13:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C0641299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsrMctujJv4C; Sun, 19 Jun 2022 13:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB82408EE;
	Sun, 19 Jun 2022 13:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB82408EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A485E1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F99581CAD
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F99581CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycbK6mB4VZVz for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EDF981CA5
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EDF981CA5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98FA787197; Sun, 19 Jun 2022 12:57:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:08:56 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a6d51d0b2d8fb8fcee64fe250b8f8f543fc58931
X-Git-Newrev: abd6027aa10483086f9e5e14e632703e99076359
X-Patchwork-Hint: ignore
Message-Id: <20220619125742.98FA787197@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rustc: add
 support for ARMv8 with 32-bit software
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd6027aa10483086f9e5e14e632703e99076359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not enabled when ARMv8
target hardware is combined with 32-bit software. That is because ARMv7
(32-bit) toolchain is only enabled for BR2_ARM_CPU_ARMV7A which is
mutually exclusive with BR2_ARM_CPU_ARMV8A.

Use ARMv7 toolchain for 32-bit software.

Cc: James Hilliard <james.hilliard1@gmail.com>
Reported-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 350772148f208c8d49f88f97b3a5ecf59c369bc6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rustc/Config.in.host | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 9ce0f62592..27c3a3cdeb 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -42,6 +42,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# armv7-unknown-linux-gnueabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
+	# armv7-unknown-linux-gnueabihf for armv8 hardware with 32-bit
+	# userspace
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# mips-unknown-linux-gnu
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-gnuabi64
@@ -86,6 +89,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
 	# armv7-unknown-linux-musleabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
+	# armv7-unknown-linux-musleabihf for armv8 hardware with 32-bit
+	# userspace
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
 	# i586-unknown-linux-gnu
 	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
 	# i586-unknown-linux-musl
@@ -116,6 +122,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH
 	default "armv5te" if BR2_ARM_CPU_ARMV5
 	default "arm" if BR2_ARM_CPU_ARMV6
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
+	default "armv7"  if BR2_ARM_CPU_ARMV7A || (BR2_arm && BR2_ARM_CPU_ARMV8A)
 	default "riscv64gc" if BR2_RISCV_64
 	default BR2_ARCH
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
