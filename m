Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B33CECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3438940FDE;
	Fri, 26 Aug 2022 14:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3438940FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GKuKGC_cjIv; Fri, 26 Aug 2022 14:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2655F40FBD;
	Fri, 26 Aug 2022 14:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2655F40FBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5601BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 532746110D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532746110D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiI42riKUzv8 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB3D6111F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB3D6111F
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so3282344ejc.10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eyy7v/neTwXzju4ap5X2dJSpEEkyMX/0Ub+GbHaLwjM=;
 b=mGHUh5hZikAqO14fZnhiEyntbp/KUwwxew1DYxgngiD80w4YLM8p/wnoP5IfW6ceDD
 3TR9YTcL52Leh2M5knV+Jo93Ct1LFqf3wLEVYdzUxUghl4x7joBDMD8U6WXEyFavQaMm
 vKyfINGnCRJ8uTmxTu+EmkJXyd74PD085WpLF70ce6jxBqAwkN1pyRt3+c3h3FkYQL4m
 QEi+94dfvsEd3f31HoRgMxKjHopLCq4Vylydcy5v2XB5vCzOea9RwB3dCynJj5cCsENE
 BHbw0WfbJslDDI9xgLcrfUNfFEvbqL6o23oH23cK7VpMVtiZW/Dh05H80w4TzWf5DRa+
 cl5Q==
X-Gm-Message-State: ACgBeo0cnmaV8vxZ638UcoAF4YTIorlUiOs90rbR3BozJuov+6pqRQTn
 pnv39Z3jatxNVta+6KAvmVNgTt5wgbZkzFEJ
X-Google-Smtp-Source: AA6agR7nt1i2XapzIuwdUviVSZyQtp6xf6SQq8JliGdNvEwyDr5+lKB4QkEVna768Gb39eMNKfderw==
X-Received: by 2002:a17:906:8a77:b0:73d:deef:8f76 with SMTP id
 hy23-20020a1709068a7700b0073ddeef8f76mr3140925ejc.765.1661522129226; 
 Fri, 26 Aug 2022 06:55:29 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:28 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:57 +0200
Message-Id: <20220826135503.20612-24-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eyy7v/neTwXzju4ap5X2dJSpEEkyMX/0Ub+GbHaLwjM=;
 b=IpJMrvgqNg4oN3IHkczjbuFK7jh4Fnv0cNjAMQmKNb3H/1pXclJNgQ19UfJNo6FqOO
 icealAZWeBaQLE3DDRctM5nK/jbRmIIDJwMbfflRAnGajOJ4AkCBsJcyPdstlPqNY7XH
 oC5sJu/cwJzBbOaeS93lZT+YPQ1t9ZxAZG3nhQ+hd1u/82qvY5zqcC4Sa+zKmdrEmGsF
 uwEP/zxkK2zn0TQDPhTwrAN9jX7sLwaHU/Lz2h4DnP37qMy94SNeJeZIlseh9i6PwZpa
 qX8nO4kopcUbEA4usuVRxBqG6MD4WcuDS+eyl5KrGuPdYii+mBmGP1FjP/BNQ30v5QqH
 3j8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IpJMrvgq
Subject: [Buildroot] [PATCH v4 23/29] package/qt6/qt6base: Add support for
 gui module jpeg/png/gif image format
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 19 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index db510989ca..9533076f54 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -65,6 +65,25 @@ config BR2_PACKAGE_QT6BASE_HARFBUZZ
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
 
 config BR2_PACKAGE_QT6BASE_ICU
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ae6c482197..029afdd79b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -155,6 +155,26 @@ else
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
