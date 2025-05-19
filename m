Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B71DC54756
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F23BD60F71;
	Mon, 19 May 2025 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9dRaAi9qLpz; Mon, 19 May 2025 21:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0077360FE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0077360FE2;
	Mon, 19 May 2025 21:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E125D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AA680F4C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwwIg8VCE6em for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2F3A80F14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F3A80F14
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2F3A80F14
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:18 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3106217268dso45925321fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688777; x=1748293577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjYAduakS+w0gMBxQZXxZdf4HecBgzX2NHi5fhYXguM=;
 b=NUrD3TQh91lyVy5An9m1Nqhwbad5bOaVkHPmWhq7EnwWBsntCwD0LPX9sUho09a/u+
 pjM62lva33y1fiZtqwwAAoukZ7LedxU7+/caedQGgZTxRoGTwQW1i5osmF8KHc7HdhAM
 a5Cx1g1PYNhVk05lRDmlhPn5G9n2EO03Axh9ybRzIptdLPlUDcILV9KnTIpA4Wv4AQep
 TR0LPpdzNXm3w76MJdKd5kPeRdr3vg7Ob1NC6iVCI529IP6ySh08iI0bORe6BG5dsCZp
 yBbNe9FVHKyVF/6elIfzy8JDu+q3bUTBRLyw1Fk3EiMlA/JADa0ybbEB9TwlwEMkCTh+
 SXZg==
X-Gm-Message-State: AOJu0YxQn7Z2ZMOPnA6kq57qAce4+DD3+zBp6hypaagkmOVf2tQ/I+Yh
 QSPchdFqlvUdY8jVLFvVgvczPiZf7v/9hzzGdmohh7Y3FLRyIAj8MV4cIs4+CQ==
X-Gm-Gg: ASbGncsAf9uOlIHj1Q46LaqGap9BjEgFN+212ptjyjRfowDHMAaEA78QWIhlTG+Ca2o
 JST9S0xxnnHKSNPH/eIY3eRjAUB+kuixcgIrj0yJVG8nKhIs78iNzZiqGvPIQWUzsXVBwFkPz7O
 THpWKMM6PLEPmwzQXiY+OrKC7t3G+AoT6SJQgr5DsIMrimdqsWSv+b3Vp8A2gyUwuq3dPKZNzng
 0SJyWHIj0LjskhQ9SDY+s0Ki6MVXXW67DzuHTz6YW8cXXUKSfK/EmRqEDCSNaqYIBYoyhEmlDYM
 ascc7YJte9C7EcdSKJJB5QwscywjtYzXaVXDihfmDtZmv3B2BncNOBDKorj07+Tbi3PhRBi8o7l
 xWuqPQA==
X-Google-Smtp-Source: AGHT+IHSv2nC30i3rivF9xuh/OqwpeRSsyCa+eKZvuU1t6vjQIOd70ksjaNN9SKKd0nSf3av1dH/xQ==
X-Received: by 2002:a2e:b8ce:0:b0:30d:e104:9ad4 with SMTP id
 38308e7fff4ca-328077cd2b8mr43182501fa.41.1747688776663; 
 Mon, 19 May 2025 14:06:16 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:16 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:41 +0200
Message-ID: <20250519210553.265725-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688777; x=1748293577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjYAduakS+w0gMBxQZXxZdf4HecBgzX2NHi5fhYXguM=;
 b=lFTc6/vPsnYU9mgmd+BvjgEDG5EZB55H7zHyFRSGAy2NboIPtBqwT1v9/Sni7BVcZK
 low/ksfYo392rSUqHoidv9zwIezVnRvt+oJZ1zegzKglCn0VCFewszQlBEkbwbDUF1NW
 v9gJIkeYedDLLwQwlLuDHyJWvYWP0jUYLI3iOYvcSBOb9GU6jjjJDTo2nNJar2/KQtpJ
 9jK3Qs7YG1vKw5yX6e16xBYUjh2lq1EZ/S4EVPMTdTmxHnrhyNLsaFF1Wqk6ZzjGdNoy
 cz93C5V8TCEqT2b12mO3ir5VNLUExzYDKhP31+qW6svRHhzuElPDG7cXTTEVUDTM4Yvk
 WrVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lFTc6/vP
Subject: [Buildroot] [PATCH v2 07/11] package/qt6/qt6base: add hidden
 options needed by qt6tools
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 14 +++++++++++
 package/qt6/qt6base/qt6base.mk     | 40 ++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..4014051d5b 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -11,6 +11,16 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+config BR2_PACKAGE_HOST_QT6BASE_PNG
+	bool
+
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	bool
+	# yes, print support needs widgets
+	depends on BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
@@ -21,5 +31,9 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
 
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+config BR2_PACKAGE_HOST_QT6BASE_SQLITE
+	bool
+
 config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 39fb440be7..d24323fe8f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,16 +112,35 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_xcb=OFF \
 	-DFEATURE_opengl=OFF -DINPUT_opengl=no \
 	-DFEATURE_harfbuzz=OFF \
-	-DFEATURE_png=OFF \
 	-DFEATURE_gif=OFF \
 	-DFEATURE_jpeg=OFF \
-	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
 
+# The PNG feature is required by qt6tools (qhelpgenerator and assistant):
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PNG),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_png=ON \
+	-DFEATURE_system_png=ON
+HOST_QT6BASE_DEPENDENCIES += libpng
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+# The print support feature is required by qt6tools (qhelpgenerator and assistant):
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_printsupport=ON \
+	-DFEATURE_cups=OFF
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
 else
@@ -144,6 +163,23 @@ endif
 # available.
 ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_sql_db2=OFF \
+	-DFEATURE_sql_ibase=OFF \
+	-DFEATURE_sql_oci=OFF \
+	-DFEATURE_sql_odbc=OFF
+
+# The SQLite plugin is required by qt6tools (qhelpgenerator and assistant):
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQLITE),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_sql_sqlite=ON \
+	-DFEATURE_system_sqlite=ON
+HOST_QT6BASE_DEPENDENCIES += sqlite
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
+endif
+
 else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
