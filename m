Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5288EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF43684CA2;
	Tue, 26 Jul 2022 15:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF43684CA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3qXkaSGAZEU; Tue, 26 Jul 2022 15:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F38018420B;
	Tue, 26 Jul 2022 15:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38018420B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E753D1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C20468420B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20468420B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5IhdenaV9JH for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AFDC840DE
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFDC840DE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0A0C085EE5; Tue, 26 Jul 2022 14:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 17:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d839fa6b29f5919c524e1336f24236657948f7
X-Git-Newrev: ca881f183dff08f77c4932e86b878109e86e1a4b
X-Patchwork-Hint: ignore
Message-Id: <20220726145752.0A0C085EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: BR2_BINFMT_FLAT remove
 architecture dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca881f183dff08f77c4932e86b878109e86e1a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] removed the Config.in.host file and moved the arm, sh,
sparc, xtensa and riscv-64 architectures dependencies.  But this list
doesn't contain all elf2flt supported architectures and this breaks
the host-gcc-initial build for m68k.

Since BR2_BINFMT_FLAT is only available on no MMU case, we can rely on
BR2_USE_MMU option and remove the architecture list.

Note: SH without MMU support has been removed by [2], sparc requires
an MMU since at least [3].

Fixes:

  http://autobuild.buildroot.net/results/15d62edfc4b54c0b40b9d3961b797bce4e307919/

[1] 9db5eb258cf492567bac33a33cb606f14045639d
[2] 04ea3d38dd76f4e96f4961143d674aff59b13d3f
[3] 29563047e074a7c0b73c9e6b629d08bac1e07cb5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 442d6b0075..9135df9def 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -388,7 +388,6 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
