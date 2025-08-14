Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F8CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF72860D6D;
	Thu, 14 Aug 2025 15:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7AKkem1iGak; Thu, 14 Aug 2025 15:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7293860C0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7293860C0A;
	Thu, 14 Aug 2025 15:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2757B271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E33A40E84
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dudw9lNtzXiT for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47C2A40DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C2A40DDD
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47C2A40DDD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb78d5e74so173482166b.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185604; x=1755790404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=iDJzp1kSA4kBbmPvJ8exycsmSFEf6HdQT+9p0QA59Ve7d/urAERw2ciCRF0hFE/dIk
 f7orbRYLBkn8ToYXin/o0pU/N2ujQZr0W4yX767xj5EILZXIahFMADYhjNlbTNaPy0yA
 Ts2PyXMoXn22oH6GsuJWFc7gfKU43K4EOsG6x5lR/zzm7XoJdfqPq/qgYsNWlFbquGbz
 eaNbZSecbInD3wzMc+NRrpBU/pK1QGq2E/3DnnxGDouhJulluJVwyiRImgvybmGGanTw
 SYKQkylmQSA8+HUYKzoa9786L2pfpfTyKvSPc4o2c8E4fc/rtV7b1fuZpXJyuH7FFkUP
 Tq9A==
X-Gm-Message-State: AOJu0YwN6CHktzpmWGetOoZl/m23oUPSKrWTkkdetmiGF7kcuUYDbqXE
 VspxXw63lJjoHRTS3HQ6jdW2ok6R1DozhUhck19mNz1cD3+eb/bslwe+UqbLb8A7+/peERscp1r
 FMunmLOQ=
X-Gm-Gg: ASbGncuFPw1RYJgEVPftD84QJ9mcAdeji9nRyPPfUVw2T7tXNyG80SbzPQlXfkh93k7
 Nl/N7ZvSAiANrxJKGNBqumcKpSkUVGbMTO1ji57zikC0tMEIU8V/JVOWp1x5MzFC1Ji9OAlQgy1
 q1WDUHfEG+MYoWka5VVy3mdtlZVhaqBXsQohuetujTsKS+f7RxGO4LOjaHKuzuy9jLZEmGNA4hZ
 0v5ZVAofFEoUbyQAAZr8l9wqhfBsFnul+xhJsQiQNxClOWgu+laMrS5OtA0IcSUaftdoV9dPpxI
 VIIKDz0UEmnDNdUIgXfom7Z9Z9U5cH2PJ2qj1/Rqmvitkxk6oIeXPRoPw2DbDbVXITKzVVxqhNO
 eCgz/o+2/niuzTKVNX4gIausXWCoS/UM31sMNiOjl7273xytV+vSj6QNye3TBm0nT5u48OwdADX
 RM
X-Google-Smtp-Source: AGHT+IHdJ/Fkb/YM+r20kIbMiEVt7QY0WQdkLthq6qAW5hNzBqaRbAB88eqP9iiNQJNreKKpGBcV+w==
X-Received: by 2002:a17:907:9815:b0:af8:f187:3222 with SMTP id
 a640c23a62f3a-afcbe1afac3mr280899666b.33.1755185604170; 
 Thu, 14 Aug 2025 08:33:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:58 +0200
Message-ID: <20250814153259.6822-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185604; x=1755790404;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=FLWRKjUh9cHZdFUejlm1GqeviRiA+NI0wETK+Lc335cRdkBJMZMYoKQS5m3+uPTKSA
 OHJ9owr5vzBekztP2+OLqAaI20YuVYv7rTA6rhCUujnplPGNBZM1PwqXCmU04yS128dc
 oWh0VjY3gq+u2FpS4v96vqXj6vJdiWDBsR3bM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FLWRKjUh
Subject: [Buildroot] [RFC v3 4/5] package/qwt: enable build with Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 package/qwt/Config.in | 22 ++++++++++++++--------
 package/qwt/qwt.mk    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 736ccc2a5ea5..c816b48a0851 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 67292ee025be..0e835c700e16 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+ifeq ($(BR2_PACKAGE_QT5),y)
 QWT_DEPENDENCIES += qt5svg
 else
+QWT_DEPENDENCIES += qt6svg
+endif
+else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
