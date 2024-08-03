Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6972FC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32911404C6;
	Sat,  3 Aug 2024 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1EnLsuGkVaZ; Sat,  3 Aug 2024 10:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D036E40528
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D036E40528;
	Sat,  3 Aug 2024 10:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 201711BF8C7
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EC1E80F21
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQSismxYIDrd for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFEC680F1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEC680F1D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFEC680F1D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:50:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 592AFA4C013B
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:47:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33320)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCI9-000000003Ss-4Abp
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:47:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:47:17 +0200
Message-Id: <20240803104717.2574277-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682038;
 bh=g1cmGRUNLxrJV3/qazVXL0covpi4C80ED+f64V8sQB0=;
 h=From:To:Subject:Date:From;
 b=mD+PiCAUMg+IG8e51rzlkikBOZ6y/ayA+v3zcm4sLVO9ZRhMb68Ou42GHdZe2bfNU
 JojHLPUUGAVTXVdqCIjwb0DfagOcxWK2FmED3fySGPS8ErJQxGL+TXG/yNzZmPRF0L
 1moNFfPe3TjfZ7hcHtcMG6eEQl1UnzxRBRj/7LRRVkFvKzl2eZH0r2Cbfx2ncKrPSE
 OIMuTD/jF7WaNy6BwxFXa7ZrBna75+jMQuJbhj0RqiYlw+KCPeofY7B1LrokoQMlmE
 rxaP48j5X/z8cUoNNywlwu8Eo9hMoVlElXURnM9RFpLwvDkQxxfXSOD1B824oNzCWn
 HKEnqxchd5xvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=mD+PiCAU
Subject: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.18.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release:
https://github.com/strukturag/libheif/commit/4944d7d47cc537681d6836e8c77db179f63af005

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ns-encoder_jpeg.cc-fix-libjpeg-build.patch | 47 -------------------
 package/libheif/libheif.hash                  |  2 +-
 package/libheif/libheif.mk                    |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch

diff --git a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
deleted file mode 100644
index 5245327fe7..0000000000
--- a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 33eb948240365434c845b618854403e82a229012 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 31 Jan 2024 21:04:37 +0100
-Subject: [PATCH] libheif/plugins/encoder_jpeg.cc: fix libjpeg build
-
-Fix the following libjpeg build failure raised since version 1.17.0 and
-https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39
-because third argument of jpeg_mem_dest is defined as size_t* on libjpeg
-instead of unsigned long* on jpeg-turbo:
-
-/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
-/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
-  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
-      |                                     ^~~~~~~~~~
-      |                                     |
-      |                                     long unsigned int*
-
-Fix #1008 and #1086
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/strukturag/libheif/pull/1120
----
- libheif/plugins/encoder_jpeg.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libheif/plugins/encoder_jpeg.cc b/libheif/plugins/encoder_jpeg.cc
-index d6c7854..21a5541 100644
---- a/libheif/plugins/encoder_jpeg.cc
-+++ b/libheif/plugins/encoder_jpeg.cc
-@@ -360,7 +360,11 @@ struct heif_error jpeg_encode_image(void* encoder_raw, const struct heif_image*
-   }
- 
-   uint8_t* outbuffer = nullptr;
-+#ifdef LIBJPEG_TURBO_VERSION
-   unsigned long outlength = 0;
-+#else
-+  size_t outlength = 0;
-+#endif
- 
-   jpeg_create_compress(&cinfo);
-   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
--- 
-2.43.0
-
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index a2ca065b7a..ed1a083d7c 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8390baf4913eda0a183e132cec62b875fb2ef507ced5ddddc98dfd2f17780aee  libheif-1.17.6.tar.gz
+sha256  8702564b0f288707ea72b260b3bf4ba9bf7abfa7dac01353def3a86acd6bbb76  libheif-1.18.1.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 908e2ce068..e2c3a328bc 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.17.6
+LIBHEIF_VERSION = 1.18.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
