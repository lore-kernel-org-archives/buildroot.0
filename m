Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAAFC2FC22
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91276614CA;
	Thu, 17 Aug 2023 19:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91276614CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKI34Mn-L4I9; Thu, 17 Aug 2023 19:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9823761149;
	Thu, 17 Aug 2023 19:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9823761149
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE26C1BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F0160C16
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F0160C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PveowYuDCD1y for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:46:46 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D48460D94
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D48460D94
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso1453235ad.3
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692301605; x=1692906405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BXwdEEaHHnsPw50OCVi6gLyBOYtjBcQsD1sxDviJOc=;
 b=kz+/g2AzJ6c3qy5gD0PYkIoiL81vSWXPck4qJxtPLC6hwMHA9ee5oYiGbBMNBnC0HR
 iP0iF5reXuQm0L/NBBDhCtTYFA0cq8CV8rSjRheuivjJ08e0HdJ2ozhy4VwBz2TIEPHU
 10VOV+9VspmiAtGWHAhm11a7PQ4NhXlIVZQqNSAyrCJNKJTM9BQ30WddqI6TykR7TtZV
 RvJNIvqELezCqLK8erYFoG2u+4Nl32HEVB48C6NSDscLKo4pjDKubrZ2WEL7aOjkhXib
 2QrGjilBKcq+pzwcP/V8Tiiglcmumnx/T9/XhLzLLQ81S0LAZeZeTzAj2PyZMdzQ4suP
 MQoQ==
X-Gm-Message-State: AOJu0YwzX4ZO4/XVJjBDSM/JnTDLykYoVNgC8KJlUW88/FxfDxSgMIa5
 tdvKOMEKxsHVUiWqtBHlBYkgJzFF3QUWqT+lqnE=
X-Google-Smtp-Source: AGHT+IEsanf94NLYNQqAKjjkD910EKWQae3/Z4rutjttjt4d1Qb2cHJmOfGmWFGL8HQLpEJzMuDp4A==
X-Received: by 2002:a17:902:c94d:b0:1b8:88c5:2d2f with SMTP id
 i13-20020a170902c94d00b001b888c52d2fmr471101pla.64.1692301605584; 
 Thu, 17 Aug 2023 12:46:45 -0700 (PDT)
Received: from fedora.. ([75.174.130.12]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001bdd62cf7a1sm137569pll.236.2023.08.17.12.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 12:46:45 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 13:46:36 -0600
Message-ID: <20230817194638.780863-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
References: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692301605; x=1692906405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BXwdEEaHHnsPw50OCVi6gLyBOYtjBcQsD1sxDviJOc=;
 b=Euajj7esb6bdU/2iIfe4M4rw+4age9AGqiL1eQ1uC8PA9Fiwdd/rHDTwmSXI2N0ZFh
 oI+Gyk7wa63VPfupz5aCY1e7YskDzhoY1G33gzWka/lemy28AWq4TV+ilyVB9IdZrvaU
 GJLTnUPGRpq8rqYmLCPk+pilSmNPwVD1fW6Fk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Euajj7es
Subject: [Buildroot] [PATCH v3] package/flutter-pi: new package
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
