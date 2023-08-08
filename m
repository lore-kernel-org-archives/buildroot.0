Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE34C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA9E940562;
	Tue,  8 Aug 2023 07:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9E940562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4M91KaTmAikS; Tue,  8 Aug 2023 07:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA21402F4;
	Tue,  8 Aug 2023 07:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA21402F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 417C21BF309
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2B2402F4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B2B2402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPjrtledfZKD for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:03:04 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADAEA401F3
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADAEA401F3
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2b9cdbf682eso81425621fa.2
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 00:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691478181; x=1692082981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clPBOdJ6ZgG/hYFaj2rH7dsUU9Fw//SzT+kvJcmmpFk=;
 b=E/7Zd98IlnJsMr93vwa1ojFkKaY8UyCSVa/iugv9cLUQwLWY5G5QaEyoviXwRM9PH3
 y6KgiYuSpqluVLxnJyG88W9hyQ7zOeSg1nLEKtyqkDH15ZSe1FrsziVCwi4cUHJ0ZEWs
 3LSigVcZkxDWfWC6xXBbBWJS0iplfGTVpMESmG3bAmFPAW830zKXsKpk3T+4RQa2oAzK
 IxFsZm28815wxp/J4MmmU4jTkD6ud1hDfHU8ZuHXha6sd1KqtTo3sRv094/Gd4xeDlYT
 U8No7n80ohU5614qi0JFYh0YQB/rrob8HdIBLIGI9m7h0/n4LY15UhooicxeLph8/DMi
 yp9g==
X-Gm-Message-State: AOJu0YySYj8lWRGT/oJoiY1UJBr+gzJTpHW3fRKl89mvRzIEE1hx7U2N
 EgCnya8K48txVTAPFEZNDO8CUgLWKC0s8O8C
X-Google-Smtp-Source: AGHT+IEDjXbRMbwkz6tfJDQAteuTrex8Sn4+2QwOrOo9OpLZXBE07HTdGCiwE+r4LwyoY6Q98dHWaw==
X-Received: by 2002:a2e:b0ec:0:b0:2b6:fa3e:f2fa with SMTP id
 h12-20020a2eb0ec000000b002b6fa3ef2famr7417835ljl.32.1691478180974; 
 Tue, 08 Aug 2023 00:03:00 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb68:2f00:529:a57f:c3b9:5803])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170906198d00b00992025654c1sm6317988ejd.179.2023.08.08.00.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 00:03:00 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 09:02:45 +0200
Message-Id: <20230808070245.368539-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/qt6/qt6svg: use the CMAKE_NINJA flag
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
Same change as for qt6base, qt6serialbus, and qt6serialport.
Missed that one because I searched for --build on an older clone.
---
 package/qt6/qt6svg/qt6svg.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index be0addbd0d..25e87dd208 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -10,6 +10,8 @@ QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
 QT6SVG_INSTALL_STAGING = YES
 QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
+QT6SVG_CMAKE_BACKEND = ninja
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
@@ -25,7 +27,6 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SVG_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -33,19 +34,6 @@ QT6SVG_CONF_OPTS = \
 
 QT6SVG_DEPENDENCIES = \
 	host-pkgconf \
-	host-ninja \
 	qt6base
 
-define QT6SVG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SVG_BUILDDIR)
-endef
-
-define QT6SVG_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
-endef
-
-define QT6SVG_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
