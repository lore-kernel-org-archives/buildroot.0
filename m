Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1477AC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB0F6100F;
	Tue,  7 Feb 2023 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB0F6100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eum42QJ2IFbB; Tue,  7 Feb 2023 17:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EF76100C;
	Tue,  7 Feb 2023 17:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EF76100C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D03C81BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA24381398
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA24381398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMKdwNpkwBSN for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C0981371
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11C0981371
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y1so14288504wru.2
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzXwniSD35IXJw+2geGzA3K62SjPrn/GU6f21D9Eg88=;
 b=47KQapOG62VqUWm/sJmMrO40X92VL2CZ7iB7/piGRdh6BrsxEt86BwEp17PIQA1snP
 UYJ0YM5UxMhggR3o59R6//RdIAIasxi93Mu9PYmDMeT8jKLFhicv9F7BYfFWQ0yzF83q
 YdI1xCLuZ5R38XyCKaWapERMNu01JaQWjVSoIGoOmR7fvt4s3oIrCCaPphTnTGxNq/8z
 NhWj0LKbZZS697nFC/5o+UMcPTdPDtaHrLY0JKB3mkwZcl46f4dTShetCn5nu6j99oON
 Wi8i3Facx7C5weLVKaPpJrKa59YSfHL6XU/S6eiKm0Wdbl6A6XmJiyDvQb+pPnSodpfh
 rWGg==
X-Gm-Message-State: AO0yUKVqa/DjCSz9ZNuiIsLgqlf9EJ6EXf840+MQcuwI8jQtRJccNj7B
 3ADNXE0e1lz++BdfKaB8eCORxgMpfvXpoxZimJZ0gw==
X-Google-Smtp-Source: AK7set+pr60QGGDZ+ev05RTdwCfNQVyBKa4+NBakPyY1Q74CuZLUzb6HAEp7DB+w0azq5B/CcIQoTw==
X-Received: by 2002:adf:e98a:0:b0:2c3:ea95:4726 with SMTP id
 h10-20020adfe98a000000b002c3ea954726mr3682381wrm.34.1675790251969; 
 Tue, 07 Feb 2023 09:17:31 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:31 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:11 +0100
Message-Id: <20230207171721.2973997-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzXwniSD35IXJw+2geGzA3K62SjPrn/GU6f21D9Eg88=;
 b=oLGkXve4EaQE3k51Fc1BSC2Bc+f0HBcpHX6XzIfcmq9IGkAHz0SYShMj7Dxxzur2mI
 xpSrPRa4+VI8McPB3dPAxUJzcsXaIiSyTloONbp6+9xwacJFeZgHzmCYN+tOcV7+kdjO
 /rTBjKsGsQhdScNrKrFmZOkB98mcXroJUEVPM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oLGkXve4
Subject: [Buildroot] [PATCH v6 03/13] package/qt6/qt6base: Add support for
 jpeg/png/gif image format
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

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 19 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 594221b792..6c5c60fa30 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -76,6 +76,25 @@ config BR2_PACKAGE_QT6BASE_HARFBUZZ
 	  if the toolchain supports __sync for 4 bytes, or the qt
 	  provided one which avoids this dependency by using QAtomic).
 
+config BR2_PACKAGE_QT6BASE_GIF
+	bool "GIF support"
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT6BASE_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option enables JPEG support using the system libjpeg
+	  library.
+
+config BR2_PACKAGE_QT6BASE_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This option enables PNG support using the system libpng
+	  library.
+
 endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index da67b12c99..06ebbab8e7 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -186,6 +186,26 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+QT6BASE_DEPENDENCIES += libpng
+else
+QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
+QT6BASE_DEPENDENCIES += jpeg
+else
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
