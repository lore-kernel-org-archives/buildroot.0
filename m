Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4002C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 13:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A6F26F525;
	Mon, 14 Apr 2025 13:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJNqJXClet10; Mon, 14 Apr 2025 13:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860D86F5D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860D86F5D2;
	Mon, 14 Apr 2025 13:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9863251
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA41661B26
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OROtQTkpu0qs for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3926F5B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B3926F5B9
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB0A84622; Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Apr 2025 09:06:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81da9920631c6b99b8a211ee7d27bd5f97a21029
X-Git-Newrev: cb7599133a281359af8ebab0e2685b2ed5fc3168
X-Patchwork-Hint: ignore
Message-Id: <20250414135949.1AB0A84622@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: disable on
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7599133a281359af8ebab0e2685b2ed5fc3168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
