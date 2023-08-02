Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3EEC00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A01A611FB;
	Wed,  2 Aug 2023 12:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A01A611FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiAabwb2ECgX; Wed,  2 Aug 2023 12:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2175F611A4;
	Wed,  2 Aug 2023 12:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2175F611A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7EB1BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B56040569
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B56040569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DN20kl4MxnD for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 12:02:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 330D54051D
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 12:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330D54051D
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-317744867a6so5991514f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 05:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977725; x=1691582525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0/S99uT692bBe9/et++R96hOLC+sp0j2IR4uJZfEIY=;
 b=DMF76J5AvI6s0T0AZa3g7YM3w2z6FcMXg+yx1db6qSBdEZ1LZRyG1S9Svkf9jpZ1D3
 BJEc+PkPUOcvPAzv9yvHZ6hTkVA7ivotIKbpd9x0kaLzFtpZJ065AfxvJOg9dZSmyX1m
 55nBnpbCsAXuf/rEu1zYXN0H0+VqPSt3zRSLf5oNPfSiDnoj5yaYbAme+fMS9SpHz2LF
 thz4AWNpNi/QY02uPICPeZgEnJp5qNA3cD5A3e0qBbS4m/99yECSbNM1/FRJNgXVLm4W
 oucnBzONwQx1oq/FYR6z6tZTYvXx2p8KIGE9IswpFS/bJhBR7u4u3YYn57K4PfkYh/tB
 zpXw==
X-Gm-Message-State: ABy/qLZF9w9b3oPbDzB8/j97Xf0IgYWxaHX98jhpSBW9K5CPjacjeW7a
 oE52/fICIK38590LYiK47bO8LWir5QdDoIX8gTc=
X-Google-Smtp-Source: APBJJlFcgLuJ6dkXf3j+9+g/FPHGAWypJz1BKCr1ktpGV+yfPH+MyHP1Bt11BTabNnHIRgTeULQDag==
X-Received: by 2002:a05:6000:1206:b0:317:6ff6:fe93 with SMTP id
 e6-20020a056000120600b003176ff6fe93mr4857661wrx.47.1690977724848; 
 Wed, 02 Aug 2023 05:02:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a7bce97000000b003fe20533a1esm1501873wmj.44.2023.08.02.05.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:02:04 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 14:01:48 +0200
Message-Id: <20230802120150.564860-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/libsoup3: new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libsoup3 has a new API [1], packages using libsoup may not
compile with libsoup3 or may crash at runtime in unexpected
ways. So add a new package.

This replaces my original commit that was sent to the buildroot
mailing list a long time ago: [2]

Changes for libsoup3:
- "0001-meson.build-set-c_std-to-gnu99.patch" is upstream now [2].
- The "gnome" option was dropped in [3].
- A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2 backend) [4].

[1] https://libsoup.org/libsoup-3.0/ch02.html
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20220129214235.5133-2-thomas.devoogdt@gmail.com/
[3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c
[4] https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd06195632cb4b52a
[5] https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a492d0962dcfe8

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: no change
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libsoup3/Config.in     | 40 +++++++++++++++++++++++
 package/libsoup3/libsoup3.hash |  4 +++
 package/libsoup3/libsoup3.mk   | 58 ++++++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 package/libsoup3/Config.in
 create mode 100644 package/libsoup3/libsoup3.hash
 create mode 100644 package/libsoup3/libsoup3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5023ecd775..700422dcfa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2855,6 +2855,7 @@ F:	toolchain/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
+F:	package/libsoup3/
 
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	board/qemu/m68k-mcf5208/
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..e12ee34e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1957,6 +1957,7 @@ menu "Networking"
 	source "package/libshout/Config.in"
 	source "package/libsocketcan/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsoup3/Config.in"
 	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libteam/Config.in"
diff --git a/package/libsoup3/Config.in b/package/libsoup3/Config.in
new file mode 100644
index 0000000000..8a6cbc1e67
--- /dev/null
+++ b/package/libsoup3/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_LIBSOUP3
+	bool "libsoup3"
+	depends on BR2_USE_WCHAR # glib2, gnutls and libpsl
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_NGHTTP2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPSL
+	select BR2_PACKAGE_SQLITE
+	help
+	  libsoup3 is an HTTP client/server library. It uses GObject
+	  and the GLib main loop, to integrate well with GNOME
+	  applications.
+
+	  https://wiki.gnome.org/Projects/libsoup
+
+if BR2_PACKAGE_LIBSOUP3
+
+config BR2_PACKAGE_LIBSOUP3_GNOME
+	bool "libsoup3-gnome"
+	help
+	  Build libsoup3-gnome library.
+
+config BR2_PACKAGE_LIBSOUP3_SSL
+	bool "https support"
+	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
+	select BR2_PACKAGE_GLIB_NETWORKING # runtime
+	select BR2_PACKAGE_GNUTLS # runtime
+	help
+	  Enable HTTPS (SSL) support.
+
+comment "libsoup3 https support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "libsoup3 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
new file mode 100644
index 0000000000..01313b394b
--- /dev/null
+++ b/package/libsoup3/libsoup3.hash
@@ -0,0 +1,4 @@
+# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.2.sha256sum
+sha256  78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3  libsoup-3.4.2.tar.xz
+# Locally calculated
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
new file mode 100644
index 0000000000..5a25e10047
--- /dev/null
+++ b/package/libsoup3/libsoup3.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# libsoup3
+#
+################################################################################
+
+LIBSOUP3_VERSION_MAJOR = 3.4
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).2
+LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
+LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
+LIBSOUP3_LICENSE = LGPL-2.0+
+LIBSOUP3_LICENSE_FILES = COPYING
+LIBSOUP3_CPE_ID_VENDOR = gnome
+LIBSOUP3_INSTALL_STAGING = YES
+LIBSOUP3_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-pkgconf \
+	libglib2 \
+	libpsl \
+	libxml2 \
+	nghttp2 \
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBSOUP3_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+LIBSOUP3_CONF_OPTS = \
+	-Dntlm=disabled \
+	-Dsysprof=disabled \
+	-Dtests=false \
+	-Dtls_check=false \
+	-Dvapi=disabled
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBSOUP3_CONF_OPTS += -Dbrotli=enabled
+LIBSOUP3_DEPENDENCIES += brotli
+else
+LIBSOUP3_CONF_OPTS += -Dbrotli=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBSOUP3_CONF_OPTS += -Dintrospection=enabled
+LIBSOUP3_DEPENDENCIES += gobject-introspection
+else
+LIBSOUP3_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBSOUP3_CONF_OPTS += \
+	-Dgssapi=enabled \
+	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP3_DEPENDENCIES += libkrb5
+else
+LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
