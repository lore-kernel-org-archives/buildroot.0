Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4EFC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1F160EE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C1F160EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B20F60657;
	Sat,  7 Aug 2021 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3nYp0Zy77xn; Sat,  7 Aug 2021 19:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8685260652;
	Sat,  7 Aug 2021 19:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8DED1BF3AB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98BED60652
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29dai5pmkBOM for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 19:41:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8AB7605C8
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 19:41:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l18so15729841wrv.5
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3fmQpsTBJeauUVMVsmBt7upBGISlkNLwzc9nC7VmaI=;
 b=hE7vFFbaaN3E0OnlpDxhBo7uxg2Rt2drdImJt1Z+xMc/5kiZyaUXOQOfkUBxCqjvlH
 WpiAMMyzUNIfBbmAFoqtyR20kEowz/4RBQMt/aNQL4dQNsrIAYjirllgYCttdy/ci6Nw
 4joQd48A5yDO5bw3cHB6E0iQakkt6Tb0heIn2lHgJSJrvkh467rSHL0nB/CO3YhCxl9h
 iD+k9/CibXc6bh9sV+jK4RL5fHpEgfVxsFk4bVJcOas9p4H+MpU2Hd7aIofMaZQMxItY
 OxwJiWtEbJZuF+a4D/pJurasjmMIRJd91vwjFCVXFNlwHV6g1rAqEyABTL8wHv2Fas87
 2ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3fmQpsTBJeauUVMVsmBt7upBGISlkNLwzc9nC7VmaI=;
 b=SO1o4IX2mqIfVX+uZ850vWdMVz3lc+lQfP9jI2h2QdCpLXrAsM+gfT5q/7XmTohBkQ
 zuG1383rzQQ6kGvqjWNC48wJMV7QwOrYMr4iJbTT5Kw0GNFqTkc89zC9o2j4g7OyCtzZ
 0+focj5k+6OQ6IZS1WTlKEBq8gJUN3gchYbkscYoQBrTrjPEhQAOJydo6QAvUCWnUgwV
 eKNHdVv0ZRmOic9NPwjMrd0+LX4dmYo9FHsEz+fRMJK92Qt7F36/QZlIbwqaw2dqbDfj
 /WSqH9mlBW8TO5kzqqZAmHUFQMYcPPGna8yTwow7/halPeznqN668vaXEwn3sTizlrN8
 qlJg==
X-Gm-Message-State: AOAM530hVv7On+zGbIgv5FS00DQrYlNR7cNadkPoPs2VV5w0TRQY4JX3
 66/VWP/tizXCr9RqfrLo414iwlw+AJ/OSA==
X-Google-Smtp-Source: ABdhPJwPJCh6dkmOKp/grCKAvzJWdONo9cJcgN+zWre6tSbDzBT2lQg0SXJ30qDe5Y+p9O9toAOV3Q==
X-Received: by 2002:adf:f110:: with SMTP id r16mr16861785wro.358.1628365260573; 
 Sat, 07 Aug 2021 12:41:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o12sm9522975wrm.84.2021.08.07.12.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 12:41:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 21:40:31 +0200
Message-Id: <20210807194031.1501659-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/ffmpeg: add -latomic to pkg-config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

-latomic was added to extralibs to fix static build of ffmpeg in commit
fc8798197b57488a852e2c14b4677b5eb0114a0b. However, extralibs is not
added to libavformat.pc resulting in the following static build failure
of motion:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavformat.a(fifo.o): in function `fifo_init':
/home/buildroot/autobuild/instance-1/output-1/build/ffmpeg-4.4/libavformat/fifo.c:519: undefined reference to `__atomic_store_8'

So add a patch to add extralibs (and so -latomic) to all pkg-config
files

Fixes:
 - http://autobuild.buildroot.org/results/62ec618e40081a250b8129ec6f5a178eb06fba1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Add extralibs to all pkg-config files and not only libavformat.pc

 ...igure-add-extralibs-to-extralibs_xxx.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch

diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
new file mode 100644
index 0000000000..dbc19c1cec
--- /dev/null
+++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
@@ -0,0 +1,47 @@
+From 0c288853630b7b4e004774c39945d4a804afcfa8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 09:17:20 +0200
+Subject: [PATCH] configure: add extralibs to extralibs_xxx
+
+Add extralibs to extralibs_xxx (e.g. extralibs_avformat) to allow
+applications such as motion to retrieve ffmpeg dependencies such as
+-latomic through pkg-config
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable]
+---
+ configure | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/configure b/configure
+index 0bb3a7cf2b..3bda99e415 100755
+--- a/configure
++++ b/configure
+@@ -7602,15 +7602,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
+ source_path=${source_path}
+ LIBPREF=${LIBPREF}
+ LIBSUF=${LIBSUF}
+-extralibs_avutil="$avutil_extralibs"
+-extralibs_avcodec="$avcodec_extralibs"
+-extralibs_avformat="$avformat_extralibs"
+-extralibs_avdevice="$avdevice_extralibs"
+-extralibs_avfilter="$avfilter_extralibs"
+-extralibs_avresample="$avresample_extralibs"
+-extralibs_postproc="$postproc_extralibs"
+-extralibs_swscale="$swscale_extralibs"
+-extralibs_swresample="$swresample_extralibs"
++extralibs_avutil="$avutil_extralibs $extralibs"
++extralibs_avcodec="$avcodec_extralibs $extralibs"
++extralibs_avformat="$avformat_extralibs $extralibs"
++extralibs_avdevice="$avdevice_extralibs $extralibs"
++extralibs_avfilter="$avfilter_extralibs $extralibs"
++extralibs_avresample="$avresample_extralibs $extralibs"
++extralibs_postproc="$postproc_extralibs $extralibs"
++extralibs_swscale="$swscale_extralibs $extralibs"
++extralibs_swresample="$swresample_extralibs $extralibs"
+ EOF
+ 
+ for lib in $LIBRARY_LIST; do
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
