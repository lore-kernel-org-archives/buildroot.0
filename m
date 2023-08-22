Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D516EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15AD1611B3;
	Tue, 22 Aug 2023 19:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15AD1611B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4W9XehFcUenT; Tue, 22 Aug 2023 19:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94C560B5D;
	Tue, 22 Aug 2023 19:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94C560B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C18711BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A02E401BF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A02E401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI1IUK6GMJVZ for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:48:13 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E0374018E
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0374018E
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-56c2e840e70so1664363a12.3
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 12:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692733692; x=1693338492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9TzbUqhfvOZ968zPC1RBl2UFGsE0KQKguCMsyEypdlo=;
 b=ROnRQgFrivtVZZgi1DBKCGmrGQhdvJxCepNWleEZPxFT4cwDx6Qf7ChxUwvQoBTQ80
 ocUgbw+Ix6f2Jy8759BO8mhk1SiSSDJ7iEzYldk087ZWXmd0a4CNFegLTWmaAe+tpJks
 R4FBHfnEejc15BfaOiOgL5XJYB+hDsySqr5xns4Snre9ZT1u34bVQEDWyWBSC1fDgeAn
 b3NuTkwK+cQRKfWdcwk6JND3Ziv/H1nltcteG+GuXc2O5MgpEZmORrNsKO4ceblpcOUG
 y/xtOdBOYc4eDylOz4GRJJy9n8lvNqptlPbIj3As19rZWB04LmGdfedYiBPYK/vbjRmC
 /wdQ==
X-Gm-Message-State: AOJu0Yz8ShowX3D6hF3qNp1pBIk3N7NizghbYRWbF/Oyhgp/GqITMzrk
 jFY5CiG2DTJvrhIq5QSwntsfxuoB29UMmxyDVbk=
X-Google-Smtp-Source: AGHT+IFHJCGDW2xsHSfYGAzml1aPZQqIkGQJE68B1cXdqjr7V1N24hwYzn+xkwdgiPTz6JymgzLa7A==
X-Received: by 2002:a05:6a20:3014:b0:149:7143:3e68 with SMTP id
 d20-20020a056a20301400b0014971433e68mr3672397pzd.31.1692733692144; 
 Tue, 22 Aug 2023 12:48:12 -0700 (PDT)
Received: from localhost.localdomain ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b0067aea93af40sm8128584pfa.2.2023.08.22.12.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:48:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:47:55 -0600
Message-ID: <20230822194757.1004572-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
References: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692733692; x=1693338492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TzbUqhfvOZ968zPC1RBl2UFGsE0KQKguCMsyEypdlo=;
 b=E8VnfVvck5ddeN13CdIAv4Rnqk+vIBfArTlE5e0K2WLb+5VH75yHwgJ+W3nGU5izhZ
 0BWcoy3gHKXxNznk6IeDfQ4xW98kfXoTLyVuF9gPjUQV2l2Psiawe5tFGL3Kj2CT7Enz
 8DQhvBxWRodvSxeW+9lT2fJkprrLaJnAOsFEo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=E8VnfVvc
Subject: [Buildroot] [PATCH v5 5/7] package/flutter-pi: new package
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
index 2e6370874c..5fa7ee7411 100644
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
index 0d3043b955..b9230f5d04 100644
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
