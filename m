Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0F9C5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0E241DDF;
	Sun,  1 Jun 2025 08:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccrseQ6_n6lE; Sun,  1 Jun 2025 08:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8462440894
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8462440894;
	Sun,  1 Jun 2025 08:46:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68620127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A569400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui32zOqZr4zF for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A97A4006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A97A4006B
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A97A4006B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:26 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-553280c345cso4483230e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767584; x=1749372384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ED9IqSjkW3qGwpM9RYCLMdB10X5/wTL085hCtU8RNGg=;
 b=Xip44FjemhMxQqOa++4fT/Su91RPz25E0iec5bsEcMOMzsZVGX3dj0wD0PLovq9yVS
 0gjeGyW+dQdrSmr+QTgi0hfcY/Dd9wKCztoQzvSeyam1Q3hq0RzlsOGdhvOcTHqU/8bm
 32kGVu68M3zslSBP2dC+4jv4kfmsrg+9cY6KY0Je6xA361N0THzfxXW9n1O8K01JJx1C
 3TzhaQx4luHimN1koywK05BLzwnNGmGEbVTG/XuMSRQ9ar61xVFKiRPFnNRABlQQq7cZ
 gMoWFgYXrMWQlC/lQCuoI+coUz1rdmdbVBvirY0X8TZr8siWTCR/JYt2BHKGfvUF1nn2
 UTZA==
X-Gm-Message-State: AOJu0YxN3VdT6Y2j2adAeAoW5R/tb54yWmOqJlpswFEzLwestr39YZeE
 MnvI8axGmSpP0UWkOmi56+rfGMUMte/OgFewLvDuKaxEVbV3CI8TeHYf3wXO3Q==
X-Gm-Gg: ASbGncsRYXt7xFik4W6W1oV+T8uj7d6gkz3oboVj89jacBhKqjB+/dLB6PX2O/O6Lay
 48A/2cj1H+aDMckC/3+ryMcRgAPq7633GQidwM6tuSOK32CnrTtvNFrkykOAezSc0e3A3HKClkx
 mReuEkGUSiAGiTWGGreTkCn8s5vm+hYMV6zNUga/xFHnBWxyxjsswsaXFKsrmjbWyRhIdDmgWPa
 8/cLIvXDTyDPcWYoDVYL1EySkxe0CFH09kIBVTOcRLDhxv7mTcLxawkM8Ho7rwVZt4c4bsBBNkc
 uceKcnUzSuVPPI606svve0Yu5YSOETx10k1Byslsd4XkNSseKSsDR65AkM2Bxc+y2nU7Fu6g+fu
 CyVQyii/Hs67y3ZQmsyI0
X-Google-Smtp-Source: AGHT+IGWbHJnHr8mojma8uHr3bJfgw9ZKhKoJKpAUo+njGrtScaPKZLIDKC70G/ZumvN//W4hR/WaQ==
X-Received: by 2002:a05:6512:3b97:b0:54f:c10b:7290 with SMTP id
 2adb3069b0e04-5533d1aba24mr2278038e87.26.1748767583587; 
 Sun, 01 Jun 2025 01:46:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:08 +0200
Message-ID: <20250601084616.3104736-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767584; x=1749372384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ED9IqSjkW3qGwpM9RYCLMdB10X5/wTL085hCtU8RNGg=;
 b=QuyxLt2Z+5t5oNfFGEghiVYI/buTU2IvxoSkBKFbjK1PYOXEKz5jFZgufHCRYgKACL
 BUQBQOOqeLE8ZTGFcirHdYT2yXFt7G9z8zfN8krNqC36SH/lXEVVjoLB+DMDuSYR5VMJ
 bfoSvJaXXKD8ULuKTS59q9QkrM1KF2J/s4+2k/Odznm24sq4s8htuMA/qKCNCQqz8D0z
 s3Xjpg+5olAlIfOBKMp5nOAxVcHQwgSC41Z7xP+iqivmTj0z2I3B6K2WCZ0c9Ejk5Qd8
 RGyK1u2I6ACcsJS3yJY9OnXOvSOei2Qv8NUqZYLTqyYDjrV052DhUz48Yv3gnWlEZJt3
 74/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QuyxLt2Z
Subject: [Buildroot] [PATCH 1/5] package/qt6/qt6base: add hidden options
 needed by qt6tools
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
 package/qt6/qt6base/Config.in.host | 14 +++++++++++
 package/qt6/qt6base/qt6base.mk     | 40 ++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..89e78127ef 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -11,6 +11,16 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+config BR2_PACKAGE_HOST_QT6BASE_PNG
+	bool
+
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
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
 
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
+config BR2_PACKAGE_HOST_QT6BASE_SQLITE
+	bool
+
 config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 39fb440be7..b0d480e360 100644
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
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
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
+# https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
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
+# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
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
