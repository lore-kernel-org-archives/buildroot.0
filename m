Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76840CE7A8B
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FAF402B2;
	Sun, 24 Sep 2023 21:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25FAF402B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hh0-NsCfGTv0; Sun, 24 Sep 2023 21:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B8740289;
	Sun, 24 Sep 2023 21:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B8740289
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 493241BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2372560803
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2372560803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLJGa3Ajc-c3 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD01600C7
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD01600C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D8F687693; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:33:15 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 372e4f9723fbb4a22bdf80732328ac736ffe6f5e
X-Git-Newrev: dbd3832f7e805dfded13c526d93f4ed1ad1b3fcd
X-Patchwork-Hint: ignore
Message-Id: <20230924214720.3D8F687693@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libraw: fix
 CVE-2023-1729
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbd3832f7e805dfded13c526d93f4ed1ad1b3fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

A flaw was found in LibRaw. A heap-buffer-overflow in raw2image_ex()
caused by a maliciously crafted file may lead to an application crash.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bc4110b0739f07436cb8c0ff837b7284835fb9b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
