Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61B6EE49A5
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560024152D;
	Sun, 20 Aug 2023 21:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560024152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n88354wzaxSO; Sun, 20 Aug 2023 21:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A14415EF;
	Sun, 20 Aug 2023 21:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A14415EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF961BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 248BA81F16
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248BA81F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3Qay-xWki5S for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4C481F14
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4C481F14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14DFD85EF7; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:39:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 486a3ba4c3a78668eee1dd4f4b312a75a1b029c5
X-Git-Newrev: 27bf08e4addb78d30fb68992e35c5d8335d4e7c6
X-Patchwork-Hint: ignore
Message-Id: <20230820214028.14DFD85EF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=27bf08e4addb78d30fb68992e35c5d8335d4e7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new binutils version break the ATF build due to new linker warnings:

 ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions

From [1]
"Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
 of a new warning when linking the bl*.elf in the form:

 ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
 ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
 ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
 ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions

These new warnings are enbaled by default to secure elf binaries:
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
"

Bump the ATF custom version to 2.9 for binutils 2.39+ support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436283

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/avenger96_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 1f8e7a50d1..adfd7585c4 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
