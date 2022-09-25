Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B0CC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 15:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA4441703;
	Sun, 25 Sep 2022 15:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA4441703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vs3PCMhjk8a4; Sun, 25 Sep 2022 15:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27710416F9;
	Sun, 25 Sep 2022 15:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27710416F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47DD51BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE3A82AEF
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 15:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE3A82AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwLdt2auGbzk for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 15:25:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFAA82AED
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBFAA82AED
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 15:25:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t7so6760454wrm.10
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NNQMzvvZ/knczurkn6yVxcR/agN6yi4EQ5TeSm3RqLA=;
 b=Tx2M6TXwpCDCK3OLv6hhb3i+THnIoozPAMGcGgKr9vJhqj/N4aUnKK3JB/reRzu4wI
 6P6FPNwy1a5AePcJ+24kb5/2R2S/F3cQaj/meN65UP6vjbug04uwdHnO9yaTonBazigE
 gcem4Gdlhk3vlRHK7BvV+na0epL6Q2tpxYk67YCyvucGO9JQPN7oKPoLJKmlVLcPyUIq
 7gQfSG4CWB7IT3B1tLKYBaECSJOBo+yq2LwKV+eEoDyP1DJz5UlKCv/I1y58b1IO5NgH
 AUJqewXAd2KDtlSaY2TVKlrYev7/obvMURh8k3xnZMzgqqWig1TGbg58zei8KWt0+Mk9
 +Y3w==
X-Gm-Message-State: ACrzQf25POGgcm+IYBWvO7nBKQra+4Q4YTQn9RyD+AS7nee8j8L0yAFU
 fJtsc08NG+d+xCFuWAS0ZxL0LKBfGEg=
X-Google-Smtp-Source: AMsMyM4+6sLbATSLj3LPkXOwLJhV0MCKUruJJ3bqrIgb761lOz5vqD4YcfQdTy9k6+2/KGnKhXsxYA==
X-Received: by 2002:a5d:5687:0:b0:22a:89ca:404b with SMTP id
 f7-20020a5d5687000000b0022a89ca404bmr11337487wrv.53.1664119500488; 
 Sun, 25 Sep 2022 08:25:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003b47575d304sm9793737wmj.32.2022.09.25.08.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 08:25:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 17:24:52 +0200
Message-Id: <20220925152452.353907-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NNQMzvvZ/knczurkn6yVxcR/agN6yi4EQ5TeSm3RqLA=;
 b=lzELJyEJthyyzPYVI9YE9MDopOLl0jLL7F2UKNRJi5nrCkCZvPFEGj7TGDmRQCZiCD
 mGkyzNB75LgI+H7HNZlvWlM6TjnsgfpqzjWt8wpV6P0KgyEZVn1ySihDzEdbuIzr9L28
 UgJAcG446Ftv5ORti75XXhJwSIKw9xfXO3FHgpd+UvJXO573CPB3mvMutA1myeHBdELY
 xJwzs7umu2LhT3rQCNZ8TtyDVXlP/iK6Jg6KcqnjRObMpKpGfY7X03GFzryebzH1VFLE
 jMNUcIAjpj+lxyKd1ozwHScquQ6rYPsmXIMqK6C2Lbqi4gPnER+RLac666M1BQBMJH5p
 pvVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lzELJyEJ
Subject: [Buildroot] [PATCH 1/1] package/vdr: fix build with gcc >= 11 and
 uclibc < 1.0.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop static from first patch to fix the following build failure with
gcc >= 11 and uclibc < 1.0.0 (prior to
https://github.com/wbx-github/uclibc-ng/commit/5c484467f718a25e94a88b11bdbb670ddb1c0d0f):

skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]
 1105 | static int getloadavg (double loadavg[], int nelem)
      |            ^~~~~~~~~~
In file included from /home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/include/c++/11.3.0/cstdlib:75,
                 from /home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/include/c++/11.3.0/stdlib.h:36,
                 from config.h:15,
                 from channels.h:13,
                 from skins.h:13,
                 from skinlcars.h:13,
                 from skinlcars.c:26:
/home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdlib.h:920:12: note: previous declaration of 'int getloadavg(double*, int)'
  920 | extern int getloadavg (double __loadavg[], int __nelem)
      |            ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2d9fe8548ccbbcad3f86051509bf811fedb1d8e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr/0001-getloadavg.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
index 9e6316e284..fbb02d4dd1 100644
--- a/package/vdr/0001-getloadavg.patch
+++ b/package/vdr/0001-getloadavg.patch
@@ -4,6 +4,8 @@ Ported from
 https://github.com/stschake/buildroot-grasshopper/blob/master/package/torsmo/torsmo-0.18-uclibc-getloadavg.patch
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+{Fabrice: drop static to fix build with gcc >= 11 and uclibc < 1.0.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
 --- vdr-2.3.1.org/skinlcars.c	2015-09-01 12:07:07.000000000 +0200
@@ -14,7 +16,7 @@ diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
  
 +/* uclibc and dietlibc do not have this junk -ReneR */
 +#if defined (__UCLIBC__) || defined (__dietlibc__)
-+static int getloadavg (double loadavg[], int nelem)
++int getloadavg (double loadavg[], int nelem)
 +{
 +  int fd;
 +
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
