Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6728C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C08403D0;
	Sat, 20 Jul 2024 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFdS-Z-8eKAc; Sat, 20 Jul 2024 21:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C6F403D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C6F403D4;
	Sat, 20 Jul 2024 21:00:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 164AC1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 045048006D
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edT1J_gBbox5 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463328083D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 463328083D
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4133286DB2; Sat, 20 Jul 2024 21:00:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:59:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65672b9cd099b71dcfec1d982af1f35824b851d4
X-Git-Newrev: 9e5022a12c1f79139e446b2583e06aa430fad195
X-Patchwork-Hint: ignore
Message-Id: <20240720210014.4133286DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/httping: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e5022a12c1f79139e446b2583e06aa430fad195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix patch fuzz to avoid the following build failure raised since commit
8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:

Applying 0001-fix-math-library-linking.patch using patch:
patching file Makefile
Hunk #1 FAILED at 37.
1 out of 2 hunks FAILED -- saving rejects to file Makefile.rej

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
 - http://autobuild.buildroot.org/results/f9cfb6f55d1f2cb855e6959c2381eeddea3e4936

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/httping/0001-fix-math-library-linking.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/httping/0001-fix-math-library-linking.patch b/package/httping/0001-fix-math-library-linking.patch
index 0078f41c61..582fb9e917 100644
--- a/package/httping/0001-fix-math-library-linking.patch
+++ b/package/httping/0001-fix-math-library-linking.patch
@@ -2,12 +2,14 @@ Move LDFLAGS+=-lm option to the end.
 The order of the math library directive '-lm' matters.
 
 Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+[Fabrice: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 diff -Nurp httping-2.3.4_orig/Makefile httping-2.3.4/Makefile
 --- httping-2.3.4_orig/Makefile	2014-07-23 16:16:36.495546288 +0530
 +++ httping-2.3.4/Makefile	2014-07-23 16:18:42.547541002 +0530
-@@ -37,7 +37,6 @@ DEBUG=yes
- WFLAGS=-Wall -W
+@@ -36,7 +36,6 @@ DEBUG=yes
+ WFLAGS=-Wall -W -Wextra -pedantic -D_FORTIFY_SOURCE=2
  OFLAGS=
  CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\" -DLOCALEDIR=\"$(LOCALEDIR)\"
 -LDFLAGS+=-lm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
