Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EB2C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA17341906;
	Wed,  3 Jan 2024 19:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA17341906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBDORfStXzQv; Wed,  3 Jan 2024 19:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EA9418EE;
	Wed,  3 Jan 2024 19:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EA9418EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEBDD1BF286
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9752960AAA
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9752960AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGmsJd3gfqMe for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:22:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0646608F5
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0646608F5
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso95461075e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 11:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704309724; x=1704914524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5eDwYcZDiwDue2tk8QJYPAhkdwp/9drsIdjrPGvhuI=;
 b=jpFDfRM9Zp107lDvrJSl1mekKpTKPNSbIj78Gm/o8HZTJ7t1EUsFj6n5d1cIkBfMsF
 JMpVh7vxpIdc23r/AqDS0rh0pW/sD42rI+JBcu5muapcqvQCvOUFIEurXnLIDoKoCdtY
 tmbrCIAY6quDpCeosCRJuVE/qGsgZtTwViKT8fi2DDV2Pu5OxlJhS6Lu5UcMQqWxRt8x
 1Z9AyFmj9Bg53qIb8eoFj596anIMhwIrkcTK+1dJEjVNcGUzeE1xR/n1Jf1i12FDKUxw
 AnSc642vWJj3B8dYU2xMMM0PnM88P3D/3xlpNZuvZAP8Y8Iq9PIWhAJULoWFV8/BYnLK
 Q7uA==
X-Gm-Message-State: AOJu0YzQhjyCYRnd+XyDNosCocLH+Gat/9YvEp+dHOYWausuUjgaN7tD
 Pc1opaRjFXv+Aw71Hto4zmjj2rh2okg=
X-Google-Smtp-Source: AGHT+IG768hypo7QVs2PVaBQm2eSOZkyUWBRe3/6Jo6+gs1Abny2elZtzHeMY/CvNJS+jwGKe/cxvg==
X-Received: by 2002:a05:600c:a03:b0:40d:7cb6:ea56 with SMTP id
 z3-20020a05600c0a0300b0040d7cb6ea56mr4063372wmp.22.1704309724521; 
 Wed, 03 Jan 2024 11:22:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k15-20020adfe3cf000000b003367a51217csm31295047wrm.34.2024.01.03.11.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 11:22:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:22:00 +0100
Message-ID: <20240103192200.908186-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704309724; x=1704914524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H5eDwYcZDiwDue2tk8QJYPAhkdwp/9drsIdjrPGvhuI=;
 b=KwYWv2DljsdxYNezhhU1Zwm7QzcMFyjNMxMUA/+r5S0GpggIf5SuuMaNkDnXCdA3Io
 utoWJVgkqiiJPvygfPt5T7zgsy+traxU81ym/9iJO6XLuI4JDw4SUpvwIayBBduxoIEQ
 V7win6htAEJnBfpu6L0aucRGDQkhjhj1Og6WHUtKUJj5ptWMq8NZC2HUNNCHp+JvDvgA
 i0+1JKlZnOuNTfM7mFUaRaq10+0rlJMH3D7TYP5CenjQD87hSD6ODlDyFLtHqWQ103Tu
 +OLtezW5C7jNh3rdvkpLzAAskstpEJez3WUQbaLH06FJph6ke45jVvxWhsUJuIG+Sj/o
 2aCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KwYWv2Dl
Subject: [Buildroot] [PATCH 1/1] package/tinyxml2: bump to version 10.0.0
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

https://github.com/leethomason/tinyxml2/releases/tag/10.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyxml2/tinyxml2.hash | 2 +-
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index ff799bc2eb..a131b8624d 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cc2f1417c308b1f6acc54f88eb70771a0bf65f76282ce5c40e54cfe52952702c  tinyxml2-9.0.0.tar.gz
+sha256  3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839  tinyxml2-10.0.0.tar.gz
 sha256  9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 0a857e5732..5ea9e13a4b 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 9.0.0
+TINYXML2_VERSION = 10.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
