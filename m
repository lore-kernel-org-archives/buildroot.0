Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29F6C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 22:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCB764037E;
	Sat, 10 Sep 2022 22:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB764037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzWmP_a2U5Dy; Sat, 10 Sep 2022 22:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E08694012D;
	Sat, 10 Sep 2022 22:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E08694012D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38C4C1BF83B
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 22:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1398181402
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 22:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1398181402
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXN4AZt3Z7XQ for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 22:33:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A86C812B8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A86C812B8
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 22:33:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c11so9252246wrp.11
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 15:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8ALl1vBMxqolF+QqC1a+FtRtZ405kqsu9lbl8GZBHKs=;
 b=vNlb8nkEZg/Ns3XLIEF1p1MAg/Pr1oBPq2YI38cGiTp9f9i3CUGge8rWSz4dzWH6Rh
 gdJW0OU+VsxFVYMS3qiy9ffvj/RxJ2NyL+5g1gSfP9Ww6yFganJYlyT6uU3BU3UfGOdg
 dDUUEbXUywZYIWOA5Z1zx78dnF03Jr52ONEMrphwm8OYKQbOFk+txSwJlWYIkzh1jDmI
 ZVhoKnApmik75Hzi4qgacT8FTZ7fKu/T9RM0XLylcPjs16gIRK6eg4k8W/EwhJYb1ggB
 hBCvSr6S4NKhJow9lWhp8URM14cuMzim62k8yB3u0WOjES2ifRD/ywQZ/UN0V3NDpZ7Z
 bAJw==
X-Gm-Message-State: ACgBeo3KkY/JQrgAYMGsJ5qTNmw9n49EhsfaZ7F0qijGzfqhl/JflnwZ
 d4EYrmEmG45HnKaPVCWImzgkLPcRfjU=
X-Google-Smtp-Source: AA6agR5oicxzISfdryaBz02jpyjB7EWeKXepdXgEU5uoVhnhz9boUf5RFkWvLjKUQfSHpm0y7SyH7w==
X-Received: by 2002:a05:6000:1d9d:b0:22a:745b:9f00 with SMTP id
 bk29-20020a0560001d9d00b0022a745b9f00mr46277wrb.280.1662849205262; 
 Sat, 10 Sep 2022 15:33:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5610000000b0021e43b4edf0sm3675302wrv.20.2022.09.10.15.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 15:33:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 00:32:34 +0200
Message-Id: <20220910223234.37792-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8ALl1vBMxqolF+QqC1a+FtRtZ405kqsu9lbl8GZBHKs=;
 b=AwA0dJ/JuWGlyxeWkW1HGh+9vQTtwa+WgPKihOdGIrrUAkgvmYqodMDL3wTvx366UH
 r8RoOL/K2EyoZR2HVRaDJLk/HYyBxh4aDi1omTfF/3jx6CPm52jiUinUPv7guSvtRdLO
 3/VlfrLl4WIZ6eXoop7Mw2PRow5KiotLAagLXVIoNvK4cNYV47y5g2B9TU8U9wiKQBfa
 2UIgugI1Scrco7w+cXwdQ+EA9ud/4BASQdcM8BaWlxN7YlJ5ToicKZS1cgX+ZTr0SooZ
 lb+B04tL8LuNIDLdq8strl1iH/PQwAjAJWeYSncCCvNUUErlXAEAReI6373sm88II8B0
 NkHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AwA0dJ/J
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version 2.1.4
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index a892fd3eaa..6e1278b48a 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.3/
-sha1  6dec48193bb27e1c07abae8230031ce9ecb1cfec  libjpeg-turbo-2.1.3.tar.gz
-md5  85244dedeaf06f636a9e7ddea6d236d8  libjpeg-turbo-2.1.3.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.4/
+sha1  5a355c08caa326cef7c2a61e062edfe8dd02ac07  libjpeg-turbo-2.1.4.tar.gz
+md5  3241b54016c445e5d8f0ebb0ad9294ed  libjpeg-turbo-2.1.4.tar.gz
 # Locally computed
-sha256  467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0  libjpeg-turbo-2.1.3.tar.gz
+sha256  d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b  libjpeg-turbo-2.1.4.tar.gz
 sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 475eb5fa84..e5bc8e7cf2 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.3
+JPEG_TURBO_VERSION = 2.1.4
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
