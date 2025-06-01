Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF7DC5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDAB6086A;
	Sun,  1 Jun 2025 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UZ-bxpvC6UL; Sun,  1 Jun 2025 10:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB19606C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB19606C2;
	Sun,  1 Jun 2025 10:13:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C0971F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C53040AFE
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evKyL_dGth3B for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6608541DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6608541DD0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6608541DD0
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54e98f73850so3789608e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772798; x=1749377598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ED9IqSjkW3qGwpM9RYCLMdB10X5/wTL085hCtU8RNGg=;
 b=r0Rt4tWuIngxTjIkKAkqGPesuR/HhMIDjZdBotPcVoAIuULjcIpxbeQ1ygSuWBbJn+
 6K8BC01iscwPKyiMTH4ALGPdCFTu6a7/LFFxk1zOA+awCs5UqT8EKhv6v106dwLJsOpl
 k55QGuOF8ChlMOM6mxMNdOVXrJJ66JE72iLa+x1ZglPhei5frkBc+3AKV2a05DJU5IAe
 Yf3VnJFOar4mHHdcoXLk8++oPvU8m6RtssJEWhMNaCd/Ma2jlSOjAVFbBlvCfDs9QrVH
 ijS078A3vvjJTSMondBdLmDvjRY9gEI24zY2E0kw+SxYYwBfy6Ojpa8FZrcX9s7sVJDY
 V1fQ==
X-Gm-Message-State: AOJu0Yw1ZFCHvfntNxJsoD/1BWlQ3NFpNg6KzlfYqc7dv6ql9qFoZCnF
 kolDv7zIF2+ER/p0oc/jeLqnyiU5lyE1eKr996erfiIwsL9Xc4f4tuGZQO4cbg==
X-Gm-Gg: ASbGnctV53zraKXfZYxGbVrXRhPNuUBkg8AnX14kYvI90n59jtdR8/XvsTF4zfu9g13
 TrDTv6CyPEWSjuzSs/KLS1QG4z9W7C5WWthGKKSM1vm8qwFttq5quWKlpd52Tj1B3q9jkoHu6eG
 XFBKjfAwTNY3D3p4MsqGeHa0VNVtEPxqZOcl5XcEZSl9qNbyP4bKp53cyb6uqEtjmKoMLVk1U28
 1x6lAacS7r2yIsLx9suid6wKHBZuaZcKJq235EgMTCt03HMUYGeuPgaIet9IEh3hpJYpyzXS3Ch
 uB0fhuSMRG9kAdL0CTka5SzoxonRXw26PxanWRlJBHP3wtuuyrQGCKOSgQJm1nGOGKeOADTKpyF
 knEoYY7/xdUWTVE9DZDvmigdlLdM+LSs=
X-Google-Smtp-Source: AGHT+IFG3q91E4Gid9WB7q0+odHgWMzKssXb0wrkyNUgBiH0t/0SxGncQQCckkLoryvoN5+JulXKfA==
X-Received: by 2002:a05:6512:3a8c:b0:553:267e:914e with SMTP id
 2adb3069b0e04-55342f52102mr987795e87.1.1748772797872; 
 Sun, 01 Jun 2025 03:13:17 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:16 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:55 +0200
Message-ID: <20250601101305.3198541-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772798; x=1749377598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ED9IqSjkW3qGwpM9RYCLMdB10X5/wTL085hCtU8RNGg=;
 b=Tzf/a1dzsKxZhjgQzXl3NlbuGfU+dHi7qguvaoa0nW1Y8NqXBw+6dPxXRNY/Sa9rSk
 O7MaqVYJA9a5ZNvHLQCBbgW6xUpn+Jg7KM2XyxGEg0oxxHyqRu/D+PRPhOiDw0Y5y4yB
 G4q3P5+igHkZsJfXunuQyYgeivAx7/ftk7YdMDRK3fqlzKD9ZBIwlC7KM4FSJm5BWrxi
 3cO+w039MgY5dsN4Cs03RqbK+KRuMXyV5bbKF+Ifl4lwuBgwyxds1lJvX+MKE/AvP0Pp
 2dYdj7yztsUTpyUBl43QVJwBrcNeWY2r7EuJkX8txZaFfANDh5V5WKxzOT6rHRzYpQ8d
 RIQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tzf/a1dz
Subject: [Buildroot] [PATCH v2 1/6] package/qt6/qt6base: add hidden options
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
