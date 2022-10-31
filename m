Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE4FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE85340357;
	Mon, 31 Oct 2022 10:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE85340357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwWAoAXvOp72; Mon, 31 Oct 2022 10:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDECE404EC;
	Mon, 31 Oct 2022 10:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDECE404EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381311BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 126584031E
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 126584031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIFYTrI837-n for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:46:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C2240267
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C2240267
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18126878A9; Mon, 31 Oct 2022 10:46:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:46:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23407308e51d2112b030d7b135517949f3d50c1f
X-Git-Newrev: bacbda92e1b1bff4689ad35beeba5d136dcc6dde
X-Patchwork-Hint: ignore
Message-Id: <20221031104658.18126878A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: add patch to fix GCC 12
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bacbda92e1b1bff4689ad35beeba5d136dcc6dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch cherry-picked from upstream to fix the build with GCC 12.

Upstream commit is d1ca3f53c96dc8a4048b17dc16147a8fac782d4a.
I don't know if it fixes any autobuilder errors, I noticed the bug when
building locally.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...002-libmatrix-Add-missing-utility-include.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
new file mode 100644
index 0000000000..65b6183867
--- /dev/null
+++ b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
@@ -0,0 +1,30 @@
+From d1ca3f53c96dc8a4048b17dc16147a8fac782d4a Mon Sep 17 00:00:00 2001
+From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
+Date: Mon, 14 Feb 2022 13:54:09 +0200
+Subject: [PATCH] libmatrix: Add missing <utility> include
+
+Fixes compilation with GCC 12.
+
+Fixes #169
+[Paul: backport upstream d1ca3f53c96dc8a4048b17dc16147a8fac782d4a]
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+
+ src/libmatrix/program.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libmatrix/program.h b/src/libmatrix/program.h
+index f95b470..1c9de08 100644
+--- a/src/libmatrix/program.h
++++ b/src/libmatrix/program.h
+@@ -15,6 +15,7 @@
+ #include <string>
+ #include <vector>
+ #include <map>
++#include <utility>
+ #include "mat.h"
+ 
+ // Simple shader container.  Abstracts all of the OpenGL bits, but leaves
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
