Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33119C636D6
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC3341853;
	Tue,  7 Feb 2023 14:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC3341853
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oT5NwkrsaCWw; Tue,  7 Feb 2023 14:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5F9417B9;
	Tue,  7 Feb 2023 14:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5F9417B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D493D1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA49409FA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA49409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yExtCzNIR9k4 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E10E2409EE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E10E2409EE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso11607992wms.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IY4rMw8vyc45J1XSq/R+QFODn2VtK33THYx7HekX1eQ=;
 b=yKOD6yBwhu2R5gyXDv1VGqti2jmKVFkjFYf9xNQtnocOycBxDYdP9gOZuiEaZYWL4P
 9ZoHCnxNAtZaW4fHrAEvKntfpcVN3vIuNB40bXc3dxvB31lVUDJCbEO16yXdMtTyhIZU
 QFVozZGfU4AQbl5+VC76+N27Envt8il9mqkzKf3NRSLsyqmy+17/whhAcTk5R/TUEW5g
 PEnSWsF+tgV0weiKahraVVd8wKt7B4vGvnIi17TH9LCWV/OsPkLtvphPwqElgS1xQLRU
 ic1p/KS0znpnCS8hR6QuY4ja+YXzPhU1hsg+4o+C2jxJfUxHmrfRHdsDl3XoTPxAeKXr
 IsQw==
X-Gm-Message-State: AO0yUKW12+icquwy8HiQCX2D4b9xK1Ua4Vv+hzMkbBuSvEnIq82cH2ub
 NjU24pegVTrHi8+d9HUnC6mjkZ4PxZgvoZKy77ZEtQ==
X-Google-Smtp-Source: AK7set/vm05R/cKucAb47iJMmCtt2fyvbaE0fZ+xf9vtkbRna2RTz9jJQigpO1fZLfNBCN6S5dMgBg==
X-Received: by 2002:a05:600c:3296:b0:3dd:dd46:1274 with SMTP id
 t22-20020a05600c329600b003dddd461274mr3311274wmp.4.1675780212763; 
 Tue, 07 Feb 2023 06:30:12 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:12 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:29:57 +0100
Message-Id: <20230207143006.2681335-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY4rMw8vyc45J1XSq/R+QFODn2VtK33THYx7HekX1eQ=;
 b=UAfDoPjMexbJzTIRbyk78F15vG2HKQQH4MNur/ILbDPQzE2kotTk2SySgKPaPhI6y6
 DMe9IWBjpzW7aaO0IebqFLa4kdRUV+NwIeAJjKk+YX5YeEsCkSsT52YyA3RBb8n5w0UL
 SUJGrhRBCwyiwmUohz9tEOgBaCb4kX663dPfg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UAfDoPjM
Subject: [Buildroot] [PATCH v5 03/12] package/qt6/qt6base: Add support for
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
index df9266ba31..aec9e6d00a 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -55,6 +55,25 @@ config BR2_PACKAGE_QT6BASE_HARFBUZZ
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
index d1e409f35c..0060a4a3fe 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -164,6 +164,26 @@ else
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
