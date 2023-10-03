Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D973E75457
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270CB41F18;
	Tue,  3 Oct 2023 12:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 270CB41F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPRQW7ttQJJI; Tue,  3 Oct 2023 12:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260D241EC9;
	Tue,  3 Oct 2023 12:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 260D241EC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 743C61BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DB72403C6
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB72403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8fOX4V4vluy for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:40:23 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60C31403C4
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60C31403C4
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-69101d33315so684231b3a.3
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 05:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696336823; x=1696941623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecedSkkW+hDAPj59z8zm9oX8FAW5W6OkPIwp7UCJlTg=;
 b=dCuj5zO04cdXnHU/pIrD2/QI0mqLN1how5C4x8Ctjh5MXPx0SvhnktOvy4WsKro4o6
 uW+UoxSonONmyRIBeazJ7faGK3ORfjI2uTB/is8/0gu3cpA58PVGHyBOJRM8BS5Rvzv9
 nD3NpbRiCagPhB7ZzE8gHVIAOnu2MWBAfliGgveGUBJB3iwPhAse8sYIA4Z4bl963wk/
 5hKHr3mxIMHfuyv1Gt+5tqyEJuH63rs2fYPTK7a8QFd/akfGy9LXfeUk5ZY+d0LbG4t0
 exoXsZy+/a8TdsVwLjyKkM1wX7zYeuKrsTS+j/HmdxGQYKIz3CWro8GJWeBajupLTV3z
 oMHQ==
X-Gm-Message-State: AOJu0Yy7M1TJ/fxnWS+h9sDd8yaSk5el7x0RVpM/QaoWwFtQjpLzK1ot
 38Dpix40cGOWl+fTtv+6qVQ/H+W4QSg=
X-Google-Smtp-Source: AGHT+IEn05tsk800/79M2NQbpB4qKZiy4uvkF2h27i3J+JrmOiLhtFRGrBGgYWmvLPHHPNe5ilrYpQ==
X-Received: by 2002:a05:6a00:2da1:b0:68f:cdf3:dd54 with SMTP id
 fb33-20020a056a002da100b0068fcdf3dd54mr13909647pfb.9.1696336822618; 
 Tue, 03 Oct 2023 05:40:22 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:f06:9497:85ae:5cad])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa78004000000b0068be348e35fsm1253593pfi.166.2023.10.03.05.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 05:40:22 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 21:40:03 +0900
Message-ID: <20231003124004.983018-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696336823; x=1696941623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ecedSkkW+hDAPj59z8zm9oX8FAW5W6OkPIwp7UCJlTg=;
 b=ioq+t/Msx2/eK0aviHnhggG4LY99r10L+GCXuv1iVR5CAtT6MAWLVg1AWvBWiYYgWv
 mN7neHACANI5R6hBY7sIqF5++RCsu/Dq8+mREgSzn4FXQJccGq896AzJu03n0vQOK8zY
 xzg8GOojNZA9RIgLx/b0bvM6xMtwrARHOxJ/OohoHuUW/VRdkQsfKb8yYCKt8qCVOu7y
 7pDhokeK9vKc3VnMwToA8X08ro/2bxOcd6c1lLBRLRfXTg/p9QqTk9Lzn8i3VzE49BgO
 a9H17ty7EKhIMCvfYWKaLI9tqvXJLE/Kgyqz3EprlIet5DogbCtBnKTRQ46uiKhTFK+2
 G9tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ioq+t/Ms
Subject: [Buildroot] [PATCH] package/libcanberra: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package defines a simple abstract interface for playing event sounds.
It is mainly used by desktop applications such as GDM and GNOME Session.

http://0pointer.de/lennart/projects/libcanberra/

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 package/Config.in                    |  1 +
 package/libcanberra/Config.in        | 17 ++++++++
 package/libcanberra/libcanberra.hash |  3 ++
 package/libcanberra/libcanberra.mk   | 59 ++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 package/libcanberra/Config.in
 create mode 100644 package/libcanberra/libcanberra.hash
 create mode 100644 package/libcanberra/libcanberra.mk

diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..8f44e3efab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "Audio/Sound"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
 	source "package/libbroadvoice/Config.in"
+	source "package/libcanberra/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
 	source "package/libcdio/Config.in"
diff --git a/package/libcanberra/Config.in b/package/libcanberra/Config.in
new file mode 100644
index 0000000000..4274bcbec9
--- /dev/null
+++ b/package/libcanberra/Config.in
@@ -0,0 +1,17 @@
+comment "libcanberra needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "libcanberra needs a alsa-lib or pulseaudio or gstreamer"
+	depends on !BR2_PACKAGE_ALSA_LIB && !BR2_PACKAGE_PULSEAUDIO && !BR2_PACKAGE_GSTREAMER1
+
+config BR2_PACKAGE_LIBCANBERRA
+	bool "libcanberra"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  libcanberra defines a simple abstract interface for playing event sounds.
+
+	  http://0pointer.de/lennart/projects/libcanberra/
diff --git a/package/libcanberra/libcanberra.hash b/package/libcanberra/libcanberra.hash
new file mode 100644
index 0000000000..8dc90ccd88
--- /dev/null
+++ b/package/libcanberra/libcanberra.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72  libcanberra-0.30.tar.xz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
new file mode 100644
index 0000000000..1eadcb571b
--- /dev/null
+++ b/package/libcanberra/libcanberra.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# libcanberra
+#
+################################################################################
+
+LIBCANBERRA_VERSION = 0.30
+LIBCANBERRA_SOURCE = libcanberra-$(LIBCANBERRA_VERSION).tar.xz
+LIBCANBERRA_SITE = http://0pointer.de/lennart/projects/libcanberra
+LIBCANBERRA_LICENSE = LGPL-2.1+
+LIBCANBERRA_LICENSE_FILES = LICENSE
+LIBCANBERRA_INSTALL_STAGING = YES
+
+LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
+LIBCANBERRA_CONF_OPTS = --disable-oss --disable-null --disable-tdb --disable-lynx
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCANBERRA_CONF_OPTS += --enable-udev
+LIBCANBERRA_DEPENDENCIES += udev
+else
+LIBCANBERRA_CONF_OPTS += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBCANBERRA_CONF_OPTS += --enable-alsa
+LIBCANBERRA_DEPENDENCIES += alsa-lib
+else
+LIBCANBERRA_CONF_OPTS += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+LIBCANBERRA_CONF_OPTS += --enable-pulse
+LIBCANBERRA_DEPENDENCIES += pulseaudio
+else
+LIBCANBERRA_CONF_OPTS += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
+LIBCANBERRA_CONF_OPTS += --enable-gstreamer
+LIBCANBERRA_DEPENDENCIES += gstreamer1
+else
+LIBCANBERRA_CONF_OPTS += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LIBCANBERRA_CONF_OPTS += --enable-gtk
+LIBCANBERRA_DEPENDENCIES += libgtk2
+else
+LIBCANBERRA_CONF_OPTS += --disable-gtk
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+LIBCANBERRA_CONF_OPTS += --enable-gtk3
+LIBCANBERRA_DEPENDENCIES += libgtk3
+else
+LIBCANBERRA_CONF_OPTS += --disable-gtk3
+endif
+
+$(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
