Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80388C02188
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC3E607A9;
	Fri, 17 Jan 2025 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQRgFyJ-wx0V; Fri, 17 Jan 2025 10:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4627160B19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4627160B19;
	Fri, 17 Jan 2025 10:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6077B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AFA460872
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTbt1fkbZKPj for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5719B607D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5719B607D0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5719B607D0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso2183982e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111255; x=1737716055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp+nUQcAPT6lIDrasKlZTkZsKr8/wou8W+TtZWLO2mE=;
 b=l202SptUxOF1hUhuG0R+X6J7t1s14GIhEkhwaCI54b9KYJApS2S2BuiDTJcyZ1Msuv
 EcEyaUXlymA7DfyOk3jSNmRaBFGEeZDAyep9h7cnOfYqiF3sfedwcNHFnFnV5FUlkAhe
 WEtJDckrfgKVB075qow3X6YKWOnYQcCjbFAZId4ZmauJ24tVdoqFxvqBDR9dGIfkrXWN
 QjKrgqhCzYrKMhyISCnkgLeU4YrHMwpRWhlHKMOGC1aNB+fJEtvEV0IYzic8YzKM1ZkF
 WwkFj5aNDUB0HgfRgWd08YVBZQk7UnZqktiZ8ZxwayE0VOHsJxAj7fUyckiFxqujW00z
 liMQ==
X-Gm-Message-State: AOJu0YzyXyFmBqir4JbraKV+9v7MhT2TPqgjGYvo3LlqJbjPmZSavDqB
 uv0fFj48GLc6+tppkKGCWbDCPOXyTkmZHGVd7Klo6LuVFfELIhNfZpSJvw==
X-Gm-Gg: ASbGnct8INR7bbUD1Bsrjt6cloGpkaWPG10MeB94IaUE6k7vrvsw0fBKIvwLDv5t2mY
 L7FGCB+XqUWv/CcWc1TA6hcMgmQHm83wpsZoJt5FvUEWa0qVhY+dCNIds8GbtOabUyIn9f03AdA
 3X8judJvYBd77wTc0tPl5GAIdpwCP+m30nDe/pAwpm7UCfmFmtlVDIUvTZWFzLA2uNK3zxYshtX
 y483PPtz8AlSzyRSpJCEmzCbEF1CRzpMburBN1oiLOIiOP+HZKlUIRCkwkjGgv4wa0jsmx1nqx4
 sBO94m310zU=
X-Google-Smtp-Source: AGHT+IFPlqdJvO1yVPnYOnqTmAekZ64iopTWUGZX3eyDzMpjro/YKAvJwNrc5q92AszdmN3qiVon7Q==
X-Received: by 2002:ac2:46ce:0:b0:542:2999:2f18 with SMTP id
 2adb3069b0e04-5439c22a84emr441516e87.8.1737111254869; 
 Fri, 17 Jan 2025 02:54:14 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:13 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:29 +0100
Message-ID: <20250117105354.618220-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111255; x=1737716055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp+nUQcAPT6lIDrasKlZTkZsKr8/wou8W+TtZWLO2mE=;
 b=ndUkZXb/lHOv+igyFnMTV5sA7UeRs/qqI3slclHC5ibzhRKeXSmuvNAaTx8g+59baB
 pDKd2Shg0Z/Fc6igRivUeRR/oQDLo5v1bkbREs7X53myyS0O/ZR7YREpuabD/71YW+2h
 0Kt7bW3ez+luSRVFHTsG5h4sx3Trt5MJYvGvpTEV5Hm9fpuzSmWE1VU1AjdX6btRtwv7
 24/6824EiXjtkE7OuoLqlkOSzSRxMM2Om41MjAVN+CqR2LLzdenPB17vLYgEEM4fsM9S
 +esBLSBLueRfkpvW8j+pHtZ5P4JusNeYpzxCM89bNjStubKj6eOGdVncPE/fPnwdnfVx
 119g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ndUkZXb/
Subject: [Buildroot] [PATCH 06/19] package/qt6/qt6multimedia: set license
 files unconditionally
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 33 ++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 01bf9adf96..6aef78bf02 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -13,12 +13,26 @@ QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
+	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSD-Source-Code.txt \
+	LICENSES/BSL-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
+	LICENSES/IJG.txt \
+	LICENSES/ISC.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/MIT.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/Zlib.txt \
+	src/3rdparty/eigen/COPYING.BSD \
+	src/3rdparty/eigen/COPYING.MPL2 \
+	src/3rdparty/eigen/COPYRIGHTS \
+	src/3rdparty/pffft/COPYRIGHTS \
+	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_DEPENDENCIES = \
 	qt6base \
@@ -55,16 +69,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
-QT6MULTIMEDIA_LICENSE_FILES += \
-	LICENSES/BSD-2-Clause.txt \
-	LICENSES/BSD-Source-Code.txt \
-	LICENSES/BSL-1.0.txt \
-	LICENSES/IJG.txt \
-	LICENSES/ISC.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/MIT.txt \
-	LICENSES/MPL-2.0.txt \
-	LICENSES/Zlib.txt
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
@@ -97,13 +101,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
-QT6MULTIMEDIA_LICENSE_FILES += \
-	LICENSES/MPL-2.0.txt \
-	src/3rdparty/eigen/COPYING.BSD \
-	src/3rdparty/eigen/COPYING.MPL2 \
-	src/3rdparty/eigen/COPYRIGHTS \
-	src/3rdparty/pffft/COPYRIGHTS \
-	src/3rdparty/pffft/LICENSE
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
