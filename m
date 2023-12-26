Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94957C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 18:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0934D40529;
	Tue, 26 Dec 2023 18:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0934D40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6frnmLyWXyt; Tue, 26 Dec 2023 18:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C39EC40979;
	Tue, 26 Dec 2023 18:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39EC40979
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5975B1BF3EE
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 18:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F45780FAD
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 18:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F45780FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nL_8w2qQupBw for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 18:23:47 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19C9380F76
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 18:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C9380F76
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so44408635e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 10:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703615024; x=1704219824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYblDBy3qa40VB3wcQvIvgfu53rQ+bi3UnldD8CewuA=;
 b=oVyzDYOU1ibw2Rif/9pwkmtTti9VzQl9hr8hc6MRY+F2FHeiU15ovJqm2v7Bg/9nXk
 6Q1DsfPVDspWnuTastVR2Ha+Pqax8RtewTA8godh8ETse0mJBZ1xEc6R07TGYDoO8zGW
 YYkVIkBJ9IR2EQ2bAbbweFLsCELEdWlTcyB3Qsm1LsMMLumfyS/nOqO5Nd1YSJfLBNbZ
 8SBTcZxlnuznCUL7onTPAaoHaslj42YEzUM7/E/wx5UGuYyR6Gt9/g5RnZRgTapsSOmZ
 glnjAx69Ir5kt1NGmqNKo99GbVovA2SUvNnC/O95rcqUNenIo6AwikCEGICBXn58iqDH
 AiLQ==
X-Gm-Message-State: AOJu0YxMA/f9znEPKjCUlNy3dTdyNLb2sGbjWrxSMyG0QIB2H+pp6pFu
 JJEQzpiltdv1sGxhwNtJKbSN1GNeLyc=
X-Google-Smtp-Source: AGHT+IF0mj+O4ABYSEmrcdUQtOYGK1X8+MVBaxDdubdliST8Jc7CP7XafjZchCnfjTWC5GVFF2NUCw==
X-Received: by 2002:a05:600c:3b03:b0:409:79df:7f9c with SMTP id
 m3-20020a05600c3b0300b0040979df7f9cmr5605696wms.36.1703615023956; 
 Tue, 26 Dec 2023 10:23:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b00336c9ad1173sm3923830wrz.26.2023.12.26.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 10:23:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 19:23:38 +0100
Message-ID: <20231226182338.1040930-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703615024; x=1704219824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eYblDBy3qa40VB3wcQvIvgfu53rQ+bi3UnldD8CewuA=;
 b=mCA56f6miIixoxrCus4pglDTakzVuyGrQDJTEF0Bj9dNG4g2ZjW/JvlS5pCoWT5dBF
 ZJPLowuwYkAR+kvNa79aHEhMwa+OpWMjGJekKa28V4yZ/GdkAg8BbzVFPhvNjUE+Gsbx
 x8eKMK+LEGKYAT3kwyPj9AvpVspybEL2pn08lc/Z1yu+FoqfMT845nzKC4Mt/2d3qMDp
 wNra6o8nnsP/90PKqxdR2xikYTvlnEVPnelDP62K1n+9MV8dWaV/iOo9ZYcDUX6VCJJ7
 b76emGK75nARk3GcVBP7vxCg8MtlDEhz9iBDWUNboZZxhSnZNeLx/usLf0YigbRbw25j
 zQwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mCA56f6m
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: bump to version 5.4.10
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch (already in version)

http://www.gnuplot.info/ReleaseNotes_5_4_10.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-unbreak-HAVE_DEFLATE_ENCODER-builds.patch | 51 -------------------
 package/gnuplot/gnuplot.hash                  |  8 +--
 package/gnuplot/gnuplot.mk                    |  2 +-
 3 files changed, 5 insertions(+), 56 deletions(-)
 delete mode 100644 package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch

diff --git a/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch b/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
deleted file mode 100644
index c3edb39cc6..0000000000
--- a/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 84002a5bd7f4cb10e9beffab88ae55b4e982bcea Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 1 Oct 2023 10:20:31 +0200
-Subject: [PATCH] term/post.trm: unbreak !HAVE_DEFLATE_ENCODER builds
-
-Commit 2f2cf617808 (post: handle RGBA images (only current use is to render
-a pixmap)) added an extra '}' outside the HAVE_DEFLATE_ENCODER (gd support)
-conditional, leading to build breakage:
-
-In file included from term.h:298,
-                 from term.c:1211:
-../term/post.trm:4016:11: error: expected declaration specifiers or '...' before string constant
- 4016 |     fputs("%%%%BeginImage\n", gppsfile);
-
-http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433/build-end.log
-
-Fix it by dropping the extra { } added by the above commit.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/merge-requests/28/
----
- term/post.trm | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/term/post.trm b/term/post.trm
-index 186eb9d3c..100811b86 100644
---- a/term/post.trm
-+++ b/term/post.trm
-@@ -4000,17 +4000,16 @@ PS_image (unsigned int M, unsigned int N, coordval *image, gpiPoint *corner, t_i
- 	cscale = 1.0;
- 
- #ifdef HAVE_DEFLATE_ENCODER
--    if (ps_params->level3) {
-+    if (ps_params->level3)
- 	encoded_image = (void *)PS_encode_png_image(M, N, image, color_mode,
- 					    bits_per_component, max_colors, cscale,
- 					    &num_encoded_bytes);
--    } else {
-+    else
- #endif
- 	encoded_image = PS_encode_image(M, N, image, color_mode,
- 					bits_per_component, max_colors, cscale,
- 					(ps_params->level1 ? PS_ASCII_HEX : PS_ASCII85),
- 					&num_encoded_bytes);
--    }
- 
- 
-     fputs("%%%%BeginImage\n", gppsfile);
--- 
-2.30.2
-
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 6ed24b6d3c..39dacd50a4 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.9/
-md5  345533e461e41c263b3293f46651f0b2  gnuplot-5.4.9.tar.gz
-sha1  1a3953660656a38178ae2b368efa895af55a5001  gnuplot-5.4.9.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.10/
+md5  334851e63450362bdb95e67fa8a23665  gnuplot-5.4.10.tar.gz
+sha1  9981e5b0111c07d376deef571ccc75ce4b4ebbd2  gnuplot-5.4.10.tar.gz
 # Locally computed
-sha256  a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97  gnuplot-5.4.9.tar.gz
+sha256  975d8c1cc2c41c7cedc4e323aff035d977feb9a97f0296dd2a8a66d197a5b27c  gnuplot-5.4.10.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index b98da4267a..825863d080 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.9
+GNUPLOT_VERSION = 5.4.10
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
