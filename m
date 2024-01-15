Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A529C47DA2
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 22:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C145A81E8D;
	Mon, 15 Jan 2024 22:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C145A81E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWCX2o0lKfWs; Mon, 15 Jan 2024 22:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B9C681E86;
	Mon, 15 Jan 2024 22:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9C681E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10ADF1BF39D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB54F42EBE
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB54F42EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GpOOACLctcz for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 22:39:58 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5592841D60
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 22:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5592841D60
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso963957466b.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 14:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358396; x=1705963196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PmGASyWW+bnEOKh3bEpL/rE0wAikdWKI2xXk7G62uuQ=;
 b=b/VRb4hy9QwCbqSxYXmxuf2/egYS6vODW7GvW5qFzTCAfexwtyFlG5GcCxkmNelM3P
 VI+vatW8Br64+xC7yIKWDecpeApG5uiagPo3SglnjjO+ApWtwtwBW5KZy+3Id+mSOnHt
 3lv1Ua1QhnBYO19MwehOTNpeAfERKNX9uaZvFB7saQc9hCeu7lLena3awlAtyQm3b0pw
 1ixkDvfF73JlEhVaqkS5ZsLnNn99+U/7dRgFhODOhn6KX74SeSk3aJHRTm6QvsuS8Eto
 r2wju7wFRdwdx8nngk/MjlOzaRI5Hqy5kU4tQIsORJq12e8Xqw8pMkxmX1nbCLF7jmtH
 7xgQ==
X-Gm-Message-State: AOJu0YyIINyif2yhIvd1nmWejndBvXEiXzgH1GXX71jkxpIhNzyveNAx
 F6nIAFD0XkHGB5I8hwXWbkFynUSMIUI=
X-Google-Smtp-Source: AGHT+IFj9K2TzQsJgYDgvbyg3s9X87d7n3STzX9VUBYq7dB32WlRvSNxfuEjp4yRPcxdNjG9NV4jCg==
X-Received: by 2002:a17:907:d40c:b0:a2d:a239:635e with SMTP id
 vi12-20020a170907d40c00b00a2da239635emr1396992ejc.24.1705358396443; 
 Mon, 15 Jan 2024 14:39:56 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709067d9800b00a2a4efe7d3dsm5771303ejo.79.2024.01.15.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:39:56 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 23:39:52 +0100
Message-ID: <20240115223952.2532111-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705358396; x=1705963196; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PmGASyWW+bnEOKh3bEpL/rE0wAikdWKI2xXk7G62uuQ=;
 b=Tarm3rcxe2Jnf62LzyjYl/z7LsZxbKIZZyLR7y531r0Fe7MtypAT3BKjvMn1NYdvvR
 pc45bgugi2ixTw1jezKwzn9tADkZvmkBJqeAQKPMklOD+CrrfnyEkElaWFmVLtiY6nc1
 6yZZHmp2H1tkAOBEsyxa9Vwnr3G3OGmPNmfX0PWAiWMX7pe1SNusmN+87AiOf3FRtvSY
 qCUHo1gn8AF8sN0s3ZAvbN7C/TrXMk4uXkO+3uYCtsyNl7IfC1CxHqmIwFiaxKRLxA3n
 94BGPIE0QmpHy9pOcejNqRy4lmO+netY0NqAweZ9hjHLepDdlOBABgROBOxDpH0tydMO
 8mGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tarm3rcx
Subject: [Buildroot] [PATCH 1/1] package/libqrtr-glib: bump version to 1.2.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Project switched to meson.
Use gitlab.freedesktop.org for download (previous URL did not work for
meson), thus moving to tar.gz archive.

Disable gtkdocize (not only to follow Buildroot approach, but also to avoid
build failure: ERROR: Program 'gtkdoc-scan' not found or not executable).

License file got renamed:
https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/commit/974e4231eaf4a3bf087c1df54e77df8cac935e15

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

build tested (very minimal testing):

                    bootlin-armv5-uclibc [1/6]: SKIPPED
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED
6 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/libqrtr-glib/libqrtr-glib.hash |  4 ++--
 package/libqrtr-glib/libqrtr-glib.mk   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libqrtr-glib/libqrtr-glib.hash b/package/libqrtr-glib/libqrtr-glib.hash
index e00dd0cb94..38543f7de9 100644
--- a/package/libqrtr-glib/libqrtr-glib.hash
+++ b/package/libqrtr-glib/libqrtr-glib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  30d879b2ade6f8f461def3a677755db5c0238babf688d5c83c03b3e6abe35cee  libqrtr-glib-1.0.0.tar.xz
+sha256  c5cdf5ea91cbd2cf2758b2896064c7b1dfe7156063267df905f957ac69b6b763  libqrtr-glib-1.2.2.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index 6ab8335417..c3df76dc84 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-LIBQRTR_GLIB_VERSION = 1.0.0
-LIBQRTR_GLIB_SITE = http://www.freedesktop.org/software/libqmi
-LIBQRTR_GLIB_SOURCE = libqrtr-glib-$(LIBQRTR_GLIB_VERSION).tar.xz
+LIBQRTR_GLIB_VERSION = 1.2.2
+LIBQRTR_GLIB_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/archive/$(LIBQRTR_GLIB_VERSION)
 LIBQRTR_GLIB_LICENSE = LGPL-2.1+
-LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
+LIBQRTR_GLIB_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
 LIBQRTR_GLIB_INSTALL_STAGING = YES
 LIBQRTR_GLIB_DEPENDENCIES = libglib2
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBQRTR_GLIB_CONF_OPTS += --enable-introspection
+LIBQRTR_GLIB_CONF_OPTS += -Dintrospection=true
 LIBQRTR_GLIB_DEPENDENCIES += gobject-introspection
 else
-LIBQRTR_GLIB_CONF_OPTS += --disable-introspection
+LIBQRTR_GLIB_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+# disable gtkdocize
+LIBQRTR_GLIB_CONF_OPTS += -Dgtk_doc=false
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
