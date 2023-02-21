Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD3FC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 19:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B6941839;
	Tue, 21 Feb 2023 19:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B6941839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBIQmueTyNsY; Tue, 21 Feb 2023 19:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A7241846;
	Tue, 21 Feb 2023 19:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A7241846
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC7BF1BF362
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5E5F605B3
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E5F605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epPcj7XbCwvg for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 19:28:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A168960591
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A168960591
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 19:28:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l1so5338816wry.10
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n76lJIfUjPoxjvDH/J5taXD9/cn9snJnCDSC3IzaOhs=;
 b=HkviqQF3DWIXOE4tkdYHOTAtCLuMsGM6rss9s0GhYjlG7Vd9sQZUwbisHE2U4AzZ+o
 wiRNCFMEVk44k7bXpfMHD0zxgmeaWUZMaVQXOA4jvOJKDlwsDCmmMFPD8rMruftD87ob
 +jOtYNdoA8x+6fNkPXC+AmZM64qh1NyYE/Wcf/VreqCbZXZZPZ7770Trex/lSg1RzZwO
 HZCmEtTN0BNeNgubRaw02sbn5DXM0GKp7DVg03FjUnF+1S7XGNH5+7HhzOJDjuQWr6m0
 FdGYbEzqjpT0h6nUa5mDzzlZTjHHndy70N/JBFqDyxfwIptcbpcbKLQfDT8psXdkH6zu
 lZMg==
X-Gm-Message-State: AO0yUKVvT2P+qi1fNsiE+iSirnqyCNfRP8tbNcjYHG/EKR0nbNbkJciN
 Cbxrz9W9kA30iA3WEEeCiwcrLJwDf3YTv1+h
X-Google-Smtp-Source: AK7set8hzPeCS7L8kvh/2BnptjlEHfB6GYmrvGaVuiUKQKnMZnwQofwM2ZYlTukY6kvJ/FMadrZ+aQ==
X-Received: by 2002:a5d:50c4:0:b0:2c5:5ef8:fa3c with SMTP id
 f4-20020a5d50c4000000b002c55ef8fa3cmr5675412wrt.52.1677007694328; 
 Tue, 21 Feb 2023 11:28:14 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm8748163wrq.76.2023.02.21.11.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 11:28:13 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 20:27:59 +0100
Message-Id: <20230221192802.4117856-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n76lJIfUjPoxjvDH/J5taXD9/cn9snJnCDSC3IzaOhs=;
 b=abvoWIHsuJdVlbCV0IssNbgc8Yom95TKgAIoQJ7i0aVRb4wownWkuDAXN3/tciwbi8
 HrBculHrGIRaPEX5LSUjL6k3S+wCtMyFdYtyy7yI8IBErRydjA9G3zTPfKcbN2yQ/JKi
 904tciayfYe3SbSq3eSURHaEWVBXeIuwvmdQ1pN5upJGaVRLo0wiF0U/pb0g6M3EgxU0
 IrQfzxyjEeoHZPIxSB27Z4d+NVr/4MsW5So/9gBbF/eJ9N+NCW1ry2epIMkmtmgBY9b2
 5e8qlwwTrjbXMRDcc1FqzxTajbY3kX0ZVLOQ3NWA97VK+DDxx2QNsNZd0NfP4XtovcKs
 6m0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=abvoWIHs
Subject: [Buildroot] [PATCH v3 1/4] package/at-spi2-core: bump to version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
---
 package/at-spi2-core/Config.in         |  8 ++------
 package/at-spi2-core/at-spi2-core.hash |  4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 20 +++++++++++++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)

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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
