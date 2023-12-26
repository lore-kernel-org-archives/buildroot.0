Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489EEC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D8160E62;
	Tue, 26 Dec 2023 16:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D8160E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61XFdRiP-spu; Tue, 26 Dec 2023 16:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2058860DFE;
	Tue, 26 Dec 2023 16:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2058860DFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 502791BF3E1
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 353D640912
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353D640912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4lEpfUvv0Ul for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:42:53 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE8540182
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCE8540182
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5903677fso10217435e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703608970; x=1704213770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=boUnPs7olarcC6NVtBUl4CciVi9rGCl5MXGZruMl0Og=;
 b=ZNB93XH4ibIxyFRCWe2XoPfGFKcLM7ICSr+ldfq1FiwwPm+8kZuNPc3hvGK4SMZAj0
 07mASdWUqKO/zNm8RBeejjasDutOqdSpx56rSLY5ol7Jrw9wU4hoIlZ5p4Kcc24BWujj
 X2kvlkWyeGpS7NkP63RrWt6KdsYNhq4AK3L5UJNWYG2o/sQe236CKXCGKq9qbBZ6cPFn
 twPvTUhTbuzrrIYIN8K3o2bUjslTiTuYCKQTDuxiY6CSkqN/pdIBWeolc5UmgVlU/AmM
 PW7Xxsx0iYUzhLYAKhKQ7Jeu02G9KVVyB7AOdAnz/Rk8RqlSAr+9scu5jN02sKrenSE6
 a68g==
X-Gm-Message-State: AOJu0YyDdsjWmh42zeHd+yeSoyhs6Jw2+ewLeRR1JHoAfnYybPnRIdFA
 36PrEAzVj4G+5hE/J0ygdSEnQKC8Atc=
X-Google-Smtp-Source: AGHT+IGWpeab51tm9fFT4mpb87Av/v+vvEwPu8hwGDw+58YehwU2rl/vYXlQsH/N8k/VaBNG8W/LhQ==
X-Received: by 2002:a05:600c:1d19:b0:40d:5bbf:71f2 with SMTP id
 l25-20020a05600c1d1900b0040d5bbf71f2mr353672wms.5.1703608970330; 
 Tue, 26 Dec 2023 08:42:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b0040d55e8e357sm8017592wmo.45.2023.12.26.08.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:42:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:42:47 +0100
Message-ID: <20231226164247.786588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703608970; x=1704213770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=boUnPs7olarcC6NVtBUl4CciVi9rGCl5MXGZruMl0Og=;
 b=dZsw0uOBws60e0Gp8OwXjmgoWGHmr2qxxnJJHYx83rg5kn8dwB3jKTUMDdSC0VACfi
 G5Hx0gfE/A2ukyQJfZ9w/P1wbs+FCsMEDyy3boq5jxAUBchJorJTKxHBicSUTPIfR00R
 Je7M/9WZQ4n8/M4bGp1a2+7KGJA7qLWhyIHj84jF2cRGYjJW/0VvvfKV61kwPC1CcN/+
 gZZmphXimyczmT/6PyFaBWYTNGgSBLLJmGWJdipNaOZ6tdl+5hk/sdjfQHgl33KHKS3t
 Dzv3Sqart8+PpJUVH6RzkXnrjsoYz7P/3leSoFi8kEatYV/yaj8JFPDYmxZ2XXyUEHlP
 hFbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dZsw0uOB
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.16
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License file has been renamed and year updated with:
https://github.com/mm2/Little-CMS/commit/120410b92498478405ec571dc304d9c192e50a98
https://github.com/mm2/Little-CMS/commit/6bf0713c1c1155c3299bdee3b896f005170a4226

https://github.com/mm2/Little-CMS/releases/tag/lcms2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 45728a36f1..362412e3c4 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.15
-sha1  b143ff29b03676119dbca30f13cbed72af15cce8  lcms2-2.15.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.16
+sha1  751d32ba11809e3591c118be9aae8ac2dbd41cb7  lcms2-2.16.tar.gz
 # Locally computed:
-sha256  b20cbcbd0f503433be2a4e81462106fa61050a35074dc24a4e356792d971ab39  lcms2-2.15.tar.gz
-sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
+sha256  d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51  lcms2-2.16.tar.gz
+sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 3892dbfbdc..92aeff8890 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.15
+LCMS2_VERSION = 2.16
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
-LCMS2_LICENSE_FILES = COPYING
+LCMS2_LICENSE_FILES = LICENSE
 LCMS2_CPE_ID_VENDOR = littlecms
 LCMS2_CPE_ID_PRODUCT = little_cms
 LCMS2_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
