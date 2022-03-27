Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B844C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E71A44092D;
	Sun, 27 Mar 2022 16:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9mnFFx3jOaF; Sun, 27 Mar 2022 16:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACF5410A1;
	Sun, 27 Mar 2022 16:35:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5B11BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1D7360D58
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkHxKYoNeaFg for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E29D860BB2
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8165E85E08; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 082076ffc186392f2b794facaa0545529e4f5851
X-Git-Newrev: f11f6ab6e62cb04e33487390f0f0d66d9ed2d950
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.8165E85E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f11f6ab6e62cb04e33487390f0f0d66d9ed2d950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version 1.25
in commit 0fc5bc235990073233df6352d1208624034a6b6e and
https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=01cd8587606bf2da1af245163150589834126c1:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'

Fixes:
 - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-src-storage.c-fix-build-with-uclibc.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..55fdaa86fd
--- /dev/null
+++ b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
@@ -0,0 +1,37 @@
+From 99e74ade2ea892e6d0b070bec1df6a135ce2c8b3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Mar 2022 16:35:49 +0100
+Subject: [PATCH] src/storage.c: fix build with uclibc
+
+explicit_bzero is used in src/storage.c since commit
+01cd8587606bf2da1af245163150589834126c1c but src/missing.h is not
+included, as a result build with uclibc fails on:
+
+/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
+storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/WB2XXRBUDHC5IVFDEOJBK23JHPURL427]
+---
+ src/storage.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/storage.c b/src/storage.c
+index 82a72443..aa8066b1 100644
+--- a/src/storage.c
++++ b/src/storage.c
+@@ -44,6 +44,7 @@
+ #include <ell/ell.h>
+ #include "ell/useful.h"
+ 
++#include "src/missing.h"
+ #include "src/common.h"
+ #include "src/storage.h"
+ #include "src/crypto.h"
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
