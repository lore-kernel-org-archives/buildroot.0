Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E25C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4566108E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B4566108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63C384027D;
	Sat, 13 Nov 2021 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGaLmfN95rOE; Sat, 13 Nov 2021 14:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2544027A;
	Sat, 13 Nov 2021 14:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBD9A1BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBBBC4026F
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsNb10cqdaq9 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33F4C4022F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:24:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1CE578C9A3; Sat, 13 Nov 2021 14:20:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:23:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cf4822035ddf7b601e33fa99875ce76c81c1c46
X-Git-Newrev: 2d6a5a0cc7c283916df5a7c71f4599b05d296bd1
X-Patchwork-Hint: ignore
Message-Id: <20211113142002.1CE578C9A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sheevaplug_defconfig: backport gcc
 >= 10 u-boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d6a5a0cc7c283916df5a7c71f4599b05d296bd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966307

The old U-Boot version used does not build with hostcc >= 10.  Backport a
patch fixing that issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ++++++++++++++++++++++
 configs/sheevaplug_defconfig                       |  1 +
 2 files changed, 29 insertions(+)

diff --git a/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch b/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 0000000000..c9d5d71ca1
--- /dev/null
+++ b/board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
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
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 4c3bb21b4a..7f186df22c 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # system
+BR2_GLOBAL_PATCH_DIR="board/sheevaplug/patches"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
