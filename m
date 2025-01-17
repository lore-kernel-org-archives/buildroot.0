Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32896C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E466FB2F;
	Fri, 17 Jan 2025 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi9JtXKfAvpg; Fri, 17 Jan 2025 10:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6896FB38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6896FB38;
	Fri, 17 Jan 2025 10:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C18E994B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA7140283
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nHWWRz9pefv for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD0D94013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD0D94013C
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD0D94013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so2156070e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111257; x=1737716057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sb2L06phURbXgb3O3fQd5F7HCam+oCHCnlsY0PJYxc=;
 b=RxtDxjhLQS5PcgutaI0vv6UxPUbX+3LB74QqbVczA4ccx78/hLWAPdXNBj+klfmsnl
 RnGBzPVTDuQ2SV2d8OPALu1Xlgy17/babFM6aiXOrJLfMX9E1oj6Q50mdmFk4fhW0Cqk
 c+M0EUPw1Eb0PMy61LGenVEinLQ43Fi7iV+lwUOwiwy6GlVqAotnAkrsvzSt/jGbEotF
 Nf/RPaUECwAF19bdxrs2sEz8Yj5wFUKlmQ4z1jVa0oD+/RzxmKEScXf+reHlEjuAhY3f
 gpl0cDwiqAZTk/0p3BsiUX08lD5a+RExhHVSJ/rKFXkOx//ajZTtxrTtYOEA3YTXyG4k
 QmoQ==
X-Gm-Message-State: AOJu0Yx/++9z2iCvR53QkNwzIC5aKwpsMBmsztIfRfGj1XCIkjZO/WT0
 USyfUxrGvOMfMH+IhhAeAkR9snZLsbVJesrIMcMllFzRHLTgDsieTI78nw==
X-Gm-Gg: ASbGncsOp8k7KxzGUTf8Nmg05jn31lFcj44B6RVoH4cE6RaZPmQEH9cIwh8yDCE1n7n
 C5kO7tNNgvm7ocIFvggcFsMd7AAgGpYY2aiw/x/LKxNEDIDoHMUPPgaviFLRofJINwyWNf47w5Y
 dIe9EAMQhLS2HE3F6PCfMkLq8Kg2liGoWdgH+KuuOUwenJbDwG1ppgn5ajjPlaauT7Gc4eK0D4y
 DH5DMhtBrdYc7s9M90jsaFGre1BbTygk4xcdCR1uLviGMTztU8eTFFanuMG3vAYdoFjkGETZh1z
 uI5BUAf8oqA=
X-Google-Smtp-Source: AGHT+IEM7S3AyJaJ1/REKs7vkv1MmELX+QTZxONa7EPF6J/I9uqYC9mjjbJwZ4jWFOmZ+PdWm4jKLA==
X-Received: by 2002:a05:6512:1312:b0:540:1b53:d413 with SMTP id
 2adb3069b0e04-5439c2824a0mr569054e87.40.1737111256441; 
 Fri, 17 Jan 2025 02:54:16 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:15 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:30 +0100
Message-ID: <20250117105354.618220-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111257; x=1737716057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sb2L06phURbXgb3O3fQd5F7HCam+oCHCnlsY0PJYxc=;
 b=drhXcyf1S9b1ziIjZgVcVZjMDBnb3DiupAVRYjhu16QXWZm1eU2TrTtFqUFa8y0kSj
 WXm8mWWW/B3zhTImQTIOqE1Li6NG99qBcOCnRWUOv5oa9P9FTvhRx2D27rWppwKlpng8
 rNtzzfQAMcH8nvW3QdRc9o1W24lyqCzQ1kFrGQwuID0DJfupj8HfY+bdN0CYCCOMmiB5
 W0s8TPcn+CAGWuNK7SxV4JM1jydlyWgY5VwXvmClHaKMJ9f73B2faxKmL+IAaYl5+oy6
 qywtLYn4OsjMNaDgS/v3mfx8UxjZy/RMPJ6aU5TDoCagLCYEpmmuxnssXDZXVWK9zRI4
 si3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=drhXcyf1
Subject: [Buildroot] [PATCH 07/19] package/qt6/qt6multimedia: set
 dependencies after conf-opts
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

This way we get alphabetic ordering, and follow the same pattern as
elsewhere in the file.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 6aef78bf02..31c3405b5b 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -34,10 +34,6 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/COPYRIGHTS \
 	src/3rdparty/pffft/LICENSE
 
-QT6MULTIMEDIA_DEPENDENCIES = \
-	qt6base \
-	qt6shadertools
-
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -56,6 +52,10 @@ QT6MULTIMEDIA_CONF_OPTS = \
 	-DFEATURE_spatialaudio_quick3d=OFF \
 	-DFEATURE_vaapi=OFF
 
+QT6MULTIMEDIA_DEPENDENCIES = \
+	qt6base \
+	qt6shadertools
+
 # for multimedia quick module
 ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
@@ -104,8 +104,8 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
+QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
 endif
 endif
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
