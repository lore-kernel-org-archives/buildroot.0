Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546AC60D76;
	Sun, 24 Apr 2022 08:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1t6T5BGcAE5H; Sun, 24 Apr 2022 08:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 602D560D5A;
	Sun, 24 Apr 2022 08:52:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C33E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A42960D5A
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gImxfCQcrXpl for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2F1B60BF0
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BCFB284150; Sun, 24 Apr 2022 08:41:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:45:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04ea3d38dd76f4e96f4961143d674aff59b13d3f
X-Git-Newrev: ec190481a76b494d348e0e03cfa3c580bb444d03
X-Patchwork-Hint: ignore
Message-Id: <20220424084158.BCFB284150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.sh: move
 BR2_ARCH_HAS_MMU_MANDATORY one level up
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec190481a76b494d348e0e03cfa3c580bb444d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all SuperH cores have an MMU, and must use it, move back the
select BR2_ARCH_HAS_MMU_MANDATORY one level up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in    | 1 +
 arch/Config.in.sh | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index e51ef60f40..1ea4e21413 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -228,6 +228,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index f00954bb5e..d3acc8ccf8 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -7,16 +7,12 @@ choice
 
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4eb
 	bool "sh4eb (SH4 big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 endchoice
 
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
