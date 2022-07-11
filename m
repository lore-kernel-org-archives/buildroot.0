Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EAEC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B8283027;
	Mon, 11 Jul 2022 17:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B8283027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dH6SCQR57e0; Mon, 11 Jul 2022 17:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748D5830C1;
	Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748D5830C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B858E1BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEC4409E2
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEC4409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4A55Nlhhq80h for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C37A34059C
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37A34059C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E503983748; Mon, 11 Jul 2022 17:14:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:10:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8ebacc810e95963c406674cfbaa4cf79e5bb80c9
X-Git-Newrev: 1b26ef9e45bbe7b5d4cab6717310dc7eb3f84fef
X-Patchwork-Hint: ignore
Message-Id: <20220711171456.E503983748@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 support/scripts/gen-bootlin-toolchains: fix RISC-V 64-bit toolchain
 description
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b26ef9e45bbe7b5d4cab6717310dc7eb3f84fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

We now support both MMU-enabled and MMU-less RISC-V 64-bit
configurations. However, the Bootlin toolchain for RISC-V 64-bit only
supports MMU-enabled configurations, but the current logic in
toolchain/toolchain-external/toolchain-external-bootlin/ does not take
this into account, and allows selecting the Booltin toolchain for
MMU-less RISC-V 64-bit configurations.

To fix this, the gen-bootlin-toolchains script is modified to add the
BR2_USE_MMU dependency to the description of the RISC-V 64-bit
toolchain.

However, the BR2_USE_MMU dependency was also added for glibc and musl
toolchains unconditionally, so to avoid duplicating the dependency, we
now only add it only if not already present in the list of
dependencies for this toolchain.

This will allow to fix:

  http://autobuild.buildroot.net/results/d6aee9b275b1ec399aea59758ac8f69fdc5691fc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1f4bba5967f793add3bfd051c96926224b73eebd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 97a744340a..16773cd9cb 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -159,7 +159,7 @@ arches = {
         'prefix': 'riscv32',
     },
     'riscv64-lp64d': {
-        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
+        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D', 'BR2_USE_MMU'],
         'prefix': 'riscv64',
     },
     's390x-z13': {
@@ -312,13 +312,15 @@ class Toolchain:
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
                 # glibc needs mmu support
-                depends.append("BR2_USE_MMU")
+                if "BR2_USE_MMU" not in depends:
+                    depends.append("BR2_USE_MMU")
                 # glibc doesn't support static only configuration
                 depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
                 # musl needs mmu support
-                depends.append("BR2_USE_MMU")
+                if "BR2_USE_MMU" not in depends:
+                    depends.append("BR2_USE_MMU")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_MUSL")
 
             # gcc version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
