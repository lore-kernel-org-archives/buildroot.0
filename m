Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569EEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D296660B55;
	Wed, 29 Dec 2021 23:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id na_Dc3TR3e5l; Wed, 29 Dec 2021 23:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27ADF60B50;
	Wed, 29 Dec 2021 23:16:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D241BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6156940935
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y49OTjswG90a for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:16:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3557408E2
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 287D282C83; Wed, 29 Dec 2021 23:10:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 00:16:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcb85b2e59902c1f570fb0545b38a677d088841f
X-Git-Newrev: 7c830c21a0bb0b00ed2e39c8e7856e6530920158
X-Patchwork-Hint: ignore
Message-Id: <20211229231037.287D282C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: fix build without libpng
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c830c21a0bb0b00ed2e39c8e7856e6530920158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libjpeg but without libpng raised
since bump to version 21.12.0 in commit
1da4ead4c2286047228f710d233933dfc04c51f0:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/poppler-21.12.0/poppler/ImageEmbeddingUtils.cc:298:5: error: 'jmp_buf' does not name a type
  298 |     jmp_buf setjmpBuffer;
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/360972af797bb1be80b0324796794817fe0ccf53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
new file mode 100644
index 0000000000..40af6a2e00
--- /dev/null
+++ b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
@@ -0,0 +1,27 @@
+From 3ea6bca90d87d3f91556205c4e58ca425c6ac437 Mon Sep 17 00:00:00 2001
+From: Marco Genasci <fedeliallalinea@gmail.com>
+Date: Sun, 12 Dec 2021 10:23:37 +0100
+Subject: [PATCH] Include setjmp.h when WITH_JPEG=yes and WITH_PNG=no
+
+[Retrieved from:
+https://gitlab.freedesktop.org/poppler/poppler/-/commit/3ea6bca90d87d3f91556205c4e58ca425c6ac437]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ poppler/ImageEmbeddingUtils.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/poppler/ImageEmbeddingUtils.cc b/poppler/ImageEmbeddingUtils.cc
+index 5c50f1269..c26b9eb2a 100644
+--- a/poppler/ImageEmbeddingUtils.cc
++++ b/poppler/ImageEmbeddingUtils.cc
+@@ -16,6 +16,7 @@
+ extern "C" {
+ #    include <jpeglib.h>
+ }
++#    include <csetjmp>
+ #endif
+ #ifdef ENABLE_LIBPNG
+ #    include <png.h>
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
