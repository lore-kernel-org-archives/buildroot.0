Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A427C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65ABD6FB2A;
	Fri, 17 Jan 2025 10:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LprYu2rKNxnP; Fri, 17 Jan 2025 10:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 796296FB5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 796296FB5C;
	Fri, 17 Jan 2025 10:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B794694B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9814D403D7
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ina6vuDAzEa6 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9300B40173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9300B40173
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9300B40173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401c52000fso1964338e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110999; x=1737715799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lv54gKw7P1mdrhz38nTFjSZAIuIrgmdZvulaUN1v6Ys=;
 b=Mj8vuvM/NkYCttBJvoGPBxw68VSrClkFe9chLfJkJB+S/MQ0Unb4JPRd9kU7O8rpgz
 7mE/diIRaca+yI40auzMDNgxNHi3OhKgTUAMsCx4elh7eGtQ+XOLKbhpDW8vQwx5CmtC
 4qmW6XqecWvQJ+B57b8gptZX98wv1nVj7W+qSqDz0QBgU6Y8OlnL7GIpquURjnAX/hzg
 2V9QGsrkhhaXXZbYtlweqL9pCH+iAkVBVbeSO3myWABi16lW1uRwDohox9sTkvWCcFaE
 ALbwY88wp/mMu14xyaX/L6vWqTsafHEavRKHGmrvzCELqlTKoHf2gJKTJBVmji/yis3U
 xsAQ==
X-Gm-Message-State: AOJu0YwBkTqjWGTvmFnVFWHLMRnZ2fQ8myQYGaw8KzXAEwCrAfjCUQna
 hklFQxSrjlNnH7+WkYQ2eSMX/UK1sPvCQ6MKP6xdjULpEDqjoGKhocC2fA==
X-Gm-Gg: ASbGncuY4UPMZXD3foIzIsBrQomM1fArhuz98LDL9IZ3u3aprdYIjgfpuZqPuxXN42r
 oPJBu0xYCaC/IcU8TJ2+1XHnO4YdBZQosmD41xyiHvtiwJ7hbUET0PGcp2oxE0+449sukVcH92o
 AFej6pAWhjSLy8vDuRMLjbv9ozSXv+rTBO4tcfQl3NkLxFp4tKlNovMCvp1xRFdgtDo2phcFnMP
 ev1cjcMHjUWYdzoUF6915sKhmTrKYsMd86C7E+eRoCQGj7xIkxZLKburVFaFY9zls78U+vhFKID
 uselBD9+Kp0=
X-Google-Smtp-Source: AGHT+IFgHcRAb+ZEMmSs7XQp5dyNOm7j9ux+YljIXHzgQcCuftpIkHaxU5OBwK1CuRnO8GkPyZr+Eg==
X-Received: by 2002:a05:6512:2394:b0:542:2972:4e1e with SMTP id
 2adb3069b0e04-5439c2471f0mr679265e87.12.1737110999194; 
 Fri, 17 Jan 2025 02:49:59 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:57 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:50 +0100
Message-ID: <20250117104911.613221-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110999; x=1737715799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lv54gKw7P1mdrhz38nTFjSZAIuIrgmdZvulaUN1v6Ys=;
 b=CvMy9wVpSct7LbD9cUkQEGOEZ4FsAsBCfOfrWIcrHgNT/jUnX3xlO1FQw4kfm4mNP2
 WkW1gqUPgKUbvj/ADQ1QZv4YwnOMR4Wn9AGl61VSch0uGZ1qoKTxaLE59v4QeSbGfJVd
 hXsrDOTiTx6ZQoxF/MdYmZ9B4dFwf0VJYeynYlKsC9AvrC/q77HhKqbNWtj6bdX3K+pk
 HYK9hsVShyoMXEd2/NjrYNM137EV/jYIeGlYjF8TUA7SRc7st8In3evLHd+/7Us76mfG
 aTKgU53r439yXGpJP7CzqTPCHFppq5ezaEIiukR6acxyUtBYK0/IqvX3QE62ough522C
 zybA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CvMy9wVp
Subject: [Buildroot] [PATCH 10/19] package/qt6/qt6multimedia: add option to
 enable examples
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
 package/qt6/qt6multimedia/Config.in        | 5 +++++
 package/qt6/qt6multimedia/qt6multimedia.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index ae84ec24a1..d2d4a73232 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -28,6 +28,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 	help
 	  This option select Alsa as audio backend.
 
+config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
+	bool "examples"
+	help
+	  This option enables the Qt6 Multimedia examples.
+
 config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	bool "ffmpeg plugin"
 	# qt6-multimedia ffmpeg plugin needs
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 60eac8c785..1f02d0a5a5 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -36,7 +36,6 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
-	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DFEATURE_alsa=OFF \
@@ -67,6 +66,13 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
 QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES),y)
+QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+QT6MULTIMEDIA_DEPENDENCIES += qt6svg
+else
+QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
