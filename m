Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B23CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1597683DF5;
	Fri, 28 Jan 2022 11:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdqalEWWmZPA; Fri, 28 Jan 2022 11:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0578183B07;
	Fri, 28 Jan 2022 11:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6DA1BF275
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EEE4046A
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HFEc1f2R1fA for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 10:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AE82403F9
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 10:59:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id d10so14663497eje.10
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m9RLeg59M0Kp2ZUvM9prC0/GQFVSUFLGb4HviYCVdD0=;
 b=EyaWEip/zNIH7aCehYqaylvzB0dv0KqRceGposNJ//qNydsAwXBPcQPit1oewrfWJm
 70AmwZFQlqWsOZuzD+uljrUGPGaTyHZtkH2GTchR2r7IluHPHDWJ1k3SheXvqSKf6vV7
 csj6IwB8U4JUvmBoqRHb6s6rT+TllIuyIkND07il6iv0uqgkwUOTOWQnVTjfExlAO/VN
 lLapPWrzZV5PZ7j3R7MjMlCC244o9RTVTOAoNkits7RZGwHPtCGsJAEeB337oAxVb7Zj
 I0P/hBFPbMqb8rTtRShhB8ZhFlAQ1W05wQWpLOIjaXtq5AZTAHNdP42/7boZCoyHXV8W
 O1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m9RLeg59M0Kp2ZUvM9prC0/GQFVSUFLGb4HviYCVdD0=;
 b=ypqRoKE51cFTHIM3aesTc9vBr0tVGNmVFYgn4n9LCxFhZGPL8zudderyM0Be3b7ejQ
 sIgnCiosYn/hR3Uh9FKOmPiay/ODBHumW2qHlEhNbA7w8V8UXIf6zCYnXFOszaNu+3b4
 gWIWee2X8ltP2eL2bFQF90HzsRr+JWjie3CTcV4lt9OShv4SfftjRdnT2y5xjtc1p7iB
 Ex2GWGRV0cpAt5/B311vrJ00xaEJoUg81ulWHXlTSTdl7lGGqNKqhaMkaZfiWaxgKatf
 d1aY4ALTgApE/a5LxJqwISw3UU04E/F0dIWdLCvZlYV3Ny6xEXHFdfLIwcMhsHbwArFe
 5PNQ==
X-Gm-Message-State: AOAM531/X3x8uE+YS0f9/h8E4WZlwn/KpDjWEKmzwUri7BKEcmcBlFZS
 b0ZxMTrifFMDDT9gKh7NxmJ0kr0ArsQ9WKCr
X-Google-Smtp-Source: ABdhPJzSx2Nd+SRLthCTCUzUSd/T7viK9gwhUQiMYuCv+4OIsdF9v6sSpSN5187QhOomcotOdNww5Q==
X-Received: by 2002:a17:906:7693:: with SMTP id
 o19mr6277597ejm.742.1643367594513; 
 Fri, 28 Jan 2022 02:59:54 -0800 (PST)
Received: from thomas-Latitude-5590.barco.com ([87.66.230.131])
 by smtp.googlemail.com with ESMTPSA id v14sm9873576ejy.77.2022.01.28.02.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:59:54 -0800 (PST)
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 11:59:17 +0100
Message-Id: <20220128105917.30421-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220128105917.30421-1-thomas.devoogdt@barco.com>
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
Subject: [Buildroot] [PATCH 2/2] package/libsoup: bump to version 3.0.4
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstreamed patch:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c

The gnome option was dropped in:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd06195632cb4b52a

A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2 backend):
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a492d0962dcfe8

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 Config.in.legacy                              |  6 +++
 .../0001-meson.build-set-c_std-to-gnu99.patch | 40 -------------------
 package/libsoup/Config.in                     |  6 +--
 package/libsoup/libsoup.hash                  |  4 +-
 package/libsoup/libsoup.mk                    | 11 ++---
 package/midori/Config.in                      |  1 -
 6 files changed, 12 insertions(+), 56 deletions(-)
 delete mode 100644 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 62717463df..d1fa68f894 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_LIBSOUP_GNOME
+	bool "libsoup-gnome support was removed"
+	select BR2_LEGACY
+	help
+	  Build libsoup-gnome library.
+
 config BR2_PACKAGE_RPI_BT_FIRMWARE
 	bool "rpi-bt-firmware package was renamed"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
deleted file mode 100644
index f2e8f7701d..0000000000
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5c3d431bdb094c59997f2a23e31e83f815ab667c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 1 Jul 2021 22:09:23 +0200
-Subject: [PATCH] meson.build: set c_std to gnu99
-
-Set c_std to gnu99 to avoid the following build failure with gcc 4.8:
-
-In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
-                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
-                 from ../libsoup/soup-address.c:14:
-/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
-  const u_char *_msg, *_eom;
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 4dfd8c15..a5ebc63a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2,6 +2,6 @@ project('libsoup', 'c',
-         version: '2.74.0',
-         meson_version : '>= 0.50',
-         license : 'LGPL2',
--        default_options : 'c_std=c99')
-+        default_options : 'c_std=gnu99')
- 
- gnome = import('gnome')
- 
--- 
-2.30.2
-
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 02e8e8b578..c98c61a31e 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2, gnutls and libpsl
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_NGHTTP2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPSL
@@ -16,11 +17,6 @@ config BR2_PACKAGE_LIBSOUP
 
 if BR2_PACKAGE_LIBSOUP
 
-config BR2_PACKAGE_LIBSOUP_GNOME
-	bool "libsoup-gnome"
-	help
-	  Build libsoup-gnome library.
-
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
 	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 95c1c26eb4..00591fc0ad 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
-sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/3.0/libsoup-3.0.4.sha256sum
+sha256  5bd38b5e091f707fd7fa3ed7c37aacca3f8e16c65787f1cc17dc38d1dcde567b  libsoup-3.0.4.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 1a26714992..ce40a7dabf 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.74
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+LIBSOUP_VERSION_MAJOR = 3.0
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).4
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
@@ -16,6 +16,7 @@ LIBSOUP_DEPENDENCIES = \
 	host-intltool \
 	host-libglib2 \
 	host-pkgconf \
+	nghttp2 \
 	libglib2 \
 	libpsl \
 	libxml2 \
@@ -55,10 +56,4 @@ else
 LIBSOUP_CONF_OPTS += -Dgssapi=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
-LIBSOUP_CONF_OPTS += -Dgnome=true
-else
-LIBSOUP_CONF_OPTS += -Dgnome=false
-endif
-
 $(eval $(meson-package))
diff --git a/package/midori/Config.in b/package/midori/Config.in
index d98d7cb161..715295e5a6 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -41,7 +41,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBPEAS
 	select BR2_PACKAGE_LIBPEAS_WIDGETS
 	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBSOUP_GNOME
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_SQLITE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
