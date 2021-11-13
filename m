Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9822C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC05160F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC05160F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F29060685;
	Sat, 13 Nov 2021 14:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usFN-tZCTKGM; Sat, 13 Nov 2021 14:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1A060683;
	Sat, 13 Nov 2021 14:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 490311BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37D3040275
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4UKppPvyHGH for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EB7740277
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 272A48C9A4; Sat, 13 Nov 2021 14:20:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:23:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d6a5a0cc7c283916df5a7c71f4599b05d296bd1
X-Git-Newrev: 4074fbd0aad1dc7c623aee68c8267d4f11e19fdc
X-Patchwork-Hint: ignore
Message-Id: <20211113142002.272A48C9A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: backport
 gcc >= 10 u-boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=4074fbd0aad1dc7c623aee68c8267d4f11e19fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966041

The old U-Boot version used does not build with hostcc >= 10.  Backport a
patch fixing that issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch b/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 0000000000..c9d5d71ca1
--- /dev/null
+++ b/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch
@@ -0,0 +1,28 @@
+From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index fd825ebba6..24af549977 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.20.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
