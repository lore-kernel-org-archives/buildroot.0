Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41141C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8AD440BFE;
	Thu, 13 Feb 2025 14:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfXZi-Z_6U_y; Thu, 13 Feb 2025 14:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F4D940C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F4D940C12;
	Thu, 13 Feb 2025 14:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06625C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA45740C20
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8U9b66bqfjF for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86E2940BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86E2940BA5
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86E2940BA5
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:13 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-308dfea77e4so11042341fa.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458691; x=1740063491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXt7/6IPvwtMpSwz1155eKZfpSOi+L/kazlTaK+Sveg=;
 b=ezh7cV9v5G0AE9tNR1kE747kjNaquZib1cUqzqQpo/I+V/C2QI7LIjuFDz4bNgvug/
 fSiFWpdvVEy0SpSz7gqrIZeiTceS2KfBL0Qn0IKiNoeFtl5ykNMl1vBP7Q4DIMd09kNH
 RQcyX5mkrphPKUkpuhQ8ORBMEOH7G/O37IPRRutE9oMaq3K2raH78kau2uXqNpw8kkIa
 dz8oxGLCtxuBd39bEowiCbS/ideGUxDjJPoBFQHXb3zkQFFmcXwafSWsVq28BWDGbL8v
 R3WIflpxyBlppYr9/oV9evOfwOzCXPH1dw8R9zp66oOFEDyzy65fUqFD4hokrCcxz4sI
 eItg==
X-Gm-Message-State: AOJu0YyEpiL393lKXuzR+uaQCd2wII0D2hEFRsWLoMyPH1NMgyiATb1O
 j6l7fEJ8ru8rNigPI8Pq2dmNLJ2YDU0O8UH3TnpOp+uC9aYrwJ/0V5EQ+Apb
X-Gm-Gg: ASbGncsP9lelzHu/ilObXATUk5M23ecfTZuEqC+Af09ve9750S6GNnLq8fGOMBfx+V7
 45zeNAqbvyP3pYYTUeFQG5bpnl00a0Iqrnbj2IUCXqzFuFng2rat9iK//YBb/IS0I3fRRS0y1Ih
 GrpzrPLK8T4Zbhhsm3JeKeaVUYlmvECzhlEhFtj0CV3DEsEb+slK1/lR/yvidNDPQ3LNOt4ukqw
 kD3m3Xcgb8TyvsH5NTi4Aat9mEgQl2T+1XVd3cp4fkYfgDODBzap01ETMNh9OZXQ+HmPtFKtI5f
 p4P6F3y9mziKtNAQUFqtKRIfGvj87cS+2T+CgohzWCXzVQ==
X-Google-Smtp-Source: AGHT+IFeZ4TF1mFFehnSDklVpD//WH1V6jhuOQunhZHUiHuG1zruivVLGudq3lAAVoIhNsYcQuEZNw==
X-Received: by 2002:a2e:984a:0:b0:2fa:d086:bca0 with SMTP id
 38308e7fff4ca-3090f185ed4mr9645291fa.10.1739458691145; 
 Thu, 13 Feb 2025 06:58:11 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029be88sm2094681fa.96.2025.02.13.06.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:58:09 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 13 Feb 2025 15:57:44 +0100
Message-ID: <20250213145747.639358-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213145747.639358-1-roykollensvendsen@gmail.com>
References: <20250213145747.639358-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458691; x=1740063491; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXt7/6IPvwtMpSwz1155eKZfpSOi+L/kazlTaK+Sveg=;
 b=EtOtGF1oyeriWz3E5MKJuB12XGUPIiN8Fx3Ot8kCrEGDDVLNcke+M3/VSwzuPbMLsB
 2zz5lxEltEMHYGSIHdKYpfTUUJA4ZIidN6NMj87JHMcAbnKP5F1Z1aEepR5kPUOri+HG
 cZWwm66FFFd690HkGjUZSIpvzvElKyB5r9olniZE7h0w0R5gnPJvoBNAGwjnvZ2FpcA3
 wMSyN+O45a+Atj4L1MXiM0fnnO6Y5aYzW3PMFc+1nisRffv3Rk/obJA+BD5qKNRXap7v
 O2CiRrZDxGD6NhUulgVRGXF4OYU0vKZfmjKZOBjL/+5UilNlLkQSn/89oN38+GrK2Ufq
 ikgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EtOtGF1o
Subject: [Buildroot] [PATCH 4/4] package/qt6/qt6tools: WIP
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
 package/qt6/qt6base/Config.in.host  |  7 +++++++
 package/qt6/qt6base/qt6base.mk      | 16 ++++++++++++++--
 package/qt6/qt6tools/Config.in      | 21 +++++++++++++++++++++
 package/qt6/qt6tools/Config.in.host | 12 +++++++++---
 package/qt6/qt6tools/qt6tools.mk    | 12 ++++++++++++
 5 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..5d4476aca2 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -11,6 +11,13 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+config BR2_PACKAGE_HOST_QT6BASE_PNG
+	bool
+	select BR2_PACKAGE_HOST_LIBPNG
+
+config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	bool
+
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a4c56da601..12848513ee 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,10 +112,8 @@ HOST_QT6BASE_CONF_OPTS += \
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
@@ -139,6 +137,20 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PNG),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+HOST_QT6BASE_DEPENDENCIES += libpng
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+# Needed for building the qhelpgenerator host tool (Part of qt6tools).
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 # We need host qt6base with Sql support for host-qt6tools to generate the
 # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
 # available.
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 1828e5f043..1a9cda1ef9 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -11,3 +11,24 @@ config BR2_PACKAGE_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_QT6TOOLS_ASSISTANT
+	bool "assistant"
+	select BR2_PACKAGE_HOST_QT6TOOLS_QHELPGENERATOR
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_PNG
+	select BR2_PACKAGE_QT6BASE_SQL
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  Qt Assistant is a tool for viewing on-line documentation in
+	  Qt help file format.
+
+config BR2_PACKAGE_QT6TOOLS_LINGUIST_TOOLS
+	bool "linguist tools"
+	help
+	  Translate Qt C++ and Qt Quick applications into local
+	  languages.
+
+endif
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..3037261fd3 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
 	# The Qt Qt Network module is required
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -22,4 +19,13 @@ config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
 	  Translate Qt C++ and Qt Quick applications into local
 	  languages.
 
+config BR2_PACKAGE_HOST_QT6TOOLS_QHELPGENERATOR
+	bool "host qhelpgenerator"
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_PNG
+	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	select BR2_PACKAGE_HOST_QT6BASE_SQL
+	help
+	  Qt Compressed Help File Generator.
+
 endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..996acd19db 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_ASSISTANT),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
+endif
+
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
@@ -59,5 +65,11 @@ else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_QHELPGENERATOR),y)
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=ON
+else
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_assistant=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
