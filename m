Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC1ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF207408A9;
	Mon, 31 Oct 2022 12:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF207408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5H01FXu3tDjr; Mon, 31 Oct 2022 12:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44B7408C2;
	Mon, 31 Oct 2022 12:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E44B7408C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945B31BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEFE60BFB
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CEFE60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsFQqUIiZwfw for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:47:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E712660BE3
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E712660BE3
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:47:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id q9so29200424ejd.0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 05:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1th0vh/7NN2Ma9KgLsVAggfO7zPUbj3PL5P4kv5cJts=;
 b=hzMwDxQ/uPzt3EpQKAHi6pSr/2ppqmQF9+SAW1dQfH9fGLZQRGYXwa3+gapl6WhYBa
 Zg9qCYJdrHN/l7Jim+8b2fsc2IAqNKrbr2Xd40WBiTOtqrWLhZmkSimOjbFiEr3+V9xS
 adbMimWDqgQa36+oXUbuEf5efI8kcqvLJInoENtbceyG+AF8B8t7DxL7OMc5hy2aROSh
 4jVOOA7Be8SB3ycp95xAUm4iOthB3OWAEnXAiLIWqU7tnRhgzvPV0vIgj67yReenKgup
 ATcICfBGeWguLvvboKncwB4R0asbaoMz7j2c4arvuJNcinDQ05oyVXjnUM33A2EpFP4x
 FfKQ==
X-Gm-Message-State: ACrzQf1DZOFK05fB30ZB9mOLMcojegA0VhWRWHg5d7wwqFf862ECPEc7
 zS2W/CrDSwTjxkuMyl0gnGw5xLRZR1x68Q==
X-Google-Smtp-Source: AMsMyM41mdyw0OvKQEECHDcIPf60cw3CweanptuEo/DY3joxexFofI7JrFIWZGMBkVyMBQLX+LV4Jw==
X-Received: by 2002:a17:907:3e96:b0:7ad:e35a:be36 with SMTP id
 hs22-20020a1709073e9600b007ade35abe36mr1168692ejc.678.1667220420900; 
 Mon, 31 Oct 2022 05:47:00 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709067d4100b00782e3cf7277sm2927028ejp.120.2022.10.31.05.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:47:00 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:46:25 +0100
Message-Id: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1th0vh/7NN2Ma9KgLsVAggfO7zPUbj3PL5P4kv5cJts=;
 b=CLyjUD58XNENBJdWEZ7aN/62LRveq1eEbzlcv0StW5akX/l7oRc5IJmeCDgd5sr1vm
 TR/RHGUzMjL8OtE38cb111+3wJA8KlxDp7DQV7PH8vQ7jJheYiMELRyv998paQvOb4ST
 CEiW6lualsu4+VnP6T9sIFWoKNuaRYMll3y+Sn7x43jik2NZbTFa1aDxdg7Y3fVybeYc
 QlbB9+LO44uXjpUv2M+QNNWiDs3saOG59a74Kw53aJTYBeDsz5hp2yO3j58RCIaRn7Z1
 sAeq5FqQOfrDsvd1k2zI90qj1wXUjJFBnxqETZkZoTPrFZ2AG0EbOnvtL4O8aRHkRZS0
 doHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CLyjUD58
Subject: [Buildroot] [PATCH v1 1/1] package/sway: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

i3-compatible Wayland compositor

This Wayland compositor can be used as a kiosk compositor like cage, but
with the advantage of better configuration of multiple monitor and
windows. For example, move a window by title to the output X or set the
resolution of Y to Z.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 DEVELOPERS             |  3 ++-
 package/Config.in      |  1 +
 package/sway/Config.in | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/sway/sway.hash |  3 +++
 package/sway/sway.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 package/sway/Config.in
 create mode 100644 package/sway/sway.hash
 create mode 100644 package/sway/sway.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dac8fefd0b..0390b94519 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2477,8 +2477,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
-N:	Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/slirp4netns/
+F:	package/sway/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/Config.in b/package/Config.in
index e4eb2b7434..c70729734d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -325,6 +325,7 @@ comment "Graphic applications"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
+	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
 
diff --git a/package/sway/Config.in b/package/sway/Config.in
new file mode 100644
index 0000000000..cdeca16fc0
--- /dev/null
+++ b/package/sway/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_SWAY
+	bool "sway"
+	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
+	depends on !BR2_STATIC_LIBS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_UDEV # wlroots
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_WCHAR # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
+	depends on BR2_USE_MMU # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+	select BR2_PACKAGE_WLROOTS
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_PANGO
+	help
+	  i3-compatible Wayland compositor 
+
+	  https://github.com/swaywm/sway
+
+comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
+	depends on !BR2_PACKAGE_SYSTEMD || \
+		!BR2_PACKAGE_HAS_UDEV || \
+ 		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBGLES 
+
+comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/sway/sway.hash b/package/sway/sway.hash
new file mode 100644
index 0000000000..6dfa71730f
--- /dev/null
+++ b/package/sway/sway.hash
@@ -0,0 +1,3 @@
+# Locally computed, tarball verified with GPG signature
+sha256  0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84  sway-1.7.tar.gz
+sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
new file mode 100644
index 0000000000..6bf49dbb6b
--- /dev/null
+++ b/package/sway/sway.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# sway
+#
+################################################################################
+
+SWAY_VERSION = 1.7
+SWAY_SITE = $(call github,swaywm,sway,v$(SWAY_VERSION))
+SWAY_LICENSE = MIT
+SWAY_LICENSE_FILES = LICENSE
+SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
+SWAY_CONF_OPTS = \
+	-Dwerror=false \
+	-Ddefault-wallpaper=false \
+	-Dzsh-completions=false \
+	-Dbash-completions=false \
+	-Dfish-completions=false \
+	-Dswaybar=false \
+	-Dswaynag=false \
+	-Dtray=disabled \
+	-Dman-pages=disabled \
+	-Dsd-bus-provider=libsystemd
+
+ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
+SWAY_CONF_OPTS += -Dxwayland=enabled
+else
+SWAY_CONF_OPTS += -Dxwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
+else
+SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.37.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
