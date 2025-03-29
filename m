Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C8AC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8562660B0A;
	Sat, 29 Mar 2025 20:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEgWS8l0mtx7; Sat, 29 Mar 2025 20:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8833F60894
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8833F60894;
	Sat, 29 Mar 2025 20:04:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 549A512A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B03A605A7
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCsUZS8JOIQx for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B90206068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90206068F
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B90206068F
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:03:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a823036so31648995e9.0
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 13:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743278637; x=1743883437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULYm/jmrRtzPCzTyV8Z7zzFYA/pDLWTOcyA+kIobIxg=;
 b=KNbjGtAzLAy8Vt/jOHXQs0yhq5NGdHcpN2bY9+uv6UMm2ajjefbMnrR7F0+mkT5lcV
 xcbfJx1iMDVxcJ6zQsSJJIvl+otnXB1AL6HbqWKhrbnMaLGDCP/29RSjahC8vtBPSrqQ
 43R8mUquPrwfeXRCp9PmYRI3nlp4r5B4X3MWh9SaP9Xm6bWVjDdwBiM0xWGzLSvVCRd7
 w9/V5512jzTG4KCgCLSEAtOuyj6NuPebQT6UZy9RswlIzvifjEqJgbKrLxKVJaHov/tF
 zQIgYAzOydVrTjciIyXYCPZfnzvAhk0lXEcoO+Offd3W7wsImDn8YtlK1ANHJgCh2w7f
 rYcg==
X-Gm-Message-State: AOJu0YxlR8Vm5E7gB3ytQqsMeR1y81tKuAnLKzs+YktoAd9foqiMuWMk
 WApUvGe5BtE/LiMSGJdXmiCnj+1D7HjUo0cCvm9iTXlgl1P7mRgAhHAUPA==
X-Gm-Gg: ASbGncs8TaJdBK1H+PemuEYxSOWETGYP6eQ8rc4xaLGKO3DEeyDWGSoN+8onkl/qj8L
 apdjf9+uD31sXA2O5hMDDZ0Osu5Tdo2lZg+cprgeHSUhgZ49y4PhYbWpycdMDCdziau8yOwbfkB
 8IWga8FTMJgZQyA22GyyhhWyAJtswR8TmzBl6yiTaHZ5+EgBOEFj8qm0igyNhe6uRyt8wyNBl3Z
 zYJHimZUqybR7vzhcowGzX/RtuOKyKfO00t/yizQgj4iBa23CcZRUpbEckvjqeHDz/qxiNSSBlS
 nbWcgd2IJTsQE/jJ8xQxWe/wT5dyd+Ku7lYKGcCAgakUP9ArpWT8ZP1bHNSwwgMZU5kYE/WyZf0
 =
X-Google-Smtp-Source: AGHT+IEBYuo0YntNfHHz+tq0Al7f+IQSG0x4NEsRNdo/uDm7bMhP5gYmHVOSMxgOwNt8450g3MzVrQ==
X-Received: by 2002:a05:6000:18a8:b0:399:6d53:68d9 with SMTP id
 ffacd0b85a97d-39c12118aedmr3255656f8f.38.1743278636833; 
 Sat, 29 Mar 2025 13:03:56 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:418a:c8de:a7c8:4861])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66285bsm6523514f8f.21.2025.03.29.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 13:03:56 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 29 Mar 2025 21:03:53 +0100
Message-ID: <20250329200354.178980-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/cairo: bump to 1.18.4
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

News:
- https://www.cairographics.org/news/cairo-1.18.4/

Other changes:
- 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
  has been dropped because it's upstream. [1]

- c_std=gnu11 override has been dropped because
  it's upstream. [2]

- Use the new 'lzo' option. [3]

[1] https://gitlab.freedesktop.org/cairo/cairo/-/commit/9607e19a9e4c1784e7b656772e1df82aea26f6e7
[2] https://gitlab.freedesktop.org/cairo/cairo/-/commit/b60f47dfd5bbe98aec43f6c356ba3be9a1b7989e
[3] https://gitlab.freedesktop.org/cairo/cairo/-/commit/c1748e79f0b18d44891bda2b6aa877175d802660

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...private.h-fix-missing-FT_Color-error.patch | 32 -------------------
 package/cairo/cairo.hash                      |  4 +--
 package/cairo/cairo.mk                        | 11 ++++---
 3 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch

diff --git a/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
deleted file mode 100644
index 3b18d8077b..0000000000
--- a/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From da698db0c20507f0e07492cbe40dbaf1c9053f71 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 12 Nov 2023 09:58:05 +0100
-Subject: [PATCH] cairo-ft-private.h: fix missing FT_Color error
-
-In file included from ../src/cairo-colr-glyph-render.c:37:
-../src/cairo-ft-private.h:87:30: error: unknown type name 'FT_Color'
-   87 |                              FT_Color               *palette,
-      |                              ^~~~~~~~
-
-Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/cairo-ft-private.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/cairo-ft-private.h b/src/cairo-ft-private.h
-index 836f7e523..6b0e30223 100644
---- a/src/cairo-ft-private.h
-+++ b/src/cairo-ft-private.h
-@@ -43,6 +43,8 @@
- 
- #if CAIRO_HAS_FT_FONT
- 
-+#include FT_COLOR_H
-+
- CAIRO_BEGIN_DECLS
- 
- typedef struct _cairo_ft_unscaled_font cairo_ft_unscaled_font_t;
--- 
-2.34.1
-
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index b2d384d01a..3c66c63f6d 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,5 +1,5 @@
-# From https://www.cairographics.org/releases/cairo-1.18.2.tar.xz.sha256sum
-sha256  a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a  cairo-1.18.2.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.4.tar.xz.sha256sum
+sha256  445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb  cairo-1.18.4.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index c741c97853..26c2555f9d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.18.2
+CAIRO_VERSION = 1.18.4
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
@@ -37,8 +37,7 @@ CAIRO_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dspectre=disabled \
 	-Dsymbol-lookup=disabled \
-	-Dgtk_doc=false \
-	-Dc_std=gnu11
+	-Dgtk_doc=false
 CAIRO_DEPENDENCIES = \
 	host-pkgconf \
 	fontconfig \
@@ -59,8 +58,7 @@ HOST_CAIRO_CONF_OPTS = \
 	-Dglib=enabled \
 	-Dspectre=disabled \
 	-Dsymbol-lookup=disabled \
-	-Dgtk_doc=false \
-	-Dc_std=gnu11
+	-Dgtk_doc=false
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
@@ -71,7 +69,10 @@ HOST_CAIRO_DEPENDENCIES = \
 	host-zlib
 
 ifeq ($(BR2_PACKAGE_LZO),y)
+CAIRO_CONF_OPTS += -Dlzo=enabled
 CAIRO_DEPENDENCIES += lzo
+else
+CAIRO_CONF_OPTS += -Dlzo=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
