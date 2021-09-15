Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF64C433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 06:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A1861209
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 06:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A1861209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859A0401CB;
	Wed, 15 Sep 2021 06:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJuRFpdHPeF9; Wed, 15 Sep 2021 06:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11A3401A1;
	Wed, 15 Sep 2021 06:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47A081BF295
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 06:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30A07404F3
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 06:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phPg0j5gMLcI for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 06:03:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0278A40170
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 06:03:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso1116145wmd.5
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BehRG4WgwZIZ7PeTuJGtAhoYl4ZXvyNjxPyRQwcoHKs=;
 b=MMFcduKcVwyg5/II7tXU3ZvLHZ9jH+AapMZRYUdpxoiJf9uRO8BDJ8cvJg3iAf8qAh
 uMnAfD3slqLijmyiVdUawRTZgvER2LeWyIeEqbc7Vzj3u0l6UKvJUwC7Z59DwTwjEHTN
 2X4++pHlyyv4k172HOUOilOTl/B/Yrms0t3jIZQrpYEIoTWuuzc6rnMYaZhKtXDOGs8q
 QIEohKliL1LJpvpPO9RO6XX3iOlSK5+7xRPAu7WFAn3/dPK4fDns39EJ8c25a+44ZiWi
 7POoBHIVKUmll5P9u+P0hjySt8bD2Fq/2sRHvog+FWJRyz4qdZvvU1t3NQ0hKD4Pcooi
 3aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BehRG4WgwZIZ7PeTuJGtAhoYl4ZXvyNjxPyRQwcoHKs=;
 b=4YrAZ49K8zypt2OGb+PgjOdLo3Ft6AtjxRGj2W8CrlwvzprwXGk5ysWLG0emXe84Tl
 U4J6S07hm1pYXWVV+DfXQkRpITKtaK6lB4HWK/viTF1+ZsU05wwQjrVl+b6wqhoJRvEP
 EDZOhuWN0V6/N0Aq+2DXbITu6PDUShygErUt6k0SWwSE+5oWiT6VVlTjHpDh2OsPIpO4
 3BOmDfLhfEGLMCv3HX3iA27xSQSE/C0dMKreAcZgU81D2FpMAINLkw9PcAxd9xw4ykw8
 Hxtn0mBJOhg4gf4JcWsJE/8qcmGSo1+g+UtqyjN+4CDlyowLnaNWOfKgLMs7djIcK50i
 /6cA==
X-Gm-Message-State: AOAM533X8XPVtDclZ+koURO/KMrMpA98IwRpCAR1DlEs0rYtYQevt1Rw
 4RF3xO4vYRm127KhL6BOKTzDnD10CLw=
X-Google-Smtp-Source: ABdhPJzKMeCH7Xi/MP2VIux7JlibAySPzSl4ZWUeSGeB3VeYw++OtN6FIeZdyYqsybMUAGGNSTrSfQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr2602073wmr.89.1631685807862;
 Tue, 14 Sep 2021 23:03:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j17sm12322110wrh.67.2021.09.14.23.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 23:03:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 08:03:18 +0200
Message-Id: <20210915060318.599840-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libexif: fix build with gcc 4.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 0.6.23 in commit e2f805097611b4828d2cba6168472aac6dedeafe:

exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
   ^
exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xif-gps-ifd.c-fix-build-with-gcc-4.8.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch

diff --git a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..7bbf3b3e4d
--- /dev/null
+++ b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,40 @@
+From 0c925491dea995ca96770159158bb8d57a48d84b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Sep 2021 07:56:32 +0200
+Subject: [PATCH] libexif/exif-gps-ifd.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 raised since version 0.6.23 and
+https://github.com/libexif/libexif/commit/e12c3529813cd16d50bf0a1c759093e1039dffec:
+
+exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
+exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
+   ^
+exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libexif/libexif/pull/72]
+---
+ libexif/exif-gps-ifd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libexif/exif-gps-ifd.c b/libexif/exif-gps-ifd.c
+index 9c9ba70..de5f950 100644
+--- a/libexif/exif-gps-ifd.c
++++ b/libexif/exif-gps-ifd.c
+@@ -59,7 +59,8 @@ const static struct ExifGPSIfdTagInfo exif_gps_ifd_tags[] = {
+ };
+ 
+ const ExifGPSIfdTagInfo *exif_get_gps_tag_info(ExifTag tag) {
+-  for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
++  int i;
++  for (i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
+     if (tag==exif_gps_ifd_tags[i].tag)
+       return &exif_gps_ifd_tags[i];
+   }
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
