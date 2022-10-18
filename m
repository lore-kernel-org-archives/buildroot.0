Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FABC4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 15:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1CC610CF;
	Tue, 18 Oct 2022 15:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1CC610CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXcAezQsJzjR; Tue, 18 Oct 2022 15:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D7C610C9;
	Tue, 18 Oct 2022 15:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82D7C610C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50C051BF5E0
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 15:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B63C402DC
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 15:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B63C402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVPttaBl4aIX for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 15:16:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0732940467
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0732940467
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 15:16:31 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a13so20999423edj.0
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKFRfgD+n2TqSZRm1aXJZejvKAbLSVKO4MO0Kek/1O4=;
 b=16ZJOGJilrnM6lx4GAtivcrGKGfBloRPn6IEguPkYTN59Vf0qb9KYcDXd/gXr2Bqum
 wHWMOP88hpSzISV4yVQayeo0joEbVm+yhWRuliyLjo6wOpOCZ3QIar/H7SOmdNKz08UQ
 AhWnO5QzbcJnw7/I/g4Uc5AhXyqzN0lMD3uRRK/wP1GXOLJSwkTtwVzxSNsz0Ms2zRQb
 Pf0f5YqGu+0/qH1E28adNY1lh+FAEn8g3KttOxIIn5UfLOShkSNGWZ5t3v8K4YXJZNWd
 lprOrEVsoyYLz1TH1T7M0hfShuQDgKuiF77SZPLPcpYqzZIiAAPjnhZhUubyx+4dYM+h
 adNg==
X-Gm-Message-State: ACrzQf04AjELBTSp7jCxlUFm95z4sWFtSs/VgL3qivlO1yyOD3EYneLg
 Uem7NIeR+adoWjbK9vUwijKSj3iGxAtiJw==
X-Google-Smtp-Source: AMsMyM60Neqc5jPqDo7jXUrAkCMzZFzerWGCo5YwfKYSOw6gBKRg1mru7aZ4gMJ5rrmiUnZcWzWMXg==
X-Received: by 2002:a05:6402:2744:b0:45c:9978:eae8 with SMTP id
 z4-20020a056402274400b0045c9978eae8mr3113382edd.361.1666106189921; 
 Tue, 18 Oct 2022 08:16:29 -0700 (PDT)
Received: from localhost.localdomain ([37.161.144.184])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906784700b0078d9e26db54sm7757742ejm.88.2022.10.18.08.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:16:29 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 17:16:24 +0200
Message-Id: <20221018151624.882453-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKFRfgD+n2TqSZRm1aXJZejvKAbLSVKO4MO0Kek/1O4=;
 b=WV7fzzcpXBaj9s4P9fZfsp+LOzzVHyKDfFu/IKBE9WqYCk2QP7RhykNLufmKcfKdFv
 4qQl8crrbv6Df1GI692M5Llyfw0OrCW1lIHms9yx7faZVRyqNGxPWqJy0WXhQ22sguNS
 F3nklxZIHjZuy31r05qfdn4VVwDD9QfTE/aLE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WV7fzzcp
Subject: [Buildroot] [PATCH v4] package/cutekeyboard: new package
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
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CuteKeyboard is a Qt virtual keyboard plugin for embedded applications

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
v2:
* bump to verison v1.0.1
v3:
* Adding me to developers file
v4:
* Fixing typo in Config.in

 package/Config.in                      |  1 +
 package/cutekeyboard/Config.in         | 19 +++++++++++++++++++
 package/cutekeyboard/cutekeyboard.hash |  3 +++
 package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
 4 files changed, 41 insertions(+)
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
index 0000000000..59362f0648
--- /dev/null
+++ b/package/cutekeyboard/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CUTEKEYBOARD
+	bool "cutekeyboard"
+	depends on BR2_PACKAGE_QT5DECLARATIVE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5QUICKCONTROLS2
+	help
+	  CuteKeyboard is a Qt virtual keyboard plugin for
+	  embedded applications.
+
+	  https://amarula.github.io/cutekeyboard/
+
+if BR2_PACKAGE_CUTEKEYBOARD
+
+config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
+	bool "cutekeyboard examples"
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
