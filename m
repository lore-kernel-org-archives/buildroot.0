Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6EBC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78737410AF;
	Fri, 11 Apr 2025 10:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyIYo6ppxL7H; Fri, 11 Apr 2025 10:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99EB41432
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99EB41432;
	Fri, 11 Apr 2025 10:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B95108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822C161AF3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXZXOnWOlyGI for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED0060D78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ED0060D78
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 376DC843A9; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:47 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: e2d0b5b9bfbef8a76ccb718d094f710db1ce613d
X-Git-Newrev: ed5c6f3625fe5a3d622c8a4d696824e1f1640dab
X-Patchwork-Hint: ignore
Message-Id: <20250411104451.376DC843A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/glibc: disable on
 RISC-V ilp32f and lp64f, not supported
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed5c6f3625fe5a3d622c8a4d696824e1f1640dab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 8292b8fb89ba71d2b35d4596327b022741f18be4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 6075d28874..577404aff5 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -23,7 +23,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_nios2
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
