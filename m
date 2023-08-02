Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0493C00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A721D600C7;
	Wed,  2 Aug 2023 11:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A721D600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZ5QaxXqH0O7; Wed,  2 Aug 2023 11:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E755261203;
	Wed,  2 Aug 2023 11:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E755261203
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6FE1BF3BB
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 105E560F3B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105E560F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im0uCoZbOCbt for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:58:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11C31611A4
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C31611A4
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-31297125334so554327f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977503; x=1691582303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2ueEbBL4ZGfI8pWDhoXzdOI7pcKYouPH9rXJgWLOKo=;
 b=Taf4ji/kn/+k8PNqFkJRDqR9Kgu3z448zS29RROp2+XH85L40QckTKpMHnJj9oveQy
 RJuo1UH9n6xeg28x1OhT6WMTdGLpQjQyBeydGNU5HM+maPUUdh+cWuj/zvQkdprHY7jy
 gaO/U17gLLC40Agzjwoi5XOSFtPvcoowOF5GspgSVSjyMw46NWBODPhpIs23onNlrS/8
 CwEhD3u82kwMFCX5K51vikzRH2s7xys2WViQHusJXvRS/kHUJ3Rknc7kbY2PsA8ATQQM
 S9hcrXupLFllFmcxbNyzfydLIiiV5MIoRTrKdUtfKWgmujoPBiiIhzLV0tSCh7IbaXpA
 ngQw==
X-Gm-Message-State: ABy/qLY4TgAMa+WV2yht2NMo/sVP5f0u1Mw2OkH9YH2+wWhRWjdzpoRd
 hbW2znnkiXRnriodAWgSTKwK02weRQ6x5s0xJyQ=
X-Google-Smtp-Source: APBJJlEQwg4DaQIxUzlP5s9QXtKaiR17W6Yumu+teKpCqRdEehRHpShxjas8LGPfZgrxFZBAokzvfw==
X-Received: by 2002:adf:d84f:0:b0:317:5cfb:44c7 with SMTP id
 k15-20020adfd84f000000b003175cfb44c7mr4552426wrl.30.1690977502586; 
 Wed, 02 Aug 2023 04:58:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4f12000000b0030647449730sm18903863wru.74.2023.08.02.04.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:58:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:58:11 +0200
Message-Id: <20230802115811.501698-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802115811.501698-1-thomas@devoogdt.com>
References: <20230802115811.501698-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 3/3] package/webkitgtk: add http/2 support by
 using libsoup3
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

Support added in 2.33.2:
  https://wpewebkit.org/release/wpewebkit-2.33.2.html
  "HTTP/2 support when building with libsoup3."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wpewebkit/Config.in    | 6 +++---
 package/wpewebkit/wpewebkit.mk | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 7a8dc557c3..f1d38c7cad 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -36,9 +36,9 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_USE_WCHAR # icu, libsoup
+	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
@@ -51,7 +51,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_OPENJPEG
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c13a7201e6..8b5de00f07 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -15,7 +15,7 @@ WPEWEBKIT_LICENSE_FILES = \
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
-	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
+	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CONF_OPTS = \
@@ -26,8 +26,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
-	-DUSE_AVIF=OFF \
-	-DUSE_SOUP2=ON
+	-DUSE_AVIF=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
