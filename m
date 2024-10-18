Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B399D3F282
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0EDF81E83;
	Fri, 18 Oct 2024 19:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAvGZ6OVi7_2; Fri, 18 Oct 2024 19:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC0681E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC0681E7E;
	Fri, 18 Oct 2024 19:53:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE4A2073
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B099640154
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkBvcY1Fpv8r for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 19:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9F8140126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F8140126
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9F8140126
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9428152c0so3046837a12.1
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729281221; x=1729886021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSk9q90+2CxZPB/mvnM4FHVjpeXnBVznipiG0iLxq50=;
 b=u7q0mcIRDp4CBwXeRmLA43Lr0+yfIrWuuyq9ju0uaG8992wfqo1ZRrHVt8KGMiJ3DQ
 EdWK88okJjJa4eOS5fhWx8P2Mlcoh8tn5+EpcjtA3z2ThJX+Q6fkvEmtqWzHqSNmZd2m
 5hE52lw7jT0TAKfu8RvD7JTbRn6ABTs5eZP6DYvAPddmEZt6vnw1mhd34OCmQdNnKIRf
 mMM6LPNxrvs3+IpJgGZ+Y43GUBc+Jdky8wOSM9Njc5z81hXeKYUsBmHxGzTyP3g3v0At
 Xkr2m9M2xVBdTlw1DJLOc+58+9e2aFVr4fjmDbctoufGf72bYVwo7/+l80GIZQn5fdQ8
 WeTQ==
X-Gm-Message-State: AOJu0Yw2KFml+jKN9z67heN4YQDiSR/3qoPvCtCvkcqdfSyZFcpGeN5d
 Uu4W0SbdMVBZMFz66qU+gSsajaYzqaHHkN1J6yD9buHLg+FTWV6qLJ3KEW0n
X-Google-Smtp-Source: AGHT+IFrrAz79y/wHoqcreZoo0lIV9GijlAjcNxSATTDE3I8D86Qe2BEvqMIcMQ57KX8HIVdGblyRg==
X-Received: by 2002:a17:907:1c9e:b0:a9a:188f:efd9 with SMTP id
 a640c23a62f3a-a9a69bad2a2mr303732166b.29.1729281220330; 
 Fri, 18 Oct 2024 12:53:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::f68b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68b122cfsm131847166b.94.2024.10.18.12.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 12:53:40 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 18 Oct 2024 21:52:14 +0000
Message-ID: <20241018215214.623918-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
References: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729281221; x=1729886021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSk9q90+2CxZPB/mvnM4FHVjpeXnBVznipiG0iLxq50=;
 b=gu2IxC66oaGGGT7CiMKNPh782ISlBXyG0FhwlBXmzfBhYOHil9durwmrhKHea/2i/L
 2fBpHHfkLV+IJdsChTluOQhEzR0DSdUZC1CcLwobQaa6i2lrqADmLxMpRZDRebG+OhcD
 qQPAfMtHU7Rjjol1xX6wsPJWQczhPKsVe6aADOz6aQCFyHbnJDyTn4bkA4JtXLI/nvXg
 IY1DGx19iMfHm2JJGaMVImZ1XyL9B9f9h3X0MrAFxoUCLk90M7ADOk8n08Navv66463/
 lR2nn9FfxAEuRpxSDZK7Q8iD+ZgiegRtR9u+cfFwkWfvjRATcKOcAMJASO0VZjgeGwTs
 mG0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gu2IxC66
Subject: [Buildroot] [PATCH v1 2/2] package/xwayland: bump to version 24.1.3
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

Additionally, make libdrm an optional dependency. Also,
xlib_libxshmfence is not a required dependency.

Release notes:
https://lists.x.org/archives/xorg-announce/2024-October/003532.html

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/Config.in     | 12 ++++--------
 package/x11r7/xwayland/xwayland.hash |  8 +++++---
 package/x11r7/xwayland/xwayland.mk   | 21 +++++++++++++++------
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 311dae25ec..a4e4a4e46f 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -3,12 +3,10 @@ config BR2_PACKAGE_XWAYLAND
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	# We need a SHA1 implementation. If either openssl or
-	# libgcrypt are already part of the build, we'll use one of
-	# them, otherwise, use the small libsha1 library.
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
+	# libsha1 are already part of the build, we'll use one of them,
+	# otherwise, use the small libmd library.
+	select BR2_PACKAGE_LIBMD if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBSHA1)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
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
diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 5bb26bf17e..c7fd2c2ff8 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003443.html
-sha256  a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b  xwayland-23.2.4.tar.xz
-sha512  ac3ff208cbef5bbe4637c335cfda226489c93b0a3768f2f4fb0201c588485ede38262fbce77ef1425b3d2a0be61b6580df53341c7b95e6072c8b6371ad29d187  xwayland-23.2.4.tar.xz
+# Verified from https://xorg.freedesktop.org/archive/individual/xserver/xwayland-24.1.3.tar.xz.sig
+# with key 67DC86F2623FC5FD4BB5225D14706DBE1E4B4540
+# From https://lists.x.org/archives/xorg-announce/2024-October/003532.html
+sha256  dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10  xwayland-24.1.3.tar.xz
+sha512  7e0e11b07408f41a81bafa7bc519d02ed9bdc36e11be16abe255a7d779d04824af23d79323f1602119b046c545cdd43ea91b93e23feb0ffe411aa6989b462c1d  xwayland-24.1.3.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index c66dd471ac..0621e3547a 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.2.4
+XWAYLAND_VERSION = 24.1.3
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
@@ -12,7 +12,6 @@ XWAYLAND_LICENSE_FILES = COPYING
 XWAYLAND_CPE_ID_VENDOR = x.org
 XWAYLAND_INSTALL_STAGING = YES
 XWAYLAND_DEPENDENCIES = \
-	libdrm \
 	pixman \
 	wayland \
 	wayland-protocols \
@@ -20,22 +19,26 @@ XWAYLAND_DEPENDENCIES = \
 	xlib_libXfont2 \
 	xlib_libxkbfile \
 	xlib_libXrandr \
-	xlib_libxshmfence \
 	xlib_xtrans \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
-	-Ddri3=true \
-	-Dxwayland_eglstream=false \
+	-Dxwayland_ei=false \
 	-Dxvfb=false \
 	-Ddefault_font_path=/usr/share/fonts/X11/ \
 	-Ddtrace=false \
 	-Ddocs=false
 
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XLIB_LIBXSHMFENCE),yy)
+XWAYLAND_CONF_OPTS += -Ddri3=true
+XWAYLAND_DEPENDENCIES += libdrm xlib_libxshmfence
 ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
 else
 XWAYLAND_CONF_OPTS += -Dglamor=false
+endif # BR2_PACKAGE_LIBEPOXY
+else
+XWAYLAND_CONF_OPTS += -Ddri3=false
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -76,9 +79,15 @@ XWAYLAND_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
 XWAYLAND_DEPENDENCIES += libgcrypt
-else
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libnettle
+XWAYLAND_DEPENDENCIES += nettle
+else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
+else
+XWAYLAND_CONF_OPTS += -Dsha1=libmd
+XWAYLAND_DEPENDENCIES += libmd
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
