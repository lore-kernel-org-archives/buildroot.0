Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2A5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F78B61248
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F78B61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1410C40304;
	Wed, 10 Nov 2021 16:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzHy-UzIbEeu; Wed, 10 Nov 2021 16:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35976402F1;
	Wed, 10 Nov 2021 16:44:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 653721BF318
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FFA401BE
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cl06qV5R2idi for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 16:44:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFF7C401DC
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 16:44:32 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id i9so3143577ilu.8
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2TU8f3oEccaPgW75xrZp1hNdmgtdO2DZLaAOLKHTTc=;
 b=FeQSYjHYzKCbF7671637su8bqv/uPSeX20+/MSDdGBKP7T8QMI6BxvA9RIHdenn+UN
 ef0gwlHAFb7wrZveb73ZXr7N/tLK86y0VcVoax4ACDRC33p1JdODjj20ZUqtqMOvw6xw
 g9eRkbwQnhP9TR4y4RAoHchALKG2lfywZT9vXW1CY3gPv0/qsQ1tEf3hKVH4EgStE2by
 6FE+0PomMz7wAbLuvMz/jykpQjTg4PYCXgCr2BXIR2gz6yNQ2QWgxqVaFwwTGAHFspQA
 DhQqlAXhB15WC4+jeX5klRbBtyi0hjkn9f6bpg8yZ9ZxYJmNtk40OGLZ1VzOYJ9EnvLQ
 A8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2TU8f3oEccaPgW75xrZp1hNdmgtdO2DZLaAOLKHTTc=;
 b=pqu3Z4CN1g3cRN82qfXP4MVqPvrggmIzhFfK6GiALE7gcm1zg/wH3e/8fuy2i8nUTo
 K5PM7sAdRJsZy3xkq+8j9O82x3JN6SjsKzjENaznFFREEN0LXwmTar/+/XFBbnazC+Wv
 2RRQo3Q0tZ0yBwVuUPOfvhZSRqfdsOy8rGy6+iWcQQBHy0GEOG1YnxaXpmukLqCDbOpi
 gPnHrrTT2+vesjhZ63Ii8dufaHrePLOyYcEuQ+baMfy/tvuN1gn5cJhyEGPzj4mv+uNM
 cuNE4DIGzZqnAm94K+YJq8cmLjP2ol9TqRBl+DnBCbrcpDIdCjr7Vyr7YMlr12a6uLyV
 lkoQ==
X-Gm-Message-State: AOAM5304XPhUBMGUr0+VORQE4TXah0JoBw07mQ/TlAOaU0drQowmiyGO
 zdc2nc5Hu/YwwqZGexcuQJyN21zm2Tg=
X-Google-Smtp-Source: ABdhPJwaisLUmk9yVRL7zdNS5XSkgk7jkl4zuuGT3Iq/6hu7WgMy2SsUgQsPYbYLRkB1SVx8eQMj5A==
X-Received: by 2002:a05:6e02:1ba9:: with SMTP id
 n9mr223962ili.297.1636562671555; 
 Wed, 10 Nov 2021 08:44:31 -0800 (PST)
Received: from james-x399.localdomain (97-118-146-63.hlrn.qwest.net.
 [97.118.146.63])
 by smtp.gmail.com with ESMTPSA id d4sm193379ilq.76.2021.11.10.08.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:44:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 09:44:28 -0700
Message-Id: <20211110164428.137533-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire-media-session: new package
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pipewire-media-session has been moved into a separate package
which pipewire attempts to download via meson wraps if
session-managers are enabled, since we don't support meson wraps
we need to disable session-managers in the pipewire package and
create a new pipewire-media-session package.

We also need to add a patch removing an invalid session-managers
option check from pipewire-media-session.

There is an alsa with-module-sets uption in pipewire-media-session,
however at the moment alsa is an unconditional dependency so
we need to always enable it and select alsa-lib.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                             |  1 +
 ...remove-session-managers-option-check.patch | 36 +++++++++++++
 package/pipewire-media-session/Config.in      |  9 ++++
 .../pipewire-media-session.hash               |  4 ++
 .../pipewire-media-session.mk                 | 51 +++++++++++++++++++
 package/pipewire/Config.in                    |  6 ---
 package/pipewire/pipewire.mk                  |  9 +---
 7 files changed, 103 insertions(+), 13 deletions(-)
 create mode 100644 package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
 create mode 100644 package/pipewire-media-session/Config.in
 create mode 100644 package/pipewire-media-session/pipewire-media-session.hash
 create mode 100644 package/pipewire-media-session/pipewire-media-session.mk

diff --git a/package/Config.in b/package/Config.in
index e355ab1987..cb94e30be3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1539,6 +1539,7 @@ menu "Graphics"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
 	source "package/pipewire/Config.in"
+	source "package/pipewire-media-session/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch b/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
new file mode 100644
index 0000000000..fc1d25edb3
--- /dev/null
+++ b/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
@@ -0,0 +1,36 @@
+From 1923c97fbd0b3d8cacdb72386886f860c818bccf Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 10 Nov 2021 08:54:06 -0700
+Subject: [PATCH] meson: remove session-managers option check.
+
+This option no longer exists and causes a build failure if building
+with the systemd system service enabled.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/pipewire/media-session/-/merge_requests/24]
+---
+ systemd/system/meson.build | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/systemd/system/meson.build b/systemd/system/meson.build
+index ab0d49064..0e9885b0f 100644
+--- a/systemd/system/meson.build
++++ b/systemd/system/meson.build
+@@ -4,9 +4,7 @@ systemd_system_services_dir = systemd.get_variable(pkgconfig: 'systemdsystemunit
+ systemd_config = configuration_data()
+ systemd_config.set('PW_MEDIA_SESSION_BINARY', media_session_bindir / 'pipewire-media-session')
+ 
+-if get_option('session-managers').contains('media-session')
+-  configure_file(input : 'pipewire-media-session.service.in',
+-               output : 'pipewire-media-session.service',
+-               configuration : systemd_config,
+-               install_dir : systemd_system_services_dir)
+-endif
++configure_file(input : 'pipewire-media-session.service.in',
++             output : 'pipewire-media-session.service',
++             configuration : systemd_config,
++             install_dir : systemd_system_services_dir)
+-- 
+2.25.1
+
diff --git a/package/pipewire-media-session/Config.in b/package/pipewire-media-session/Config.in
new file mode 100644
index 0000000000..d025cd4d75
--- /dev/null
+++ b/package/pipewire-media-session/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
+	bool "pipewire media-session"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, dbus
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_PACKAGE_PIPEWIRE
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_DBUS
+	help
+	  Build pipewire media-session support
diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
new file mode 100644
index 0000000000..e335fd8913
--- /dev/null
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ebdf9f8e389896fdc4b58da5f909afce18441b4b53d5b4f2104dd53586ea8681  media-session-0.4.1.tar.bz2
+sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
+sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
new file mode 100644
index 0000000000..b5401a04bd
--- /dev/null
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# pipewire-media-session
+#
+################################################################################
+
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.1
+PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
+PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
+PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
+PIPEWIRE_MEDIA_SESSION_LICENSE_FILES = COPYING LICENSE
+PIPEWIRE_MEDIA_SESSION_INSTALL_STAGING = YES
+PIPEWIRE_MEDIA_SESSION_DEPENDENCIES = \
+	host-pkgconf \
+	alsa-lib \
+	dbus \
+	pipewire \
+	$(TARGET_NLS_DEPENDENCIES)
+
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS += \
+	-Ddocs=disabled \
+	-Dtests=disabled
+
+PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST = alsa
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS += \
+	-Dsystemd=enabled \
+	-Dsystemd-system-service=enabled \
+	-Dsystemd-user-service=enabled
+PIPEWIRE_MEDIA_SESSION_DEPENDENCIES += systemd
+else
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Dsystemd-system-service=disabled \
+	-Dsystemd-user-service=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST += jack
+PIPEWIRE_MEDIA_SESSION_DEPENDENCIES += jack2
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST += pulseaudio
+PIPEWIRE_MEDIA_SESSION_DEPENDENCIES += pulseaudio
+endif
+
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS += -Dwith-module-sets='$(subst $(space),$(comma),$(PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST))'
+
+$(eval $(meson-package))
diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 1f48a4b50f..dd13f31a73 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -18,12 +18,6 @@ config BR2_PACKAGE_PIPEWIRE_EXAMPLES
 	help
 	  Build pipewire examples
 
-config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
-	bool "pipewire media-session"
-	depends on BR2_PACKAGE_PIPEWIRE_EXAMPLES
-	help
-	  Build pipewire media-session support
-
 config BR2_PACKAGE_PIPEWIRE_GSTREAMER
 	bool "pipewire gstreamer plugins"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index f376f3c276..97a6b77510 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -26,7 +26,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dtest=disabled \
 	-Dvideoconvert=enabled \
 	-Dvideotestsrc=enabled \
-	-Dvolume=enabled
+	-Dvolume=enabled \
+	-Dsession-managers=[]
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -171,12 +172,6 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION),y)
-PIPEWIRE_SESSION_MANAGERS_LIST = media-session
-endif
-
-PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
-
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
