Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5852A426C8;
	Thu, 26 May 2022 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTI4U0rygb74; Thu, 26 May 2022 21:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221F1426A5;
	Thu, 26 May 2022 21:03:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E38641BF370
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D123E61554
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRwTdcfhnEys for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D095661553
 for <buildroot@buildroot.org>; Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0B0298655B; Thu, 26 May 2022 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 11:14:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 77e9154d0335aa786717d5cc94cafc3b3316e2ba
X-Git-Newrev: 0c787c7955f9ed632564e7335dbfecfd668c93a6
X-Patchwork-Hint: ignore
Message-Id: <20220526205151.0B0298655B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch/Config.in.sh: fixup
 MMU selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c787c7955f9ed632564e7335dbfecfd668c93a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

BR2_sh selects BR2_ARCH_HAS_MMU_OPTIONAL, which means that it's up to
the user to decide whether he wants to use MMU or not on SuperH
platforms.

However:

 - On SH2A, there is no MMU at all, so being to select "Use MMU"
   doesn't make any sense.

 - On SH4, there is no support for *not* using the MMU, so disabling
   "Use MMU" will cause the build to fail.

In order to fix this, we move the MMU selection to arch/Config.in.sh:

 - BR2_sh2a selects nothing, so that it's always noMMU

 - BR2_sh4* select BR2_ARCH_HAS_MMU_MANDATORY so that the MMU is
   always used.

Fixes:

 http://autobuild.buildroot.net/results/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20/ (FLAT
 selected with sh4aeb)

 http://autobuild.buildroot.net/results/d1b1dfe449f82944bd48215da3cdffd05797e2e9/ (FLAT
 selected with sh4a)

 http://autobuild.buildroot.net/results/45bc90fd2dde7bb201d7f999db1a8024cf889a06/ (FLAT
 selected with sh4)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa8a2dacf2ef3081a403a82e93b3815383d8a107)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in    | 1 -
 arch/Config.in.sh | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 98b0e40d51..e51ef60f40 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -228,7 +228,6 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index c1ba449dd5..a012cbf491 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -9,12 +9,16 @@ config BR2_sh2a
 	bool "sh2a (SH2A big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4eb
 	bool "sh4eb (SH4 big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 endchoice
 
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
