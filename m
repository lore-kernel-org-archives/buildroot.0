Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A05C64EB4
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA1783ED0;
	Thu, 17 Aug 2023 21:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA1783ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mds70Gp5Tv5a; Thu, 17 Aug 2023 21:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7015983F23;
	Thu, 17 Aug 2023 21:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7015983F23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B1F1BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B3ED40297
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B3ED40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcR1oFqqCjRA for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:59:04 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AEE340003
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AEE340003
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bdc8081147so9870245ad.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305943; x=1692910743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BXwdEEaHHnsPw50OCVi6gLyBOYtjBcQsD1sxDviJOc=;
 b=gQhN8t3jsfj2Muh69ajJOBlYNCV+1KxdJ/oTvZEFZZt75YeKNWA66qtteRvZnQ7Fqm
 PU09sQxIb+RlzuBY/yyFJAi1HEo5wgX6XAuI+TaYGwsuuD1vBUgJW0p1nIZs+w3HdOci
 RoKLbyEA1Swwz3WreW40BuVnefRvc8MWOSEMGcEk1zI+6s2Koq2ijXXrwJWurSSWQ/MP
 q8qQKA8d8dvM0vR62Imkf+qp7Tn1y0GBg46/tPDy4DvblyNoQzSTsPJ6gm1idvFWTyVF
 2iEBEcss0sYiuBTPJcOxRtKBr7lg726x4KF+222UD6zLiQ9zIGj/PM3XZEDq+26fYCPa
 NiOw==
X-Gm-Message-State: AOJu0YyYm8Uuqaj4T2WCliT5POpEUexEzAZ5Us/COIOAe5MQC37Sq9Lf
 mwnMK18U2IqkQ4ETPED3yE0qwembxc7mIx54uuA=
X-Google-Smtp-Source: AGHT+IF/YrXNJIpFe9zGFpt6+syNFI0UzQ8AN6xb/VvHD8EPa7qmsMttds85Qpg5oM5Ml7ISDcOptQ==
X-Received: by 2002:a17:90b:1808:b0:26b:535e:fc12 with SMTP id
 lw8-20020a17090b180800b0026b535efc12mr617460pjb.7.1692305943206; 
 Thu, 17 Aug 2023 13:59:03 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([75.174.130.12])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a3f1600b0026d034f6badsm243143pjc.38.2023.08.17.13.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:59:02 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:58:53 -0600
Message-ID: <20230817205855.1556239-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
References: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692305943; x=1692910743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BXwdEEaHHnsPw50OCVi6gLyBOYtjBcQsD1sxDviJOc=;
 b=JfltcKvakN4CU6W6RKDm5XkCzYN0kgd1aqVgW29Wcfn+XKjkp8YR7K6gvvq1IzzS59
 liSZ1uoQFGFuLwgJeQm1MFY9ydg1kfeEvUCSFWI3uq3Kqr7Y1CkgrFP/zDAXLqi91tGy
 4gRjGr/DAFLpBY50q/gnla8BGci/JTG5YEDDQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JfltcKva
Subject: [Buildroot] [PATCH v4] package/flutter-pi: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flutter-pi is one of many flutter-embedders. However, flutter-pi is unique
because it doesn't require X or Wayland to run. So long as there is support for
KMS and DRI flutter-pi should run on any platform that flutter-engine supports.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3:
  - Add -DFILESYSTEM_LAYOUT=meta-flutter to conf_opts. This is used to check
    where the icudtl.dat file is located. Without this change, flutter apps
    fail to start.

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/flutter-pi/Config.in       | 41 +++++++++++++++++++++++
 package/flutter-pi/flutter-pi.hash |  3 ++
 package/flutter-pi/flutter-pi.mk   | 53 ++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/flutter-pi/Config.in
 create mode 100644 package/flutter-pi/flutter-pi.hash
 create mode 100644 package/flutter-pi/flutter-pi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b3b0be145..5292315bcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
 N:	Adam Duskett <aduskett@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 6f385ff697..bf29825752 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
new file mode 100644
index 0000000000..e816af46c3
--- /dev/null
+++ b/package/flutter-pi/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_FLUTTER_PI
+	bool "flutter-pi"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	depends on BR2_PACKAGE_SYSTEMD # Event loop and dbus support
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  A light-weight Flutter Engine Embedder. Flutter-pi also
+	  runs without X11, so you don't need to boot into a
+	  Desktop & have X11 or Wayland load up; just boot into the
+	  command-line.
+
+	  Although flutter-pi is only tested on a Rasberry Pi 4
+	  2GB, it should work fine on other linux platforms supported
+	  by Flutter so long as there is support for KMS and DRI.
+
+	  https://github.com/ardera/flutter-pi
+
+if BR2_PACKAGE_FLUTTER_PI
+
+config BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN
+	bool "text input plugin"
+	help
+	  Include the text input plugin in the finished binary.
+	  Enables text input (to flutter text fields, for example)
+	  via attached keyboards.
+
+config BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN
+	bool "keyboard plugin"
+	help
+	  Include the raw keyboard plugin in the finished binary.
+	  Enables raw keycode listening in flutter via the flutter
+	  RawKeyboard interface.
+
+endif
+
+comment "flutter-pi needs flutter-engine"
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
+
+comment "flutter-pi needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
new file mode 100644
index 0000000000..8491a727df
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  06b5544c8538bb4a56cb49aa91e97bc0e319ca95a53414c8cfcc78aad2fda616  flutter-pi-004efdaa31bb9ca97938a6b05695496163fe1179-br1.tar.gz
+sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
new file mode 100644
index 0000000000..504d823265
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# flutter-pi
+#
+################################################################################
+
+FLUTTER_PI_VERSION = 004efdaa31bb9ca97938a6b05695496163fe1179
+FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
+FLUTTER_PI_SITE_METHOD = git
+FLUTTER_PI_LICENSE = MIT
+FLUTTER_PI_LICENSE_FILES = LICENSE
+FLUTTER_PI_DEPENDENCIES = \
+	flutter-engine \
+	libinput \
+	libxkbcommon \
+	systemd
+
+FLUTTER_PI_CONF_OPTS = \
+	-DFLUTTER_EMBEDDER_HEADER=$(STAGING_DIR)/usr/include/flutter_embedder.h \
+	-DFILESYSTEM_LAYOUT=meta-flutter
+
+ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_INPUT_PLUGIN),y)
+FLUTTER_PI_DEPENDENCIES += libinput libxkbcommon
+FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN),y)
+FLUTTER_PI_CONF_OPTS += -DBUILD_RAW_KEYBOARD_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_RAW_KEYBOARD_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OMXPLAYER),y)
+FLUTTER_PI_DEPENDENCIES += omxplayer
+FLUTTER_PI_CONF_OPTS += \
+	-DBUILD_OMXPLAYER_VIDEO_PLAYER_PLUGIN=ON \
+	-DOMXPLAYER_SUPPORTS_RUNTIME_ROTATION=ON
+else
+FLUTTER_PI_CONF_OPTS += \
+	-DBUILD_OMXPLAYER_VIDEO_PLAYER_PLUGIN=OFF \
+	-DOMXPLAYER_SUPPORTS_RUNTIME_ROTATION=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
