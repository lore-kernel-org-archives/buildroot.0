Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6A0C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6561D40347;
	Tue, 16 Apr 2024 14:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsXJuNoV7nLB; Tue, 16 Apr 2024 14:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E820B404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E820B404A3;
	Tue, 16 Apr 2024 14:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD9C01BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C81B581320
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxThS-9XECwn for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A9138131E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A9138131E
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A9138131E
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:23 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-518c9ff3e29so2997954e87.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277641; x=1713882441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qYKypuCZ2c1uszEBnEIvhfXD6Jk4ZOr12oBvuA8bJs=;
 b=jAvDNWGPicURszN0X4ZbDfJgKVmqbNk8w55t8WY4Av53+y7iWHz2qQwQI4CUFBh3b+
 Iy7KZm4j1IGGpgsOFZHc7SSKjpk3FptPSc217HNbJPo1wiPCKyrzfjFD9DaR7f8Gddz6
 3flkRIXVnuzDi85mltxjrw2ZkDkBo2aS0wBMV/gQBWMx8D7wyJG0iAsbyU0hpKDw9Rda
 DFP3BYDd+QLvGSyUsEtIe/V7aW9OsRfIV9oETVom9BnoFthliad9E4HLQIWCpkMvOzL6
 7FJMSqQEvAEB6Pj/gcBcd/NT8EULOskFGFtLzccR7YYRLwu9jQEnxEF1GFs9tqMTAK2c
 ysYg==
X-Gm-Message-State: AOJu0YxGCxSesQhSM8UHT5Zu3aUlAL8Qaav1QZ5FH60zAlKQ1nmlsqWu
 wyINcn7RGxh6TzHfIGXSiUlAHtfBYazKzIdyX56/ELwRO94c1OOQR1B0lsFL
X-Google-Smtp-Source: AGHT+IGw6x88j2RP/4p0oKoIM2+MxFz0A3RXY8nGQoWXPvwsMAdlxAVBPkoALxWhmKBdazY6Nj9P/g==
X-Received: by 2002:a05:6512:32ca:b0:518:a17a:2324 with SMTP id
 f10-20020a05651232ca00b00518a17a2324mr8395425lfg.29.1713277641391; 
 Tue, 16 Apr 2024 07:27:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:25:56 +0200
Message-ID: <20240416142620.1751773-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277641; x=1713882441; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qYKypuCZ2c1uszEBnEIvhfXD6Jk4ZOr12oBvuA8bJs=;
 b=aU8cdpbz8997DPBYkUMWu3eD8TjLZWK5RF86/4QPz4OCOlmrjOJ6bP4HMOJpBTz5On
 kCt82qTmZEMc69hNvxupgi6NCYfThkE7gy3QgClhjPv2qxytIW63IFi+BmfN+uQGLbxz
 Znq6ezgS1Kqp8ITHrtTv53tgcIHyU/N9hYW4BCc3qpdrk8eb5Alylxqpx88Y+IsCnh+h
 FpdY1QxozTDZojC51iUNs3+lYWkeGmm2Dw5G/b8FxF6+LV7zcvt+uMDEOv06GrBrHI+o
 RHgUlX6d6Yr4aB/+rL0LCOIiFesy6EtieqIGUm1YGz0NJ/fWAIuHRa2Vn69egWYRrRGk
 LY6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aU8cdpbz
Subject: [Buildroot] [PATCH 02/11] package/qt6base: avoid enabling both
 desktop and es2 opengl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error:

ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
    NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
Condition values dump:
    WIN32 = ""
    WATCHOS = "0"
    QT_FEATURE_opengl_desktop = "ON"
    GLESv2_FOUND = "TRUE"

CMake Error at cmake/QtBuildInformation.cmake:209 (message):
  Check the configuration messages for an error that has occurred.
Call Stack (most recent call first):
  cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
  cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
  CMakeLists.txt:208 (qt_build_repo_end)

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..211808d2af 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengl_desktop=ON
 QT6BASE_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengles2=ON \
+	-DFEATURE_opengl_desktop=OFF
 QT6BASE_DEPENDENCIES += libgles
 else
 QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
