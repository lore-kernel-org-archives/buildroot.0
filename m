Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73589CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E76610FD;
	Sun, 17 Sep 2023 12:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E76610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-RciT-tlq01; Sun, 17 Sep 2023 12:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76AF16110E;
	Sun, 17 Sep 2023 12:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76AF16110E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBBC1BF947
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16BD781ED2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BD781ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQFdsT95suKL for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48FEE81EC6
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48FEE81EC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3801A87165; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:41:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56b066740608e9ca62ce5739fe1a683f7050b605
X-Git-Newrev: bc4110b0739f07436cb8c0ff837b7284835fb9b8
X-Patchwork-Hint: ignore
Message-Id: <20230917124914.3801A87165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libraw: fix CVE-2023-1729
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc4110b0739f07436cb8c0ff837b7284835fb9b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A flaw was found in LibRaw. A heap-buffer-overflow in raw2image_ex()
caused by a maliciously crafted file may lead to an application crash.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-set-shrink-flag-for-3-4-component-images.patch | 24 ++++++++++++++++++++++
 package/libraw/libraw.mk                           |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
new file mode 100644
index 0000000000..ef93e0901b
--- /dev/null
+++ b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
@@ -0,0 +1,24 @@
+From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 14 Jan 2023 18:32:59 +0300
+Subject: [PATCH] do not set shrink flag for 3/4 component images
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
+---
+ src/preprocessing/raw2image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
+index e65e2ad7..702cf290 100644
+--- a/src/preprocessing/raw2image.cpp
++++ b/src/preprocessing/raw2image.cpp
+@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
+ 
+   // adjust for half mode!
+   IO.shrink =
++	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
++	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
+       P1.filters &&
+       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
+ 
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index b6616f0c10..cbd509cfea 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,6 +18,9 @@ LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
+# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
