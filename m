Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA09C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF6E81D7D;
	Sun, 24 Apr 2022 08:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiPbaHdyN8eH; Sun, 24 Apr 2022 08:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94B9A81D24;
	Sun, 24 Apr 2022 08:52:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 700C91BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3F60BF0
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VitP0UGID_XC for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9152160B94
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A86DF8414E; Sun, 24 Apr 2022 08:41:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:28:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 664f1fc1c7dce0ab62668f9ec5fe13d9e9faff2d
X-Git-Newrev: aa8a2dacf2ef3081a403a82e93b3815383d8a107
X-Patchwork-Hint: ignore
Message-Id: <20220424084158.A86DF8414E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.sh: fixup MMU selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa8a2dacf2ef3081a403a82e93b3815383d8a107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
