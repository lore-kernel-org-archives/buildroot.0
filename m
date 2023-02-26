Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D04C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 12:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C0B60C16;
	Sun, 26 Feb 2023 12:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C0B60C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTNMfmjc7p0E; Sun, 26 Feb 2023 12:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A0C60BE6;
	Sun, 26 Feb 2023 12:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A0C60BE6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D996B1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE9460BE6
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 12:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE9460BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95hEOXuIH7hP for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 12:24:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8640960AD1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8640960AD1
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 12:24:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id j3so2602920wms.2
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 04:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H07NvO+RGqIEOhGr4oKi/X1Z7KYH1nreW6/ff8ZkOUY=;
 b=gwHWIxBsHamOEwwn5VZinVIoup8AhI0KFL6aedUb90kfCmbNeqeGvpJPZYgwEiA64x
 B3dAPClcJkgHQck0x7EoOu9Ff/N1FAfPlGpdcDlP6qyxAjfevFTdX94/PUjz2IQrFIii
 Y1YaUXl45r0StDSJPmwJIDNmPxKAawHqetl32l6H5jigRc7ZL06Wx2nlDS/P6mqWW1cb
 NdD89XjJFP6OvRs76K/lVvPWGVjCIqTHiPWjaJ1ea+2B8ALbiDKU5pn8BhxxD0Lk1B+a
 B0pVfWpgrWRNUVgKyk44wHDz7C0TiAzU4DLh8vYjEwadWhBpZ/0azelIyT9+ksW6Rh+N
 SQtQ==
X-Gm-Message-State: AO0yUKXykTpDEQ0ns0GYURfFqlKPbKgGxKysXiFoFrwYFhU7kQW5Kx/5
 G82wla+j5tYqio+t2cd95tofvmga10g=
X-Google-Smtp-Source: AK7set89+kKoLUQrrJGhicRQ01kPNLmVicsPBA7NDwD9FD5jKIANpVZS5coHuqB03G+RapeMMrySRQ==
X-Received: by 2002:a05:600c:998:b0:3eb:86a:6bb0 with SMTP id
 w24-20020a05600c099800b003eb086a6bb0mr7955723wmp.35.1677414259264; 
 Sun, 26 Feb 2023 04:24:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003db03725e86sm5640237wmh.8.2023.02.26.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 04:24:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 13:23:36 +0100
Message-Id: <20230226122336.49814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H07NvO+RGqIEOhGr4oKi/X1Z7KYH1nreW6/ff8ZkOUY=;
 b=JqFUxEZ7SJP/RldzrhLF+E+grKaoIuJkXvhmK0eI9SuLj6s7w6F35WrKPh55XG+MYe
 /MvzaAJeO/qOD+J4H2hGe7SVy2wrxiuwiC+oyYdCcroNcUFyElMmAjsk/cUZIIeXqe12
 cqjHSWf5syhScK2aIj52TpQJVvSgMBPm8njvbjFizHzgzGbkyT0INpKFb827amKohqc8
 3govVCHS4sJu/+odCU5D35+QzlEpXFlqbzRS7yG3/9dKrpAweKlJTEnmFpQVTVePuhMO
 SmCn2dofC74T8dw05TpZG6r6KRGKB8sZnx4aI3YMzVA3iildcqSIEKAFlkgvpoAIbji+
 HccQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JqFUxEZ7
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: xlib_libxshmfence
 is mandatory
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xlib_libxshmfence is mandatory, not optional, since the addition of the
package in commit 05c3177493aa8447d5cb568c8c13e0c09eded18b:

../miext/sync/misyncshm.c:36:10: fatal error: X11/xshmfence.h: No such file or directory
   36 | #include <X11/xshmfence.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cccc8f97d452ed2adbcbc4624f159a00287a3d38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/weston/Config.in           | 4 ++++
 package/wlroots/Config.in          | 4 ++++
 package/x11r7/xwayland/Config.in   | 5 +++++
 package/x11r7/xwayland/xwayland.mk | 5 +++--
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 09119edaaa..d5dbf27bbd 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -114,6 +114,8 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -125,6 +127,8 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 # Weston needs at least one shell; this can be one of the bundled ones,
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index b2d3f3c3b1..fb23e9069c 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -47,6 +47,8 @@ config BR2_PACKAGE_WLROOTS_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_WM
 	select BR2_PACKAGE_XWAYLAND
@@ -58,6 +60,8 @@ comment "XWayland support needs X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 endif
diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 4f14f2cc36..241ab73ad3 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_XWAYLAND
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
+	depends on !BR2_RISCV_32 # xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
@@ -14,6 +16,7 @@ config BR2_PACKAGE_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XORGPROTO
 	help
@@ -23,4 +26,6 @@ config BR2_PACKAGE_XWAYLAND
 
 comment "xwayland needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 174b440b07..7aef1156d3 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -18,6 +18,7 @@ XWAYLAND_DEPENDENCIES = \
 	xlib_libXfont2 \
 	xlib_libxkbfile \
 	xlib_libXrandr \
+	xlib_libxshmfence \
 	xlib_xtrans \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
@@ -77,9 +78,9 @@ XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_LIBDRM),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XWAYLAND_CONF_OPTS += -Ddri3=true
-XWAYLAND_DEPENDENCIES += xlib_libxshmfence libdrm
+XWAYLAND_DEPENDENCIES +=  libdrm
 else
 XWAYLAND_CONF_OPTS += -Ddri3=false
 endif
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
