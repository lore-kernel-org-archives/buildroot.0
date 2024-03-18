Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED7C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EF7C40A4F;
	Mon, 18 Mar 2024 13:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yi6sJF5b53BZ; Mon, 18 Mar 2024 13:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A65340A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A65340A46;
	Mon, 18 Mar 2024 13:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC15A1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDDB54052E
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztTszwXZffTe for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B0140531
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B0140531
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83F4382ADD; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:25:18 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e7a64a59a17fb37722f4663c05b04a59800c9cb4
X-Git-Newrev: 19fadb7db083752afb3b8dfee6480c4433539450
X-Patchwork-Hint: ignore
Message-Id: <20240318133246.83F4382ADD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libheif: fix
 libjpeg build
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

commit: https://git.buildroot.net/buildroot/commit/?id=19fadb7db083752afb3b8dfee6480c4433539450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

libheif raises the following build failure with libjpeg since bump to
version 1.17.5 in commit 5714126edac88e3adc043a482b262b319a907dd3 and
https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39

/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
      |                                     ^~~~~~~~~~
      |                                     |
      |                                     long unsigned int*

Fixes:
 - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bd5d1f5b6ae8d9765520728e4995897940c86b05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...plugins-encoder_jpeg.cc-fix-libjpeg-build.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
new file mode 100644
index 0000000000..5245327fe7
--- /dev/null
+++ b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
@@ -0,0 +1,47 @@
+From 33eb948240365434c845b618854403e82a229012 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 31 Jan 2024 21:04:37 +0100
+Subject: [PATCH] libheif/plugins/encoder_jpeg.cc: fix libjpeg build
+
+Fix the following libjpeg build failure raised since version 1.17.0 and
+https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39
+because third argument of jpeg_mem_dest is defined as size_t* on libjpeg
+instead of unsigned long* on jpeg-turbo:
+
+/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
+/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
+  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
+      |                                     ^~~~~~~~~~
+      |                                     |
+      |                                     long unsigned int*
+
+Fix #1008 and #1086
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/strukturag/libheif/pull/1120
+---
+ libheif/plugins/encoder_jpeg.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libheif/plugins/encoder_jpeg.cc b/libheif/plugins/encoder_jpeg.cc
+index d6c7854..21a5541 100644
+--- a/libheif/plugins/encoder_jpeg.cc
++++ b/libheif/plugins/encoder_jpeg.cc
+@@ -360,7 +360,11 @@ struct heif_error jpeg_encode_image(void* encoder_raw, const struct heif_image*
+   }
+ 
+   uint8_t* outbuffer = nullptr;
++#ifdef LIBJPEG_TURBO_VERSION
+   unsigned long outlength = 0;
++#else
++  size_t outlength = 0;
++#endif
+ 
+   jpeg_create_compress(&cinfo);
+   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
