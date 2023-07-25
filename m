Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B5C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F2060E4D;
	Tue, 25 Jul 2023 10:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29F2060E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUbHMoHyos1G; Tue, 25 Jul 2023 10:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A9660E25;
	Tue, 25 Jul 2023 10:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A9660E25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACADB1BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 854C881CBA
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 854C881CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZnlBkm2LAVw for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:31:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87F8E81CAF
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F8E81CAF
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso52651735e9.2
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281065; x=1690885865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocVpKxZlW2bqlOZ8vs8N3d5UH+SUPJgLpmQj4DbmLRA=;
 b=QfwaGvSb8RY1YBu8R/P1UYmLRJ1MfLG4hKd3sc9G3NTlsThhUPnrNizexvjoyAdWH4
 dCRIM0Jjx5XTjS+123fIFQXnX/Sf+mf2ipHrUeEFkSz0JlR0SCpRnLPx1kRJYvfjgpFg
 m375hMbn9453qL4erLZIEyQcJp3cP+C0c7YAuJdih9Tg9ILdZPYKfSi3Y4VxEd2M22g6
 UVQ7ZEh/WWMUGLYD2TQsPYKCewiTzmbiSrH5OzAAHzFnkQ7tfraxDaR/0t0Cvhq5cbCy
 AyABvR542WfaRAXI8yd8E7E9B+PodjGwl0W4euib+IeAwMJElXo5TdfrSxdwj3mWvbTC
 CxWw==
X-Gm-Message-State: ABy/qLZ0ZbEzUGxVvSJ5unUeDq1G8brv4Oee5TDrw2PySOo+qvyQcYWm
 +S2HHPj7DTYgTM/TSF9ey8aa9gbgjMI=
X-Google-Smtp-Source: APBJJlF9POox9tzU3OS0pXprJ8eXfXXoyBgEcj94WwFmFeQ4+K+sULkzsI4LS1C1JO7yo/sl4Kor2Q==
X-Received: by 2002:a5d:484c:0:b0:317:6ea5:ab71 with SMTP id
 n12-20020a5d484c000000b003176ea5ab71mr666876wrs.30.1690281065423; 
 Tue, 25 Jul 2023 03:31:05 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfe90c000000b0031758e7ba6dsm8137039wrm.40.2023.07.25.03.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:31:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:30:53 +0200
Message-Id: <20230725103053.941474-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281065; x=1690885865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ocVpKxZlW2bqlOZ8vs8N3d5UH+SUPJgLpmQj4DbmLRA=;
 b=LrJoLhD+pakt8eZ39LovKq2dzwoZDIARbqLZLK788uxUdb3vGeoLBwHp8HEBYirTat
 FrV+zbiJRqyDTMH7/LLh8IQm6ablIUQebg2h2ZizRo7WvyBBIZUQqjqwWLen/aalaXto
 ybGlq2cvj5yPF6bHiVJKp8gAMGnYqSUlAJg1CG43dt7KESLCb7yU/3GqU97keoNY7pVw
 fXYbKfD5Lwi1qMazCYf+OEAWfdD5ikvMyjPc9CNgxzaPen74TbTpkhy7uFcOKMd0Xi2I
 8oGcghLgLOBvbdIhZx4gfN7Xoenc345dSSvbXMlSSkcRk+ru2dtUNJFkMyCnEJHye3JR
 aTZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LrJoLhD+
Subject: [Buildroot] [PATCH] package/jpeg-turbo: bump to version 2.1.5
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

diff LICENSE.md
-Copyright (C)2009-2022 D. R. Commander.  All Rights Reserved.<br>
+Copyright (C)2009-2023 D. R. Commander.  All Rights Reserved.<br>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 6e1278b48..a929ae4dc 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.4/
-sha1  5a355c08caa326cef7c2a61e062edfe8dd02ac07  libjpeg-turbo-2.1.4.tar.gz
-md5  3241b54016c445e5d8f0ebb0ad9294ed  libjpeg-turbo-2.1.4.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.5/
+sha1  edab071e7c5bc12f98a2a7ae499bd6b312770849  libjpeg-turbo-2.1.5.tar.gz
+md5  1c6e9f8550a82c6d4cd30b370c22a5fd  libjpeg-turbo-2.1.5.tar.gz
 # Locally computed
-sha256  d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b  libjpeg-turbo-2.1.4.tar.gz
-sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
+sha256  bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf  libjpeg-turbo-2.1.5.tar.gz
+sha256  60c756742db3ad1913304e8b13f0e86e22e51adb50cc0b3333c163f7e45ceec1  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index e5bc8e7cf..5e806156e 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.4
+JPEG_TURBO_VERSION = 2.1.5
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
