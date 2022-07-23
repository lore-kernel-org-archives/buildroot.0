Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C33C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B3294167B;
	Sat, 23 Jul 2022 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B3294167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jme8CpEiWuqm; Sat, 23 Jul 2022 15:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0846B4167C;
	Sat, 23 Jul 2022 15:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0846B4167C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87A781BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D1342427
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D1342427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAiZKtZRcv3E for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2491741908
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2491741908
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0807C8469D; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fed42456693a5c31c73b5a577d85ce6baa69737
X-Git-Newrev: d479264b34f209b96b81a627c88851a04fa794dd
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.0807C8469D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.riscv: enable Zicsr and
 Zifencei standalone extensions with gcc >= 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=d479264b34f209b96b81a627c88851a04fa794dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcc 12, the default RISC-V ISA spec version was bump to 20191213 [1].

This bump introduces a major compatibility issue: support for the csr read/write
(csrr*/csrw*) instructions and fence.i instruction has been separated
from the "I" extension, becoming two standalone extensions: Zicsr and
Zifencei. gcc now has specific -march suffixes to enable those
extensions (_zicsr and _zifencei). If they are not used and code that
uses these instructions is built, one would get errors such as
unrecognized opcode "csrr" (or "fence.i").

For example, without Zifencei we can't build the opensbi
bootloader[2]:

opensbi-1.0/lib/sbi/sbi_tlb.c: Assembler messages:
opensbi-1.0/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i', extension `zifencei' required

As a workaround, the opensbi build system has been patched [3] to use
-march=rv64imafdc_zicsr_zifencei when needed.  This workaround doesn't
work in Buildroot due to the local patch
0001-Makefile-Don-t-specify-mabi-or-march.patch which removes -march
from CFLAGS.

In the context of Buildroot, we have decided for now to assume that
all RISC-V cores that are Linux capable will implement the Zicsr and
Zifencei extensions: it is in fact the case today ase these extensions
were part of the I extension, that all cores support. OpenSBI and
Linux are making the same assumption (see [5]).

Therefore, when gcc >= 12, the -march value gets appended with
_zicsr_zifencei.

[1] https://gcc.gnu.org/gcc-12/changes.html
[2] https://github.com/riscv-software-src/opensbi/blob/v0.9/lib/sbi/sbi_tlb.c#L173
[3] https://github.com/riscv-software-src/opensbi/commit/5d53b55aa77ffeefd4012445dfa6ad3535e1ff2c
[4] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
[5] http://lists.busybox.net/pipermail/buildroot/2022-July/646698.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
[Thomas: add comment in .mk file, rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk.riscv | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..8d2236147c 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -27,4 +27,13 @@ ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
 
+# Starting from gcc 12.x, csr and fence instructions have been
+# separated from the base I instruction set, and special -march
+# suffixes are needed to enable their support. In Buildroot, we assume
+# all RISC-V cores that support Linux implement those instructions, so
+# we unconditionally enable those extensions.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
+endif
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
