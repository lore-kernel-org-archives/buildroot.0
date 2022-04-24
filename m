Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C108EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA9940A5F;
	Sun, 24 Apr 2022 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgXKXUKMHbcI; Sun, 24 Apr 2022 08:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 835AC40A88;
	Sun, 24 Apr 2022 08:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBA71BF963
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DF1E40432
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWZTnrh_PPPg for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA96040104
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C55318414E; Sun, 24 Apr 2022 08:41:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:46:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec190481a76b494d348e0e03cfa3c580bb444d03
X-Git-Newrev: 42a3300ae5641bf45c4c8f6a1306f4e06dc93034
X-Patchwork-Hint: ignore
Message-Id: <20220424084158.C55318414E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: remove
 BR2_ARCH_HAS_MMU_MANDATORY from BR2_aarch64*
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

commit: https://git.buildroot.net/buildroot/commit/?id=42a3300ae5641bf45c4c8f6a1306f4e06dc93034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selecting BR2_ARCH_HAS_MMU_MANDATORY from BR2_aarch64 and
BR2_aarch64_be doesn't make much sense, because the actual ARM cores
described in arch/Config.in.arm then all select
BR2_ARCH_HAS_MMU_OPTIONAL. So we end up with both
BR2_ARCH_HAS_MMU_OPTIONAL and BR2_ARCH_HAS_MMU_MANDATORY, which
doesn't make any sense.

To prevent this, we remove the selection of BR2_ARCH_HAS_MMU_MANDATORY
from BR2_aarch64 and BR2_aarch64_be, and let arch/Config.in.arm do its
job. What arch/Config.in.arm does is currently incorrect, but it will
be fixed in a separate commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1ea4e21413..49e16fce38 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -60,7 +60,6 @@ config BR2_armeb
 config BR2_aarch64
 	bool "AArch64 (little endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -69,7 +68,6 @@ config BR2_aarch64
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
