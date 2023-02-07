Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B27C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB7A81DE8;
	Tue,  7 Feb 2023 14:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB7A81DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gp6lRJMKhmps; Tue,  7 Feb 2023 14:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BBD6812C6;
	Tue,  7 Feb 2023 14:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BBD6812C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF2D41BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B91A660F48
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91A660F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1wTfod3_79v for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D508060B9A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D508060B9A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id z13so3693516wmp.2
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFCnaPkhZ5JshYoxSnfZYCVWwTB4kljjkIk5CNzkOGE=;
 b=QkIOLpGbLO8sBtMYChoe3/ax7Vjy/fcxH/EBstCXjVujEEBxnKnfkQeWGKZkVrhuca
 /ltSgW+3lNNrebwUQ2kUqBvvwBTncjiQiImbVqsjvXjQDoGnI1AWB6odvglTEXnU/YcW
 m5vSIZxuc16XBZEWXvudAxtx4U2TIXTrbBd0SGnYDJEEMl7hLARh1UlxBAYZUJZ5Dguq
 RgxgQ8D2wQ5f32ss4Z0rcnMiwaLKMz0+ps5eWwGFg+Ujlr4COeyKHha7byk4c9jmGfob
 YG0qv4yaCZMAMvEPT4tcL5wfnmWrZfr+sLaHnlVUO1bKRAlG/G4B0trBJqCSvmh/hRDB
 hOQA==
X-Gm-Message-State: AO0yUKUEhtDL65NXqxdMyIvY4H5dMxE8WzHy7iumojcN9JuRGYI9F8Y3
 ybfHO1qCvO16BO1GlQFjYjSRTmYfW0vnpC0MC0M7CQ==
X-Google-Smtp-Source: AK7set9hCpVmBjlYdP/CdUKAY6TAmNjozgrz64AtU35vrh4XoLz1FUlkyFEdMzgRcrseGOlb5mn+cg==
X-Received: by 2002:a05:600c:490a:b0:3dc:433a:e952 with SMTP id
 f10-20020a05600c490a00b003dc433ae952mr3236117wmp.33.1675780222775; 
 Tue, 07 Feb 2023 06:30:22 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:21 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:06 +0100
Message-Id: <20230207143006.2681335-13-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFCnaPkhZ5JshYoxSnfZYCVWwTB4kljjkIk5CNzkOGE=;
 b=IuWVa0JuD8eeG81TDSF2azFZy8dN4IyM89ZewCElmmuP+24aKbrS3SjrEvlp1FTf0l
 j/YCt/HVk2XQX9RStlgFBIcjZMwAIgJYwidUqYoLvaZamk9u5tnQ5SC/T+3aQdWoDdMw
 V3Nb+YIBA+maz67XNZjzCDtCCYshX/vjHesNQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IuWVa0Ju
Subject: [Buildroot] [PATCH v5 12/12] package/qt6/qt6base: add support for
 building examples
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

The select option makes the default examples set to actually compile.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index cb2d7d34c2..365a8cca82 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,24 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_EXAMPLES
+	bool "Compile and install examples "
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT6BASE_DBUS
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_XML
+	select BR2_PACKAGE_QT6BASE_DBUS
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_QT6BASE_OPENGL_LIB
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
+	help
+	  If unsure, say N.
+
+comment "Building examples needs OpenGL/DBus support"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS || !BR2_PACKAGE_DBUS
+
 config BR2_PACKAGE_QT6BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9f82cfc276..0e72485d88 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -313,6 +313,12 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+else
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
