Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A17E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71F7340909;
	Fri, 13 Dec 2024 11:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KI_wdqA8P7M8; Fri, 13 Dec 2024 11:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 561FE40CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561FE40CF7;
	Fri, 13 Dec 2024 11:58:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECB441146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62C940D97
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkYjy4ty2pUE for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93B524091C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B524091C
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93B524091C
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:47 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso13764941fa.1
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091125; x=1734695925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGsuW5J/P7/DEOkDAlS/AepUvxKR4T694bOsL0t9Wtk=;
 b=wZzimXxdSy1EfM1vM7rNkxZoLmoKLcfcxUtaf1B8aQYI+lJajO+svWOZ19KK+DEZWH
 qimdR232j1mObmz2Z9QLJRHIGNi1n58SeJSuZV3qVyuQjQLQWWqPmB+QIY3ifxNjsZ7T
 HzzcKqCjutxhjwSin8x/mf/sedw5gaMqW5RaW79F9O47fdP+Jwt6z1ZcPmWAm35KjSlX
 32cLbkA8dgdFoXgtRneEX8WOsuS+ntMvlet2tZxrTNURE7W+HJiKpDL4DIb3jvFlsBNb
 EguF1SeaIBRzsC5xYn4hdYlqhvOwg0EDHvMZ4GlPpAQsK6JrpMbA+dNdnj/ZX82z86Dl
 AFlg==
X-Gm-Message-State: AOJu0YygaIxu3VX2ZQPcQIbAUgq0foeqAR2/7aLV9seuBpelhpOSF5eU
 3fpTfgqcmJyXPY9WMEtPcy3fVWrRF0XmCI72AMHRHuot4jq+qgFsiWVJiQ==
X-Gm-Gg: ASbGncu0X6P00HyV+ysnIPeZZy+92Vfk0o4fQVFhykJYil9kqLj8nSCXZ9lC+72u1/2
 YDXRTYW13ZFgRq5Ac2MEWUcYO3dctjvVisqDEwa+kpct1ynmzrDmzeqm3cw+pHwE/DSOlWtkfFN
 07SKQAxtagypY0A1NcyDkD434JVOpuoic9FQK/MlK4GaTV45MzQNUubdZgdDHgRbg9PA5QTRPrU
 j9NV4yfkeOr9w5UiA4CiJi9hN7x/LRXRFwq0Sfn6zooc82R3DSpRckrFjW6F9NySYTfJAzSUC4B
 hXoaWJ2S/ho2U2w=
X-Google-Smtp-Source: AGHT+IEzb6e/7QE3BLUcNeIU96SsWwk5W3CFzCXoySkBSqGbuu7T2qMFm4D9UQj0yK7miuKhjJkJ/g==
X-Received: by 2002:a05:651c:226:b0:302:4115:190 with SMTP id
 38308e7fff4ca-30254427186mr6536681fa.6.1734091124958; 
 Fri, 13 Dec 2024 03:58:44 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:43 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:11 +0100
Message-ID: <20241213115820.655993-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091125; x=1734695925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGsuW5J/P7/DEOkDAlS/AepUvxKR4T694bOsL0t9Wtk=;
 b=dTCo/NQ96Ozat/FEVMk+BRoARbE6fTwPUcxSGYM0KHezkTnCYTNn0+09WREhAW1bAN
 Y9Tq0UtAaz/sQNY/JnFa6BM3EC4kr4kA4IjqZ8a+cwSuDy+Eb8nEam7pgXqGLXeSweoX
 fM0k4gqSrvdbFaZpSMRuFZHx2o8DdxCKlKSFCXe4Ek83ekC4/ibzeXChc7wQL/onpaKS
 l0W3qJsdp7Iyj/larhj0IEItTxpaEY72ynlrX0cljZRBLlGX8z9QeMYAHlNycz9isaJb
 u1Al8hBo8Vpv74u9xmXUrwJYOz0C39AOZ2gaCILT4qOAqR/IyoU9p67/wLQLlRYEUsiM
 7G/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dTCo/NQ9
Subject: [Buildroot] [PATCH 4/8] package/qt6/qt6base: add blind host option
 for selecting 'Qt Concurrent'
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

Needed by new package qt6quick3d.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 3 +++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 46fb668817..a6dfb40c34 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
+	bool
+
 # Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 888654a216..153fe1abfa 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,8 +83,8 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-libb2 \
 	host-pcre2 \
 	host-zlib
+
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
@@ -94,6 +94,12 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_CONCURRENT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
 # We need host-qt6base with Gui support when building host-qt6shadertools,
 # otherwise the build is skipped and no qsb host tool is generated.
 # qt6shadertools fail to build if qsb is not available.
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
