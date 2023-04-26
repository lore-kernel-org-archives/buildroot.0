Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C73C77B60
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC3D40B6D;
	Wed, 26 Apr 2023 07:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC3D40B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7STx_m6Qs9L; Wed, 26 Apr 2023 07:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00654401B1;
	Wed, 26 Apr 2023 07:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00654401B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 613ED1BF215
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33BB7401B1
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33BB7401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_M75DzFXdYW for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 07:59:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F4840101
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F4840101
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 07:59:25 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-94ef8b88a5bso1016524566b.2
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 00:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682495963; x=1685087963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0Ju/UFBHNupwuJF7rMxtrLXlAvnmWJAVBBJER4D+y4=;
 b=JWJwOXChAa42OZ1vNwau4w36COPF+7gZc7zZoibjqyp9uDKzK13dZYS64X4YlKq1jY
 Tb//07EMVZstd/DhHvU2XU/omZ5mx1qD7DWV1gZtP6cp0MMsv/XzbqXTUCMRbvNHXW+W
 myuUd2syzd7yMn3fhBhX7wjj+ej9hbBJLfovXrJmOSHOJNQ/CaBgcCfrCotnpsGhdmBL
 6WJIJ5XsaOGTPZpyvnXreksxZt86q21SZDBAfnDQ+Q7S964eog1G2BUdXPINuTS9FUAj
 gXVmz/jrSSBfUO6dmekXGMy1lhsmofdjRqy+lEaOLmmUY0L4H++j/STSmrBcfjdF9B8A
 M/gA==
X-Gm-Message-State: AAQBX9fvQGJspHV2/t4/a3F/4fyMj4rOUxKiLqUrhHX4HKYMTKcsFH50
 UnyC7oi+RBXLR6c93hXPHEew7PIC1BOuqvMs
X-Google-Smtp-Source: AKy350aL3zq7dsgv2T2aP4w5ib3zQAH7HHPuS2sksSe2JCROPQ6WGCXeuqcbr2rnIed7zBDk2S4/ww==
X-Received: by 2002:a17:906:17d6:b0:94f:3728:7047 with SMTP id
 u22-20020a17090617d600b0094f37287047mr14876242eje.6.1682495962606; 
 Wed, 26 Apr 2023 00:59:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5dc7:9f11:9dc8:1e6d])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170906970900b009534211cc97sm7883414ejx.159.2023.04.26.00.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 00:59:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 09:59:01 +0200
Message-Id: <20230426075905.2307988-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/5] package/at-spi2-core: bump to version
 2.47.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_47_1/NEWS

- X11 is now optional.
- libxml2 is no longer optional.
- atk and at-spi2-atk have been merged into at-spi2-core.
- atk introspection option added.
- Added patch to which avoids requiring libsystemd when configured to use dbus-daemon.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
v5: rebased + grouped patches
v6: rebased + added Adrians patch
 - note: 2.48.0 is out, but will first merge this one
---
 ...iring-libsystemd-when-configured-to-.patch | 92 +++++++++++++++++++
 package/at-spi2-core/Config.in                |  8 +-
 package/at-spi2-core/at-spi2-core.hash        |  4 +-
 package/at-spi2-core/at-spi2-core.mk          | 20 +++-
 4 files changed, 113 insertions(+), 11 deletions(-)
 create mode 100644 package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch

diff --git a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
new file mode 100644
index 0000000000..29c3de8d2d
--- /dev/null
+++ b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
@@ -0,0 +1,92 @@
+From aeb14ffccaabe65a64e976576d71f30eb2165f43 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 24 Apr 2023 12:09:50 +0300
+Subject: [PATCH] meson: Avoid requiring libsystemd when configured to use
+ dbus-daemon
+
+Checks for dbus-daemon and dbus-broker only when they are chosen
+with default_bus. This avoids requiring the systemd libraries if
+one wants the built at-spi2-core to use dbus-daemon, but dbus-worker
+is somehow available in the $PATH. A typical scenario is cross
+compilation, where the build host may have a dbus-broker program
+available, but the target system may not have it (or may not have
+nor want to use the systemd libraries).
+
+upstream: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/134
+---
+ bus/meson.build | 53 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 26 insertions(+), 27 deletions(-)
+
+diff --git a/bus/meson.build b/bus/meson.build
+index 22a1bce6..2f3c5621 100644
+--- a/bus/meson.build
++++ b/bus/meson.build
+@@ -46,39 +46,38 @@ launcher_args = [
+              '-DDATADIR="@0@"'.format(atspi_datadir),
+            ]
+ 
+-if get_option('dbus_daemon') != 'default'
+-  launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
+-else
+-  dbus_daemon = find_program('dbus-daemon',
+-                             '/sbin/dbus-daemon',
+-                             '/usr/sbin/dbus-daemon',
+-                             '/libexec/dbus-daemon',
+-                             '/usr/libexec/dbus-daemon',
+-                             '/usr/lib/dbus-daemon',
+-                             '/usr/pkg/bin/dbus-daemon',
+-                             required: false)
+-  if dbus_daemon.found()
+-    launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
+-  endif
+-endif
+-
+ needs_systemd = false
+-if get_option('dbus_broker') != 'default'
+-  launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
+-  needs_systemd = true
++if get_option('default_bus') == 'dbus-daemon'
++  if get_option('dbus_daemon') != 'default'
++    launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
++  else
++    dbus_daemon = find_program('dbus-daemon',
++                               '/sbin/dbus-daemon',
++                               '/usr/sbin/dbus-daemon',
++                               '/libexec/dbus-daemon',
++                               '/usr/libexec/dbus-daemon',
++                               '/usr/lib/dbus-daemon',
++                               '/usr/pkg/bin/dbus-daemon',
++                               required: false)
++    if dbus_daemon.found()
++      launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
++    endif
++  endif
+ else
+-  dbus_broker = find_program('dbus-broker-launch',
+-                             required: false)
+-  if dbus_broker.found()
+-    launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
++  launcher_args += '-DWANT_DBUS_BROKER'
++  if get_option('dbus_broker') != 'default'
++    launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
+     needs_systemd = true
++  else
++    dbus_broker = find_program('dbus-broker-launch',
++                               required: false)
++    if dbus_broker.found()
++      launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
++      needs_systemd = true
++    endif
+   endif
+ endif
+ 
+-if get_option('default_bus') == 'dbus-broker'
+-  launcher_args += '-DWANT_DBUS_BROKER'
+-endif
+-
+ if needs_systemd
+   systemd_dep = dependency('libsystemd')
+ else
+-- 
+2.34.1
+
diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
index f56c5b93c4..1f6c421777 100644
--- a/package/at-spi2-core/Config.in
+++ b/package/at-spi2-core/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_AT_SPI2_CORE
 	bool "at-spi2-core"
-	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7 # optionally for X11
 	help
 	  The At-Spi2 Core package is a part of the GNOME
 	  Accessibility Project. It provides a Service Provider
@@ -19,7 +19,3 @@ config BR2_PACKAGE_AT_SPI2_CORE
 comment "at-spi2-core needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-core depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 764e4c3661..4531bf396c 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
-sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.47/at-spi2-core-2.47.1.sha256sum
+sha256  c6ba7c160434edebf09d2936933569c936f6ec972301766f2bdac5a4d418153c  at-spi2-core-2.47.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index f0b019c0ed..e98e779884 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,17 +4,31 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.36
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.47
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 libxml2 \
 	$(TARGET_NLS_DEPENDENCIES)
 AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+AT_SPI2_CORE_CONF_OPTS += -Dx11=enabled
+AT_SPI2_CORE_DEPENDENCIES += xlib_libXtst
+else
+AT_SPI2_CORE_CONF_OPTS += -Dx11=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=enabled
+AT_SPI2_CORE_DEPENDENCIES += gobject-introspection
+else
+AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
+endif
+
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
