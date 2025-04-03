Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54BDC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7733D41725;
	Thu,  3 Apr 2025 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMPd-Sv3cu2V; Thu,  3 Apr 2025 19:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A71FF41423
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71FF41423;
	Thu,  3 Apr 2025 19:55:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B45E81F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD7AA811FA
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fhhjq6Ca6nn3 for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBBB81123
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBBB81123
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6DF983B6B; Thu,  3 Apr 2025 19:55:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Apr 2025 21:52:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d3b1781f639c174de3b09e292179f6f81da61f1
X-Git-Newrev: 8292b8fb89ba71d2b35d4596327b022741f18be4
X-Patchwork-Hint: ignore
Message-Id: <20250403195505.C6DF983B6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: disable on RISC-V ilp32f
 and lp64f, not supported
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=8292b8fb89ba71d2b35d4596327b022741f18be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc fails to build on RISC-V 32-bit with the ilp32f ABI and on
RISC-V 64-bit with the lp64f: both use single-point precision floating
point, which glibc doesn't support, failing during the configure step
with:

  configure: error: glibc does not yet support the single floating-point ABI

Fix that by disabling glibc support on those configurations.

Fixes:

  https://autobuild.buildroot.org/results/fe8d569cab507992978ef0da649278dd3a9e0b23/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d464b3def8..52752e975e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -22,7 +22,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	# glibc needs atomic instructions, and does not support
+	# single-precision floating point ABIs (ilp32f and lp64f)
+	depends on (BR2_RISCV_ISA_RVA && !BR2_RISCV_ABI_ILP32F && !BR2_RISCV_ABI_LP64F) || !BR2_riscv
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_GLIBC_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
