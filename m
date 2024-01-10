Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C0CC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C715183DA7;
	Wed, 10 Jan 2024 22:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C715183DA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGb6oG5kjh8S; Wed, 10 Jan 2024 22:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B2F83DB0;
	Wed, 10 Jan 2024 22:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B2F83DB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71AA41BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC5B61577
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC5B61577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFZPRYulSpMU for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:16:25 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 107B6614BD
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107B6614BD
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e586a62f7so11623765e9.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704924982; x=1705529782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LFRSOR+MvWQBr8CUtmJrtNBJFvqX1quzMr8D9bK+pQ=;
 b=SscTx36KJzutxT+E/yoX4pYvyNQ0EqZsGn0TudorABQUMRDLTvUopzAU2s8G1jktLL
 P5Y4zC+NWgQh3gqIGIM1Eolof8bh43tAiVeMcmzBR9JTH0hLogsx0Q1TFbwyioORF6a7
 YddQ+0wLq/VhuQVAjHtnjJx95PSkxCiSEZITkNLk17tSoMXSo0pV/1/TRhFH/yYnFrhn
 1MJeo/BHQ6ZE1PSJmOmvvAlF3KmdT7vnu4wauDy3dj9B3wCJ9qn09tkq4gDV+w2tf27y
 Tl3kYUJrYnh8sXOzRPGJTzlLuKjFuPZ2w4ohn/kFTpLpthcCihZ2iwe6sF37IFDyZfiW
 3s9g==
X-Gm-Message-State: AOJu0Yy6l+1qi3oIi/GBCsg3Ml/R4G37U6oZ1ST75yMgKmGAYp4OK82P
 Xp+XUsiWlOENrQsnEKDJHYUm1k4P9TY=
X-Google-Smtp-Source: AGHT+IG753+wOxtHee5lPCB0osjE/uE1NvEyDYkZVEcjQOBR6A78EanmPT3tqhnXYPDw6InGzl/MnQ==
X-Received: by 2002:a05:600c:a2a2:b0:40e:51c2:42ec with SMTP id
 hu34-20020a05600ca2a200b0040e51c242ecmr52854wmb.157.1704924982229; 
 Wed, 10 Jan 2024 14:16:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c314400b0040d2d33312csm3522076wmo.2.2024.01.10.14.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 14:16:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:16:20 +0100
Message-ID: <20240110221620.1318012-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704924982; x=1705529782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5LFRSOR+MvWQBr8CUtmJrtNBJFvqX1quzMr8D9bK+pQ=;
 b=dsC68jJ+soNRS55aMg9MBK2/TM7vOmGYpGPHP1Y5Qd1hEPNgNUg/6vuI3zZTdIC5tJ
 ZU+Wz43LANoLUvHTUpbnSqxhEBRA8Jzk7ekVGE2wdd731N+b/EVFxq0Kk7ezcwMF+XGq
 RVEnrf9PyBCPWqkvRrE+X4DoR+f9t98wNGW8qe3gxxKrDhEcGMTXtQZDbAX3TFrLTF6q
 snKSQhDBi4/P8U4jzIJDYyRGV9amsVEMVNpZV2gLWVbAZTXNy+iwKaWfkH+dPrjx4qjJ
 xv+2G8lCoQK6xDJHrvJyinVa0wy0YvzWnVmYNV2q96a9OUxD4KCqEqHGGBY4V1yKYjkw
 o1dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dsC68jJ+
Subject: [Buildroot] [PATCH 1/1] package/gdal: add xz optional dependency
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 937e28ba20..3104332db9 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -67,7 +67,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_KDU=OFF \
 	-DGDAL_USE_KEA=OFF \
 	-DGDAL_USE_LERC=OFF \
-	-DGDAL_USE_LIBLZMA=OFF \
 	-DGDAL_USE_DEFLATE=OFF \
 	-DGDAL_USE_MONGOCXX=OFF \
 	-DGDAL_USE_MRSID=OFF \
@@ -139,4 +138,11 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+GDAL_DEPENDENCIES += xz
+GDAL_CONF_OPTS += -DGDAL_USE_LIBLZMA=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_LIBLZMA=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
