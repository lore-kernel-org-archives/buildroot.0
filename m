Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707BFC001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 22:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BBE3611D6;
	Tue, 15 Aug 2023 22:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBE3611D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3EyynbR9Az6; Tue, 15 Aug 2023 22:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BDB611D2;
	Tue, 15 Aug 2023 22:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BDB611D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 117131BF47F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D831E4186B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D831E4186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zftcem_NrtYc for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 22:28:54 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2FFC4187C
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FFC4187C
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so3976370b3a.1
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138533; x=1692743333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20x7tUXHu91LWQf0/+lkMSH3yDKpc84+yGwNy0yd1T0=;
 b=jRw00WEaGC+uL6V4NxKxfL652GYh1ULrxyK9DOWUt8LNhKF7YLqkX1yF+yEaQVf9Yn
 1QdkucWdGjPey0757GNECULpqxnDgEFJJYmXKTViJDocXFDXEZCpz3V+ucJaWRKUqpi6
 N053ZUESWN+2m5jvQ1dqRCv7E6JiAgTv42/kkRcOh0pAaVCoAlXAwTeA/7u2EA9c5OoR
 NEO3E3Cj5cERne1hzeYrO22fQnI98+L9HiuPKHh05noLOMmFAO6UfPU8b/hlZ9kArLUJ
 p88mUM+Yhnmrd+aZS/Bn9pUNDD+Ghmi1TlAl5Xm1hrOFuHia1n2FQD00svT/Zf3KpD54
 X8KA==
X-Gm-Message-State: AOJu0Yy+mTnqjWUFj6e8Y1TxhLNFe+kJy60WvuXvZIP8kcz0uFsjK6pL
 W0pX6/9xMXR3Zm/CTZGU6Hr/x0XwQqLvQaYJ79E=
X-Google-Smtp-Source: AGHT+IEmUQnJUQRFqZA4tyLk38VFr14TdM3U/M46uU9pUJWtF8ShExpGeZKfnAeSklnONd4jwVgtZQ==
X-Received: by 2002:a05:6a00:248e:b0:686:b5c9:c527 with SMTP id
 c14-20020a056a00248e00b00686b5c9c527mr301599pfv.17.1692138533576; 
 Tue, 15 Aug 2023 15:28:53 -0700 (PDT)
Received: from fedora.. ([174.27.153.162]) by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006873aa079aasm10177758pfh.171.2023.08.15.15.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:28:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:28:47 -0600
Message-ID: <20230815222847.2460201-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
References: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692138533; x=1692743333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20x7tUXHu91LWQf0/+lkMSH3yDKpc84+yGwNy0yd1T0=;
 b=Ifmf5HFq1KjcmrD2Pwcg1pzbnPawGAB2/w1Gph5UIHpoA7qdn68Ckv9+vRxuPt2epZ
 7biLTISJ8J80aM7W2d3K3NggFqU0S5jHFPk5A2JbSKo5IphE9OJ96roBSkQF2wFNS1uR
 +WOmW3xAgJWWgBW7WFQ8x+hGJP3jwEsYKkmsc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ifmf5HFq
Subject: [Buildroot] [PATCH v2] package/flutter-pi: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flutter-pi is one of many flutter-embedders. However, flutter-pi is unique
because it doesn't require X or Wayland to run. So long as there is support for
KMS and DRI flutter-pi should run on any platform that flutter-engine supports.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/flutter-pi/Config.in       | 41 +++++++++++++++++++++++
 package/flutter-pi/flutter-pi.hash |  3 ++
 package/flutter-pi/flutter-pi.mk   | 52 ++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 package/flutter-pi/Config.in
 create mode 100644 package/flutter-pi/flutter-pi.hash
 create mode 100644 package/flutter-pi/flutter-pi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 57abe36fc9..011221e870 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/firewalld/
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
 N:	Adam Heinrich <adam@adamh.cz>
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
index 0000000000..e9cf5a7682
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.mk
@@ -0,0 +1,52 @@
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
+	-DFLUTTER_EMBEDDER_HEADER=$(STAGING_DIR)/usr/include/flutter_embedder.h
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
