Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31411C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE310838FB;
	Fri, 17 Jan 2025 08:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dss7_eIiTqzF; Fri, 17 Jan 2025 08:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A1983938
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A1983938;
	Fri, 17 Jan 2025 08:13:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F945B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60062607D7
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJ9IpjS-Hzxc for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87A49607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A49607D5
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A49607D5
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:13:20 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-215770613dbso23976715ad.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 00:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737101600; x=1737706400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ora7z9Mx2rP8O7vaIBXARc1zASUGRBXu2X7qfva7aJ4=;
 b=SxvBDKS5XMQT3VE6wUrNudTDB1fk9CsI7EbxHbuBUEj3QUdca6T0iBOrOFpISFgq76
 UGNktQor6BXO3L2DduY68bem9yxkhTEoHfRXQPObktMqyHLaUyC9WrvhGTFnVaJOUJ5e
 j+3apNK9AbRsLnE/lp25zfinWoQruTqDjpbz3HVrnUsaIAC76wfnvUbcK/pTWe/Ek9vP
 4AVd5Yd9ZfGDU98bnBVZbsJ8PFngIDi8DTHyulrviB0Y0V6py5se0XMU/qVi1FpQLNuG
 PPy/N3wGEnic3jlAq54BSyWVHZcUdfvxfyS66FZJYaJQzdzKPI+I0Nx/FM3C88Dol0c2
 PGJA==
X-Gm-Message-State: AOJu0Yym1FQLIjnU/klgc3pTYJxhQK7W4G7tT4GD0q1GMvhH3CIabpfk
 DLHuo7kVIrtFtfTwCqOOFTvM5zRzzZKoDEZcNrPBsSnIrogXDZqOJVlaBQ1z
X-Gm-Gg: ASbGncu8ov+ZoXhpg5k4upPj8YmgbO4NVdRd4F21O4sMvgeVkKyb2+Sew03fS4wDD4S
 OxNlvKxH/amja7/SQIQat/DqGqoEl/uPl5iHzOAhGqSA0Onlqtr2nCHg68fxOZ8rVQEwWP5PEj4
 hYotiENGzhpyK/k96WhcoEgjvB3cp5Jy6pmy6mehO0EsrLgqsgwdKHlReuOQ3lWFWA9d7Uoyoq1
 N0bRmBVF2ITeGpqHKJylbtiTtkPhLgKClXZCWepXD26bLTpVCYbZuyFazjpCPhW/5axaGi8UlcM
 jN1wINZVAihH9r2uLM8SLEd6Q01VN3GrXZ88sX+H
X-Google-Smtp-Source: AGHT+IHvEAA90FS+pffnL/UjFG6K64MiSLz9MfuwfDEINCz6aYu0F18TFagZNfV+amnTkDN0jGLSYw==
X-Received: by 2002:a05:6a00:2917:b0:725:b201:2362 with SMTP id
 d2e1a72fcca58-72dafa409b5mr3058432b3a.11.1737101599460; 
 Fri, 17 Jan 2025 00:13:19 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab814a03sm1258898b3a.42.2025.01.17.00.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:13:18 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 17 Jan 2025 00:13:14 -0800
Message-Id: <20250117081314.841216-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737101600; x=1737706400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ora7z9Mx2rP8O7vaIBXARc1zASUGRBXu2X7qfva7aJ4=;
 b=OeYufC/cefYuHuc2SqTbTMLacvHGBABJeL5PUI/K0ilvGCes+h2/IzplN86i/Zfii6
 wdjopj8bujcQz3QMaMUozWN8vmRzDfR0wvAa8/eCNFhNIQTqLiMk2yC7x2CfhjAWrJyO
 oVq7OAlZ0b8OooVAwOtgmia0EMU6basdldXBehAeEW+a+yWTQycIgdLDEWCZ9It3jH47
 PjdyICu/eYDTBgq9h5x2mGBJ4p3PY1O5MQVkKF54QytE1RI/giMi2FSNsPCv3Ku0Nhux
 i1w6K7LEmP7azv1WKmeukI6Sg4awf4mQTz8YEmVumNKJe/MBGMk8ECGU4FBe4Elwb7HL
 h65Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OeYufC/c
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.391
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.391
https://github.com/vcrhonek/hwdata/releases/tag/v0.390
https://github.com/vcrhonek/hwdata/releases/tag/v0.389
https://github.com/vcrhonek/hwdata/releases/tag/v0.388
https://github.com/vcrhonek/hwdata/releases/tag/v0.387
https://github.com/vcrhonek/hwdata/releases/tag/v0.386

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.385...v0.391

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index db30db66af..c559c99374 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  577219d44d9686e8177f6291adbff7bacdd785ad4e8a8d0c4b2a14dbf850d6ac  hwdata-0.385.tar.gz
+sha256  620fe1c22922a3d1bd1062424e9cc6b954acea2f83b72ff0cb45144981cb1975  hwdata-0.391.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 294afdc061..bbf7b861f8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.385
+HWDATA_VERSION = 0.391
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
