Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 21:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35AFC84758;
	Thu, 26 May 2022 21:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfLqJL5VnfSw; Thu, 26 May 2022 21:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3455384759;
	Thu, 26 May 2022 21:03:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE5CA1BF370
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7E661554
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeGZQjASqiMb for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2FD46155D
 for <buildroot@buildroot.org>; Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 20C7486561; Thu, 26 May 2022 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 11:19:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 814880699521dde1efe7e572da92909ad712f6d9
X-Git-Newrev: 1067c60c57cff73284eda8676edfbe5c1ae72786
X-Patchwork-Hint: ignore
Message-Id: <20220526205151.20C7486561@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch/Config.in.sh: move
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

commit: https://git.buildroot.net/buildroot/commit/?id=1067c60c57cff73284eda8676edfbe5c1ae72786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Now that all SuperH cores have an MMU, and must use it, move back the
select BR2_ARCH_HAS_MMU_MANDATORY one level up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ec190481a76b494d348e0e03cfa3c580bb444d03)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
