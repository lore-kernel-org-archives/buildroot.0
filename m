Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89249C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584ED60E0A;
	Thu, 22 Aug 2024 18:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeN7q1m7f4CP; Thu, 22 Aug 2024 18:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47C8D60E14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C8D60E14;
	Thu, 22 Aug 2024 18:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 092791BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EACA560E14
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUyoNRaVF4ad for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4D2C60E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4D2C60E0A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4D2C60E0A
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:22:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33C79A4C2723;
 Thu, 22 Aug 2024 20:20:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQU-0000000060E-1eYU;
 Thu, 22 Aug 2024 18:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:45 +0200
Message-Id: <20240822182050.65230-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350851;
 bh=hpznDhkOsxlwKM5mqgw5KZJoLMgtk8WzyG85yhk42qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oERW7LFyCAJ5DJ1vI9048P1gL6w0gbLzq22ID0Bpi8UJQvnneNBOTrwfETEWc188w
 Hr3PhKwGJZESIUuQEGfqfP1CBR4TWEafMoC0ovPTEq6rAuXDjGjtw9SiIgc3tCYVqd
 5CVlrHoqPV1xvDvrykTfQQ3LY26Q7pf69hdyN1c6WMH47OBaX5UwsLMYs9FVQPBAO7
 9cLeYkMHjzJOEZdUtL9VzOyhW7KUvaL5tR9TLiJFBafxoQE17V2FmtTrrCCGx5q5GF
 H4ugSi1idKmusXLcd2cmX/jJqWtXa2ai8BAmyuRgTh6z4IcWhgO9cnl5NNXSe33DJw
 b0NYvfs+CdYyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=oERW7LFy
Subject: [Buildroot] [PATCH/next 08/13] package/libv4l: bump version to
 1.28.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream switched to xz tarball and meson.

Changelog:
https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.28

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libv4l/libv4l.hash |  4 ++--
 package/libv4l/libv4l.mk   | 41 ++++++++++++--------------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 4f694de34b..0c8ea1010b 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.28.1.tar.xz.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
+sha256  0fa075ce59b6618847af6ea191b6155565ccaa44de0504581ddfed795a328a82  v4l-utils-1.28.1.tar.xz
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 1142a7442f..072d7efcf3 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.24.1
-LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
+LIBV4L_VERSION = 1.28.1
+LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.xz
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
-# needed to get utils/qv4l link flags right
-LIBV4L_AUTORECONF = YES
-# add host-gettext for AM_ICONV macro
-LIBV4L_DEPENDENCIES += host-gettext
-
-# fix uclibc-ng configure/compile
-LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBV4L_CONF_OPTS = -Ddoxygen-doc=disabled -Dqvidcap=disabled -Dv4l2-tracer=disabled
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
@@ -34,10 +27,10 @@ endif
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBV4L_CONF_OPTS += -Djpeg=enabled
 LIBV4L_DEPENDENCIES += jpeg
-LIBV4L_CONF_OPTS += --with-jpeg
 else
-LIBV4L_CONF_OPTS += --without-jpeg
+LIBV4L_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -45,10 +38,10 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-libudev --with-udevdir=/usr/lib/udev
+LIBV4L_CONF_OPTS += -Dlibdvbv5=enabled -Dudevdir=/usr/lib/udev
 LIBV4L_DEPENDENCIES += udev
 else
-LIBV4L_CONF_OPTS += --without-libudev
+LIBV4L_CONF_OPTS += -Dlibdvbv5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
@@ -56,33 +49,25 @@ LIBV4L_DEPENDENCIES += libglu
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
-LIBV4L_CONF_OPTS += --enable-v4l-utils
+LIBV4L_CONF_OPTS += -Dv4l-utils=true
 LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
-# v4l2-ctl needs c++11, use gnu++11 for typeof support
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
-
 # IR BPF decoder support needs toolchain with linux-headers >= 3.18
 # libelf and clang support
-LIBV4L_CONF_OPTS += --disable-bpf
+LIBV4L_CONF_OPTS += -Dbpf=disabled
 
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
-LIBV4L_CONF_OPTS += --enable-qv4l2
+LIBV4L_CONF_OPTS += -Dqv4l2=enabled
 LIBV4L_DEPENDENCIES += qt5base
-# protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
-LIBV4L_CONF_ENV += \
-	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
-	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
-	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
 else
-LIBV4L_CONF_OPTS += --disable-qv4l2
+LIBV4L_CONF_OPTS += -Dqv4l2=disabled
 endif
 else
-LIBV4L_CONF_OPTS += --disable-v4l-utils
+LIBV4L_CONF_OPTS += -Dv4l-utils=false
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LIBV4L_DEPENDENCIES += sdl2_image
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
