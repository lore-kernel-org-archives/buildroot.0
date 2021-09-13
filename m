Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60549C433FE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABF6610CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EABF6610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C654C4021B;
	Mon, 13 Sep 2021 17:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kw7ju4g8QEGX; Mon, 13 Sep 2021 17:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA91C401E2;
	Mon, 13 Sep 2021 17:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 021C61BF342
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E27E6074E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tashV7OV4Rk0 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D47ED6076B
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB5FE8A5D9; Mon, 13 Sep 2021 17:45:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:38:58 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f5041927886351328f2fd46bfabb6d660c1ebcf4
X-Git-Newrev: c776e800b5da23fd986f8de3741b5c2fbc88a5c7
X-Patchwork-Hint: ignore
Message-Id: <20210913174536.BB5FE8A5D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/uboot-tools: fix
 MKIMAGE_ARCH handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=c776e800b5da23fd986f8de3741b5c2fbc88a5c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix MKIMAGE_ARCH handling to avoid the following build failure:

/home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/mkimage -C none -A openrisc -T script -d /home/buildroot/autobuild/instance-0/output-1/boot_script.txt /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/boot.scr

Invalid architecture, supported are:
	alpha            Alpha
	arc              ARC
	arm              ARM
	arm64            AArch64
	avr32            AVR32
	blackfin         Blackfin
	ia64             IA64
	invalid          Invalid ARCH
	m68k             M68K
	microblaze       MicroBlaze
	mips             MIPS
	mips64           MIPS 64 Bit
	nds32            NDS32
	nios2            NIOS II
	or1k             OpenRISC 1000
	powerpc          PowerPC
	riscv            RISC-V
	s390             IBM S390
	sandbox          Sandbox
	sh               SuperH
	sparc            SPARC
	sparc64          SPARC 64 Bit
	x86              Intel x86
	x86_64           AMD x86_64
	xtensa           Xtensa

Strangely enough, we only have autobuilder failures since July 2021 even
as or1k has been used since the addition of openriscv support in 2012:
https://github.com/u-boot/u-boot/commit/3ddcaccda3824e1c7f7266d543e4c0eb3ea9851c

For x86_64, we incorrectly mangle it to x86.

Finally, the comment about mips64 is wrong: mips64 *is* a valid
archtecture, and we anyway had no code to tweak that case.

Fixes:
 - http://autobuild.buildroot.org/results/c3f0f2a3fb87d74bfdaccf9b94c66f0b5bae7520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: extend commit log for mips64 and x86_64]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5e8804d4e433cad0c0509483e865afdba003b6fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b0fc9276b2..84c5ab99a0 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -202,15 +202,15 @@ $(eval $(host-generic-package))
 
 MKIMAGE = $(HOST_DIR)/bin/mkimage
 
-# mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
+# mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
 # KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
-# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
-# For mips64, we'll just keep mips
-# For i386 and x86_64, we need to convert
-ifeq ($(KERNEL_ARCH),x86_64)
-MKIMAGE_ARCH = x86
-else ifeq ($(KERNEL_ARCH),i386)
+# For i386, we need to convert
+# For openrisc, we need to convert
+# For others, we'll just keep KERNEL_ARCH
+ifeq ($(KERNEL_ARCH),i386)
 MKIMAGE_ARCH = x86
+else ifeq ($(KERNEL_ARCH),openrisc)
+MKIMAGE_ARCH = or1k
 else
 MKIMAGE_ARCH = $(KERNEL_ARCH)
 endif
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
