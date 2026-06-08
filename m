Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBECD8C90
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3715403F0;
	Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gveoPOTzZC05; Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72DA3405A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884381;
	bh=kHuJ7td/RHLDn9Wk5n/7VmpMznBilOWC8iXNEp/u97g=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K4Wmz85Ydk6s0xiwZDEVdXmQaPvQwFw/GUCWcG9fTcNak6qb1ybcZfaZlxRG9nqws
	 K46GDWuvRmW/O1+oZNYXObtrCKIdmH2LF4dIFwx3plZ/5eRSADWdr2gLKQmkNZ3yw3
	 H5aMZzvkiZ3ZLG0n1o5nrH8A9gjsiIWSwch2Zv+fybqj1MrY90AHjxwzu6zCiOf6Ht
	 JXZv0rA5DxsFakXJ6DqokPLIUstTrBC32WkBk1qXIwyQidD65TKz2siEIPjjFjgZzM
	 vUvEIsef7ZCrZ9fRVtY34Fa9QziLW7v0v79kPEaYW1qNFpkIJnkHKYFwIk0tRpVH6e
	 /fFPAmafNxEUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72DA3405A5;
	Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0CD2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548BF4010F
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3eKObhF_RgJ for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59B1040106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B1040106
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59B1040106
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:17 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-36da8439078so3324806a91.2
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884377; x=1781489177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r72yXCn3vOrp5cUXMHdYrBZtn5GogsO9QcdFR1f3OLw=;
 b=KtFZc/BnLYuCM/kstisC2NKttAN1NGw7nxjnCky09wxyH4d/pRfzn9SdFge53X5L1q
 b+nyaD3r+U1JpJJKb0P5zEUiwsiiLha9Is3Qe8uE5GThBiHeSjzvKx5Hg0vjzyoKC8UF
 RrE3bfi/aqUEDMQcmA7MOB6VOaO24DkKsiXvgD4j3WmfSjDYadz8go7vcczy7vus1Gok
 KHMfF4+x1N1XB0niMVIsCZLTMvBdFhH/9yU/1ShONSHMrYPcgfGUHi3GGmbOCzaeJjB6
 ZXjwOXh/WnxZNm1xh9h8FIDuFiwgdjq3qyhIK3DHc9msjYO/zWg8KFkZrob8736sby4a
 MmbQ==
X-Gm-Message-State: AOJu0YxrBl8brvoeEdq0wVGBUx0yedcUXDmTD4iIKbxnWZRfdVHBnqju
 0XNUa29m+oXXGgRiHmHc95jGJDVuwnJa3Oqg3W2sn4ahWk6pQPSIPGdo
X-Gm-Gg: Acq92OGH0vgSZUR65Ua1UQdYJFfcQ2RkZcLl/s/jWBQXhcO0BgO5zqH75xrG5GIEgd7
 Ax03nnO4bjyV2nzcgXpSr5I8T3c9wYmlM9lkGvHO7sBI4zf3tjH0YZWool+50VkcXadZTTGlp/4
 bUf0H1ynBDEq9tcYKd43zJiv0ziksLGTqrFiXD6vwEqClqI7DsEA4rPUsp5et31HXHNdvCob834
 S2lvqXzDRKpMag39ERcmvO5HqhvrVYo0vbsVv99dOsIXX8bmKOdP+cr7KivN/54G+u5WsOzO7UH
 7MxMGCBtjtqdTmC5EbQkZWq+IZsgcFsqSkTB1HB6s7VObpqP3F80Fwz9OgoBRJX5eA911xCJzqb
 AFXLvBSR3oec/Z89ad7YDnitWqXxxwcD7+nfEHCDxnuxKbMF7apTtubdFzcXhgybQ+aWK+SRBuh
 93TGqaSMqcqHKPTaXtwMszZMAJSEvkeyBpS+jhglc=
X-Received: by 2002:a17:90b:5545:b0:36d:6315:1de5 with SMTP id
 98e67ed59e1d1-370f0771c54mr15665943a91.18.1780884376642; 
 Sun, 07 Jun 2026 19:06:16 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:16 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:04 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-1-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=2553;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=CqJT4MGvyXSeSU94YhoVaqdNY7KiwTnz1RwIcEBWJFE=;
 b=9LN3+5Aqsumsp7tGjAerPJgEcnMgtUnBldUDvbv4YDk5wIwrBatHXaNQLuirvJL3LC8LHVW3V
 2YmYtiVFNRcAlI9aDYqOGwLJJD0byntViAPlJM9lJYXdB9ouZ7+LKcX
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884377; x=1781489177; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r72yXCn3vOrp5cUXMHdYrBZtn5GogsO9QcdFR1f3OLw=;
 b=JTSauqQyXydPeCUbpi0cafmHHsPolN/BQPj0PlvqMXUBeqfUcDzlU7TtDGJBgyA3bT
 BudTmM+NgEt2DIEmQHaI8IwNKONax4GUJjSHu9PgtQevGkA8HGHym/VrSQrHao8yB2kn
 jLhLlAs2/6Q4xkmj8DpLYuW6PxHk0h7gpBoUAjTz8hN9YScpSL/gx6KU4kzJF4237tIM
 JNIATWnuMVIU9AX+vG5UiXiudyc6Xszj8jLibvD7NFRwny3J6zNcpNTxHMMBR8ZGo3IX
 gSPVMVfAnEPfuAKwAMX6XsEF8To0J1KUDdq/xrexo+5JYHLohTOG02o6p9RHIxATNp7S
 G1OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JTSauqQy
Subject: [Buildroot] [PATCH 1/7] package/weston: add EGL dependency for
 XWayland
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_WESTON_XWAYLAND currently depends on BR2_PACKAGE_LIBEPOXY,
which implicitly requires either libGL or libEGL. However, the XWayland
glamor support uses libepoxy with EGL, so express that dependency
directly. With only libGL and no libEGL, it fails to build. E.g.,

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XWAYLAND=y
BR2_PACKAGE_LIBEPOXY=y

fails with:

In file included from ../glamor/glamor_priv.h:73,
from ../glamor/glamor_composite_glyphs.c:25:
../glamor/glamor_context.h:27:10: fatal error: epoxy/egl.h: No such file or directory
27 | #include <epoxy/egl.h>
   |          ^~~~~~~~~~~~~

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/weston/Config.in           | 6 ++++--
 package/x11r7/xwayland/xwayland.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 774b75d5fb..6f61c3c561 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -123,6 +123,7 @@ comment "X11 (nested) compositor needs X.org enabled"
 
 config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_LIBEPOXY
 	depends on BR2_PACKAGE_XORG7 # xwayland
 	depends on BR2_USE_MMU # xwayland
@@ -136,8 +137,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XWAYLAND
 
-comment "XWayland support needs libepoxy and X.org enabled"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
+comment "XWayland support needs libepoxy w/ EGL and X.org enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_XORG7 || \
+		!BR2_PACKAGE_LIBEPOXY
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8fa5260f47..5902f85d4f 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -30,7 +30,7 @@ XWAYLAND_CONF_OPTS = \
 	-Ddtrace=false \
 	-Ddocs=false
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
 else

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
