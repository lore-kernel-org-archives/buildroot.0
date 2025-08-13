Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39989C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 19:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D3940E10;
	Wed, 13 Aug 2025 19:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX3LjtcvTDYW; Wed, 13 Aug 2025 19:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001B840B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001B840B9E;
	Wed, 13 Aug 2025 19:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5DB1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1191861BAE
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jptjTiVShBF for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 19:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45B4E61BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B4E61BA6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45B4E61BA6
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b656f21so212745a12.1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 12:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755113185; x=1755717985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=faim+kAf4r0vvrWI6Xsw2fOaedGYoBul7rqdvGKePXDyIEjwEWHYJhaa2EABH4N4ho
 ovLMCUUr7FTU+K9V9JoqUKp3T4gzHEEX6Rj8wWaeGTuQod212BgMSopTHVxH+L5emjzT
 DlzL2ozLQigL7VZLPodjEmf18IzxnB5ejS1cxrCsiu7DY0vNrvPqV9ERfhB/sfUpQg/V
 on8c2sZhV+WHfY8kopbS+SEjBCrREM1FtH+zy3Z6OkBJbfq6XJfXHcWQ2uHVltvhYu8u
 u7SAXpkjah3OHXu/gERqiyKvnX/gtRm6wNBvcDMNwbNHGL5jbkencwTQj+gbO6XAoYqU
 4QLQ==
X-Gm-Message-State: AOJu0YxPe4+e9mxWL0XMLAQS+2PO4L8DZKW2epXvGjt6k+M/UNk1gqGL
 8mR3/ZsfR5/CLEJLiG68ZHxBQAqF/meCKHLZPo5DLiwsYZP9dz1DeTF9kWLtIKLGxiMLc2xo/bI
 6lN9skic=
X-Gm-Gg: ASbGncs5B1XuVTLF3wikeyiS7dleompsZlZ2wNhQ23R5VfY1o1y8lRqG3apvRjKy0x4
 NW8Wz8Lucd1Nfpzs8925NdIHIe5G7X+At+0xpkixP4TWGCAoFluZnLD4CRj3nuU69MtWCtjW869
 z8v0bEdv/O4wsi1ibTSdxsNocvGFluWBbdOwmOSJEuwgBIIc7F1gz12jCRsKvT6RBZlrlFsmhXN
 C7vwF8A2lNRCBljIhdDfkpA7M743CLDnEhFE9FcEQsI3Qka63rYKjjyjw4XNpVOHU8tfNQ3Iwpa
 cjvVLXWS0T2xoan0Ma9Tc14AK4tc080RUBi+k0c8asZ6DXbJO803bwIeyTm861t6DhaMZkE8SHF
 gDVOF5na1RrmsEa4FoTwcWOhxFLEqhvBnX+so8XOzkeW33FPax3Ix3DUXemo07Dmd3VHd2jblew
 fBwoQJ1/A65NHO
X-Google-Smtp-Source: AGHT+IG8DLNRD7IxE+y2i5V+lGIWFvmhabJwiCJBD/9UEaBPXcWL7Cx4H5Ty4kJvCYwUidlL+y7a7g==
X-Received: by 2002:a17:907:6e91:b0:af9:b4e9:8677 with SMTP id
 a640c23a62f3a-afcb99238c0mr31670566b.40.1755113185047; 
 Wed, 13 Aug 2025 12:26:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:3fd1:eaf1:73ac:376f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2453396166b.59.2025.08.13.12.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 12:26:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 21:26:04 +0200
Message-ID: <20250813192605.1540321-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
References: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755113185; x=1755717985;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=OP3KeEniDPvogNk2jKmGx9Fenn3D0DCJ277iq2roA9cJpYaek5IwuxMvYFyDnNAUt1
 ChxlHPhLU8AzQFDt+Lkv5FtnnGfGd2HqflqVQq5Br6m1fa54n2+7K7pHjylNgjiyTg2F
 76dF4EyxOAlFBcoIlMqiEMr5jMykMhFUMV0rk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OP3KeEni
Subject: [Buildroot] [RFC v2 4/5] package/qwt: enable build with Qt6
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
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com
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
