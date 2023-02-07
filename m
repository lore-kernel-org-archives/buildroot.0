Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D8FC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF99F40A90;
	Tue,  7 Feb 2023 17:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF99F40A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQ5cs9ACJkwG; Tue,  7 Feb 2023 17:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C41540A68;
	Tue,  7 Feb 2023 17:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C41540A68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE0C01BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F0860BB1
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F0860BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suxPzX3oV7Mq for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269656100E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 269656100E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z11so274482wrl.8
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPf6sURic2FPDLE+R5nDIeFGx2B/rjkRm1lXntLmMtE=;
 b=knmKkKjjPzYFzyWHt2gE5JOOcbmtmoSWfPMB8adUaMHv9ubRai/ecF0qfmCyniMDGv
 IYe7aB3dw5SC1QIee4MfUYJawTYNBdVTAwqwHBXqHQs/fFF0HPA96KXKk1dIoEPMIKGr
 sPH8ApWryFuQGmPxpAVOINb8HLuA+pY1lgyqbpl/GDK+w70bh5jvu3k+Big+CcwtaqWT
 16QAhDg4eXTk0Konk25lmdz83+JyPL6jqBHCw0AEby8yB2JpDGZCVerYDzB+4fbSZsns
 c+Rmj5URyLYLCAk0cYqXZ6vx0q4doVc34JwbA4AMbMElOlYQZu7k7tB0+PvJjPJVnHx9
 UXdw==
X-Gm-Message-State: AO0yUKVEdGEUgTEBaxygxVn8y1tdohUYOO8hyUEXPm9ijvZcc8VvLnIL
 G5hY+NxmrExQkyMbQ4YkdQ5dzvanzbThLhFNj3uQKg==
X-Google-Smtp-Source: AK7set+Mf1QcuXb+d1ul0lL8iVjxseIqFlKvX0PazmqYa4FUBJzdK3iMftMxsfbTQLkLYB6sVHDBFQ==
X-Received: by 2002:adf:f9ca:0:b0:2be:3501:3645 with SMTP id
 w10-20020adff9ca000000b002be35013645mr3528993wrr.38.1675790262033; 
 Tue, 07 Feb 2023 09:17:42 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:41 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:20 +0100
Message-Id: <20230207171721.2973997-13-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPf6sURic2FPDLE+R5nDIeFGx2B/rjkRm1lXntLmMtE=;
 b=YZKxq2wPzZnF7XYr993ep1Wv0AyGwzfgdjCr56yA9De51KMhMPeHp+0PZj+bb4wicf
 kgxi1btresTqDKes7GQqky6r0SmqLqU8HIGSPQjTFm9hII1fOzXijg8Q9MyJxwhxSuma
 agtIEQ22zMgVsqAZbFyRWC1X118warWTqloV4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YZKxq2wP
Subject: [Buildroot] [PATCH v6 12/13] package/qt6/qt6base: add support for
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

The selected options make the default examples set to actually compile.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 4d13128661..4ae5e96ef0 100644
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
index 97986a3c2b..ec1c65f827 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -310,6 +310,12 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
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
