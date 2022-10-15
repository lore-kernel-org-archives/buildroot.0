Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382CFC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F0E40600;
	Sat, 15 Oct 2022 14:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F0E40600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3BMS6YB8p8B; Sat, 15 Oct 2022 14:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A3EC405EF;
	Sat, 15 Oct 2022 14:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3EC405EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 312F81BF307
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F9760B2A
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F9760B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1WmTrwMxKje for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E337C60B01
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E337C60B01
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:26:08 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fy4so16064663ejc.5
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 07:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZGu+RHDemGRmmMzf5FGHB4KnehDPNxozJNovvYI97o=;
 b=ukA26aTCSlSv4JKuKXkP81n3cfZQHZW3JJeRUQZvB6LfSXccFgaCpN7zzAoOpd72+Z
 UH1uyPmOEhIP7yJM1fZLH3yCMpXVeEwqYWz+jNHPCeUgSc5vfMdZRiVh9DusmAJWKz81
 8datsj4vRqx4hlrLydZsMxGX40ljBZ3O6Fa6ar1Om4EhrhWecjQZdFaffz4fPlz2we1R
 xWFvXjsrjSztpofLGqQdUjuxFhUbwyv2iEvOO5lOw3zZV42suRnYceaJyrTFi2Qa5E3i
 S1qyClTTM6SWunMQpbjHayi+0uqWPEshM9XC5BxyWNoFKwAQPJdEQLRld+eQ30aSImJx
 Yedw==
X-Gm-Message-State: ACrzQf0qbdQzKFAa+dEBQ79k9uQGtP8TMy0ZUNhwvlShOxkF/AVvMRIp
 phGpYxesbe31mubnu4MnPBhXOUnCWEsg8w==
X-Google-Smtp-Source: AMsMyM6HTP60fOczN2shJJpmycN3EHOuUVLFBwMnZ/2pL0S9ElHw4In9ujcsBXQJ58rZjhXJuXqXZQ==
X-Received: by 2002:a17:907:2e0b:b0:78d:387d:1579 with SMTP id
 ig11-20020a1709072e0b00b0078d387d1579mr2133447ejc.761.1665843966836; 
 Sat, 15 Oct 2022 07:26:06 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00458b41d9460sm3668904edh.92.2022.10.15.07.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 07:26:06 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:26:01 +0200
Message-Id: <20221015142601.4155681-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZGu+RHDemGRmmMzf5FGHB4KnehDPNxozJNovvYI97o=;
 b=eUDSgcxM8w2bM4McNWJmf9kRnYImBEcXf3854FG8yB87xEXJgmvYAd2KsdbygBujU0
 Z+2R9FmHIWfB42h0cvXXc8nnAhHTil1Bk9dW5L3+BjQ2/Ml6iGg/Bswi14+22US82xBT
 1vyusfY/t4YwC/M6xOTthnx0O/3kH/WT/Yy/c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eUDSgcxM
Subject: [Buildroot] [PATCH] package/cutekeyboard: new package
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
Cc: andrea.ricchi@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CuteKeyboard is a Qt virtual keyboard plugin for embedded applications

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                      |  1 +
 package/cutekeyboard/Config.in         | 18 ++++++++++++++++++
 package/cutekeyboard/cutekeyboard.hash |  3 +++
 package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/cutekeyboard/Config.in
 create mode 100644 package/cutekeyboard/cutekeyboard.hash
 create mode 100644 package/cutekeyboard/cutekeyboard.mk

diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..f11210d313 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1522,6 +1522,7 @@ menu "Graphics"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
 	source "package/chipmunk/Config.in"
+	source "package/cutekeyboard/Config.in"
 	source "package/exempi/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
new file mode 100644
index 0000000000..3c5621f76a
--- /dev/null
+++ b/package/cutekeyboard/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_CUTEKEYBOARD
+	bool "cutekeyboard"
+	depends on BR2_PACKAGE_QT5DECLARATIVE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5QUICKCONTROLS2
+	help
+	  CuteKeyboard is a Qt virtual keyboard plugin for embedded applications.
+
+	  https://amarula.github.io/cutekeyboard/
+
+if BR2_PACKAGE_CUTEKEYBOARD
+
+config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
+	bool "cutekeyboard example"
+	help
+	  Compile also application example
+
+endif
diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
new file mode 100644
index 0000000000..3d3ec2f858
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8cbaddc5fbf479d5e20fc88228e9af5928fa5e588052ee496c2f2efbe2afc510  cutekeyboard-afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7.tar.gz
+sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
new file mode 100644
index 0000000000..3e4c08f44e
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qt5virtualkeyboard
+#
+################################################################################
+
+CUTEKEYBOARD_VERSION = afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7
+CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
+CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+CUTEKEYBOARD_INSTALL_STAGING = YES
+CUTEKEYBOARD_LICENSE = MIT
+CUTEKEYBOARD_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)
+CUTEKEYBOARD_CONF_OPTS += CONFIG+=BUILD_EXAMPLES
+endif
+
+$(eval $(qmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
