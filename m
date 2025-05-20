Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0617C5479B
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D61819FC;
	Tue, 20 May 2025 11:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8d2caxUViUE; Tue, 20 May 2025 11:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1769681A18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1769681A18;
	Tue, 20 May 2025 11:34:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE724D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4DE8402D1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mF1jQ5YHwaiz for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C15DF400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C15DF400C8
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C15DF400C8
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso51952301fa.0
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740836; x=1748345636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjYAduakS+w0gMBxQZXxZdf4HecBgzX2NHi5fhYXguM=;
 b=w1uS8H4J5DKS05748TmHDy2Q++H+MDWIwtL7bInXQq8zfHiaddDu3CHbWqFBRuYS0h
 0Adoa3TeOUrZQs2W7jVqMtEOPqje6AZTf3weJ9bWJsp48VeplgxXrEo69b+ybxNUWFxm
 H8zf0ZwwIaZnevIWaJ8eLkVWeR7/ec64F2nnQZwdribN9pZ6XG7Gar/grZM041gvjkoL
 JPK/jBInBzh2orMsr8zkGIuSV6cR+IRmsBmNKXcBy0hlSDY5Bl7LrYiu3sa5NIsWfABK
 Rx0+5pb9PZXlOaGukzz6fvaGnwiULn+qxYj0Y1LWEmGpEEYEn+Zouv3kZg1Q88zxPy7D
 wifQ==
X-Gm-Message-State: AOJu0YzJ7ZyStPB/2gpmKfp637wTdoEDZSw0yy5w5X0OrnYvM9c1TYZn
 Ufx5XOVs/oeg9P9lv9VfvHkK+r1r4kRVAhofMRkJZXQsjNdoXTpCA1HCjKgsNA==
X-Gm-Gg: ASbGncvVO2GT3whNGTkREHq//MFO1S5s02kD18wVSXvNZ5phmUpCRo+j7191aSadRA3
 SHbqGeHX1BbHrwE6UHND36BWXPbJMRmXkGbsx5FLhyAgr1MAqaWAmtrZZzHspNLAvp9exQMfvVh
 lo693i5sZO9xOifrC3JiRahUjwoJ5V79o6hOihcbefxmYrOTRlS5yWrNca5JGL9I3cy8Ry/yFLZ
 FsH5nd/yA2vxRWkfP2wnAVz+bPMIJmbb84yk7f4kSMd/najXpYeppuDfQLSKdRv+QXcyzsvx7lK
 CB4Fy8PpnQlLk6NKxFJ+7bGG/rBKACNAlda8+sleRVyj6MO3kOk9SBWpCt1dFomFXuZfXFHjypR
 gUGsFjg==
X-Google-Smtp-Source: AGHT+IEfeJEGxG5YQ1Yo202SQtZCudEdc+8TMKPq1FioLpbGSMwk/f0t0Fx25gRIE6MlA0DVnWMKsw==
X-Received: by 2002:a05:651c:41cb:b0:327:fe4b:37df with SMTP id
 38308e7fff4ca-328076ef00fmr46247481fa.8.1747740836381; 
 Tue, 20 May 2025 04:33:56 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:55 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:26 +0200
Message-ID: <20250520113339.2525537-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740836; x=1748345636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjYAduakS+w0gMBxQZXxZdf4HecBgzX2NHi5fhYXguM=;
 b=QlsMd2bmBePDONqdw/ZUVQWN0uEwIV+0CA6H7La+vyg9YleSVvZMgIBZN+5tqQupLv
 J/D3vwqWrYS0SKuaQTJlU6mdE8SoLZVUNniJc5wE70ZP86DHtbE2+WRbqf1bMpGg3RgF
 fPsEfZeZnvQLX3GkUhNaByUvlQXDgE9oc/IDIQVSNwu1FJV/Lxj2xt/+x6FJUmlxQobM
 6XLAo5rFnmNGWqgixl2XIqrom7KnIvV82EJAkAdtlF/gR0MEIzy4xh0Cwte+Cc3yNr7i
 oY6qzKN8gAdN4tH1EziKNGLlbJ7m6WxsDxgZdChweKkm23sYDLTnzD1nuWRAdzoylFSt
 q27w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QlsMd2bm
Subject: [Buildroot] [PATCH v3 07/12] package/qt6/qt6base: add hidden
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
