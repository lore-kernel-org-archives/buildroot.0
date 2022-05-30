Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF6840C93;
	Mon, 30 May 2022 20:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjzWtRAUDsPQ; Mon, 30 May 2022 20:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EA0940C97;
	Mon, 30 May 2022 20:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C55E01BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3C1C4170D
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cc1zS0Hsnz_u for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:58:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6BC84170A
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C94FC86813; Mon, 30 May 2022 20:46:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:58:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 858a7fe4e59ae43b6c83d203ca6591c444618eff
X-Git-Newrev: 07cc32898b6ed0699db8d993b7334c3b1170e5de
X-Patchwork-Hint: ignore
Message-Id: <20220530204653.C94FC86813@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix boost-log build
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

commit: https://git.buildroot.net/buildroot/commit/?id=07cc32898b6ed0699db8d993b7334c3b1170e5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with boost-log raised since bump to
version 1.79.0 in commit 7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9 and
https://github.com/boostorg/log/commit/3cbc2585c3b7ff5d884a6c337a99525b57fa184b:

error: at libs/log/build/Jamfile.v2:59
error: Unable to find file or target named
error:     '/boost/architecture//mips'
error: referred to from project at
error:     'libs/log/build'

Fixes:
 - http://autobuild.buildroot.org/results/edcc7c7f3586993a77b6cc06ed02363a42c09a83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ame-mips1-to-mips-and-alias-mips1-to-mips.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch b/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
new file mode 100644
index 0000000000..cc4ab8a2f8
--- /dev/null
+++ b/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
@@ -0,0 +1,48 @@
+From 1a55d1d9c6d1cf7739645080bdd92fe903b4211e Mon Sep 17 00:00:00 2001
+From: Nikita Kniazev <nok.raven@gmail.com>
+Date: Wed, 28 Jul 2021 21:06:54 +0300
+Subject: [PATCH] Rename mips1 to mips and alias mips1 to mips
+
+[Retrieved from:
+https://github.com/boostorg/config/commit/1a55d1d9c6d1cf7739645080bdd92fe903b4211e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ checks/architecture/Jamfile.jam             | 3 ++-
+ checks/architecture/{mips1.cpp => mips.cpp} | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+ rename checks/architecture/{mips1.cpp => mips.cpp} (89%)
+
+diff --git a/libs/config/checks/architecture/Jamfile.jam b/libs/config/checks/architecture/Jamfile.jam
+index 2ba54f9ad..c3779d917 100644
+--- a/libs/config/checks/architecture/Jamfile.jam
++++ b/libs/config/checks/architecture/Jamfile.jam
+@@ -18,7 +18,8 @@ obj 64 : 64.cpp ;
+ 
+ obj arm      : arm.cpp ;
+ obj combined : combined.cpp ;
+-obj mips1    : mips1.cpp ;
++obj mips     : mips.cpp ;
++alias mips1  : mips ; # Backwards compatibility
+ obj power    : power.cpp ;
+ obj riscv    : riscv.cpp ;
+ obj sparc    : sparc.cpp ;
+diff --git a/libs/config/checks/architecture/mips1.cpp b/libs/config/checks/architecture/mips.cpp
+similarity index 89%
+rename from checks/architecture/mips1.cpp
+rename to checks/architecture/mips.cpp
+index b4a670b89..85f85583d 100644
+--- a/libs/config/checks/architecture/mips1.cpp
++++ b/libs/config/checks/architecture/mips.cpp
+@@ -1,4 +1,4 @@
+-// mips1.cpp
++// mips.cpp
+ //
+ // Copyright (c) 2012 Steven Watanabe
+ //
+@@ -7,5 +7,5 @@
+ // http://www.boost.org/LICENSE_1_0.txt)
+ 
+ #if !(defined(__mips) || defined(_MIPS_ISA_MIPS1) || defined(_R3000))
+-#error "Not MIPS1"
++#error "Not MIPS"
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
