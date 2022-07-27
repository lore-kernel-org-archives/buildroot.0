Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D33C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85AAD60AD0;
	Wed, 27 Jul 2022 07:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AAD60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hveSNw1QkOpI; Wed, 27 Jul 2022 07:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D9E60AB8;
	Wed, 27 Jul 2022 07:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D9E60AB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEF561BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1BE74041C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1BE74041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BybA9hWE6VOI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0ECD401C5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0ECD401C5
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4D50D86489; Wed, 27 Jul 2022 07:42:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:56:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cda5dff3c1f985f62dc82e8061da31f4e56e3877
X-Git-Newrev: f7d60ee57d7d5155d4b3ac5f5ca12b7445faf95c
X-Patchwork-Hint: ignore
Message-Id: <20220727074256.4D50D86489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.riscv: lp64f ABI is only
 supported if MMU is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7d60ee57d7d5155d4b3ac5f5ca12b7445faf95c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though that seems weird, the LP64F ABI is only supported when MMU
support is enabled. Indeed, as per commit
9a51381cedc16e6d70cb85e1144f6e0fa89af69a ("package/uclibc: prevent
config with unsupported RISC-V float ABI"), uClibc does not support
LP64F. But uClibc is the only C library that support RISC-V 64-bit
noMMU.

So the selection of LP64F and !MMU is impossible. Right now this
selection causes a build failure as no C library is enabled.

This commit fixes this by ensuring we cannot use LP64F when MMU
support is not available.

Fixes:

  http://autobuild.buildroot.net/results/6320dcc655f1871eb8bf6a9689bddde7447385f5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.riscv | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..30bdcaa80b 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -108,6 +108,7 @@ config BR2_RISCV_ABI_LP64
 config BR2_RISCV_ABI_LP64F
 	bool "lp64f"
 	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+	depends on BR2_USE_MMU
 
 config BR2_RISCV_ABI_LP64D
 	bool "lp64d"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
