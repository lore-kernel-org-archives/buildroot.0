Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E418CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 11:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8BA81D5F;
	Fri,  3 Oct 2025 11:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW-RW_vS--hC; Fri,  3 Oct 2025 11:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6931281D73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6931281D73;
	Fri,  3 Oct 2025 11:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C413191C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0FE81E41
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id godcGeohtQjv for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 11:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AFA981D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFA981D73
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AFA981D73
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-637a2543127so3837275a12.1
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 04:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759492361; x=1760097161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2a2WZMu5yIXjbXoxmg2dQ4DthSJ2cISGWyN0MCkOhLY=;
 b=IgECEdKGZnT8gOCoJdEMz0kzAl69RcLOxNj3fh6VXFbNe8hDI8XCorBaOKo2vd83uA
 R4Xgg0cUPqTsTXn5fB69rZDV0e46ox2ssshJpokGb6PEklh30xQwlTmhd1vd2fJZoau3
 dkZZhwjhyGO3EGU003+Dn0S8dwLNxs+ON2dJAasJC041mk7yk1tvIF1W0+ym8nXcssOY
 TERxE/V2wo4aFEhXaYyrlCpIjMIXfnoWEAJj0NJN1Ze6J2jLtj8ywJiT7275yL+uWQHD
 BP26AfT1bEWnmH5fZS8wHaXE2NcaIoGA4mC0uJX7DqrGdTc1dTSNhwN6G0jEuzppUef0
 hJkw==
X-Gm-Message-State: AOJu0YyBx9bcxu+qaHq+Bq/Py5qnFG1Z2f1Rhw6w/RS1UC+41UJcLlNI
 dFQal0R0b2QOKAOn4sIiuil3JLc8JZFn3/LAEAKZVt++i39DE8/k3fGs44ingH1d0xQ=
X-Gm-Gg: ASbGnctHCIdMgHtEoaswtKKhYVaWfbDXnCc7nN4U7hRfOk0tkJ7A4SrLtzQGu+FLnOT
 4pXcY10jXU0hC9MokZuEWaooE1HtNmQy523b13DRt8UKaH4+5zbZYjzRHPkRO4yYMWGXG7whyEl
 S2TGQNHaEAl9ZZv5FxwWs5Nb5my4c+1JBFjxE987OPJWVNGcSQH5TA2fobRQJykRG8pAIKdgUI2
 RI7FkahWeHIh65hyZwKtI2eFlpop9m5zXZ9ZAlDVVVTYZ/tGqkvre5MC8ds/sB1Y8pFj8l1O6w+
 FM65VfjeGkqO8EnQSNdFGx9KQv+YK51x6Vz1zwRVfq8iTmNDJBxn0jnRmbMGvhPjw9ACqzROZdd
 GXG0JFS2Xd6U0STaDU6oaKheGgGVaU0Xf485E
X-Google-Smtp-Source: AGHT+IHDkiWUXw7WKtmEsTPuHPnE5VuUg6HGrwvJCenRl5TESgx8OnX4gPGCjIxaDHZTz/rz6Br8jA==
X-Received: by 2002:a17:907:7fa4:b0:b3c:364d:b884 with SMTP id
 a640c23a62f3a-b49c4293209mr376956766b.63.1759492360995; 
 Fri, 03 Oct 2025 04:52:40 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b23csm430938966b.61.2025.10.03.04.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 04:52:40 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  3 Oct 2025 13:51:19 +0000
Message-ID: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759492361; x=1760097161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2a2WZMu5yIXjbXoxmg2dQ4DthSJ2cISGWyN0MCkOhLY=;
 b=XhMqxyDXF6AOb7taoYgqrnNl+Jbb1ICOqygwFmR5mKBz3AlhyZA/+MXfNVoCAuz4uO
 S8UeQUKe8A2Eph7xv9USGsEQRqNWZ47fRjxY8fO6fZmi08RsGUlXV2qzDczVUAMTqmQf
 bYZIoa5LimA8NZvwJQl61cAhgjKfPAS/9EirPSk7wq0uYkjVKs5B/qz8QB/uOvTkcb7o
 1RSkwdv5Iq4nsSdvj2XJVRttFH/dsooKf8hmSJvhibGW7WztItTw+LnRg6bbDqHHFKZk
 IN0CqD1oqbwgCxrTrBqRD+hZqLaUCKgB/O6SsSrVk9CZ9eDtuVaYVaIwdrwFGhAjXv5T
 HYqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XhMqxyDX
Subject: [Buildroot] [PATCH v1 1/2] package/wayland: make libdrm and
 xlib_libxshemfence optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To build XWayland with the DRI3 extension requires libdrm,
xlib_libxshmfence and libepoxy. This is the same as with the glamour
extension. Therefore, make the libdrm and xlib_libxshemfence optional
and merge the checks together.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/Config.in   |  4 ----
 package/x11r7/xwayland/xwayland.mk | 11 ++++-------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 311dae25ec..4f14f2cc36 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_XWAYLAND
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
-	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
@@ -16,7 +14,6 @@ config BR2_PACKAGE_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XORGPROTO
 	help
@@ -26,5 +23,4 @@ config BR2_PACKAGE_XWAYLAND
 
 comment "xwayland needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index e3b6727c19..a6d584705b 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -12,7 +12,6 @@ XWAYLAND_LICENSE_FILES = COPYING
 XWAYLAND_CPE_ID_VENDOR = x.org
 XWAYLAND_INSTALL_STAGING = YES
 XWAYLAND_DEPENDENCIES = \
-	libdrm \
 	pixman \
 	wayland \
 	wayland-protocols \
@@ -20,21 +19,19 @@ XWAYLAND_DEPENDENCIES = \
 	xlib_libXfont2 \
 	xlib_libxkbfile \
 	xlib_libXrandr \
-	xlib_libxshmfence \
 	xlib_xtrans \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
-	-Ddri3=true \
 	-Dxvfb=false \
 	-Ddefault_font_path=/usr/share/fonts/X11/ \
 	-Ddtrace=false \
 	-Ddocs=false
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
-XWAYLAND_CONF_OPTS += -Dglamor=true
-XWAYLAND_DEPENDENCIES += libepoxy
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_LIBEPOXY),yyy)
+XWAYLAND_CONF_OPTS += -Ddri3=true -Dglamor=true
+XWAYLAND_DEPENDENCIES += libdrm xlib_libxshmfence libepoxy
 else
-XWAYLAND_CONF_OPTS += -Dglamor=false
+XWAYLAND_CONF_OPTS += -Dglamor=false -Ddri3=false
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
