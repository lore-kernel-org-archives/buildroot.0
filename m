Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B1BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3179340A62;
	Tue,  2 Jan 2024 21:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3179340A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7qRo_hWKRvG; Tue,  2 Jan 2024 21:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21F9340A6F;
	Tue,  2 Jan 2024 21:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F9340A6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD7DC1BF20D
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A66E960F58
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A66E960F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id incNs6mzxLNo for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:59:20 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC69960E8A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC69960E8A
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso9018248f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 13:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704232757; x=1704837557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maAvT6cF+LbKCzjD35jDF3bOIXzuQ3Xvgg6ezGjfeSo=;
 b=Q6RKoKDORRRly3d7951Naxv0Hb4aTcSWQ69Kjd12NVRjcB3Kfy2tcUkB8nRqYEJ8oG
 0Q+HPFGZFunJnOl+TRZJAyZY2CFDe44wVgu7gT2oGVCBoDrBaIaaI4GSSe/vJf2ZORK5
 W8SswZZngDx4wXWp0Y6+PdYFWjvOn4U4kbwgjbW0c4McOhpDULBOxHrNxxbhmC+BLemO
 +sYKOzlAAHxV24gnuHZ5OVBGXyN6Xv/rPoRnetsrgwz21nF5miiPu0icP6TSXCkspkQl
 miDUwnHU6whfu8O9w2uRbkklCs22+OUP0AU+SshcXZdE5cdzfpKjdDh+VUTptjrTtv66
 oPDQ==
X-Gm-Message-State: AOJu0YxCbvlnyKVXxvMcjrnb4+AlRICgXuhb0X7glgQBmnwUIBURIogI
 y5qOPzNOVs0mxv+mOi5euXx/GId0Jfs=
X-Google-Smtp-Source: AGHT+IEzQUEsr0klLX/lkUPOaM7o+BwuEklbGJx5xLv+djkoTdoKBgJFkF1I66VfvmE5LbmhPGfBgw==
X-Received: by 2002:a05:6000:1ac5:b0:337:400c:e0b8 with SMTP id
 i5-20020a0560001ac500b00337400ce0b8mr2273401wry.98.1704232756923; 
 Tue, 02 Jan 2024 13:59:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b003372b8ab19asm10587380wri.64.2024.01.02.13.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 13:59:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 22:59:15 +0100
Message-ID: <20240102215915.2335150-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704232757; x=1704837557; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=maAvT6cF+LbKCzjD35jDF3bOIXzuQ3Xvgg6ezGjfeSo=;
 b=aZJuu9x3nHEaJVWC4N3z8/IouM5UvFL3P96Q5OAYKe/YLdaxgY5lNb+24SPCOrZC80
 /NPwU5MvjsgIxDL/NvmGlm5K/vpJFv4hL7A483lAI22fsYKGBDwZ2Z8ul4jCynsqWXE/
 0EAN9obP094d5Rf67LYbC4CiXve5mZDdYAbHjDbsVxUUZ2drNGSoe9r2HlprV8eYybHZ
 csA3PQBRTHVqQqTn0iXR0erStGeP+Cj/dfoDDWtc1CFG6oawTN6wWFo2qUN/p/mOTkXe
 F+QHhuHz+pZIA3grHrM+0DnAhAnYyUIjWaYDEA0yFOPY3wrzMG0Wf751FuM43MQn9nDc
 mjUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aZJuu9x3
Subject: [Buildroot] [PATCH 1/1] package/gdal: add expat optional dependency
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
index 13f38173fa..5690f55c00 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -51,7 +51,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_CRNLIB=OFF \
 	-DGDAL_USE_CURL=OFF \
 	-DGDAL_USE_ECW=OFF \
-	-DGDAL_USE_EXPAT=OFF \
 	-DGDAL_USE_FILEGDB=OFF \
 	-DGDAL_USE_FREEXL=OFF \
 	-DGDAL_USE_GEOS=OFF \
@@ -107,6 +106,13 @@ GDAL_CONF_OPTS = \
 	-DBUILD_JAVA_BINDINGS=OFF \
 	-DBUILD_PYTHON_BINDINGS=OFF
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+GDAL_DEPENDENCIES += expat
+GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 GDAL_DEPENDENCIES += libxml2
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
