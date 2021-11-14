Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2A3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:44:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B48A6112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B48A6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEA040222;
	Sun, 14 Nov 2021 12:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7acHfcPzcN2; Sun, 14 Nov 2021 12:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2440140220;
	Sun, 14 Nov 2021 12:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A63BF1BF34C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 875EE60688
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUkXvzU2HQLV for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:43:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9599460667
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 565418C977; Sun, 14 Nov 2021 12:39:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 13:15:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e48b159dc2be3f7ab6c82987055d655c8c9dac8
X-Git-Newrev: e6c9d495bec4be53b405f117ed2ddabb0de09d37
X-Patchwork-Hint: ignore
Message-Id: <20211114123949.565418C977@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6c9d495bec4be53b405f117ed2ddabb0de09d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on musl since bump to version
1.47 in commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f and
https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:

sg_dd.c: In function 'main':
sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
 2402 |                 uint off;
      |                 ^~~~
      |                 int

Fixes:
 - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-src-sg_dd.c-fix-musl-build.patch          | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
new file mode 100644
index 0000000000..50a81a78a4
--- /dev/null
+++ b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
@@ -0,0 +1,39 @@
+From c93ad13ecd8ddfbb8bb3e4d5d5ad7f3f2c633db6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Nov 2021 12:37:16 +0100
+Subject: [PATCH] src/sg_dd.c: fix musl build
+
+Fix the following build failure on musl raised since version 1.47 and
+https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
+
+sg_dd.c: In function 'main':
+sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
+ 2402 |                 uint off;
+      |                 ^~~~
+      |                 int
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/7]
+---
+ src/sg_dd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sg_dd.c b/src/sg_dd.c
+index 9d05c93..35e2423 100644
+--- a/src/sg_dd.c
++++ b/src/sg_dd.c
+@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
+             res = blocks * blk_sz;
+             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
+                 uint32_t pos = (uint32_t)skip;
+-                uint off;
++                uint32_t off;
+ 
+                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
+                     for (j = 0; j < (blk_sz - 3); j += 4)
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
