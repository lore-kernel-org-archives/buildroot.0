Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46070C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1011F6FB61;
	Fri, 17 Jan 2025 10:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuKznV1ZRfKy; Fri, 17 Jan 2025 10:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB60E6FB68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB60E6FB68;
	Fri, 17 Jan 2025 10:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD92B94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE856FB2F
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4N3zoI0N_ZUV for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42EC26FB2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42EC26FB2E
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42EC26FB2E
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54025432becso2169882e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111267; x=1737716067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lv54gKw7P1mdrhz38nTFjSZAIuIrgmdZvulaUN1v6Ys=;
 b=R/1WwnHTplnah9Nlx32EoHUFW9sywPA3y0ne2VGcl2PfGdY9xa6UzG3jwpraCXgKXb
 GiDEpWc/HhAseZkzU15yBV6E525JLLPa4ib+tT864syKPjxhq6knS2+EJ0KmXpLtpby6
 Yy1+gQFpTnH6sK7YD6yQs1PqCESPyIpaKg2EVeNjMmz8kJrgYSXCfEQJ9ZItIwig1mPS
 BDVLQBCxRFg3YM1svywwI69sPVcP+lkkzE4q9BMQVnnqa9SOcjMl8w9BjGVk55m0elrj
 j+8t1/DaiNoRQz+yK7Gw5LbLHpzlS5L68KRcgtgbrWGQHV24AFBEgszUMgPX5TiGIp1d
 UrYw==
X-Gm-Message-State: AOJu0YxxkH965yQa9svaGgGOv8y+deIazy/BT28cFzciF7rnZW1cO7w0
 qUhlFyCRv/bjdYJdPPCVQNxwOMJcy1GpR5Rf9VUqQJRb9U+9WKgxntF4YQ==
X-Gm-Gg: ASbGncuBlFJRQvu7SHg44s9AacRhSkFWx+PVebZOH25Rs+j5J6WdmjlC+20aP6YJC7E
 l4s8WFyNM4sKrO1GKj5zV086VfWUvZXByRXA65I7a9Agc2LcyoEDymNy0tKjg8a8Sfl6szjHK2x
 ut5SbMOA6kdNiM+hulm96DMoooiZfnqsvdqS4krYCRLZ/wudO8cod2DFkB40y15qDJwok1V/lzd
 dEMWINQQfPmCd7qjXP7c6Z7XpIhGUiK2Jq8OY7bmAa96LQfYwkyEBLH6DputIO6VN2fkM5hQA3N
 jmakbM/oXpo=
X-Google-Smtp-Source: AGHT+IH24ErekDqCZ7VHnAU1wWg0I15pikdx1zg7ICSYBSHRWRPxP84NfNerCfszGeB3vJZ7RLyf0Q==
X-Received: by 2002:a05:6512:3409:b0:542:91a5:301b with SMTP id
 2adb3069b0e04-5439c285548mr771398e87.38.1737111266669; 
 Fri, 17 Jan 2025 02:54:26 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:25 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:33 +0100
Message-ID: <20250117105354.618220-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111267; x=1737716067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lv54gKw7P1mdrhz38nTFjSZAIuIrgmdZvulaUN1v6Ys=;
 b=JxwETKcWe79GkutpHxwYdxQ8Vj2+tzZ72FQ6n/kCzlbxESb1kpKSgSn3IbrBiWWXK3
 RjbjVp23fkQeQpX4G5Kpa5Yljygx1brL/BoZo3Ev911oq4zAkuE2b/49mMXEa78pByeN
 oGs+3zBcrcnYM67Nc8/Kp0E4eWKmHNcYNWKYRnSf823M+UEE1ue9UWG6z5enIGDthCup
 ZbRHT8rp+WmckrB/rleU7ZYOgkhhZRxcoQd47Aj6X2WmB2kFnLhhjzz9zLNeaVz0rb7a
 j+E0SXsf/wJeieRLSyNCpujmaDlsTpo9iUySP7hOv+GmDXSEFbR2So1Rc2xDUOCvnIg+
 QRZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JxwETKcW
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
