Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46ACC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF3A417A1;
	Mon,  5 Feb 2024 10:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF3A417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCpFEXAwhIi7; Mon,  5 Feb 2024 10:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB744188B;
	Mon,  5 Feb 2024 10:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB744188B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75D071BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB7E40ADD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB7E40ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlKD_B64RyO4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 337CB40B12
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 337CB40B12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2231B86ACC; Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:37:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e36cadf7e17a33408c35f078824109b34f7677
X-Git-Newrev: 7e5a90f1b75e59aa5707394f3c707fbbf03204b7
X-Patchwork-Hint: ignore
Message-Id: <20240205103820.2231B86ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdma-core: fix mips4 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e5a90f1b75e59aa5707394f3c707fbbf03204b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'sync' instruction for MIPS was defined in MIPS-II as taking no
operands. MIPS32 extended the define of 'sync' as taking an optional
unsigned 5 bit immediate.

As a result, replace "sync 0" by "sync" to fix the following build
failure on mips4 raised since the addition of the package in commit
ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 and
https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:

/tmp/ccrBy9fV.s: Assembler messages:
/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'

Fixes:
 - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
 - http://autobuild.buildroot.org/results/2df58f9b98aacf00960932f53510b29199393461

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-util-udma_barrier.h-fix-mips4-build.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
new file mode 100644
index 0000000000..6dfb476faa
--- /dev/null
+++ b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
@@ -0,0 +1,56 @@
+From 1b1ca539f6e1f0b774e989f1022477686e4fc77f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jan 2024 18:55:34 +0100
+Subject: [PATCH] util/udma_barrier.h: fix mips4 build
+
+The 'sync' instruction for MIPS was defined in MIPS-II as taking no
+operands. MIPS32 extended the define of 'sync' as taking an optional
+unsigned 5 bit immediate.
+
+As a result, replace "sync 0" by "sync" to fix the following build
+failure on mips4 raised since version 43.0 and
+https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:
+
+/tmp/ccrBy9fV.s: Assembler messages:
+/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/linux-rdma/rdma-core/commit/f3f0c06014c6de845032e6fe9f152674919b3ec6
+---
+ util/udma_barrier.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/util/udma_barrier.h b/util/udma_barrier.h
+index 0a1f8a45b..3793d2f18 100644
+--- a/util/udma_barrier.h
++++ b/util/udma_barrier.h
+@@ -101,7 +101,7 @@
+ #elif defined(__riscv)
+ #define udma_to_device_barrier() asm volatile("fence ow,ow" ::: "memory")
+ #elif defined(__mips__)
+-#define udma_to_device_barrier() asm volatile("sync 0" ::: "memory")
++#define udma_to_device_barrier() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
+@@ -139,7 +139,7 @@
+ #elif defined(__riscv)
+ #define udma_from_device_barrier() asm volatile("fence ir,ir" ::: "memory")
+ #elif defined(__mips__)
+-#define udma_from_device_barrier() asm volatile("sync 0" ::: "memory")
++#define udma_from_device_barrier() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
+@@ -212,7 +212,7 @@
+ #include "s390_mmio_insn.h"
+ #define mmio_flush_writes() s390_pciwb()
+ #elif defined(__mips__)
+-#define mmio_flush_writes() asm volatile("sync 0" ::: "memory")
++#define mmio_flush_writes() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
