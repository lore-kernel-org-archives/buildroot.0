Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A556CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A23583EF1;
	Mon,  1 Sep 2025 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfYiCjiktADs; Mon,  1 Sep 2025 20:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACD483F61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ACD483F61;
	Mon,  1 Sep 2025 20:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4EB51A6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B26EB83EB5
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkfZlKB82xTQ for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19E7583EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E7583EB9
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19E7583EB9
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso303184966b.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758770; x=1757363570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=BEhK/d/xR1dTUEdryVYETMPlkQxG6s8qnt+nFXhEIvgCcteq2j37hTPLGPprzVb0r0
 AIDZMDY/g0FOd2XZtAvfo8cMVMCEXOSY3BPi6dq/KUklTbcog2SDstjC3FfG0BV4KteM
 2JZVMHUJt2xw2Vs19wB0CZIkWM0NlJ+Ad8qYyevKnx35NNeKEt7fTSQvRETdJthpzmqQ
 Z0CqKhLrBDPY06FOxfBRDY0ABc9JpNdDQkGIMVhzyrqaDnZhfSPkjFrErx83xQ7ldIcY
 37FSUHBJTok0udRASqAJEtsiDtqhIbsI6r/QwTdTB/65Y5Ctz/o3o+qjJz3c4+J27H7q
 YjFw==
X-Gm-Message-State: AOJu0YxNI8ueI8KGIcFQ3CU/PYJbfAff7cLGQanJZublh3Gt+bbCEEfI
 v66MKIbmBJg9LqXLEGfe6TLEVgIZMiSov3BpZYuFIMGB9ek92GBvFvPWaPcQamgzfONwfvhi+hJ
 4v2D6
X-Gm-Gg: ASbGncvZi7lE6FWrbkIrZcR8HK8ARz7ynsIvuHN6qYhF8PNdVeqhtuwGb2aFOPMPDpf
 maa92LUnI1tlwuku3ageBoPUlcL7tj4nOUQk+09DIAHsErCUVd1id1nZV2f0vpgHcVi5ErCeW6R
 tPeUrlOQDsSu8Rc7v15En25OnFGnZuJHpy43YkmH3RBytPg/sbfMg60JRx1BCXo1kJPpuip6JGK
 m25IqfWCfa2QMgWWB33JuNo2LqjLxV+0U9kHfzaKxyOwsaZf+T0bkjimlq8hohr9qqidFkF34yj
 m+XU1xtxPipWlnqFOvZxcYdoQ4ojriKzB7rkU2vVDyoknUtfby5bOfAkZ8MoUdHJhfgsT/MDSvj
 ySIUX/LDSdlHLUcUCS1Sm4S2YcNrxFW587RSUx4gY9KgqKNtPdIWuJIRjZIrFqvFusFqEryUk4o
 yw3N4LrHgaBvhoQYRAwhwIueK2jsSGqVFJ
X-Google-Smtp-Source: AGHT+IHAW/9ieoSXyRn7nA/q6HGjQneJA7ilGtM3xG5R5IL5EyYv9fKDqdmA/XO3e8Q8UwpycksylA==
X-Received: by 2002:a17:907:720f:b0:afe:c1e4:5561 with SMTP id
 a640c23a62f3a-b01d8c802bcmr933337366b.25.1756758769977; 
 Mon, 01 Sep 2025 13:32:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:09 +0200
Message-ID: <20250901203210.804061-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
References: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758770; x=1757363570;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D81YniUm0d5I2fh0KwtxE7j/KmEcZkOvoWFi71EYJBU=;
 b=lXyiTUrMS5PNcivuc7EmlpVN6q++wxtHN+/P4Cx7tiuaj7Jdxv/7YtpHoRb4d6ACjO
 gbsDEkOU+WCC7K5krXNXZQ3KyTBRj3I8ENTg76xi+EgQoZCJ8jG7csHBsTrohSNuzhiC
 NA93AdgwPkoXYe2ruFNUszg4beBXBOBUHTF84=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lXyiTUrM
Subject: [Buildroot] [RFC v4 4/5] package/qwt: enable build with Qt6
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
 Richard Genoud <richard.genoud@bootlin.com>,
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
